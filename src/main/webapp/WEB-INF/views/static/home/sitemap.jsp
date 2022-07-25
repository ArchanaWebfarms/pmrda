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
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="sitemap.title"  />::.</title>
	  
	<style>
	.sitenav{
		    border-left: solid 3px #1487c5;
	}
	.sitenav li{
		color:black;
		
	}
	.sitenav a{
		color:#777;
		transition:0.3s;
	}
	.sitenav a:hover{
		color:#c93638;
		text-decoration:underline;
		transition:0.3s;
	}
	</style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          
         <jsp:include page="../includes/Header.jsp" />
         <input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>
			<c:set var="engLang" value="en_US"/>
      <div class="clear"></div>
      <div id="maincontent"   class="container-fluid contbackground" style="margin-top:30px;">
         <%-- <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <spring:message code="sitemap.title"  /><a href="./index.htm" class="pathway"> </a></li></ol>
               </div>
            </section> --%>
            <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h2 class="itemTitle">
               
             <spring:message code="sitemap.title" /> 
               </h2>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>

         </div>
           
           
           <div class="row">
           	<div class="col-md-6">
           		<div class="sitenav">
           			<ul>
           				<li><a href="index.htm"><spring:message code="Header.Menu1.Home" /></a></li>
           				<li><spring:message code="Header.Menu.AboutUs" />
           				<ul>
           					<li><a href="pmrda_background"><spring:message code="Header.Menu.AboutUs.background" /></a></li>
           					<li><a href="vision_and_mission"><spring:message code="Header.Menu.AboutUs.vision" /></a></li>
           					<li><a href="leadership_and_core_team"><spring:message code="Header.Menu.AboutUs.administrative.leader" /></a></li>
           					<li><a href="objectives"><spring:message code="Header.Menu.AboutUs.objectives" /></a></li>
           					
       						<li><a href="master_plan"><spring:message code="Header.Menu.AboutUs.masterplan" /></a></li>
      						
      					</ul>
           				</li>
           				<%-- <li><spring:message code="Header.Menu.AboutUs.administrative" />
           				<ul>
           					<li><a href="leadership_and_core_team"><spring:message code="Header.Menu.AboutUs.administrative.leader" /></a></li>
           					<li><a href="administrative_structure"><spring:message code="Header.Menu.AboutUs.administrative.structure" /></a></li>
           				</ul>
           				</li> --%>
           																																						
           				
           				<li><spring:message code="Header.Menu.Departments" />
           				<ul>
           				<c:forEach items="${departmentList}" var="departmentList">
						    <c:choose>
						    	<c:when test="${departmentList.deptId==26}">
						    	
						    	</c:when>
						    	<c:otherwise>
						    	  <c:choose>
								<c:when test="${localLang eq engLang}">
								
							      	<li><a href="getDepartmentById?id=${ departmentList.deptId}">${ departmentList.departmentName}</a></li>
							     </c:when>
							     <c:otherwise>
							      	<li><a href="getDepartmentById?id=${ departmentList.deptId}">${ departmentList.departmentName_h}</a></li>
							     </c:otherwise>
							  </c:choose>
							 
						    	</c:otherwise>
						    </c:choose>
						    	 </c:forEach>				
           				</ul>
           				</li>
           				
           				<li><spring:message code="Header.Menu.Projects" /> 
           						<ul>
           							<c:forEach items="${projectList}" var="projectList">
						     <c:choose>
								<c:when test="${localLang eq engLang}">
							      	<li><a href="getProjectById?id=${ projectList.id}">${ projectList.title}</a></li>
							     </c:when>
							     <c:otherwise>
							      	<li><a href="getProjectById?id=${ projectList.id}">${ projectList.title_h}</a></li>
							     </c:otherwise>
							  </c:choose>
							  </c:forEach>
           						</ul>
           					</li>
           				
           				<li><spring:message code="Header.Menu.Downloads" />
           				<ul>
           					<li><a href="act"><spring:message code="Header.Menu.AboutUs.acts" /></a></li>
						   <li> <a href="govresolution"><spring:message code="Header.Menu.AboutUs.govresol" /></a></li>
						   <li>  <a href="pmrda_circulars"><spring:message code="Header.Menu.AboutUs.notifications" /></a></li>
						    <li> <a href="policies"><spring:message code="Header.Menu.AboutUs.policies" /></a></li>
							<li> <a href="listofvillages"><spring:message code="Header.Menu.AboutUs.listofvillages" /></a></li>
							<li>  <a href="Maps"><spring:message code="Header.Menu.AboutUs.maps" /></a>    </li>
           				</ul>
           				</li>
           				<li><spring:message code="Header.Menu.AboutUs.careers" /> 
           					<ul>
           						
           						<li><a href="currentOpen"><spring:message code="Header.Menu.AboutUs.curropening" /></a></li>
           					</ul>
           				
           				</li>
           				
           				 <li><spring:message code="Header.Menu.AboutUs.citizenservice" />
						   <ul>
						    <li> <a href="http://zonecertificate.pmrda.gov.in/" target="_blank"><spring:message code="Header.Menu.AboutUs.zonecrt" /></a></li>
						      <li> <a href="https://www.pmrda-obpas.com/" target="_blank"><spring:message code="Header.Menu.AboutUs.obpas" /></a></li>
							 <li>	<a href="pmay"><spring:message code="Header.Menu.AboutUspmay" /></a></li>
						      <li> <a href="feedback"><spring:message code="footer.li8" /></a></li>
						      <li> <a href="enquiry"><spring:message code="footer.li.28" /></a></li>
						        
						        </ul>
						       </li>
           			</ul>
           		</div>
           	</div>
           	<div class="col-md-6">
           		<div class="sitenav">
           			<ul>
           				
						       
						       <li><spring:message code="Header.Menu.AboutUs.mediacntr" />
						    
						   <ul>
						    <li>  <a href="press_notes"><spring:message code="pressnotes.title" /></a></li>
						    <li>  <a href="pmrda_news"><spring:message code="pagetitle.whatnew" /></a></li>
						      <li><a href="videos"><spring:message code="index.module-ct.span1" /></a></li>
						      <li> <a href="gallery"><spring:message code="index.module-ct.span2" /></a></li>
						       </ul>
						       </li>
						       
						       <li> <spring:message code="index.Tender" /> 
						   
						   <ul>  
						     <li> <a href="https://mahatenders.gov.in/nicgep/app" onClick="return confirm('<spring:message code="index.confirm.msg" /> ')" target="_blank"><spring:message code="index.mtendrlik" /> </a></li>
						     <li> <a href="pmrda_tenders"><spring:message code="pagetitle.tender.notice" /> </a></li>
						    <li>  <a href="https://gem.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg" /> ')" target="_blank"><spring:message code="index.portllik" /> </a></li>
						       </ul>
						       </li>
						       
						       <li><spring:message code="Header.Menu.Help1" />
						   <ul>
						     <li> <a href="pmrda_rti"><spring:message code="index.prodis" /> </a></li>
						     <li> <a href="https://rtionline.maharashtra.gov.in/index-e.php" onClick="return confirm('<spring:message code="index.confirm.msg" />')" target="_blank"><spring:message code="index.onlinerti" />  </a></li>
						      </ul> 
						       
						       </li>
						       
           				
           				<li><a href="contact"><spring:message code="Header.Menu.Contact" /></a></li>
           				
           				<li><spring:message code="footer.h4.2" />
           				<ul>
	           				<li><a href="copyrightPolicy" target="_blank"><spring:message code="copyRightPolicy.title" />  </a></li>
	                        <li><a href="cmap" target="_blank"><spring:message code="footer.li11" /></a></li>
	                        <li><a href="cap" target="_blank"><spring:message code="footer.li.21" /></a></li>
	                        <li><a href="crp" target="_blank"><spring:message code="footer.li.22" /> </a></li>
	                        <li><a href="hyperlinkpolicy" target="_blank"><spring:message code="footer.li4" /></a></li>
	                        <li><a href="privacypolicy" target="_blank" ><spring:message code="footer.li2" /></a></li>
	                        <li><a href="termsconditions"  target="_blank"><spring:message code="footer.li6" /></a></li>
	                        <li><a href="websiteMonitoringPolicies" target="_blank"><spring:message code="footer.li.23" /></a></li>
	                       
	                        <li><a href="disclaimer" target="_blank"><spring:message code="footer.li3" /></a></li>
           				</ul>
           				</li>
           				<li><spring:message code="footer.h4.1" />
           				<ul>
           					<li><a href="sitemap" target="_blank"><spring:message code="footer.li12" /> </a></li>
                           	<li><a href="accessibility"><spring:message code="footer.li.25" /> </a></li>
                           	<li><a href="help"><spring:message code="help.title" /> </a></li>
           				</ul>
           				</li>
           				<li><spring:message code="footer.h4.4" /></li>
           				<ul>
           					 <li><a href="contact" target="_blank"><spring:message code="footer.li.26" /></a></li>
                            <li><a href="feedback" target="_blank"><spring:message code="footer.li8" /> </a></li>
                            
                            <li><a href="enquiry" target="_blank"><spring:message code="footer.li.28" /></a></li>
           				</ul>
           			</ul>
           		</div>
           	</div>
           	
           </div>
            
      
               
               
      </div>

<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>	
	</div>	
				
			
	
</div>   
   </body>
</html>


		