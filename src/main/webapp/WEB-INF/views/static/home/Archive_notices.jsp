<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>

<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
   <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
  <meta name="viewport" content="width=device-width" />
     <meta name="description" content=" Active tenders of pmrda,"/>
      <title>.::<spring:message code="notice.pagetitle"  /> ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <style type="text/css">
      .blink{
		width:200px;
		height: 50px;
	    
		padding: 15px;	
		
		float:right;
		 margin-right: 725px;
		  margin-bottom: 45px;
		line-height: 20px;
	}
	.spanblink{
		font-size: 20px;
		
		color: black;
		animation: blink 1s linear infinite;
	}
@keyframes blink{
0%{opacity: 0;}
50%{opacity: .5;}
100%{opacity: 1;}
}
      </style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
      <%-- <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active"><spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway"><spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="tender.pagetitle"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>

 <hr/>
<input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>


      <div id="t3-mainbody  maincontent"    class="container-fluid t3-mainbody dl-container">
         <div class="row">
            <div class="itemHeader">

               <h2 class="itemTitle">
              
                  <spring:message code="notice.t3-mainbody.itemTitle.h2"  /><div class="blink"><span class = "spanblink"><spring:message code="archive.blink"/></span></div>
               </h2>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>




         </div>
        <form action = "">
         
         <div class="row filter-container">
        
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"> <spring:message code="filter.form.fromdate"  /></h5>
               <input class="form-control" type="date" name="" id ="fromdate">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.todate"  /></h5>
               <input class="form-control" type="date" name="" id ="todate">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.documenttype"  /> </h5>
               <select name="departments" id="departments"  onchange="searchTendersByDepartment()" class="form-control">
							 	 <c:choose>
								 	  <c:when test="${localLang eq engLang}">
								 	  	
								 	  	 <option selected="selected" value="0">अनुभाग द्वारा खोजें</option>
									  	 <c:forEach var="departments" items="${departments}">
									  		
									  		<option value="${departments.deptId}">${departments.dept_name_h}</option>
									  	 </c:forEach>
								 	  </c:when>
								 	  <c:otherwise>
								 	  	    <option selected="selected" value="0">Select Department</option>
										  	<c:forEach var="departments" items="${departments}">
										  <option value="${departments.deptId}">${departments.departmentName}</option>
										  	</c:forEach>	
								 	  </c:otherwise>
							 	 </c:choose>
							  </select>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.Searchkeyword"  /></h5>
               <input class="form-control" type="text" name="" id="search">
            </div>
            
         </div>
         <div class="clear"></div>
         <br/>
         <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnSearch pull-right btn btn-warning" type="button" value="<spring:message code="filter.form.Searchbutton"  />" style="margin-right: 25px;" onclick="SubmitDates()">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnClear btn btn-warning" type="reset" value="<spring:message code="filter.form.Clearbutton"  />" style="margin-left: 25px;">
            </div>
         </div>
         </form>
         <br/>
         <div class="row" id="data" style="overflow-x: auto;">
      
           <br/>
         </div>

      </div>

         
     
         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
        
        	
       <script>

 $(function() {	
	 SubmitDates();
});
 

