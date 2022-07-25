<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
       <meta name="keywords" content="help section,section of help]">
      <title>.:: <spring:message code="footer.li.25" /> ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <meta name="viewport" content="width=device-width" /> 
	  <style>

 p , li{
	text-align:justify;
	}
	
	table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 30px;
}
thead th{
	background: linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%);;
	color:white;
}
td, th {
  border: 1px solid #dddddd!important;
  text-align: left;
  padding: 8px!important;
}

tr:nth-child(even) {
  background-color: #efefef!important;
}

tbody td a{
	color:#777;
	text-decoration:none;
}
tbody td a:hover{
	color:red;
	text-decoration:underline;
}
.table1 td a{
	color:blue;
	text-decoration:underline;
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
                            <h3 style="margin-bottom: 0px;"><spring:message code="footer.li.25" /></h3><br>
                          <!--   <div class="heading-underline" style="width: 200px;">
					<div class="left"></div><div class="right"></div>
			   </div> -->
                            <div class="bloginfo">
                           
                            <p><spring:message code="Accessibility.p11" /></p>
                            <p><spring:message code="Accessibility.p12" /></p>
                            <p><spring:message code="Accessibility.p13" /></p>
                            
                            <hr>
                            
                           <h4><spring:message code="Accessibility.h2" /></h4>
                           <ul>
                           	<li><spring:message code="Accessibility.p21" /></li>
                           	<li><spring:message code="Accessibility.p22" /></li>
                           	<li><spring:message code="Accessibility.p23" /></li>
                           	<li><spring:message code="Accessibility.p24" /></li>
                           	<li><spring:message code="Accessibility.p25" /></li>
                           	<li><spring:message code="Accessibility.p26" /></li>
                           	<li><spring:message code="Accessibility.p27" /></li>
                           	<li><spring:message code="Accessibility.p28" /></li>
                           	<li><spring:message code="Accessibility.p29" /></li>
                           	<li><spring:message code="Accessibility.p210" /></li>
                          	<li><spring:message code="Accessibility.p211" /></li>
                           	<li><spring:message code="Accessibility.p212" /></li>
                           	<li><spring:message code="Accessibility.p213" /></li>
                           </ul>
                            
                            <hr>
                            
                            <h4><spring:message code="Accessibility.h3" /></h4>
                            <p>
                            	<spring:message code="Accessibility.p31" /><br>
                            	<spring:message code="Accessibility.p32" /><br>
                            	<spring:message code="Accessibility.p33" />
                            </p>
                            
                            <hr>
                            
                             <h4><spring:message code="Accessibility.h4" /></h4>
                             <p><spring:message code="Accessibility.p41" /></p>
                             <p>
                             	<spring:message code="Accessibility.p42" /><br>
                             	<spring:message code="Accessibility.p43" /><br>
                             	<spring:message code="Accessibility.p44" /><br>
                             </p>
                           
                           <p><spring:message code="Accessibility.p45" /> </p>
                           
                           
                           
                            </div>
                            
                             
                            
                             
                         
                            
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