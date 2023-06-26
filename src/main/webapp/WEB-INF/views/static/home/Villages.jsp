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
<title>.:: <spring:message code="Header.Menu.AboutUs.listofvillages" /> ::.
</title>
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
                <li><a href="#"><spring:message code="Header.Menu.Downloads" /> </a></li>
                   <li>  <a href="act"><spring:message code="Header.Menu.AboutUs.acts" /></a></li>
					<li>	    <a href="govresolution"><spring:message code="Header.Menu.AboutUs.govresol" /></a></li>						
						<li>     <a href="pmrda_circulars"><spring:message code="Header.Menu.AboutUs.notifications" /></a></li>
						    <li> <a href="policies"><spring:message code="Header.Menu.AboutUs.policies" /></a></li>
						 <li><a class="active" href="listofvillages"><spring:message code="Header.Menu.AboutUs.listofvillages" /></a></li>
							 <li> <a href="Maps"><spring:message code="Header.Menu.AboutUs.maps" /></a></li> 
                         <li> <a href="govpmay"><spring:message code="contact.div.h55.pmay" /></a></li> 
                       
                     </ul>
                  </div>
            </div>
		<div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
		<div class="row">
				<div class="itemHeader" style="width:100%;">

					<h3 class="itemTitle">
					 <spring:message code="Header.Menu.AboutUs.listofvillages" />
					</h3>	
				</div>
				<div class="heading-underline" style="width: 200px;">
					<div class="left"></div>
					<div class="right"></div>
				</div>
			</div>
		<div class="row" id="data" style="overflow-x: auto;">
				<div id="englishtable" style="display: visible; width:100%;">
					<table class="table table-bordered dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>

							<tr style="white-space:nowrap;">
								<th scope="col">S.N.</th>
								<th scope="col">Taluka</th>								
								<th scope="col">Total Number of Villages</th>
								<th scope="col">Remarks(Excluded/Included)</th>
								<th scope="col">Download</th>
							</tr>
							<c:forEach var="taluka" items="${talukaList}" varStatus="status">
								<tr>
									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span></td>									
									<td style="text-align:center;"><span id="SitePH_grdupload_lblCategory_0">${taluka.taluka}</span></td>									
									<td style="text-align:center;" class="A">${taluka.total_villages}</td>
									<td class="filterDates">${taluka.remark}</td>
									<td><c:forEach var="attachmentlist"	items="${attachmentList}" varStatus="status">	
									<c:if test="${taluka.id == attachmentlist.taluka.id }">										
											<c:if test="${attachmentlist.module_type == 'English Attachment'}">												
											<a href="javascript:attachmentDownload(${attachmentlist.attachmentID})" >List of Villages</a><br>
											</c:if>	
									</c:if>												
									</c:forEach></td>
								</tr>
								
							</c:forEach>
							<tr>
								<td></td>
								<td style="text-align:center;"><b>Total</b></td>
								<td style="text-align:center;"><b>${count}</b></td>
								<td></td>
								<td><a href="javascript:attachmentDownload1()" >List of All Villages</a></td>
								</tr>
						</tbody>

					</table>
				</div>
				<div id="marathitable" style="display: none;width:100%;">

					<table class="table table-bordered table-striped dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;">
						<tbody>
							<tr style="white-space:nowrap;">
								<th scope="col">अ.क्र.</th>
								<th scope="col">तालुका</th>
								<th scope="col">गावांची एकूण संख्या</th>
								<th scope="col">टिप्पणी (वगळले/समाविष्ट केले)</th>
								<th scope="col">डाउनलोड</th>
							</tr>
							<% int n=0; %>
							<c:forEach var="taluka" items="${talukaList}" varStatus="status">
							<% n=n+1; %>
							<% String numb=NumbersEnglishToMarathi.convertInMarathi(String.valueOf(n)); %>
								<tr>
									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0"><%=numb %></span></td>									
									<td style="text-align:center;"><span id="SitePH_grdupload_lblCategory_0">${taluka.taluka_h}</span></td>									
									<td style="text-align:center;" class="A">${taluka.total_villages_h}</td>
									<td class="filterDates">${taluka.remark_h}</td>
									<td><c:forEach var="attachmentlist"	items="${attachmentList}" varStatus="status">	
									<c:if test="${taluka.id == attachmentlist.taluka.id }">										
											<c:if test="${attachmentlist.module_type == 'Marathi Attachment'}">
												<a href="javascript:attachmentDownload(${attachmentlist.attachmentID})" >खेड्यांची यादी</a><br>
											</c:if>	
									</c:if>												
									</c:forEach></td>
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td style="text-align:center;"><b>एकूण</b></td>
								<td style="text-align:center;"><b>${count_mr}</b></td>
								<td></td>
								<td><a href="javascript:attachmentDownload1()" >सर्व खेड्यांची यादी</a></td>
								</tr>
						</tbody>

					</table>
				</div>

		</div>
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
		
		<form:form  action="previewFrontPdf" id="viewAttachform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="attachid" name="id" />  
  </form:form>
  
  	<form:form  action="previewAllVillagepdf" id="viewAttachform1" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
    
  </form:form>
  
<script type="text/javascript">
function attachmentDownload(id){
	  $("#attachid").val(id);
	  $("#viewAttachform").submit();
	  return true;
}

function attachmentDownload1(){
	  $("#viewAttachform1").submit();
	  return true;
}
</script>
		
	</div>
</body>
</html>