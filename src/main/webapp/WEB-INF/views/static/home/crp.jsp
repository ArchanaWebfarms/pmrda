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
      <title>.:: <spring:message code="crp.title"  />::.</title>
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

tr:nth-child(even) {
  background-color: #efefef!important;
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
                            <h4 style="margin-bottom: 0px;"><spring:message code="crp.div.h4"  /></h4><br>
                            <p><spring:message code="crp.div.h4.p1"  /></p> 
                             <p><spring:message code="crp.div.h4.p2"  /></p>
                                 
                            </div>
                            
                           
                            <div class="bloginfo">
                            
                            <table style="margin-bottom:20px;">
                            <thead>
                            	<tr>
                            		<th rowspan="2"><spring:message code="crp.table.tr1.th1"  /></th>
                            		<th rowspan="2"><spring:message code="crp.table.tr1.th2"  /></th>
                            		<th colspan="3"><spring:message code="crp.table.tr1.th3"  /></th>
                            		<th rowspan="2"><spring:message code="crp.table.tr1.th4"  /></th>
                            		<th rowspan="2"><spring:message code="crp.table.tr1.th5"  /></th>
                            		<th rowspan="2"><spring:message code="crp.table.tr1.th6"  /></th>
                            	</tr>
                            	<tr>
                            		
                            		<th><spring:message code="crp.table.tr2.th1"  /></th>
                            		<th><spring:message code="crp.table.tr2.th2"  /></th>
                            		<th><spring:message code="crp.table.tr2.th2"  /></th>
                            		
                            	</tr>
                            </thead>
                            <tbody>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td1"  /></td>
                            		<td><spring:message code="crp.table.tr.td2"  /></td>
                            		<td>&#10004;</td>
                            		<td></td>
                            		<td>&#10004;</td>
                            		<td><spring:message code="crp.table.tr.td3"  /></td>
                            		<td></td>
                            		<td></td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td4"  /> </td>
                            		<td><spring:message code="crp.table.tr.td5"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            		<td> </td>
                            		<td> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td6"  /> </td>
                            		<td><spring:message code="crp.table.tr.td7"  /> </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td><spring:message code="crp.table.tr.td8"  /></td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td9"  /> </td>
                            		<td><spring:message code="crp.table.tr.td10"  /> </td>
                            		<td>&#10004; </td>
                            		<td> </td>
                            		<td>&#10004; </td>
                            		<td><spring:message code="crp.table.tr.td11"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td12"  /> </td>
                            		<td><spring:message code="crp.table.tr.td13"  /> </td>
                            		<td>&#10004; </td>
                            		<td> </td>
                            		<td>&#10004; </td>
                            		<td><spring:message code="crp.table.tr.td14"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td15"  /> </td>
                            		<td><spring:message code="crp.table.tr.td16"  /></td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td><spring:message code="crp.table.tr.td17"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td18"  /> </td>
                            		<td><spring:message code="crp.table.tr.td19"  /> </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td><spring:message code="crp.table.tr.td20"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td21"  /> </td>
                            		<td> <spring:message code="crp.table.tr.td22"  /></td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td> </td>
                            		<td><spring:message code="crp.table.tr.td23"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td24"  /> </td>
                            		<td><spring:message code="crp.table.tr.td25"  /></td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td> </td>
                            		<td><spring:message code="crp.table.tr.td26"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td27"  /> </td>
                            		<td><spring:message code="crp.table.tr.td28"  /></td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td> </td>
                            		<td><spring:message code="crp.table.tr.td29"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td> <spring:message code="crp.table.tr.td30"  /></td>
                            		<td><spring:message code="crp.table.tr.td31"  /> </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td> </td>
                            		<td><spring:message code="crp.table.tr.td32"  /> </td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td33"  /> </td>
                            		<td><spring:message code="crp.table.tr.td34"  /> </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td><spring:message code="crp.table.tr.td35"  /></td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            	<tr>
                            		<td><spring:message code="crp.table.tr.td36"  /> </td>
                            		<td><spring:message code="crp.table.tr.td37"  /> </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td>&#10004; </td>
                            		<td><spring:message code="crp.table.tr.td38"  /></td>
                            		<td> </td>
                            		<td> </td>
                            	</tr>
                            </tbody>
                            </table>
                            
                             <p><spring:message code="cmap.div.p5"  /></p>
                            <p><strong><spring:message code="cmap.div.p6"  /></strong></p>
                            <p style="margin-top:20px;"><spring:message code="cmap.div.p7"  /><br>
                           <spring:message code="cmap.div.p8"  /><spring:message code="crp.div.p.phone"  /><br>
                           <spring:message code="cmap.div.p9"  /> ad.pmrda@gmail.com</p>
                            
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