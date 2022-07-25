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
      <title>.::  <spring:message code="screenreader.title"  /> ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <meta name="description" content="Free Web tutorials">
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
      
          <input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>



      <div id="t3-mainbody  maincontent"    class="container t3-mainbody dl-container" style="margin-top:30px;">
         <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h2 class="itemTitle">
              	<spring:message code="screenreader.title"  />
               </h2>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>




         </div>
          <h6 > <spring:message code="screenreader.h1"  /> </h6>
         <br/>
         <div class="row" id="data" style="overflow-x: auto;">
       <h4 > <spring:message code="screenreader.h2"  /> </h4>
            <table class="table table-bordered table-striped dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
        
         <tr>
            <th scope="col" style="width:10%;"><spring:message code="screenreader.th1"  /></th> <th scope="col" ><spring:message code="screenreader.th2"  /></th><th scope="col"><spring:message code="screenreader.th3"  /></th><th scope="col"><spring:message code="screenreader.th4"  /></th>
         </tr>
         
           
         <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">1</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.td1"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="http://www.nvda-project.org/" target="_blank"> http://www.nvda-project.org/ </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.td2"  /></span>
                            </td>
                           
         </tr>
         
         
          <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">2</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td3"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="http://www.satogo.com" target="_blank"> http://www.satogo.com </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.td2"  /></span>
                            </td>
                           
         </tr>
         
         
          <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">3</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td4"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="http://www.screenreader.net/index.php?pageid=2" target="_blank">	http://www.screenreader.net/index.php?pageid=2 </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.td2"  /></span>
                            </td>
                           
         </tr>
           <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">4</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td5"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="http://webanywhere.cs.washington.edu/wa.php" target="_blank">	http://webanywhere.cs.washington.edu/wa.php </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.td2"  /></span>
                            </td>
                           
         </tr>
         
         
         <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">5</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td6"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="http://www.nabdelhi.org/NAB_SAFA.htm" target="_blank">http://www.nabdelhi.org/NAB_SAFA.htm </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.tdCommercial"  /> </span>
                            </td>
                           
         </tr>
         
         
         
          <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">6</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td7"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="	http://www.yourdolphin.co.uk/productdetail.asp?id=5/" target="_blank">	http://www.yourdolphin.co.uk/productdetail.asp?id=5/ </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.tdCommercial"  /> </span>
                            </td>
                           
         </tr>
         
   
     <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">7</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td8"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="http://www.freedomscientific.com/jaws-hq.asp" target="_blank">	http://www.freedomscientific.com/jaws-hq.asp </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.tdCommercial"  /> </span>
                            </td>
                           
         </tr>
         
         
           <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">8</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td9"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="	http://www.yourdolphin.co.uk/productdetail.asp?id=1" target="_blank">		http://www.yourdolphin.co.uk/productdetail.asp?id=1 </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.tdCommercial"  /> </span>
                            </td>
                           
         </tr>
          <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">9</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> <spring:message code="screenreader.td10"  /></span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblCreatedDate_0" > <a href="	http://www.gwmicro.com/Window-Eyes" target="_blank">			http://www.gwmicro.com/Window-Eyes </a>	  </span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> <spring:message code="screenreader.tdCommercial"  /> </span>
                            </td>
                           
         </tr>
         
   
   
      
      </tbody>
      
      </table><br/>
         </div>

      </div>

         
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
        
        	
       

      </div>   
   </body>
</html>