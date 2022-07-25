<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder"%>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr"
	class='com_content view-featured itemid-550 j38 mm-hover'>
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
  <meta name="viewport" content="width=device-width" />
<title>.:: Government Notification ::.
</title>
<!-- <script src="staticResources/js/submitDates.js"></script>
<script src="staticResources/js/searchByDepartment.js"></script> -->

</head>
<body>
	<div class="t3-wrapper t3-homepage-2">
		<jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
		
		<input type="hidden" name="lang" id="lang"
			value="<%=LocaleContextHolder.getLocale()%>">
		<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>" />


		<div id="t3-mainbody  maincontent"    class="container-fluid t3-mainbody dl-container" style="margin-top:30px;">
			<div class="row">
				<div class="itemHeader" style="width:100%;">

					<h2 class="itemTitle">
					PMRDA Government Notification
						<%-- <spring:message code="notice.t3-mainbody.itemTitle.h2" /><a href ="Archive_notice" style="color:green;font-size: 22px"  class="archiveLink"><spring:message code="archive.archived.notice" /></a> --%>
					</h2>

				</div>

				<div class="heading-underline" style="width: 200px;">
					<div class="left"></div>
					<div class="right"></div>
				</div>




			</div>
			<form action="">

			<%-- 	<div class="row filter-container">

					<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
						<h5 class="text-left">
							<spring:message code="filter.form.fromdate" />
						</h5>
						<input class="form-control" type="date" name="" id="fromdate">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
						<h5 class="text-left">
							<spring:message code="filter.form.todate" />
						</h5>
						<input class="form-control" type="date" name="" id="todate">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
						<h5 class="text-left">
							<spring:message code="filter.form.documenttype" />
						</h5>
						<select name="departments" id="departments" class="form-control"
							onchange="searchNoticesByDepartment()">
							<c:choose>
								<c:when test="${localLang eq engLang}">

									<option selected="selected">अनुभाग द्वारा खोजें</option>
									<c:forEach var="departments" items="${departments}">

										<option value="${departments.deptId}">${departments.departmentName_h}</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option selected="selected" value="0">Select
										Department</option>
									<c:forEach var="departments" items="${departments}">
										<option value="${departments.deptId}">${departments.departmentName}</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
						<h5 class="text-left">
							<spring:message code="filter.form.Searchkeyword" />
						</h5>
						<input class="form-control" type="text" name="" id="search">
					</div>

				</div> --%>
				<%-- <div class="clear"></div>
				<br />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<input class="btnSearch pull-right btn btn-warning" type="button"
							value="<spring:message code="filter.form.Searchbutton"  />"
							style="margin-right: 25px;" onclick="SubmitDates()">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<input class="btnClear btn btn-warning" type="reset"
							value="<spring:message code="filter.form.Clearbutton"  />"
							style="margin-left: 25px;">
					</div>
				</div> --%>
			</form>
			<br />
			<div class="row" id="data" style="overflow-x: auto;">








				<div id="englishtable" style="display: visible; width:100%;">
					<table class="table table-bordered table-striped dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>

							<tr>
								<th scope="col" style="width: 10%;">SrNo</th>
								<th scope="col">Title Of Document</th>								
								<th scope="col">Name Of Concerned Department</th>
								<th scope="col">Year Of Publication</th>
								<th scope="col">Download</th>
							</tr>
							<c:forEach var="approvedNotice" items="${approvedNotice}"
								varStatus="status">

								<tr>


									<td><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
									</td>
									<td><span id="SitePH_grdupload_lblCategory_0">
											<a href="getNoticeById?id=${approvedNotice.noticeID}">${approvedNotice.title}</a></span></td>
									
									<td class="A">${approvedNotice.department.departmentName}</td>
									<td class="filterDates">${approvedNotice.publish_date}</td>
									<td><c:forEach var="attachmentlist"
											items="${attachmentlist}" varStatus="status">
											<c:if
												test="${approvedNotice.noticeID ==  attachmentlist.moduleID}">
												<c:if
													test="${attachmentlist.module_type == 'English Attachment'}">
													<c:choose>
										<c:when test="${attachmentlist.extension == 'pdf'}">
											<a  href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">${attachmentlist.title}[size:${attachmentlist.size}KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br>
										</c:when>
										<c:otherwise>
											<a  href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">${attachmentlist.title}[size:${attachmentlist.size}KB]<img src="staticResources/images/img2.png" height="20px" width="20px"></a><br>
										</c:otherwise>
									</c:choose>
												</c:if>
											</c:if>
										</c:forEach></td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
				<div id="marathitable" style="display: none;">

					<table class="table table-bordered table-striped dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>

							<tr>
								<th scope="col" style="width: 10%;">अनुक्रमांक</th>
								<th scope="col">शीर्षक</th>
								<th scope="col">तारीख</th>
								<th scope="col">विभाग</th>
								<th scope="col">डाउनलोड करा</th>
							</tr>
							<c:forEach var="approvedNotice" items="${approvedNotice}"
								varStatus="status">

								<tr>


									<td><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
									</td>
									<td><span id="SitePH_grdupload_lblCategory_0">
											<a href="getNoticeById?id=${approvedNotice.noticeID}">${approvedNotice.title_h}</a></span></td>
									<td class="filterDates">${approvedNotice.publish_date}</td>
									<td class="A">${approvedNotice.department.departmentName_h}</td>
									<td><c:forEach var="attachmentlist"
											items="${attachmentlist}" varStatus="status">
											<c:if
												test="${approvedNotice.noticeID ==  attachmentlist.moduleID}">
												<c:if
													test="${attachmentlist.module_type == 'Marathi Attachment'}">
													<c:choose>
										<c:when test="${attachmentlist.extension == 'pdf'}">
											<a  href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">${attachmentlist.title}[size:${attachmentlist.size}KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br>
										</c:when>
										<c:otherwise>
											<a  href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">${attachmentlist.title}[size:${attachmentlist.size}KB]<img src="staticResources/images/img2.png" height="20px" width="20px"></a><br>
										</c:otherwise>
									</c:choose>
												</c:if>
											</c:if>
										</c:forEach></td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>











				<br />
			</div>

		</div>




		<footer id="t3-footer" class="wrap t3-footer footer-section">
			<jsp:include page="../includes/Footer.jsp" />
		</footer>


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
    		 
    		 // SubmitDates()
    		  
    		  
    	}); 
 
       
       function SubmitDates(){
    		var language=$("#lang").val();
    		
    	  var issueHTML;
    	  
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
    				'<thead><tr><th>Sr. No.</th><th>Title</th><th>Date </th><th>Department</th><th>Download</th></tr>'+
    				'</thead>'+
    				'<tbody>';	
    	  }
    		
    		 var fromdate = $("#fromdate").val(); 
    		 var todate = $("#todate").val(); 
    		
    	     $.ajax({
    			 url:"noticebydates?fromdate="+fromdate+"&todate="+todate+"&type=NOTICE",
    				success:function(response){
    					console.log(response)
    					
    					 for(var i=0;i<response.notice.length;i++){   
    						var title;
    						var deptName;
    						var pathName;
    						
    						if(language=="marathi"){
    							title=response.notice[i].title_h;
    							deptName=response.notice[i].department.departmentName_h;
    						}else{
    							title=response.notice[i].title;	
    							deptName=response.notice[i].department.departmentName;
    						} 
    						
    					    var j = i+1;
    						issueHTML+='<tr><td>'+j+'</td>'+
    						'<td><a href="getNoticeById?id='+response.notice[i].noticeID+'">'+title+'</a></td>'+	  						
    						'<td>'+response.notice[i].publish_date+'</td>'+
    						'<td>'+deptName+'</td>'+
    						'<td>';
    						
    						for(var j=0;j<response.attachment.length;j++){   
    							if(response.notice[i].noticeID==response.attachment[j].moduleID){
    								if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
    									if(response.attachment[j].extension=="pdf"){
    										issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br> ';  
    									}else{
    										issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/img2.png" height="20px" width="20px"></a><br> ';  
    									}
    								}else if(language=="en_US"){
    									if(response.attachment[j].module_type=="English Attachment"){
    										atitle=response.attachment[j].title; 
    										if(response.attachment[j].extension=="pdf"){
    											issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br> ';  
    										}else{
    											issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/img2.png" height="20px" width="20px"></a><br> ';  
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
	 
	     $.ajax({
				url:"searchNoticesByDepartment?departments="+departments+"&noticeType=NOTICE"+"&category=NOTICE",
				success:function(response){
					//alert(response.length);
					console.log(response)
					 for(var i=0;i<response.notice.length;i++){   
							var title;
							var deptName;
							var pathName;
							
							if(language=="marathi"){
								title=response.notice[i].title_h;
								deptName=response.notice[i].department.departmentName_h;
							}else{
								title=response.notice[i].title;	
								deptName=response.notice[i].department.departmentName;
							} 
							
							
						    var j = i+1;
							issueHTML+='<tr><td>'+j+'</td>'+
							'<td><a href="getNoticeById?id='+response.notice[i].noticeID+'">'+title+'</a></td>'+	  						
							'<td>'+response.notice[i].publish_date+'</td>'+
							'<td>'+deptName+'</td>'+
							'<td>';
							for(var j=0;j<response.attachment.length;j++){   
								if(response.notice[i].noticeID==response.attachment[j].moduleID){
									if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
										if(response.attachment[j].extension=="pdf"){
											issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br> ';  
										}else{
											issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/img2.png" height="20px" width="20px"></a><br> ';  
										} 
									}else if(language=="en_US"){
										if(response.attachment[j].module_type=="English Attachment"){
											atitle=response.attachment[j].title; 
											if(response.attachment[j].extension=="pdf"){
												issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br> ';  
											}else{
												issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+'[size:'+response.attachment[j].size+'KB]<img src="staticResources/images/img2.png" height="20px" width="20px"></a><br> ';  
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