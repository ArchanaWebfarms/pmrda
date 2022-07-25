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
      <meta name="description" content=" Content needs to be contributed by the authorized Content Owner  the respective deputy directorsfrom various wings of PMRDA in a consistent fashion to maintain uniformity"/>
     <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="cap.title"  />::.</title>
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
      <div id="maincontent"   class="container-fluid" style="margin-top:30px;">
         
            
                 <div class="col-sx-12 col-sm-12 col-md-12" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="static_content">
        
                            <div class="bloginfo">
                            <h4 style="margin-bottom: 0px;"><spring:message code="cap.div.h4"  /></h4><br>
                            <p><spring:message code="cap.div.h4.p1"  /></p> 
                             <p><spring:message code="cap.div.h4.p2"  /></p>
                                  <p><spring:message code="cap.div.h4.p3"  /></p>
                            </div>
                            
                           
                            <div class="bloginfo">
                            
                            
                            
                            
                            <p><strong><spring:message code="cmap.div.p6"  /></strong></p>
                            <p style="margin-top:20px;"><spring:message code="cmap.div.p7"  /><br>
                           <spring:message code="cmap.div.p8"  /><spring:message code="cap.div.p8.ph"  /><br>
                           <spring:message code="cmap.div.p9"  />ad.pmrda@gmail.com</p>
                            
                            </div>
                            
                        </div>
               </div>
               
               <div class="col-sx-12 col-sm-12 col-md-3 left-side" style="padding-right: 25px;">
                  
            </div>
      </div>

<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>	
	</div>	
				
			
	
</div>   
   </body>
</html>