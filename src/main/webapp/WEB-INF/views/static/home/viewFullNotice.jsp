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
        <title>.:: ${notice.type} ::.</title>
   </head>
   <body>
  <input type="hidden" name="lang" id="lang"
			value="<%=LocaleContextHolder.getLocale()%>">
		<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>" />
  
      <div class="t3-wrapper t3-homepage-2">
        
       
         <jsp:include page="../includes/Header.jsp" />


         <div id="maincontent" class="container au-container" style="margin-top:30px;"> 
            
            <div class="row" style="padding-bottom: 25px;">
              
               
                 <div class="col-sx-12 col-sm-12 col-md-3 left-side" style="padding-right: 25px;">
                  <div   class="b-l-m-container">
                     <ul>
                     <li><a href="#">${notice.type}</a></li>
                     <c:set value="${notice.noticeID}" var="id"></c:set>
                     <c:forEach items="${noticeList}" var="noticeList">
                     <c:choose>
                     <c:when test="${noticeList.noticeID eq id}">
                     	<li><a class="active" href="getNoticeById?id=${noticeList.noticeID}">${noticeList.title}</a></li>
                     </c:when>
                     <c:otherwise>
                     	<li><a href="getNoticeById?id=${noticeList.noticeID}">${noticeList.title}</a></li>
                     </c:otherwise>
                     </c:choose>
                     
							     
							  </c:forEach>
                       
                     </ul>
                  </div>
               </div> 
               <div class="col-sx-12 col-sm-12 col-md-9 contdiv" style="border-left: 1px solid #eaeaea; padding: 0px 25px;" id="EnglishDiv">
                  <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;">${notice.title} :</h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 170px;">
								<div class="left"></div><div class="right"></div>
						    </div>

				  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.description}
                  </p>                                    
                                    
                   <h5 style="color:#0086b2"><spring:message code="index.closingdte" /></h5>
                  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.closingDate}
                  </p>
                  
                  <h5 style="color:#0086b2"><spring:message code="index.TabHeading2" /></h5>
                  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.publish_date}
                  </p>
                  
                  <h5 style="color:#0086b2"><spring:message code="filter.form.documenttype" /></h5>
                  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.department.departmentName}
                  </p>
                  
                  <h5 style="color:#0086b2"><spring:message code="table.heading.Download" /></h5>
                  <c:forEach var="attachmentlist" items="${attachmentlist}">
                  <c:if test="${attachmentlist.module_type eq 'English Attachment'}">
                  
                  		<a  href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">${attachmentlist.title}[size:${attachmentlist.size}KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br>                 
                  </c:if>                  	               	                
                  </c:forEach> 
                  
               </div>
               
               <div class="col-sx-12 col-sm-12 col-md-9 contdiv" style="border-left: 1px solid #eaeaea; padding: 0px 25px;display: none;" id="MarathiDiv">
                  <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;">${notice.title_h} :</h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 170px;">
								<div class="left"></div><div class="right"></div>
						    </div>

				  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.description}
                  </p>
                  
                   <h5 style="color:#0086b2"><spring:message code="index.closingdte" /></h5>
                  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.closingDate}
                  </p>
                  
                  <h5 style="color:#0086b2"><spring:message code="index.TabHeading2" /></h5>
                  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.publish_date}
                  </p>
                  
                  <h5 style="color:#0086b2"><spring:message code="filter.form.documenttype" /></h5>
                  <p style="text-align:justify;color: black;line-height: 20px;">
                    ${notice.department.departmentName}
                  </p>
                  
                  <h5 style="color:#0086b2"><spring:message code="table.heading.Download" /></h5>
                  <c:forEach var="attachmentlist" items="${attachmentlist}">
                  <c:if test="${attachmentlist.module_type eq 'Marathi Attachment'}">
                  	<a  href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">${attachmentlist.title}[size:${attachmentlist.size}KB]<img src="staticResources/images/pdf1.ico" height="20px" width="20px"></a><br>	                 
                  </c:if>                  	               	                
                  </c:forEach> 
                  
               </div>
            </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div> 
      <script type="text/javascript">
      $(function() {	 
      var language=$("#lang").val();//alert(language)
  	
 	 if(language=="marathi"){
 		$("#EnglishDiv").hide();
 		$("#MarathiDiv").show();
 	 }else{
 		$("#MarathiDiv").hide();
 		$("#EnglishDiv").show();
 	 }
 	)};
 		
      </script>  
   </body>
</html>