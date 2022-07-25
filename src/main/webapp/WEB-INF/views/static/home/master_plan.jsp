<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
      <title>.:: <spring:message code="background.b-l-m-container.li8"  /> ::.</title>
      
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          <jsp:include page="../includes/Header.jsp" />
        
         


         <div id="maincontent" class="container-fluid au-container" style="margin-top:30px;"> 
            
            <div class="row" style="padding-bottom: 25px;">
              
                  
                  <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div class="b-l-m-container">
                     <ul>
                        <li><a href="#"><spring:message code="background.b-l-m-container.li1"  /></a></li>
                        <li><a href="pmrda_background"><spring:message code="background.b-l-m-container.li2"  /></a></li>
                        <li><a href="vision_and_mission"><spring:message code="background.b-l-m-container.li3"  /></a></li>
                        <li><a href="leadership_and_core_team"><spring:message code="background.b-l-m-container.li5"  /></a></li>
                        <li><a href="objectives"><spring:message code="background.b-l-m-container.li4"  /></a></li>
                         <li><a class="active" href="master_plan"><spring:message code="background.b-l-m-container.li8"  /></a></li>
                          <%--  <li><a href="pmrda_establishment"><spring:message code="background.b-l-m-container.li7"  /></a></li>
                           <li><a href="digital_policy"><spring:message code="background.b-l-m-container.li9"  /></a></li>
                         <li><a href="administrative_structure"><spring:message code="background.b-l-m-container.li6"  /></a></li> --%>
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10 grayback" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;"><spring:message code="background.b-l-m-container.li8"  /> :</h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
				  <div class="heading-underline" style="width: 150px;">
					<div class="left"></div><div class="right"></div>
				</div>
				  <div class="blog_detail">


                            <p style="text-align:justify;"><spring:message code="masterplan.blog_detail.p1"  /></p>
 	
 	<h4><spring:message code="masterplan.blog_detail.h2"/></h4>
 	<ul>
 		<li><spring:message code="masterplan.blog_detail.p21"/></li>
 		<li><spring:message code="masterplan.blog_detail.p22"/></li>
 		<li><spring:message code="masterplan.blog_detail.p23"/></li>
 		<li><spring:message code="masterplan.blog_detail.p24"/></li>
 		<li><spring:message code="masterplan.blog_detail.p25"/></li>
 		<li><spring:message code="masterplan.blog_detail.p26"/></li>
 		<li><spring:message code="masterplan.blog_detail.p27"/></li>
 	</ul>
 	
 <p style="text-align:justify;"><spring:message code="masterplan.blog_detail.p3"  /></p>
                           
                            

                        </div>
                  </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>