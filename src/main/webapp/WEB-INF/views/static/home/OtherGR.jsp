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
      <title>.:: <spring:message code="OG.pagetitle"  /> ::.</title>
      
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
      <div id="maincontent"   class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                 <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">  <spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway">  <spring:message code="table.heading.Download"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="OG.pagetitle"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div>



<input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>

      <div id="t3-mainbody" class="container-fluid t3-mainbody dl-container">
         <div class="row">
            <div class="itemHeader">

               <h2 class="itemTitle">
               
                <spring:message code="OG.t3-mainbody.itemTitle.h2"  />  
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
                <select name="departments" id="departments"  onchange="searchNoticesByDepartment()" class="form-control">
							 	 <c:choose>
								 	  <c:when test="${localLang eq engLang}">
								 	  	
								 	  	   <option selected="selected" value="0">अनुभाग द्वारा खोजें</option>
									  	 <c:forEach var="departments" items="${departments}">
									  		
									  			<option value="${departments.deptId}">${departments.departmentName_h}</option>
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
      
            <%-- <table class="table table-bordered table-striped dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
        
         <tr>
            <th scope="col" style="width:10%;">SrNo</th><th scope="col">Title</th><th scope="col">Date</th><th scope="col">Department</th><th scope="col">Download</th>
         </tr>
          <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
            <c:if test="${approvedNotice.type == 'OTHER GR' }">
         <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0"> ${approvedNotice.title}</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCreatedDate_0"> ${approvedNotice.date}</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.department.departmentName}</span>
                            </td><td>
                                <a class="align-center" href="attachmentDownload?path=${approvedNotice.attachment.path}" target="_blank"  class="button read-more-button big button-arrow" target="_blank">Download</a>
                                    
                            </td>
         </tr>
         </c:if>
        </c:forEach> 
      </tbody>
      
      </table> --%><br/>
         </div>

      </div>

         
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
        
        	
       
      </div>   
   </body>
    <script>

 $(function() {	
	 SubmitDates();
});
 

function SubmitDates(){
	var language=$("#lang").val();
	//alert(language);
  var issueHTML ;
  if(language=="marathi")
	 {
	 issueHTML = 
		 '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
			'<thead><tr><th>अनुक्रमांक</th><th>शीर्षक</th><th>तारीख </th><th>विभाग</th><th>डाउनलोड करा</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
  else{
	  issueHTML = 
  
	'<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
	'<thead><tr><th>Sr. No.</th><th>Title</th><th>Date </th><th>Department </th><th>Download</th></tr>'+
	'</thead>'+
	'<tbody>';	
  }
	 var fromdate = $("#fromdate").val(); 
	 var todate = $("#todate").val(); 
     $.ajax({
		 url:"sendbothdates?fromdate="+fromdate+"&todate="+todate+"&Type=OTHER GR",
			success:function(response){
				//alert(response.length);
				
				for(var i=0;i<response.length;i++){
					if(language=="marathi"){
						title=response[i].title_h;
						department=response[i].department.departmentName_h;
					}else{
						title=response[i].title;
						department=response[i].department.departmentName;
					}
				    var j = i+1;
					issueHTML+='<tr><td>'+j+'</td>'+
					'<td>'+title+'</td>'+			
					'<td>'+response[i].publish_date+'</td>'+
					'<td>'+department+'</td>'+
					'<td><a href="attachmentDownload?path='+response[i].attachment.path+'" >Download</a></td>' ; 
			        }
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
			},
			error:function(response){
	        	alert("Error");
	        }
		});
}
$("#search").keyup(function(){
    _this = this;
    $.each($("#example tbody").find("tr"), function() {
        console.log($(this).text());
      //  alert($(this).text());
       if($(this).find('td').eq(1).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
           $(this).hide();
        else
             $(this).show();                
    });
}); 
</script>
<script>
$(function() {	
	searchNoticesByDepartment();
}); 
function searchNoticesByDepartment(){
	var language=$("#lang").val();
	//alert(language);
	
  var issueHTML ;
  if(language=="marathi")
	 {
	 issueHTML = 
		 '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
			'<thead><tr><th>अनुक्रमांक</th><th>शीर्षक</th><th>तारीख </th><th>विभाग</th><th>डाउनलोड करा</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
  else{
	  issueHTML = 
  
	'<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
	'<thead><tr><th>Sr. No.</th><th>Title</th><th>Date </th><th>Department </th><th>Download</th></tr>'+
	'</thead>'+
	'<tbody>';	
  }
  var departments = $("#departments").val();
 // alert(departments);
     $.ajax({
			url:"searchNoticesByDepartment?departments="+departments+"&noticeType=OTHER GR"+"&category=NOTICE",
			success:function(response){
				//alert(response.length);
				
				for(var i=0;i<response.length;i++){
					if(language=="marathi"){
						title=response[i].title_h;
						department=response[i].department.departmentName_h;
					}else{
						title=response[i].title;
						department=response[i].department.departmentName;
					}
				    var j = i+1;
					issueHTML+='<tr><td>'+j+'</td>'+
					'<td>'+title+'</td>'+			
					'<td>'+response[i].publish_date+'</td>'+
					'<td>'+department+'</td>'+
					'<td><a href="attachmentDownload?path='+response[i].attachment.path+'" >Download</a></td>' ; 
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
</html>