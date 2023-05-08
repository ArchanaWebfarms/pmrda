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
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
        <title>.:: <spring:message code="Header.Menu.TpScheme" /> ::.</title>
        
        <style>
        
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  
}
table th{
	background: linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%)!important;
	color:white;
}
td, th {
  border: 1px solid #dddddd!important;
  text-align: left;
  padding: 8px!important;
}



.nomargin{
	margin:0px;
}

h4{
	margin-top:20px!important;
}
        </style>
   </head>
   <body>
  <c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>
      <div class="t3-wrapper t3-homepage-2">
        
       
         <jsp:include page="../includes/Header.jsp" />


         <div id="maincontent" class="container-fluid au-container" style="margin-top:30px;"> 
            
            <div class="row" style="padding-bottom: 25px;">
              
               
                 <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div   class="b-l-m-container">
                     <ul>
                     <li><a href="#"><spring:message code="Header.Menu.TpScheme" /></a></li>                     
                     <c:set value="${project.id}" var="id"></c:set>
                     <c:forEach items="${tplist}" var="projectList">
                     <c:choose>
						<c:when test="${localLang eq 'en_US'}">
							 <c:choose>
                     			<c:when test="${projectList.id eq id}">
                     				<li><a class="active" href="javascript:getTpScheme(${projectList.id})">${projectList.title}</a></li>
                    			</c:when>
                     			<c:otherwise>
                     				<li><a href="javascript:getTpScheme(${projectList.id})">${projectList.title}</a></li>
                    			</c:otherwise>
                    		</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
                     			<c:when test="${projectList.id eq id}">
                     				<li><a class="active" href="javascript:getTpScheme(${projectList.id})">${projectList.title_h}</a></li>
                    			</c:when>
                     			<c:otherwise>
                     				<li><a href="javascript:getTpScheme(${projectList.id})">${projectList.title_h}</a></li>
                    			</c:otherwise>
                    		</c:choose>	
						</c:otherwise>
        			</c:choose>
                    
							  </c:forEach>
							  </ul>
                  </div>
               </div> 
               <div class="col-sx-12 col-sm-12 col-md-10 contdiv" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="bloginfo">
                  			<c:choose>
								<c:when test="${localLang eq 'en_US'}">
									<h3 style="margin-bottom: 0px;">${project.title} </h3>
								</c:when>
								<c:otherwise>
									<h3 style="margin-bottom: 0px;">${project.title_h} </h3>
								</c:otherwise>
							</c:choose>		
                                
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 170px;">
								<div class="left"></div><div class="right"></div>
						    </div>

			<c:choose>
			<c:when test="${empty project.description}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="project.h4.des" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${project.description}
						</c:when>
						<c:otherwise>
								${project.description_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
				
				<c:choose>
			<c:when test="${empty project.projectCordinator}">			
			</c:when>	
			<c:otherwise>
                  <h4 style="color:#0086b2"><spring:message code="project.h4.implpartner" /></h4>
                  <p style="text-align:justify;line-height: 20px;">
                  <c:choose>
                  <c:when test="${empty project.contact && empty project.email}">
                  	<c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${project.projectCordinator}
						</c:when>
						<c:otherwise>
								${project.projectCordinator_h}						
						</c:otherwise>
						</c:choose>                  		
                  </c:when>
                  <c:otherwise>
                  	 <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								 <div style="overflow:auto;">
								 <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
        							 <tbody>
        
        								 <tr style="white-space:nowrap;">
           									 <th scope="col"><spring:message code="screenreader.th1"  /></th><th scope="col"><spring:message code="index.feedback.name"  /></th><th scope="col"><spring:message code="project.contact"  /></th><th scope="col"><spring:message code="index.feedback.email"  /></th>
        								 </tr>          
        								 <tr>             
            	 							<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span></td>
                           				 	<td><span id="SitePH_grdupload_lblCategory_0">${project.projectCordinator} </span>
                            				<td style="text-align:center;" class="A">${project.contact}</td>
                            				<td style="text-align:center;" class="A">${project.email}</td>                            
         								</tr>
      
      								</tbody>      
      							</table>
								 </div>
								   
						</c:when>
						<c:otherwise>
								 <div style="overflow:auto;">
								 <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
        							 <tbody>
        
        								 <tr>
           									 <th scope="col" style="width:10%;"><spring:message code="screenreader.th1"  /></th><th scope="col"><spring:message code="index.feedback.name"  /></th><th scope="col"><spring:message code="project.contact"  /></th><th scope="col"><spring:message code="index.feedback.email"  /></th>
        								 </tr>          
        								 <tr>             
            	 							<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0">१</span></td>
                           				 	<td><span id="SitePH_grdupload_lblCategory_0">${project.projectCordinator_h} </span>
                            				<td style="text-align:center;" class="A">${project.contact_h}</td>
                            				<td style="text-align:center;" class="A">${project.email}</td>                            
         								</tr>
      
      								</tbody>      
      							</table>  
      							</div>
						</c:otherwise>
					</c:choose> 
                  
                  </c:otherwise>
                  </c:choose>
                                    
                  </p>
                  </c:otherwise>		
			</c:choose>
                  
                  <c:choose>
			<c:when test="${empty project.project_status}">			
			</c:when>	
			<c:otherwise>
                   <h4 style="color:#0086b2"><spring:message code="project.h4.status" /></h4>
                  <p style="text-align:justify;line-height: 20px;">
                  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${project.project_status}
						</c:when>
						<c:otherwise>
								${project.project_status_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
                  </c:otherwise>
                  </c:choose>
                  
                  <c:choose>
			<c:when test="${empty project.scope_of_work}">			
			</c:when>	
			<c:otherwise>
                  <h4 style="color:#0086b2"><spring:message code="project.h4.scpofwrk" /></h4>
                 <p style="text-align:justify;line-height: 20px;">
                  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${project.scope_of_work}
						</c:when>
						<c:otherwise>
								${project.scope_of_work_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
                  
                  </c:otherwise>
                  </c:choose>
                  
                   <c:choose>
			<c:when test="${empty project.specification}">			
			</c:when>	
			<c:otherwise>
                  <h4 style="color:#0086b2"><spring:message code="project.h4.target" /></h4>
                  <p style="text-align:justify;line-height: 20px;">
                  <c:choose>
					 <c:when test="${localLang eq 'en_US'}">
								${project.specification}
					 </c:when>
					 <c:otherwise>
								${project.specification_h}
					 </c:otherwise>
				 </c:choose>                    
                  </p>
                  </c:otherwise>
                  </c:choose>
                  <c:choose>
			<c:when test="${empty docs}">			
			</c:when>	
			<c:otherwise>
                 <h4 style="color:#0086b2"><spring:message code="project.h4.docpro" /></h4>
                 <table>
                 <tr>
                 <th>Sr. No.</th>
                 <th>Document</th>
                 </tr>
                 <c:forEach var="docs" items="${docs}" varStatus="sr">
                 <tr>
                 <td>${sr.index+1 }</td>
                 <td><a href="staticResources/Project/${docs.attachmnt_name}" target="_blank">${docs.attachmnt_name}</a></td>
                 </tr>
                 </c:forEach>   
                 </table>               
              </c:otherwise>
              </c:choose> 
                  <c:choose>
			<c:when test="${empty map.attachmnt_name}">			
			</c:when>	
			<c:otherwise>
                 <h4 style="color:#0086b2"><spring:message code="project.h4.map" /></h4>
                  <img src="staticResources/Project/${map.attachmnt_name}" alt="Not Found" height="400px" width="700px">
              </c:otherwise>
              </c:choose>    
                  
                  <c:choose>
			<c:when test="${empty photo}">			
			</c:when>	
			<c:otherwise>
                 <h4 style="color:#0086b2"><spring:message code="project.h4.phopro" /></h4>
                 <c:forEach var="photo" items="${photo}">
                 	<img src="staticResources/Project/${photo.attachmnt_name}" alt="Not Found" height="400px" width="700px"><br /><br />
                 </c:forEach>                  
              </c:otherwise>
              </c:choose> 
              
              <c:choose>
			<c:when test="${empty video.attachmnt_name}">			
			</c:when>	
			<c:otherwise>
                 <h4 style="color:#0086b2"><spring:message code="project.h4.vdopro" /></h4>
                  <%-- <img src="staticResources/Project/${video.attachmnt_name}" alt="Los Angeles" height="400px" width="700px"> --%>
                  <video width="320" height="240" preload="auto" controls>
  <source src="staticResources/Project/${video.attachmnt_name}" type="video/mp4">
  Your browser does not support the video tag.
</video>
              </c:otherwise>
              </c:choose> 
                
                  
               </div>
            </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
      
    <form:form action="TpschemeView" id="tpform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" > <input type="hidden" id="tpid" name="id" /> </form:form>

  
<script type="text/javascript">
function getTpScheme(id){
	 $("#tpid").val(id);
	$("#tpform").submit();
	 return true;
}
</script>
      
   </body>
</html>