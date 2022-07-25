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
    <meta name="keywords" content="Administration Department,dept of administration,administration department of pmrda pmrda administration">
      <meta name="description" content="  Increased focus on citizen welfare activity,Cost minimization by outsourcing of logistic services,"/>
     <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="fire.stProject.title"  /> ::.</title>
	  <style>
	
p{
	text-align:justify;
}


table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-bottom:20px;
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
     <%--  <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">  <spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway">  <spring:message code="department.navigation"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="Administration.title" /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>

		<div id="t3-mainbody  maincontent"    class="container-fluid t3-mainbody administration-container" style="margin-top:30px;">
			<div class="row">

<div class="t3-sidebar t3-sidebar-right col-xs-12 col-sm-3 col-md-3 col-lg-3"  style="padding-right: 25px;">

	
				<div class="nspArts bottom" style="width:100%;">
				<div class="nspArtScroll1">
				<div class="nspArtScroll2 nspPages1">
				<div class="nspArtPage active nspCol1">
				<div class="b-l-m-container">
                     <ul>
                      <li><a  href="#"><spring:message code="Header.Menu.Projects"  /></a></li>
                        <li><a href="metro"><spring:message code="metro.stProject.title"  /></a></li>
                        <li><a  href="PuneRingRoad"><spring:message code="ringroad.stProject.title"  /></a></li>
                        <li><a  href="Mhalunge"><spring:message code="mhalunge.stProject.title"  /></a></li>
                        <li><a  href="Indrayani"><spring:message code="indra.stProject.title"  /></a></li>
                       <li><a href="underMaintenance"><spring:message code="yeravda.stProject.title"  /></a></li>
                       <li><a class="active" href="FireStation"><spring:message code="fire.stProject.title"  /></a></li>
                       
                        </ul>
                  </div>
				</div>
				</div>
				</div>
				</div>
			</div>

			<div id="t3-content" class="t3-content col-xs-12 col-sm-9 col-md-9 col-lg-9" style="padding-left: 25px;  border-left: 1px solid #eaeaea;">

			<div class="t3-component">

			<div id="k2Container" class="itemListView">


			<div class="itemList">

			<div id="itemListLeading">
			<div class="itemContainer itemContainerLast">

			<div class="catItemView groupLeading">

			<div class="itemHeader">

			<h2 class="itemTitle">
			
<spring:message code="fire.stProject.title"  />
			</h2>

			</div>
			
			<div class="heading-underline" style="width: 200px;">
					<div class="left"></div><div class="right"></div>
			   </div>


			<div class="catItemBody">
			<div class="catItemIntroText">
		
		
			 <h4><spring:message code="fire.stProject.h1"  /></h4> 
			  <p><spring:message code="fire.stProject.p11"  /></p>
			  
			   <h4><spring:message code="fire.stProject.h2"  /></h4> 
			  <p><spring:message code="fire.stProject.p21"  /></p>
			  
			   <h4><spring:message code="fire.stProject.h3"  /></h4> 
			  <p><spring:message code="fire.stProject.p31"  /></p>
			  
			   <h4><spring:message code="fire.stProject.h4"  /></h4> 
			  <p><spring:message code="fire.stProject.p41"  /></p>
			  <p><spring:message code="fire.stProject.p42"  /></p>

			 <h4><spring:message code="fire.stProject.h5"  /></h4> 
			  <p><spring:message code="fire.stProject.p51"  /></p>
			
			
			
			<h4><spring:message code="fire.stProject.h6"  /></h4>
			<img src="staticResources/images/fireMap.PNG" style="margin-bottom:20px;" alt="Wagholi Fire Station Map" title="Wagholi Fire Station Map">
			
			<h4><spring:message code="fire.stProject.h7"  /></h4>
			<img src="staticResources/images/firePhoto.PNG" style="margin-bottom:20px;" alt="Wagholi Fire Station" title="Wagholi Fire Station">
			
			</div>

			</div>

			</div>

			</div>

			</div>


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
   </body>
</html>