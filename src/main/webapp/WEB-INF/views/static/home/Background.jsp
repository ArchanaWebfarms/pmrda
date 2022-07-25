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
      <meta name="description" content="Pune has come to be known one of the most advanced and industrialized cities of India "/>
       <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
        <title>.:: <spring:message code="background.title"  /> ::.</title>
        
   </head>
   <body>
  
      <div class="t3-wrapper t3-homepage-2">
        
       
         <jsp:include page="../includes/Header.jsp" />


         <div id="maincontent" class="container-fluid au-container" style="margin-top:30px;"> 
            
            <div class="row" style="padding-bottom: 25px;">
              
               
                 <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div   class="b-l-m-container">
                     <ul>
                        <li><a href="#"><spring:message code="background.b-l-m-container.li1"  /></a></li>
                        <li><a class="active" href="pmrda_background"><spring:message code="background.b-l-m-container.li2"  /></a></li>
                        <li><a href="vision_and_mission"><spring:message code="background.b-l-m-container.li3"  /></a></li>
                        <li><a href="leadership_and_core_team"><spring:message code="background.b-l-m-container.li5"  /></a></li>
                        <li><a href="objectives"><spring:message code="background.b-l-m-container.li4"  /></a></li>
                         <li><a href="master_plan"><spring:message code="background.b-l-m-container.li8"  /></a></li>
                          <%--  <li><a href="pmrda_establishment"><spring:message code="background.b-l-m-container.li7"  /></a></li>
                           <li><a href="digital_policy"><spring:message code="background.b-l-m-container.li9"  /></a></li>
                         <li><a href="administrative_structure"><spring:message code="background.b-l-m-container.li6"  /></a></li> --%>
                     </ul>
                  </div>
               </div> 
               <div class="col-sx-12 col-sm-12 col-md-10 contdiv" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;"><spring:message code="background.title"  /> :</h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 170px;">
								<div class="left"></div><div class="right"></div>
						    </div>

				  <p style="text-align:justify;">
                     <spring:message code="background.col-sx-12col-sm-12col-md-9.p1"  />  </p>
                     <p style="text-align:justify;">
                     <spring:message code="background.col-sx-12col-sm-12col-md-9.p2"  />  </p>
                     <p style="text-align:justify;">
                     <spring:message code="background.col-sx-12col-sm-12col-md-9.p3"  />  </p>
                     <p style="text-align:justify;">
                     <spring:message code="background.col-sx-12col-sm-12col-md-9.p4"  />  </p>
                     <br>
                  <h4 style="color: #0086b2!important;"> <spring:message code="background.col-sx-12col-sm-12col-md-9.h1"  /></h4>
                  <table style="width:100%" border="0px">
                       <tbody>
                          <tr style="width:70px; padding:5px;">
                           <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td1"  /></td>
                           <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td2"  /></td>
                          </tr>
                          <tr style="width:70px; padding:5px;">
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td3"  /></td>
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td4"  /></td>
                          </tr>
                          <tr style="width:70px; padding:5px;">
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td5"  /></td>
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td6"  /></td>
                          </tr>
                          <tr style="width:70px; padding:5px;">
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td7"  /></td>
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td8"  /></td>
                          </tr>
                          <tr style="width:70px; padding:5px;">
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td9"  /></td>
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td10"  /></td>
                          </tr>
                          <tr style="width:70px; padding:5px;">
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td11"  /></td>
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td12"  /></td>
                          </tr>
                          <tr style="width:70px; padding:5px;">
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td13"  /></td>
                              <td><spring:message code="background.col-sx-12col-sm-12col-md-9.td14"  /></td>
                          </tr>
                      </tbody>
                  </table><br/>
                  <h4 style="color: #0086b2!important;"><spring:message code="background.col-sx-12col-sm-12col-md-9.h2"  /></h4>
                  <img src="staticResources/t3-assets/images/PMRDA Region.jpg">
               </div>
            </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>