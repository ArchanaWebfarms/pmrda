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
    <meta name="keywords" content="Guardian Minister of pmrda, pmrda Guardian Minister, Chief Minister of Maharashtra">
     <meta name="description" content="Pune is one of the important and rapidly growing cities in the country, and hence, its planned development is required. Many people come to Pune for the purpose of employment and the State Government has set up PMRDA to pursue the city’s planned development."/>
      <title>Shri. Ajit Pawar [Hon. Guardian Minister]</title>
     <style>
     .text-center p{
     text-align:justify;
     }
     	
     </style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
           <jsp:include page="../includes/Header.jsp" />

		 <div class="clear"></div>
    <%--   <div id="maincontent"   class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active"><spring:message code="navigation.container.li1"  /> </li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway"><spring:message code="navigation.container.li2"  /></a><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway"><spring:message code="about.navigation.container.li3"  /> </a><span class="divider">\</span></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="hgm.title"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>

		

         <div class="container-fluid au-cmm-container text-center" style="margin-top:30px;"> 
             <div class="row">
				<img src="staticResources/images/icon/AjitPawar.jpg" alt="Shri. Ajit Pawar"><br/><br/>
				<h3><spring:message code="hgm.body.h1"  /></h3>
				<h4><spring:message code="hgm.body.h2"  /></h4>
				<div class="heading-underline" style="width: 200px;margin: 0px auto;">
					<div class="left"></div><div class="right"></div>
			   </div>
				<br/>
				<p><spring:message code="hgm.body.p1"  /></p>
				
				
				</div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>