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
      <meta name="keywords" content="">
      <title>.:: <spring:message code="Website.policy.title"  />::.</title>
	  
	<style>

.bloginfo p{
	text-align:justify;
	}
</style>  
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          
         <jsp:include page="../includes/Header.jsp" />
        
      <div class="clear"></div>
      <div id="maincontent" class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i><spring:message code="Website.policy.title"  /><a href="./index.htm" class="pathway"> </a></li></ol>
               </div>
            </section>
            <hr/>
            
                 <div class="col-sx-12 col-sm-12 col-md-12" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="static_content">
                            <div class="bloginfo">
                            <h4 style="margin-bottom: 0px;"><spring:message code="Website.policy.title"  /></h4><br>
                            <p><spring:message code="Website.policy.div1.p1"  /></p>
                           
                            <p><spring:message code="Website.policy.div1.p2"  /></p>
                            
                            <p><spring:message code="Website.policy.div1.p3"  /></p>
                            
                            <p><spring:message code="Website.policy.div1.p4"  /></p>
                            
                            <p><spring:message code="Website.policy.div1.p5"  /></p>
                            
                            <p><spring:message code="Website.policy.div1.p6"  /></p>
                            </div>
                            
                        
                        </div>
               </div>
               
               <div class="col-sx-12 col-sm-12 col-md-3 left-side" style="padding-right: 25px;">
                  
            </div>
      </div>


	</div>	
				
			
	<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>	
</div>   
   </body>
</html>