<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
   <meta name="viewport" content="width=device-width" />
    <meta name="keywords" content="ceo of pmrda pmrda ceo,Metropolitan Commissioner,Commissioner of Metropolitan">
     <meta name="description" content=" ceo of pmrda,about pmrda ceo"/>
    <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.::  <spring:message code="Header.Menu.AboutUs.curropening" /> ::.</title>
      
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
     <%--  <div id="maincontent"   class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active"><spring:message code="navigation.container.li1"  /> </li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway"><spring:message code="navigation.container.li2"  /></a><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway"><spring:message code="about.navigation.container.li3"  /> </a><span class="divider">\</span></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="ceo.title"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>

		

         <div class="container-fluid text-center" style="margin-top:30px; padding: 20px 0px;"> 
             <div class="row">
				
				
				<div class="col-md-12" style="padding: 20px 0px;">
				<h3><spring:message code="curopening.msg.noopening"  /></h3>
				<hr>
				
				</div>
				
				</div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>