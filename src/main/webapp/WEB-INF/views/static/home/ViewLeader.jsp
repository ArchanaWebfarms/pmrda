<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   
   <style>
	p{
		text-align:justify;
	}  
	@media screen and (max-width: 600px){
		.sidepadMob{
  		padding:0px 15px!important;
  	}
	} 		
   </style>

   <head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
  <meta name="viewport" content="width=device-width" />
      <title>.:: <spring:message code="Header.Menu.AboutUs.administrative.leader" /> ::.</title>
     
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
           <jsp:include page="../includes/Header.jsp" />

		 <div class="clear"></div>
    
         <div  id="maincontent"   class="container-fluid au-cmm-container text-center" style="margin-top:30px;"> 
            <div class="row sidepadMob" id="engDiv">
            <c:forEach items="${leader.attachment}" var="leaderAttachList">
				<img src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}" style="margin:auto;"><br/><br/>
			</c:forEach>
				<h3 style="width:100%;">${leader.name}</h3>
				<h4 style="width:100%;">${leader.positon}</h4>
				<div  style="width:100%;">
				
				<div class="heading-underline" style="width: 200px;margin: 0px auto;">
					<div class="left"></div><div class="right"></div>
			   </div>
				</div>
				<br/>
				<p>${leader.description}</p>				
				</div>
				
				<div class="row sidepadMob" id="marathiDiv" style="display: none;">
            <c:forEach items="${leader.attachment}" var="leaderAttachList">
				<img src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}" style="margin:auto;"><br/><br/>
			</c:forEach>
				<h3 style="width:100%;">${leader.name_h}</h3>
				<h4 style="width:100%;">${leader.positon_h}</h4>
				<div  style="width:100%;">
				
				<div class="heading-underline" style="width: 200px;margin: 0px auto;">
					<div class="left"></div><div class="right"></div>
			   </div>
				</div>
				<br/>
				<p>${leader.description_h}</p>
				
				
				</div>
				
				
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
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
      
      </script>
   </body>
</html>