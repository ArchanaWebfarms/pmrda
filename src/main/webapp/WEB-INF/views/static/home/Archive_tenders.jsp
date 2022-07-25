<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
<%@ page import="com.cmsManagement.util.NumbersEnglishToMarathi"%>

<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
   <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
     
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="pagetitle.tender.noticeA"  /> ::.</title>
      <meta name="viewport" content="width=device-width" />
       <!-- <script src="staticResources/js/searchTenderByDepartment.js"></script>  -->
      <style type="text/css">
      .archiveLink{          
		 font-size: 20px;
          color:yellow;      
      
      }
      </style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
     
<input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>


      <div id="t3-mainbody  maincontent"  class="container-fluid t3-mainbody dl-container" style="margin-top:30px;">
         <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h3 class="itemTitle">
               
                  <spring:message code="pagetitle.tender.noticeA"  />  <font style="color:green"  class="archiveLink"></font>
               </h3>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>




         </div>
        <form action = "">
         
          <div class="row filter-container">
        
           <%--  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"> <spring:message code="filter.form.fromdate"  /></h5>
               <input class="form-control" type="date" name="" id ="fromdate">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.todate"  /></h5>
               <input class="form-control" type="date" name="" id ="todate">
            </div> --%>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.documenttype"  /> </h5>
               <select name="departments" id="departments"  onchange="searchTendersByDepartment()" class="form-control">
							 	 <c:choose>
								 	  <c:when test="${localLang eq 'marathi'}">
								 	  	
								 	  	 <option selected="selected" value="0">विभाग निवडा</option>
									  	 <c:forEach var="departments" items="${departments}">
									  		
									  		<option value="${departments.dept_id}">${departments.dept_name_h}</option>
									  	 </c:forEach>
								 	  </c:when>
								 	  <c:otherwise>
								 	  	    <option selected="selected" value="0">Select Department</option>
										  	<c:forEach var="departments" items="${departments}">
										  <option value="${departments.dept_id}">${departments.departmentName}</option>
										  	</c:forEach>	
								 	  </c:otherwise>
							 	 </c:choose>
							  </select>
            </div>
           <%--  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.Searchkeyword"  /></h5>
               <input class="form-control" type="text" name="" id="search">
            </div> --%>
            
         </div> 
         <div class="clear"></div>
         <br/>
        <%--  <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnSearch pull-right btn btn-warning" type="button" value="<spring:message code="filter.form.Searchbutton"  />" style="margin-right: 25px;" onclick="SubmitDates()">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnClear btn btn-warning" type="reset" value="<spring:message code="filter.form.Clearbutton"  />" style="margin-left: 25px;">
            </div>
         </div> --%>
         </form>
         <br/>
         <div class="row" id="data" style="overflow-x: auto;">
      <div id="englishtable" style="display: visible; width:100%;">
         <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
        
         <tr style="white-space:nowrap;">
            <th scope="col" style="width:5%;">S.N.</th><th scope="col" style="width:40%;">Tender ID</th><th scope="col">Department</th><th scope="col">Publish Date</th><th scope="col">Closing Date</th><th scope="col">Opening Date</th><th scope="col" style="width:15%;">Download</th>
         </tr>
          <c:forEach var="approvedNotice" items="${Archive_tenders}" varStatus="status">
           
         <tr>
         
                             
             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0"> <%-- <a href="getTenderById?id=${approvedNotice.id}"> --%>[${approvedNotice.subTitle}]&nbsp;${approvedNotice.title}</span>
                             </td><%--<td >
                                ${approvedNotice.subTitle}
                            </td> --%>
                            <td class="A">${approvedNotice.tendorsDepartment.departmentName}</td>
                            <td style="text-align:center;" class="filterDates">${approvedNotice.publish_date} &nbsp;${approvedNotice.publish_time}</td>
                            
                             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.closingDate} &nbsp;${approvedNotice.closing_time}</span>
                            </td>
                             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.openingDate} &nbsp;${approvedNotice.opening_time}</span>
                            </td>
                            <td>
                                
                                 <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
							<c:if test="${approvedNotice.id ==  attachmentlist.moduleID}">
								<c:if test="${attachmentlist.module_type == 'English Attachment'}">
								<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:${attachmentlist.size}KB]</a><br>
										</c:if>						
							</c:if>
					</c:forEach> 
                            </td> 
         </tr>
      
        </c:forEach> 
      </tbody>
      
      </table>  
      </div>
       <div id="marathitable" style="display: none;">
       
         <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
      
         <tr style="white-space:nowrap;">
            <th scope="col" style="width:5%;">अ.क्र.</th><th scope="col" style="width:40%;">निविदा आयडी</th><th scope="col">विभाग</th><th scope="col">प्रकाशन तारीख</th><th scope="col">बंद होण्याची तारीख</th><th scope="col">उघडण्याची तारीख</th><th scope="col" style="width:15%;">डाउनलोड करा</th>
         </tr>
          <% int n=0; %>
          <c:forEach var="approvedNotice" items="${Archive_tenders}" varStatus="status">
             <% n=n+1; %>
			<% String numb=NumbersEnglishToMarathi.convertInMarathi(String.valueOf(n)); %>
         <tr>
         
                             
             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblSN_0"><%=numb %></span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0"><%-- <a href="getTenderById?id=${approvedNotice.id}"> --%>[${approvedNotice.subTitle_h}] ${approvedNotice.title_h}<!-- </a> --></span>
                            </td><%-- <td >
                                ${approvedNotice.subTitle}
                            </td> --%>
                             <td class="A">${approvedNotice.tendorsDepartment.dept_name_h}</td>
                            <td style="text-align:center;" class="filterDates">${approvedNotice.publish_date_h} &nbsp;${approvedNotice.publish_time_h}</td>
                            
                             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.closingDate_h} &nbsp;${approvedNotice.closing_time_h}</span>
                            </td>
                             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.openingDate_h} &nbsp;${approvedNotice.opening_time_h}</span>
                            </td>
                            <td>
                                
                                 <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
								<c:if test="${approvedNotice.id ==  attachmentlist.moduleID}">
							
								<c:if test="${attachmentlist.module_type == 'Marathi Attachment'}">
								<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [आकार:${attachmentlist.size}केबी]</a><br>
										</c:if>						
							</c:if>
					</c:forEach> 
                            </td> 
         </tr>
      
        </c:forEach> 
      </tbody>
      
      </table>  
      </div>
      
           <br/>
         </div>

      </div>

         
     


         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
         <script src="staticResources/js/submitDates.js"></script>
         <script src="resources/js/NumberConversion.js"></script> 
        	
       <script>
       $(function() {	
    		  
    		  
    		  
    		  var language=$("#lang").val();
    		//  alert(language);
    		  if(language=="marathi")
    			 {
    			  
    			  $("#marathitable").show();
    			  $("#englishtable").hide();
    			  document.getElementById("marathitable").style.visibility = "visible";
    			  document.getElementById("englishtable").style.visibility = "none";
    			 }
    		 
    		  
    		  
    		  
    	});  
 $(function() {	
	 //SubmitDates();
});
 

