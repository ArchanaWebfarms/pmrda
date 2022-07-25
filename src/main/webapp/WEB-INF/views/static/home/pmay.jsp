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
      <title>.:: <spring:message code="Header.Menu.AboutUspmay"  /> ::.</title>
	  <style>

.bloginfo p{
	text-align:justify;
	}
	
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
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


tabe td ul{
	padding-left:15px;
}
</style>  
	
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          
         <jsp:include page="../includes/Header.jsp" />
        
      <div class="clear"></div>
      <div id="maincontent"   class="container-fluid" style="margin-top:30px;">
      <div class="row">
      <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
				              <li>  <a href="#"><spring:message code="Header.Menu.AboutUs.citizenservice"  /></a></li>
							<li>	<a href="http://zonecertificate.pmrda.gov.in/" target="_blank"><spring:message code="Header.Menu.AboutUs.zonecrt"  /></a></li>
							    <li>  <a href="https://www.pmrda-obpas.com/" target="_blank"><spring:message code="Header.Menu.AboutUs.obpas"  /></a></li>
								<li><a class="active" href="pmay" ><spring:message code="Header.Menu.AboutUspmay"  /></a></li>
						      <li><a  href="feedback"><spring:message code="index.feedback"  /></a></li>						      
						     <li> <a href="enquiry"><spring:message code="footer.li.28"  /></a></li>
                       
                     </ul>
                  </div>
            </div>
      
     
     <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="static_content">
        <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h3 class="itemTitle">
               
              <spring:message code="Header.Menu.AboutUspmay"  />
               </h3>

            </div>
               
            <div class="heading-underline" style="width: 200px;  ">
               <div class="left"></div><div class="right"></div>
            </div>

         </div>
                            <div class="bloginfo">
                            
                            <p>
                            	<spring:message code="pmay.div.p1"  />
                            </p> 
                             <p>
								<spring:message code="pmay.div.p2"  />:
							</p>
                                 
                                 <ul style="list-style:none;">
                                 	<li><spring:message code="pmay.div.ul.li1"  />	</li>
                                 	<li><spring:message code="pmay.div.ul.li2"  />	</li>
                                 	<li><spring:message code="pmay.div.ul.li3"  />	</li>
                                 
                                 </ul>
                                 
                                 <div style="overflow:auto;">
                                 <table>
                                 	<thead>
                                 		<tr>
                                 			<th style="width:5%;"><spring:message code="pmay.div.table.th1"  /></th>
                                 			<th style="width:15%;"><spring:message code="pmay.div.table.th2"  /></th>
                                 			<th style="width:10%;"><spring:message code="pmay.div.table.th3"  /></th>
                                 			<th style="width:15%;"><spring:message code="pmay.div.table.th4"  /></th>
                                 			<th style="width:20%;"><spring:message code="pmay.div.table.th5"  /></th>
                                 			<th style="width:35%;"><spring:message code="pmay.div.table.th6"  /></th>
                                 		</tr>
                                 	</thead>
                                 <tbody>
                                 	<tr>
                                 		<td style="text-align:center;"><spring:message code="pmay.div.table.tr1.td1"  /></td>
                                 		<td><spring:message code="pmay.div.table.tr1.td2"  /></td>
                                 		<td><spring:message code="pmay.div.table.tr1.td3"  /></td>
                                 		<td><spring:message code="pmay.div.table.tr1.td4"  /> </td>
                                 		<td><spring:message code="pmay.div.table.tr1.td5"  /></td>
                                 		<td>
                                 			<ul style="padding-left:15px;">
                                 				<li><spring:message code="pmay.div.table.tr1.td6.li1"  /></li>
                                 				<li><spring:message code="pmay.div.table.tr1.td6.li2"  /></li>
                                 				<li><spring:message code="pmay.div.table.tr1.td6.li3"  /></li>
                                 				<li><spring:message code="pmay.div.table.tr1.td6.li4"  /></li>
                                 				<li><spring:message code="pmay.div.table.tr1.td6.li5"  /></li>
                                 				<li><spring:message code="pmay.div.table.tr1.td6.li6"  /></li>
                                 				<li><spring:message code="pmay.div.table.tr1.td6.li7"  /></li>
                                 			</ul>
                                 		</td>
                                 	</tr>
                                 	<tr>
                                 		<td style="text-align:center;"><spring:message code="pmay.div.table.tr2.td1"  /></td>
                                 		<td><spring:message code="pmay.div.table.tr2.td2"  /></td>
                                 		<td><spring:message code="pmay.div.table.tr2.td3"  /></td>
                                 		<td><spring:message code="pmay.div.table.tr2.td4"  /></td>
                                 		<td><spring:message code="pmay.div.table.tr2.td5"  /></td>
                                 		<td>
                                 			<ul style="padding-left:15px;">
                                 				<li><spring:message code="pmay.div.tr2.td6.li1"  /></li>
                                 				<li><spring:message code="pmay.div.tr2.td6.li2"  /></li>
                                 				<li><spring:message code="pmay.div.tr2.td6.li3"  /></li>
                                 				<li><spring:message code="pmay.div.tr2.td6.li4"  /></li>
                                 				<li><spring:message code="pmay.div.tr2.td6.li5"  /></li>
                                 				<li><spring:message code="pmay.div.tr2.td6.li6"  /></li>
                                 				<li><spring:message code="pmay.div.tr2.td6.li7"  /></li>
                                 			</ul>
                                 		</td>
                                 	</tr>
                                 	<tr>
                                 		<td style="text-align:center;"><spring:message code="pmay.div.tr3.td1"  /></td>
                                 		<td><spring:message code="pmay.div.tr3.td2"  /></td>
                                 		<td><spring:message code="pmay.div.tr3.td3"  /></td>
                                 		<td><spring:message code="pmay.div.tr3.td4"  /></td>
                                 		<td><spring:message code="pmay.div.tr3.td5"  /></td>
                                 		<td>
                                 			<ul style="padding-left:15px;">
                                 				<li><spring:message code="pmay.div.tr3.td6.li1"  /></li>
                                 				<li><spring:message code="pmay.div.tr3.td6.li2"  /></li>
                                 				<li><spring:message code="pmay.div.tr3.td6.li3"  /></li>
                                 				<li><spring:message code="pmay.div.tr3.td6.li4"  /></li>
                                 				<li><spring:message code="pmay.div.tr3.td6.li5"  /></li>
                                 				<li><spring:message code="pmay.div.tr3.td6.li6"  /></li>
                                 				<li><spring:message code="pmay.div.tr3.td6.li7"  /></li>
                                 			</ul>
                                 		</td>
                                 	</tr>
                                 	
                                 </tbody>
                                 
                                 </table>
                                 </div>
                                 
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