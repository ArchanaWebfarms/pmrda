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
  <meta name="viewport" content="width=device-width" />
      <title>.:: <spring:message code="Header.Menu.AboutUs.mediacntr"  /> ::.</title>
      <link rel="stylesheet" href="resources/plugins/datepicker/datepicker3.css">
       <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
    

<input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>


      <div id="maincontent"    class="container-fluid t3-mainbody dl-container"  style="margin-top:30px;">
         <div class="row">
         <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
             <li> <a href="#"><spring:message code="Header.Menu.AboutUs.mediacntr"  />  </a></li>
						    
						      <li><a href="press_notes"><spring:message code="pressnotes.title"  /></a></li>
						      <li><a href="pmrda_news"><spring:message code="pagetitle.whatnew"  /></a></li>
						      <li><a href="videos"><spring:message code="index.module-ct.span1"  /></a></li>
						       <li><a href="gallery"><spring:message code="index.module-ct.span2"  /></a></li>
                        <li><a class="active" href="mediacenter"><spring:message code="Header.Menu.AboutUs.mediacntr"  /></a></li>
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
            <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h3 class="itemTitle">
               <spring:message code="Header.Menu.AboutUs.mediacntr"/>
               <%-- <spring:message code="pressnotes.title"/><a href ="Archive_PressNotes_notice" style="color:green;font-size: 22px"  class="archiveLink"><spring:message code="archive.archived.pressnotes" /></a> --%>
               </h3>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>

         </div>
         <form action = "">
         
         <div class="row filter-container filter_table_input">
        
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 l-w">
               <h5 class="text-left"> <spring:message code="filter.form.fromdate"  /></h5>
              <div class="input-group date" id="engFromDateDiv">
					  <input class="form-control" type="text" name="" id ="fromdate" placeholder="yyyy-mm-dd" autocomplete="off">
              			<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
					
					<div class="input-group date" id="marathiFromDateDiv" style="display: none;">
					<input class="form-control" type="text" name="" id ="fromdatemr" placeholder="yyyy-mm-dd" autocomplete="off">
					  	<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 l-w">
               <h5 class="text-left"><spring:message code="filter.form.todate"  /></h5>
                <div class="input-group date" id="engTODateDiv">
					  <input class="form-control" type="text" name="" id ="todate" placeholder="yyyy-mm-dd" autocomplete="off">
              			<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
					
					<div class="input-group date" id="marathiTODateDiv" style="display: none;">
					<input class="form-control" type="text" name="" id ="todatemr" placeholder="yyyy-mm-dd" autocomplete="off">
					  	<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
            </div>
           <%--  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
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
            </div> --%>
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 l-w">
               <h5 class="text-left"><spring:message code="filter.form.Searchkeyword"  /></h5>
               <input class="form-control" type="text" name="" id="search" >
            </div>
            
         </div>
         <div class="clear"></div>
        
         <div class="row" style="margin:10px 0px;">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnSearch pull-right btn btn-warning" type="button" value="<spring:message code="filter.form.Searchbutton"  />" style="margin-right: 25px;" onclick="SubmitDates()">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnClear btn btn-warning" type="reset" onclick="ReserData()" value="<spring:message code="filter.form.Clearbutton"  />" style="margin-left: 25px;">
            </div>
         </div>
         </form>
         <div class="row" id="data" style="overflow-x: auto;">
          <div id="englishtable" style="display: visible; width:100%;">
         <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
        
         <tr style="white-space:nowrap;">
            <th style="width:5%;" scope="col">S.N.</th><th style="width:50%;" scope="col">Title</th><th scope="col">Date</th><th scope="col">Download</th>
         </tr>
          <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
           
         <tr>
         
                             
             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0"><%-- <a href="getNoticeById?id=${approvedNotice.noticeID}">  --%>${approvedNotice.title}<!-- </a> --></span>
                            </td><td style="text-align:center;" class="filterDates">${approvedNotice.publish_date}</td>  
                            <%-- <td class="filterDates">${approvedNotice.department.departmentName}</td>   --%>                          
                            <td>
                                
                                 <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
							<c:if test="${approvedNotice.noticeID ==  attachmentlist.moduleID}">
								<c:if test="${attachmentlist.module_type == 'English Attachment'}">
								<c:choose>
										<c:when test="${attachmentlist.extension == 'pdf'}">
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:${attachmentlist.size}KB]</a><br>
										</c:when>
										<c:otherwise>
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/img2.png" height="20px" width="20px"> [size:${attachmentlist.size}KB]</a><br>
										</c:otherwise>
									</c:choose>
										</c:if>						
							</c:if>
					</c:forEach> 
                            </td> 
         </tr>
      
        </c:forEach> 
      </tbody>
      
      </table>  
      </div>
       <div id="marathitable" style="display: none; display: visible; width:100%;">
       
         <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
      
         <tr style="white-space:nowrap;">
            <th style="width:5%;" scope="col">अ.क्र.</th><th style="width:50%;" scope="col">शीर्षक</th><th scope="col">तारीख</th><th scope="col">डाउनलोड</th>
         </tr>
         <% int n=0; %>
          <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
           <% n=n+1; %>
		   <% String numb=NumbersEnglishToMarathi.convertInMarathi(String.valueOf(n)); %>
          <tr>
         
                             
             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblSN_0"><%=numb %></span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0"><%-- <a href="getNoticeById?id=${approvedNotice.noticeID}"> --%> ${approvedNotice.title_h}<!-- </a> --></span>
                            </td><td style="text-align:center;" class="filterDates">${approvedNotice.date_h}</td>   
                            <%-- <td class="filterDates">${approvedNotice.department.departmentName_h}</td>   --%>                            
                            <td>
                                
                                 <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
							<c:if test="${approvedNotice.noticeID ==  attachmentlist.moduleID}">
								<c:if test="${attachmentlist.module_type == 'Marathi Attachment'}">
								<c:choose>
										<c:when test="${attachmentlist.extension == 'pdf'}">
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [आकार:${attachmentlist.size}केबी]</a><br>
										</c:when>
										<c:otherwise>
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/img2.png" height="20px" width="20px"> [आकार:${attachmentlist.size}केबी]</a><br>
										</c:otherwise>
									</c:choose>
										</c:if>						
							</c:if>
					</c:forEach> 
                            </td> 
         </tr>
      
        </c:forEach> 
      </tbody>
      
      </table>  
      </div>
      
     
         </div>
         
            
            
            
         </div>
         
         </div>
      

      </div>

         
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
         <script src="staticResources/js/submitDates.js"></script>
      <script src="staticResources/js/searchByDepartment.js"></script>
        <script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
         <script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
         <script src="resources/plugins/timepicker/0-5-2-bootstrap-timepicker.min.js"></script>
         <script src="resources/plugins/datepicker/locales/bootstrap-datepicker.mr.js"></script>
         <script src="resources/js/NumberConversion.js"></script> 
        <script>
        $("#fromdate").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd'
        });
        $("#todate").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd'
            
        });
        $("#fromdatemr").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd',
            language: 'mr'
        });
        $("#todatemr").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd',
            language: 'mr'
        });
     

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
 			 	$("#engFromDateDiv").hide();
 			  $("#engTODateDiv").hide();
 			  $("#marathiFromDateDiv").show();
 			  $("#marathiTODateDiv").show();
 			 }else{
 				$("#marathitable").hide();
 	 			  $("#englishtable").show();
 	 			  document.getElementById("marathitable").style.visibility = "none";
 	 			  document.getElementById("englishtable").style.visibility = "visible";
 				 
 				 $("#engFromDateDiv").show();
 				  $("#engTODateDiv").show();
 				  $("#marathiFromDateDiv").hide();
 				  $("#marathiTODateDiv").hide();
 			 }
 		 
 		  
 		  
 		  
 	}); 
 
       function ReserData(){
    		  window.location.reload();
    	  }

       function SubmitDates(){
       	var language=$("#lang").val();
       	var fromdate;
    	var todate;
       	
         var issueHTML;
         
         if(language=="marathi")
       	 {
        	 fromdate = $("#fromdatemr").val(); 
   		  todate = $("#todatemr").val(); 
   		 
       	 issueHTML = 
       		 '<div class="box-body"  style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
       			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">अ.क्र.</th><th style="width:50%;">शीर्षक</th><th>तारीख </th><th>डाउनलोड</th></tr>'+
       			'</thead>'+
       			'<tbody>';	
       	 }
         else{
        	 fromdate = $("#fromdate").val(); 
   		  todate = $("#todate").val(); 	 
   		 
       	  issueHTML = 
       		  '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
       			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">S.N.</th><th style="width:50%;">Title</th><th>Date </th><th>Download</th></tr>'+
       			'</thead>'+
       			'<tbody>';	
         }
       	
       	
            $.ajax({
       		 url:"noticebydates?fromdate="+fromdate+"&todate="+todate+"&type=MEDIA CENTER",
       			success:function(response){
       				console.log(response)
       				
       				 for(var i=0;i<response.notice.length;i++){   
       					var title;
       					var deptName;
       					var pathName;
       					var date;
       					var numb;
    					
   					 var j = i+1;
       					if(language=="marathi"){
       						title=response.notice[i].title_h;
       						deptName=response.notice[i].department.departmentName_h;
       						date=response.notice[i].date_h;
       						numb=NumbersInEngToMar(String(j));
       					}else{
       						title=response.notice[i].title;	
       						deptName=response.notice[i].department.departmentName;
       						date=response.notice[i].publish_date;
       						numb=j;
       					} 
       					
       					issueHTML+='<tr><td style="text-align:center;">'+numb+'</td>'+
       					'<td>'+title+'</td>'+	  						
       					'<td style="text-align:center;">'+date+'</td>'+
       					/*  '<td>'+deptName+'</td>'+  */
       					'<td>';
						for(var j=0;j<response.attachment.length;j++){   
							if(response.notice[i].noticeID==response.attachment[j].moduleID){
								if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
									if(response.attachment[j].extension=="pdf"){
										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [आकार:'+response.attachment[j].size+'केबी]</a><br> ';  
									}else{
										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/img2.png" height="20px" width="20px"> [आकार:'+response.attachment[j].size+'केबी]</a><br> ';  
									}
								}else if(language=="en_US"){
									if(response.attachment[j].module_type=="English Attachment"){
										atitle=response.attachment[j].title; 
										if(response.attachment[j].extension=="pdf"){
											issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
										}else{
											issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/img2.png" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
										}
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
	//searchNoticesByDepartment();
}); 
function searchNoticesByDepartment(){
	var language=$("#lang").val();
	//alert(language);
	
  var issueHTML ;
  if(language=="marathi")
	 {
	 issueHTML = 
		 '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">अ.क्र.</th><th style="width:50%;">शीर्षक</th><th>तारीख </th><th>डाउनलोड करा</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
  else{
	  issueHTML = 
  
	'<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
	'<thead><tr style="white-space:nowrap;"><th style="width:5%;">S.N.</th><th style="width:50%;">Title</th><th>Date </th><th>Download</th></tr>'+
	'</thead>'+
	'<tbody>';	
  }
  var departments = $("#departments").val();
 
     $.ajax({
			url:"searchNoticesByDepartment?departments="+departments+"&noticeType=MEDIA CENTER"+"&category=NOTICE",
			success:function(response){
				//alert(response.length);
				console.log(response)
				 for(var i=0;i<response.notice.length;i++){   
						var title;
						var deptName;
						var pathName;
						var date;
						
						if(language=="marathi"){
							title=response.notice[i].title_h;
       						deptName=response.notice[i].department.departmentName_h;
       						date=response.notice[i].date_h;
						}else{
							title=response.notice[i].title;	
							deptName=response.notice[i].department.departmentName;
							date=response.notice[i].publish_date;
						} 
						
						
					    var j = i+1;
						issueHTML+='<tr><td style="text-align:center;">'+j+'</td>'+
						'<td>'+title+'</td>'+	  						
						'<td style="text-align:center;">'+date+'</td>'+
						/* '<td>'+deptName+'</td>'+ */
						'<td>';
						for(var j=0;j<response.attachment.length;j++){   
							if(response.notice[i].noticeID==response.attachment[j].moduleID){
								if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
									if(response.attachment[j].extension=="pdf"){
										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
									}else{
										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/img2.png" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
									}
								}else if(language=="en_US"){
									if(response.attachment[j].module_type=="English Attachment"){
										atitle=response.attachment[j].title; 
										if(response.attachment[j].extension=="pdf"){
											issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
										}else{
											issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/img2.png" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
										}
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
      </div>   
   </body>
</html>