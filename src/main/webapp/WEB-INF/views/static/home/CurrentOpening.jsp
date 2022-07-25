<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder"%>
	<%@ page import="com.cmsManagement.util.NumbersEnglishToMarathi"%>
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
<title>.::  <spring:message code="Header.Menu.AboutUs.curropening" /> ::.</title>
<link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
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


		<div id="maincontent"    class="container-fluid t3-mainbody dl-container" style="margin-top:30px;">
		
		<div class="row">
			  <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
               <li><a href="#">  <spring:message code="Header.Menu.AboutUs.careers" /> </a></li>
                   <li><a class="active" href="currentOpen"> <spring:message code="Header.Menu.AboutUs.curropening" /></a></li>    
                     </ul>
                  </div>
            </div> 
            
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
            <div class="row">
				<div class="itemHeader" style="width:100%;">

					<h3 class="itemTitle">
					 <spring:message code="Header.Menu.AboutUs.curropening" />
						<%-- <spring:message code="notice.t3-mainbody.itemTitle.h2" /><a href ="Archive_notice" style="color:green;font-size: 22px"  class="archiveLink"><spring:message code="archive.archived.notice" /></a> --%>
					</h3>

				</div>

				<div class="heading-underline" style="width: 200px;">
					<div class="left"></div>
					<div class="right"></div>
				</div>
		</div>
		<form action="">

			
			</form>
		<div class="row" id="data" style="overflow-x: auto;">
				<div id="englishtable" style="display: visible; width:100%;">
					<table class="table table-bordered  dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>

							<tr style="white-space:nowrap;">
								<th style="width:5%;" scope="col">S.N.</th>
								<th style="width:30%;" scope="col">Department</th>								
								<th style="width:30%;" scope="col">Name of the Post</th>
								<th scope="col">Required Number</th>
								<th scope="col">Download</th>
							</tr>
							<c:forEach var="list" items="${list}" varStatus="status">

								<tr>


									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
									</td>
									<td><span id="SitePH_grdupload_lblCategory_0">${list.department.departmentName}</span></td>									
									<td class="A">${list.post}</td>
									<td style="text-align:center;">${list.total_vacancy}</td>
									<td><c:forEach var="attachmentlist"	items="${attachmentList}" varStatus="status">
										<c:if test="${list.id ==  attachmentlist.opening.id}">		
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
										</c:forEach></td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
				<div id="marathitable" style="display: none;width:100%;">

					<table class="table table-bordered  dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>

							<tr style="white-space:nowrap;">
								<th style="width:5%;" scope="col">अ.क्र.</th>
								<th style="width:30%;" scope="col">विभाग</th>
								<th style="width:30%;" scope="col">पदनाम</th>
								<th scope="col">आवश्यक नंबर</th>
								<th scope="col">डाउनलोड</th>
							</tr>
							<% int n=0; %>
							<c:forEach var="list" items="${list}"
								varStatus="status">
							<% n=n+1; %>
							<% String numb=NumbersEnglishToMarathi.convertInMarathi(String.valueOf(n)); %>
								<tr>


									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0"><%=numb %></span>
									</td>
									<td><span id="SitePH_grdupload_lblCategory_0">${list.department.departmentName_h}</span></td>
									<td style="text-align:center;" >${list.post_h}</td>
									<td class="A" style="text-align:center;">${list.total_vacancy_h}</td>
									<td><c:forEach var="attachmentlist"
											items="${attachmentList}" varStatus="status">
											<c:if
												test="${list.id ==  attachmentlist.opening.id}">
												<c:if
													test="${attachmentlist.module_type == 'Marathi Attachment'}">
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
										</c:forEach></td>
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
    			 }
    		 
    		 // SubmitDates()
    		  
    		  
    	}); 
 
       
    
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
		
	</div>
</body>
</html>