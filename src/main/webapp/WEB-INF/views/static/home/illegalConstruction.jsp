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
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="Illegal.title"  /> ::.</title>
	  <style>
	  p{
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
        
      <div class="clear"></div>
      <%-- <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">  <spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway">  <spring:message code="department.navigation"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="Illegal.title"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>

		<div id="maincontent"    class="deptpage container-fluid t3-mainbody administration-container" style="margin-top:30px;">
			<div class="row">

         <div class="t3-sidebar t3-sidebar-right col-xs-12 col-sm-2 col-md-2 col-lg-2" style="padding-right: 25px;">

	
				<div class="nspArts bottom" style="width:100%;">
				<div class="nspArtScroll1">
				<div class="nspArtScroll2 nspPages1">
				<div class="nspArtPage active nspCol1">
				<div class="b-l-m-container">
                     <ul>
                        <li><a href="#"><spring:message code="department.b-l-m-container.li1"  /></a></li>
                        <li><a href="administration"><spring:message code="department.b-l-m-container.li8"  /></a></li>
                        <li><a href="account"><spring:message code="department.b-l-m-container.li7"  /></a></li>
                        <li><a href="engineering"><spring:message code="department.b-l-m-container.li2"  /></a></li>
                       <li><a  href="landandestate"><spring:message code="department.b-l-m-container.li6"  /></a></li>
                       <li><a href="planning"><spring:message code="department.b-l-m-container.li4"  /></a></li>
                       <li><a href="permission"><spring:message code="department.b-l-m-container.li3"  /></a></li>
                        <li><a class="active" href="illegal_construction"><spring:message code="department.b-l-m-container.li5"  /></a></li>
                        <li><a href="fire"><spring:message code="department.b-l-m-container.li11"  /></a></li>
                         <li><a href="center_of_excellence"><spring:message code="department.b-l-m-container.li9"  /></a></li>
                        <li><a href="Investment"><spring:message code="department.b-l-m-container.li10"  /></a></li>
                        </ul>
                  </div>
				</div>
				</div>
				</div>
				</div>
			</div>

			<div id="t3-content" class="t3-content col-xs-12 col-sm-10 col-md-10 col-lg-10" style="padding-left: 25px;  border-left: 1px solid #eaeaea;">

			<div class="t3-component">

			<div id="k2Container" class="itemListView">

			<div class="itemList">

			<div id="itemListLeading">
			<div class="itemContainer itemContainerLast">

			<div class="catItemView groupLeading">

			<div class="itemHeader">

			<h3 class="itemTitle">
			
			<spring:message code="Illegal.itemTitle"  /> 
			</h3>

			</div>
			
			<div class="heading-underline" style="width: 200px;">
					<div class="left"></div><div class="right"></div>
			   </div>


			<div class="catItemBody">



			<div class="catItemIntroText">
			<h4><spring:message code="Illegal.catItemIntroText.h1"  /></h4>
			<p><spring:message code="Illegal.catItemIntroText.p11"  /></p>
			<p><spring:message code="Illegal.catItemIntroText.p12"  /></p>
			
			<h4><spring:message code="Illegal.catItemIntroText.h2"  /></h4>
			
			 <img src="staticResources/t3-assets/images/departmentFlowchart/IllegalConstructionFlowchart.png" alt="Illlegal Department Flowchart">
			
			<h4><spring:message code="Illegal.catItemIntroText.h3"  /></h4>
		
		 <h4 class="nomargin"><spring:message code="Illegal.catItemIntroText.h31"  /></h4>
		 <table>
				<thead>
					<tr>
						<th width="40%"><spring:message code="Illegal.table.th1"  /></th>
						<th><spring:message code="Illegal.table.th2"  /></th>
						<th><spring:message code="Illegal.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Illegal.table.td1"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td2"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="Illegal.catItemIntroText.h32"  /></h4>
		 <table>
				<thead>
					<tr>
						<th width="40%"><spring:message code="Illegal.table.th1"  /></th>
						<th><spring:message code="Illegal.table.th2"  /></th>
						<th><spring:message code="Illegal.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Illegal.table.td4"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td6"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
		
		<h4 class="nomargin"><spring:message code="Illegal.catItemIntroText.h33"  /></h4>
		 <table>
				<thead>
					<tr>
						<th width="40%"><spring:message code="Illegal.table.th1"  /></th>
						<th><spring:message code="Illegal.table.th2"  /></th>
						<th><spring:message code="Illegal.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Illegal.table.td4"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td6"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="Illegal.catItemIntroText.h34"  /></h4>
		 <table>
				<thead>
					<tr>
						<th width="40%"><spring:message code="Illegal.table.th1"  /></th>
						<th><spring:message code="Illegal.table.th2"  /></th>
						<th><spring:message code="Illegal.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Illegal.table.td5"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td6"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			<h4 class="nomargin"><spring:message code="Illegal.catItemIntroText.h35"  /></h4>
		 <table>
				<thead>
					<tr>
						<th width="40%"><spring:message code="Illegal.table.th1"  /></th>
						<th><spring:message code="Illegal.table.th2"  /></th>
						<th><spring:message code="Illegal.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Illegal.table.td5"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td6"  /></td>
						<td class="text-center"><spring:message code="Illegal.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			
		<h4><spring:message code="Illegal.catItemIntroText.h8"  /></h4>
		
		<ul>
			<li><spring:message code="Illegal.catItemIntroText.p81"  /></li>
			<li><spring:message code="Illegal.catItemIntroText.p82"  /></li>
			<li><spring:message code="Illegal.catItemIntroText.p83"  /></li>
			<li><spring:message code="Illegal.catItemIntroText.p84"  /></li>
			<li><spring:message code="Illegal.catItemIntroText.p85"  /></li>
		</ul>
		
		<h4><spring:message code="Illegal.catItemIntroText.h9"  /></h4>
		
		<ul>
			<li><spring:message code="Illegal.catItemIntroText.p91"  /></li>
			<li><spring:message code="Illegal.catItemIntroText.p92"  />
			<ul style="list-style: lower-alpha;">
				<li><spring:message code="Illegal.catItemIntroText.p93"  /></li>
			<li><spring:message code="Illegal.catItemIntroText.p94"  /></li>
			<li><spring:message code="Illegal.catItemIntroText.p95"  /></li>
			</ul>
			</li>
			
		</ul>
		

<h4><spring:message code="Illegal.catItemIntroText.h10"  /></h4>
		<p><spring:message code="Illegal.catItemIntroText.p10"  /></p>



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