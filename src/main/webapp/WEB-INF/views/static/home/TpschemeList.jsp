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
  <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
<title>.:: <spring:message code="Header.Menu.TpScheme" /> ::.
</title>
<meta name="viewport" content="width=device-width" />
<script src="staticResources/js/jquery.night.mode.js"></script>
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
			
            
            <div class="col-sx-12 col-sm-12 col-md-12" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
            <div class="row">
				<div class="itemHeader" style="width:100%;">

					<h3 class="itemTitle">
					<spring:message code="Header.Menu.TpScheme.list" />
						<%-- <spring:message code="notice.t3-mainbody.itemTitle.h2" /><a href ="Archive_notice" style="color:green;font-size: 22px"  class="archiveLink"><spring:message code="archive.archived.notice" /></a> --%>
					</h3>

				</div>

				<div class="heading-underline" style="width: 200px;">
					<div class="left"></div>
					<div class="right"></div>
				</div>
		</div>
		<div class="row" id="data" style="overflow-x: auto;">
				<div id="englishtable" style="display: visible; width:100%;">
					<table class="table table-bordered  dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>

							<tr style="white-space:nowrap;">
								<th style="width:5%;" scope="col">S.N.</th>
								<th  scope="col">Title</th>								
								<th  style="width:21%;">Action</th>
							</tr>
							 <c:set value="${project.id}" var="id"></c:set>
                     <c:forEach items="${tpList}" var="projectList" varStatus="status">

								<tr>


									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
									</td>
									<td><span id="SitePH_grdupload_lblCategory_0">${projectList.title}</span></td>
									<td style="text-align:center;"><a class="btn mr-2 text-white" href="javascript:getTpScheme(${projectList.id})">View</a></td>
								</tr>

							 </c:forEach> 
						</tbody>
	
					</table>
				</div>
				
<div id="marathitable" style="display: none; width:100%;">
					<table class="table table-bordered  dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>

							<tr style="white-space:nowrap;">
								<th style="width:5%;" scope="col">अ.क्र.</th>
								<th  scope="col">शीर्षक</th>								
								<th  style="width:21%;">कृती</th>
							</tr>
							 <c:set value="${project.id}" var="id"></c:set>
                     <c:forEach items="${tpList}" var="projectList" varStatus="status">

								<tr>


									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
									</td>
									<td><span id="SitePH_grdupload_lblCategory_0">${projectList.title}</span></td>
									<td style="text-align:center;"><a class="btn mr-2 text-white" href="javascript:getTpScheme(${projectList.id})">View</a></td>
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
<form:form action="TpschemeView" id="tpform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" > <input type="hidden" id="tpid" name="id" /> </form:form>

  
<script type="text/javascript">



function getTpScheme(id){
	 $("#tpid").val(id);
	$("#tpform").submit();
	 return true;
}
       
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