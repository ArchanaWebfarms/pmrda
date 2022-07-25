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
      <title>.:: <spring:message code="search.title"  /> ::.</title>
      
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
      <div id="maincontent"   class="container-fluid">
         <%-- <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">You are here: &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">Home</a></li><li><i class="fas fa-caret-right"></i> <a href="./downloads.html" class="pathway">Downloads</a></li><li><i class="fas fa-caret-right"></i> <span>Notices And Circulars</span></li></ol>
               </div>
            </section> --%>
            <hr/>
      </div>





      <div id="t3-mainbody" class="container t3-mainbody dl-container">
         <div class="row">
            <div class="itemHeader">

               <h2 class="itemTitle">
               
           <spring:message code="search.itemTitle"  />
               </h2>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>




         </div>
          
         <br/>
         <div class="row" id="data" style="overflow-x: auto;">
      
            <table class="table table-bordered table-striped dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
        
         <tr>
            <th scope="col" style="width:10%;"><spring:message code="search.th1"  /></th><th scope="col"><spring:message code="search.th2"  /></th><th scope="col" id ="publishdate"><spring:message code="search.th3"  /></th><th scope="col"><spring:message code="search.th4"  /></th><th scope="col"><spring:message code="search.th5"  /></th>
         </tr>
          <c:forEach var="arraylist" items="${arraylist}" varStatus="status">
           
         <tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
                            </td>
                            
                            <td>
                                <span id="SitePH_grdupload_lblCategory_0"> ${arraylist.title}</span>
                            </td>
                            
                            
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> ${arraylist.publish_date}</span>
                            </td>
                            <td>
                                <span id="SitePH_grdupload_lblsize_0"> ${arraylist.type}</span>
                            </td>
                            
                            
                            <td>
                                <a class="align-center" href="${arraylist.url}">View Details</a>
                                    
                            </td>
         </tr>
      
        </c:forEach> 
      </tbody>
      
      </table><br/>
         </div>

      </div>

         
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
        
        	
     <!-- <script>
     $('*').each(function() {
         if ($(this).text() == "") {
        	 $("#publishdate").hide()
         }
});
     </script> -->

      </div>   
   </body>
</html>