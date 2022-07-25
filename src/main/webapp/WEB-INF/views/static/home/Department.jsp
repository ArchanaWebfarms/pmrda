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
        <title>.:: <spring:message code="Header.Menu.Departments" /> ::.</title>
        
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
   
      <div class="t3-wrapper t3-homepage-2">
        
       
         <jsp:include page="../includes/Header.jsp" />
 <c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>  

         <div id="maincontent" class="container-fluid au-container" style="margin-top:30px;"> 
            
            <div class="row" style="padding-bottom: 25px;">
              
               
                 <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div   class="b-l-m-container">
                     <ul>
                     <li><a href="#"><spring:message code="Header.Menu.Departments" /></a></li>                     
                     <c:set value="${department.deptId}" var="id"></c:set>
                     <c:forEach items="${departmentList}" var="departmentList">
                    
                     <c:choose>
						    	<c:when test="${departmentList.deptId==26}">
						    	
						    	</c:when>
						    	<c:otherwise>
						    	  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
							 <c:choose>
                     			<c:when test="${departmentList.deptId eq id}">
                     				<li><a class="active" href="javascript:getDepartment(${departmentList.deptId})">${departmentList.departmentName}</a></li>
                    			</c:when>
                     			<c:otherwise>
                     				<li><a href="javascript:getDepartment(${departmentList.deptId})">${ departmentList.departmentName}</a></li>
                    			</c:otherwise>
                    		</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
                     			<c:when test="${departmentList.deptId eq id}">
                     				<li><a class="active" href="javascript:getDepartment(${departmentList.deptId})">${departmentList.departmentName_h}</a></li>
                    			</c:when>
                     			<c:otherwise>
                     				<li><a href="javascript:getDepartment(${departmentList.deptId})">${departmentList.departmentName_h}</a></li>
                    			</c:otherwise>
                    		</c:choose>	
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
									<h3 style="margin-bottom: 0px;">${department.departmentName} </h3>
								</c:when>
								<c:otherwise>
									<h3 style="margin-bottom: 0px;">${department.departmentName_h} </h3>
								</c:otherwise>
							</c:choose>		
                                
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 170px;">
								<div class="left"></div><div class="right"></div>
						    </div>

			<c:choose>
			<c:when test="${empty department.description}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="Administration.catItemIntroText.h1" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${department.description}
						</c:when>
						<c:otherwise>
								${department.description_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
				
				 <c:choose>
			<c:when test="${empty department.attachment}">			
			</c:when>	
			<c:otherwise>
                 <h4 style="color:#0086b2"><spring:message code="Administration.catItemIntroText.h2" /></h4>
                 <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								<c:forEach items="${department.attachment}" var="attachmentlist">                  
                 					<c:if test="${attachmentlist.module_type eq 'English Attachment'}"> 
                 						 <img src="staticResources/Department/${attachmentlist.attachmnt_name}" alt="" height="auto" width="auto">
                					 </c:if>                            
                 				 </c:forEach>
						</c:when>
						<c:otherwise>
								<c:forEach items="${department.attachment}" var="attachmentlist">                  
                 					<c:if test="${attachmentlist.module_type eq 'Marathi Attachment'}"> 
                 						 <img src="staticResources/Department/${attachmentlist.attachmnt_name}" alt="" height="auto" width="auto">
                					 </c:if>                            
                 				 </c:forEach>
						</c:otherwise>
					</c:choose> 
                  
              </c:otherwise>
              </c:choose> 
				
				<c:choose>
			<c:when test="${empty department.officeContact}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="Administration.catItemIntroText.h3" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								<c:forEach items="${officelist}" var="officelist">  
								<h4 style="color:#0086b2">${officelist.name}</h4>									
									<div style="overflow:auto;">
									<table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
        							 <tbody>        
        								 <tr>
           									<th scope="col" style="width:40%;"><spring:message code="index.feedback.name"  /></th><th scope="col"><spring:message code="project.contact"  /></th><th scope="col"><spring:message code="index.feedback.email"  /></th>
        								 </tr>
        								 <c:forEach items="${department.officeContact}" var="officeContact">          									
										<c:if test="${officelist.id==officeContact.deptOffice.id}">
        								 <tr>  
                           				 	<td><span id="SitePH_grdupload_lblCategory_0">${officeContact.name} </span>
                            				<td style="text-align:center;" class="A">${officeContact.contact_no}</td>
                            				<td style="text-align:center;" class="A">${officeContact.email}</td>                            
         								</tr>      								 
										</c:if>
										</c:forEach>
										</tbody>      
      							</table>
									</div>
									
								
								</c:forEach>
						</c:when>
						<c:otherwise>
								<c:forEach items="${officelist}" var="officelist">  
								<h4 style="color:#0086b2">${officelist.name_h}</h4>									
									<div style="overflow:auto;">
									<table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
        							 <tbody>        
        								 <tr>
           									<th scope="col" style="width:40%;"><spring:message code="index.feedback.name"  /></th><th scope="col"><spring:message code="project.contact"  /></th><th scope="col"><spring:message code="index.feedback.email"  /></th>
        								 </tr>
        								 <c:forEach items="${department.officeContact}" var="officeContact">          									
										<c:if test="${officelist.id==officeContact.deptOffice.id}">
        								 <tr>  
                           				 	<td><span id="SitePH_grdupload_lblCategory_0">${officeContact.name_h} </span>
                            				<td style="text-align:center;" class="A">${officeContact.contact_no_h}</td>
                            				<td style="text-align:center;" class="A">${officeContact.email}</td>                            
         								</tr>      								 
										</c:if>
										</c:forEach>
										</tbody>      
      							</table>
								</div>
								</c:forEach>
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
			
			<c:choose>
			<c:when test="${empty department.objectives}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="Administration.catItemIntroText.h9" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${department.objectives}
						</c:when>
						<c:otherwise>
								${department.objectives_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
			
			<c:choose>
			<c:when test="${empty department.functions}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="Administration.catItemIntroText.h10" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${department.functions}
						</c:when>
						<c:otherwise>
								${department.functions_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
			
			<c:choose>
			<c:when test="${empty department.roles_and_responsibility}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="planning.catItemIntroText.h10" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${department.roles_and_responsibility}
						</c:when>
						<c:otherwise>
								${department.roles_and_responsibility_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
			
			<c:choose>
			<c:when test="${empty department.projects}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="planning.catItemIntroText.h11" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${department.projects}
						</c:when>
						<c:otherwise>
								${department.projects_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
			
			<c:choose>
			<c:when test="${empty department.achievements}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="planning.catItemIntroText.h12" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${department.achievements}
						</c:when>
						<c:otherwise>
								${department.achievements_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
			
				<c:choose>
			<c:when test="${empty department.other_title}">			
			</c:when>	
			<c:otherwise>				
				  <c:choose>				  
						<c:when test="${localLang eq 'en_US'}">
						<h4 style="color:#0086b2">${department.other_title}</h4>
				 			 <p style="text-align:justify;line-height: 20px;">
								${department.other_content}
						</c:when>
						<c:otherwise>
						<h4 style="color:#0086b2">${department.other_title_h}</h4>
				 			 <p style="text-align:justify;line-height: 20px;">
								${department.other_content_h}
						</c:otherwise>
					</c:choose>                    
                  
			</c:otherwise>		
			</c:choose>
			
			
				<c:choose>
			<c:when test="${empty department.salient_features}">			
			</c:when>	
			<c:otherwise>
				<h4 style="color:#0086b2"><spring:message code="Illegal.catItemIntroText.p8" /></h4>
				  <p style="text-align:justify;line-height: 20px;">
				  <c:choose>
						<c:when test="${localLang eq 'en_US'}">
								${department.salient_features}
						</c:when>
						<c:otherwise>
								${department.salient_features_h}
						</c:otherwise>
					</c:choose>                    
                  </p>
			</c:otherwise>		
			</c:choose>
			
                  
               </div>
            </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
      
      <form:form  action="getDepartmentById" id="deptform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="deptid" name="id" />  
  </form:form>
  
<script type="text/javascript">
function getDepartment(id){
	$("#deptid").val(id);
	$("#deptform").submit();
}
</script>
   </body>
</html>