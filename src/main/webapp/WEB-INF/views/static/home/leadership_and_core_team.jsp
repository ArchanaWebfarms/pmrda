<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
     <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="Header.Menu.AboutUs.administrative.leader"  /> ::.</title>
      <style>
      .specialtabdiv{
      	background: linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%);
      	padding: 5px;
      	height:42px;
      }
     .team h6{
        margin:0px; 
    color: white;
        position: relative;
    top: 50%;
    transform: translateY(-50%);
    
    
      }
      
      .leadership-container hr{
      	    margin: 5px 0px 15px 0px;
      }
      
     /*  @media screen and (min-width: 1370px) {
      	.specialtab{
      	     line-height: 32px!important;
      	}
      
      } 
      @media screen and (max-width: 1370px) {
      	.specialtab{
      	     line-height: 16px!important;
      	}
      
      }  */
      </style>
      
      
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         
        <jsp:include page="../includes/Header.jsp" />
         <div id="maincontent"   class="container-fluid au-container" style="margin-top:30px;"> 
           
            <div class="row" style="padding-bottom: 25px;">
             
                  
                  <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div class="b-l-m-container">
                    <ul>
                        <li><a href="#"><spring:message code="background.b-l-m-container.li1"  /></a></li>
                        <li><a href="pmrda_background"><spring:message code="background.b-l-m-container.li2"  /></a></li>
                        <li><a href="vision_and_mission"><spring:message code="background.b-l-m-container.li3"  /></a></li>
                        <li><a class="active" href="leadership_and_core_team"><spring:message code="Header.Menu.AboutUs.administrative.leader"  /></a></li>
                        <li><a href="objectives"><spring:message code="background.b-l-m-container.li4"  /></a></li>
                         <li><a href="master_plan"><spring:message code="background.b-l-m-container.li8"  /></a></li>
                          <%--  <li><a href="pmrda_establishment"><spring:message code="background.b-l-m-container.li7"  /></a></li>
                           <li><a href="digital_policy"><spring:message code="background.b-l-m-container.li9"  /></a></li>
                         <li><a href="administrative_structure"><spring:message code="background.b-l-m-container.li6"  /></a></li> --%>
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;overflow: auto;">
                  <div class="blog_detail">

                            <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;"><spring:message code="leadership.bloginfo.h1"  /></h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 160px;">
								<div class="left"></div><div class="right"></div>
						    </div>
						    <div id="engDiv">
                            <ul class="listing leadership-container">
                            <c:forEach items="${leaderList}" var="leader">
                             <li>
                             <c:forEach items="${leaderAttachList}" var="leaderAttachList">
                             	<c:if test="${leader.id ==  leaderAttachList.leader.id}">
                                 <div class="thumb"><img src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}" alt="${leader.name}" height="125" width="125"></a></div>
                              	</c:if>
                              </c:forEach>
                                 <div class="description">
                                  <h5>${leader.name}</h5>
                                        <p>[${leader.positon}] </p>
                                         <p>${leader.description}</p>
                                       
                                        <div class="clear"></div>
                                        <div class="info">                                         
                                          <a class="moreinfo" href="javascript:getLeader(${leader.id})"><spring:message code="leadership.info.a1"  /></a> 
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </li>
                          <hr>
                            </c:forEach>
                         
                            </ul>
                           
                             <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;"><spring:message code="leadership.bloginfo.h2"  /></h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 150px;">
								<div class="left"></div><div class="right"></div>
						    </div>

						<div class=" team">
							<div class="row p-b-10">
							
							 <c:forEach items="${teamList}" var="team">
							 
							 	<div class="col-sm-3" style="text-align:center; padding:5px;" >
							 	<div class="specialtabdiv">
							 		<h6 class="specialtab">${team.department.departmentName}</h6>
							 	</div>
								
										
										
										<div class="col-md-12 team_text">
										<c:forEach items="${teamAttachList}" var="teamAttachList">
										<c:if test="${team.id ==  teamAttachList.leader.id}">
										<div>
											 <img src="staticResources/LeadershipCoreTeam/${teamAttachList.attachmnt_name}" alt="${team.name}" height="100"><!--Shri. Sarang Awad-->
										</div>
										</c:if>
										</c:forEach>
										<b>${team.name}</b><br>
										${team.positon}
										</div>
										
								</div>
							 
							 </c:forEach>
						
							
							
						</div>
                             
</div>
                        </div>
                        
                          <div id="marathiDiv" style="display: none;">    
                            <ul class="listing leadership-container">
                            <c:forEach items="${leaderList}" var="leader">
                             <li>
                             <c:forEach items="${leaderAttachList}" var="leaderAttachList">
                             	<c:if test="${leader.id ==  leaderAttachList.leader.id}">
                                 <div class="thumb"><img src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}" alt="${leader.name_h}" height="125" width="125"></a></div>
                              	</c:if>
                              </c:forEach>
                                 <div class="description">
                                  <h5>${leader.name_h}</h5>
                                        <p>[${leader.positon_h}] </p>
                                         <p>${leader.description_h}</p>
                                       
                                        <div class="clear"></div>
                                        <div class="info">
                                            <a class="moreinfo" href="javascript:getLeader(${leader.id})"><spring:message code="leadership.info.a1"  /></a> 
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </li>
                          <hr>
                            </c:forEach>
                         
                            </ul>
                           
                             <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;"><spring:message code="leadership.bloginfo.h2"  /></h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
							<div class="heading-underline" style="width: 150px;">
								<div class="left"></div><div class="right"></div>
						    </div>

						<div class=" team">
							<div class="row p-b-10">
							
							 <c:forEach items="${teamList}" var="team">
							 
							 	<div class="col-sm-3" style="text-align:center; padding:5px;" >
							 	<div class="specialtabdiv">
							 		<h6 class="specialtab">${team.department.departmentName_h}</h6>
							 	</div>
								
										
										
										<div class="col-md-12 team_text">
										<c:forEach items="${teamAttachList}" var="teamAttachList">
										<c:if test="${team.id ==  teamAttachList.leader.id}">
										<div>
											 <img src="staticResources/LeadershipCoreTeam/${teamAttachList.attachmnt_name}" alt="${team.name_h}" height="100"><!--Shri. Sarang Awad-->
										</div>
										</c:if>
										</c:forEach>
										<b>${team.name_h}</b><br>
										${team.positon_h}
										</div>
										
								</div>
							 
							 </c:forEach>
						
							
							
						</div>
                             
</div>
                        </div>
                  
                        
                  </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
              <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div> 
      
      <form:form  action="getLeader" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="viewid" name="id" />  
  </form:form>
      
      <script type="text/javascript">
      $(function() {	
      var lang=$("#lang").val();//alert(lang)
      if(lang=="marathi"){
    	  $("#engDiv").hide();
    	  $("#marathiDiv").show();
      }else{
    	  $("#engDiv").show();
        	$("#marathiDiv").hide();
      }
      });
      
      
      function getLeader(id){
    	  $("#viewid").val(id);
  			$("#viewform").submit();
      }
      
      </script>  
   </body>
</html>