/* function SubmitDates(){//alert("in tender")
	var language=$("#lang").val();//alert(language)
	
  var issueHTML;
  
  if(language=="marathi")
	 {
	 issueHTML = 
		 '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">अ.क्र.</th><th style="width:40%;">निविदा आयडी</th><th>विभाग </th><th>प्रकाशन तारीख </th><th>उघडण्याची तारीख</th><th>बंद होण्याची तारीख</th><th style="width:15%;">डाउनलोड करा</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
  else{
	  issueHTML = 
		  '<div class="box-body"  style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">S.N.</th><th style="width:40%;">Tender ID</th><th>Department</th><th>Publish Date </th><th>Opening Date </th><th>Closing Date </th><th style="width:15%;">Download</th></tr>'+
			'</thead>'+
			'<tbody>';	
  }
	
	 var fromdate = $("#fromdate").val(); //alert(fromdate)
	 var todate = $("#todate").val();// alert(todate)
	
     $.ajax({
		 url:"tenderbydates?fromdate="+fromdate+"&todate="+todate,
			success:function(response){
				console.log(response)
				
				for(var i=0;i<response.tendor.length;i++){   
					var title;
					var deptName;
					var pathName;
					var atitle;
					
					if(language=="marathi"){
						title=response.tendor[i].title_h;
						deptName=response.tendor[i].tendorsDepartment.dept_name_h;
					}else{
						title=response.tendor[i].title;	
						deptName=response.tendor[i].tendorsDepartment.departmentName;
					} 
					
					
				    var j = i+1;
					issueHTML+='<tr><td style="text-align:center;">'+j+'</td>'+
					'<td>'+response.tendor[i].subTitle+'&nbsp;'+title+'</td>'+	
					/* '<td>'+response.tendor[i].subTitle+'</td>'+ */
					/* '<td>'+deptName+'</td>'+
					'<td style="text-align:center;">'+response.tendor[i].publish_date+'</td>'+
					'<td style="text-align:center;">'+response.tendor[i].openingDate+'</td>'+
					'<td style="text-align:center;">'+response.tendor[i].closingDate+'</td>'+
					'<td>';
					
						for(var j=0;j<response.attachment.length;j++){   
							if(response.tendor[i].id==response.attachment[j].moduleID){
								if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
										issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
								}else if(language=="en_US"){
									if(response.attachment[j].module_type=="English Attachment"){
										atitle=response.attachment[j].title; 
										issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
									}
									 
								}
							
							
						}
							
					}
						issueHTML+='</td>';
			        }
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
	
			},
			error:function(response){
	        	alert("Error");
	        }
		});
} */ 

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
   
    function searchTendersByDepartment(){
    	var language=$("#lang").val();
    	
      var issueHTML;
      if(language=="marathi")
 	 {
 	 issueHTML = 
 		 '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">'+ 
 			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">अ.क्र.</th><th style="width:40%;">निविदा आयडी</th><th>विभाग </th><th>प्रकाशन तारीख </th><th>बंद होण्याची तारीख</th><th>उघडण्याची तारीख</th><th style="width:15%;">डाउनलोड करा</th></tr>'+
 			'</thead>'+
 			'<tbody>';	
 	 }
   else{
 	  issueHTML = 
 		  '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">'+ 
 			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">S.N.</th><th style="width:40%;">Tender ID</th><th>Department</th><th>Publish Date </th><th>Closing Date </th><th>Opening Date </th><th style="width:15%;">Download</th></tr>'+
 			'</thead>'+
 			'<tbody>';	
   }
    	
      var departments = $("#departments").val();
         $.ajax({
        	 url:"searchArchieveTendersByDepartment?departments="+departments,
    			success:function(response){
    				console.log(response)
    				
    				for(var i=0;i<response.tendor.length;i++){   
    					var title;
    					var deptName;
    					var pathName;
    					var atitle;
    					var cdate;
    					var pdate;
    					var odate;
    					var subtitle;
						var numb;
    					
   					 	var j = i+1;
    					
    					if(language=="marathi"){
    						title=response.tendor[i].title_h;
    						deptName=response.tendor[i].tendorsDepartment.dept_name_h;
    						cdate=response.tendor[i].closingDate_h+' '+response.tendor[i].closing_time_h
    						pdate=response.tendor[i].publish_date_h+' '+response.tendor[i].publish_time_h;
    						odate=response.tendor[i].openingDate_h+' '+response.tendor[i].opening_time_h;
    						subtitle=response.tendor[i].subTitle_h;
    						numb=NumbersInEngToMar(String(j));
    							
    					}else{
    						title=response.tendor[i].title;	
    						deptName=response.tendor[i].tendorsDepartment.departmentName;
    						cdate=response.tendor[i].closingDate+' '+response.tendor[i].closing_time
    						pdate=response.tendor[i].publish_date+' '+response.tendor[i].publish_time;
    						odate=response.tendor[i].openingDate+' '+response.tendor[i].opening_time;
    						subtitle=response.tendor[i].subTitle;
    						numb=j;
    					} 
    					
    					
    					issueHTML+='<tr><td style="text-align:center;">'+numb+'</td>'+
    					'<td>['+subtitle+']'+title+'</td>'+	
    					/* '<td>'+response.tendor[i].subTitle+'</td>'+ */
    					'<td>'+deptName+'</td>'+
    					'<td style="text-align:center;">'+pdate+'</td>'+
    					'<td style="text-align:center;">'+cdate+'</td>'+
    					'<td style="text-align:center;">'+odate+'</td>'+
    					'<td>';
    					
    						for(var j=0;j<response.attachment.length;j++){   
    							if(response.tendor[i].id==response.attachment[j].moduleID){
    								if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
    										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [आकार:'+response.attachment[j].size+'केबी]</a><br> ';  
    								}else if(language=="en_US"){
    									if(response.attachment[j].module_type=="English Attachment"){
    										atitle=response.attachment[j].title; 
    										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
    									}
    									 
    								}						
    						}
    							
    					}
    						issueHTML+='</td>';
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
    <form:form  action="attachmentNewsDownload" id="viewAttachform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="attachid" name="id" />  
  </form:form>
  <script type="text/javascript">
function attachmentDownload(id){
	  $("#attachid").val(id);
	  $("#viewAttachform").submit();
	  return true;
}
</script>
      </div>   
   </body>
</html>