function SubmitDates(){
	var language=$("#lang").val();
	
  var issueHTML;
  
  if(language=="marathi")
	 {
	 issueHTML = 
		 '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
			'<thead><tr><th>अनुक्रमांक</th> <th>शीर्षक</th> <th>प्रकार</th> <th>विभाग</th> <th>प्रकाशन तारीख </th> <th>बंद होण्याची तारीख</th><th>डाउनलोड करा</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
  else{
	  issueHTML = 
		  '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
			'<thead><tr><th>Sr. No.</th><th>Title</th><th>Type</th> <th>Department</th><th>Publish Date </th><th>Closing Date</th><th>Download</th></tr>'+
			'</thead>'+
			'<tbody>';	
  }
	
	 var fromdate = $("#fromdate").val(); 
	 var todate = $("#todate").val(); 
     $.ajax({
		 url:"Archive_noticesbydates?fromdate="+fromdate+"&todate="+todate,
			success:function(response){
				console.log(response);
			
				for(var i=0;i<response.length;i++){   
					var title;
					
					if(language=="marathi"){
						title=response[i].title_h;
						department=response[i].department_h;
					}else{
						title=response[i].title;
						department=response[i].department;                                       
					} 
				    var j = i+1;
					issueHTML+= '<tr><td>'+j+'</td>'+
					'<td><a href="getNoticeById?id='+response.notice[i].noticeID+'">'+title+'</a></td>'+	
					'<td>'+response[i].type+'</td>'+
					'<td>'+department+'</td>'+
					'<td>'+response[i].publishDate+'</td>'+
					'<td>'+response[i].closingDate+'</td>' +
					'<td>'
		
					for(var k=0;k<response[i].attachmentList.length;k++){
						<c:choose>
						<c:when test="response[i].attachmentList.extension== 'pdf'}">
						issueHTML+= '<a href="attachmentNewsDownload?id='+response[i].attachmentList[k].attachmentID+'" ><img src="staticResources/images/pdf1.ico" height="20px" width="20px">Size:'+response[i].attachmentList[k].size+'  KB</a>'; 
						</c:when>
						<c:otherwise>
						issueHTML+= '<a href="attachmentNewsDownload?id='+response[i].attachmentList[k].attachmentID+'" ><img src="staticResources/images/img2.png" height="20px" width="20px">Size:'+response[i].attachmentList[k].size+'  KB</a>'; 
						</c:otherwise>
						</c:choose>
						
						issueHTML+=	'<br>'
					}//inner for
				issueHTML+=	'</td>'
			        }//outer for
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
	
			},
			error:function(response){
	        	alert("Error");
	        }
		});
}

</script>
<script type="text/javascript">
	 // Write on keyup event of keyword input element
    $("#search").keyup(function(){
        _this = this;
        $.each($("input").find("text"), function() {
            console.log($(this).text());
            alert($(this).text());
           if($(this).find('text').eq(1).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
               $(this).hide();
            else
                 $(this).show();                
        });
    }); 
    </script>
    <script>
    $(function() {	
		searchTendersByDepartment();
	});
    function searchTendersByDepartment(){
    	var language=$("#lang").val();
    	
      var issueHTML;
      if(language=="marathi")
    	 {
    	 issueHTML = 
    		 '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
    			'<thead><tr><th>अनुक्रमांक</th><th>शीर्षक</th><th>प्रकार</th> <th>विभाग</th> <th>प्रकाशन तारीख </th><th>बंद होण्याची तारीख</th><th>डाउनलोड करा</th></tr>'+
    			'</thead>'+
    			'<tbody>';	
    	 }
      else{
    	  issueHTML = 
    		  '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
    			'<thead><tr><th>Sr. No.</th><th>Title</th><th>Type</th> <th>Department</th> <th>Publish Date </th><th>Closing Date </th><th>Download</th></tr>'+
    			'</thead>'+
    			'<tbody>';	
      }
      var departments = $("#departments").val();
         $.ajax({
        	 url:"searchArchive_noticeByDepartment?departments="+departments,
    			success:function(response){
    				
    				
    				for(var i=0;i<response.length;i++){   
    					var title;
    					
    					if(language=="marathi"){
    						title=response[i].title_h;
    						department=response[i].department_h;
    					}else{
    						title=response[i].title;
    						department=response[i].department;
    					} 
    				    var j = i+1;
    					issueHTML+='<tr><td>'+j+'</td>'+
    					'<td><a href="getNoticeById?id='+response.notice[i].noticeID+'">'+title+'</a></td>'+	
    					'<td>'+response[i].type+'</td>'+
    					'<td>'+department+'</td>'+
    					'<td>'+response[i].publishDate+'</td>'+
    				    '<td>'+response[i].closingDate+'</td>' + 
    				    '<td>'
    					
    					for(var k=0;k<response[i].attachmentList.length;k++){
    						<c:choose>
    						<c:when test="response[i].attachmentList.extension== 'pdf'}">
    						issueHTML+= '<a href="attachmentNewsDownload?id='+response[i].attachmentList[k].attachmentID+'" ><img src="staticResources/images/pdf1.ico" height="20px" width="20px">Size:'+response[i].attachmentList[k].size+'  KB</a>'; 
    						</c:when>
    						<c:otherwise>
    						issueHTML+= '<a href="attachmentNewsDownload?id='+response[i].attachmentList[k].attachmentID+'" ><img src="staticResources/images/img2.png" height="20px" width="20px">Size:'+response[i].attachmentList[k].size+'  KB</a>'; 
    						</c:otherwise>
    						</c:choose>
    						issueHTML+=	'<br>'
    					}//inner for
    				issueHTML+=	'</td>'   
    				}
       				issueHTML+='</tbody></table>';
       				$("#data").html(issueHTML);
    	
    			},
    			error:function(response){
    	        	alert("Error");
    	        }
    		});
    }
    </script>
      </div>   
   </body>
</html>