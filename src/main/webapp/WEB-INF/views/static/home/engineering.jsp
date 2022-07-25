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
    <meta name="keywords" content="pmrda engineering,engg department,enginering department,pune engineering ">
      <meta name="description" content="
The Engineering Department will focus on  sustainable resources with minimal carbon footprint curtailing environmental impact of economic growth in the PMR and  sustainable resources . "/>
    <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="engineering.title"  /> ::.</title>
	  
	<style>
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

p{
	text-align:justify;
}
</style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          
         <jsp:include page="../includes/Header.jsp" />
        
      <div class="clear"></div>
    <%--   <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">  <spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway">  <spring:message code="department.navigation"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="engineering.title" /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>

		<div id="maincontent"  class="deptpage container-fluid t3-mainbody administration-container" style="margin-top:30px;">
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
                        <li><a class="active"  href="engineering"><spring:message code="department.b-l-m-container.li2"  /></a></li>
                       <li><a href="landandestate"><spring:message code="department.b-l-m-container.li6"  /></a></li>
                       <li><a  href="planning"><spring:message code="department.b-l-m-container.li4"  /></a></li>
                       <li><a href="permission"><spring:message code="department.b-l-m-container.li3"  /></a></li>
                        <li><a href="illegal_construction"><spring:message code="department.b-l-m-container.li5"  /></a></li>
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
			
			<div id="t3-content" class="t3-content col-xs-12 col-sm-10 col-md-10 col-lg-10"  style="padding-left: 25px;  border-left: 1px solid #eaeaea;">

			<div class="t3-component">

			<div id="k2Container" class="itemListView">

			<div class="itemList">

			<div id="itemListLeading">
			<div class="itemContainer itemContainerLast">

			<div class="catItemView groupLeading">

			<div class="itemHeader">

			<h3 class="itemTitle">
			
			<spring:message code="engineering.itemTitle"  />
			</h3>

			</div>
			
			<div class="heading-underline" style="width: 200px;">
					<div class="left"></div><div class="right"></div>
			   </div>


			<div class="catItemBody">



			<div class="catItemIntroText">
			<h4><spring:message code="engineering.catItemIntroText.h1"  /></h4>
<p><spring:message code="engineering.catItemIntroText.p11"  /></p>
<p><spring:message code="engineering.catItemIntroText.p12"  /></p>
<p><spring:message code="engineering.catItemIntroText.p13"  /></p>
			
	<h4><spring:message code="engineering.catItemIntroText.h2"  /></h4>
	 <img src="staticResources/t3-assets/images/departmentFlowchart/EngineeringFlowchart.png" alt="Engineering Department Flowchart">
			
			<h4><spring:message code="engineering.catItemIntroText.h3"  /></h4>
			
			<h4 class="nomargin"><spring:message code="engineering.catItemIntroText.h31"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="45%"><spring:message code="engineering.table.th1"  /></th>
						<th><spring:message code="engineering.table.th2"  /></th>
						<th><spring:message code="engineering.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="engineering.table.td1"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td2"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="engineering.catItemIntroText.h32"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="45%"><spring:message code="engineering.table.th1"  /></th>
						<th><spring:message code="engineering.table.th2"  /></th>
						<th><spring:message code="engineering.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="engineering.table.td1"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td2"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td4"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td5"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td6"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td7"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td8"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td9"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="engineering.catItemIntroText.h33"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="45%"><spring:message code="engineering.table.th1"  /></th>
						<th><spring:message code="engineering.table.th2"  /></th>
						<th><spring:message code="engineering.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="engineering.table.td1"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td2"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td4"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td5"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td6"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td7"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td8"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td9"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="engineering.catItemIntroText.h34"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="45%"><spring:message code="engineering.table.th1"  /></th>
						<th><spring:message code="engineering.table.th2"  /></th>
						<th><spring:message code="engineering.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="engineering.table.td10"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td11"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td4"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td5"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td12"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td13"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="engineering.catItemIntroText.h35"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="45%"><spring:message code="engineering.table.th1"  /></th>
						<th><spring:message code="engineering.table.th2"  /></th>
						<th><spring:message code="engineering.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="engineering.table.td10"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td11"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td4"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td5"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="engineering.table.td12"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td13"  /></td>
						<td class="text-center"><spring:message code="engineering.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			
			<h4><spring:message code="engineering.catItemIntroText.h7"  /></h4>
			<p><spring:message code="engineering.catItemIntroText.p71"  /></p>
			<ul>
				<li><spring:message code="engineering.catItemIntroText.p72"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p73"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p74"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p75"  /></li>
			</ul>
			<p><spring:message code="engineering.catItemIntroText.p76"  /></p>
			
			<h4><spring:message code="engineering.catItemIntroText.h8"  /></h4>
			<p><spring:message code="engineering.catItemIntroText.p81"  /></p>
			
			
			
			
			<h4><spring:message code="engineering.catItemIntroText.h9"  /></h4>
			<ul style="list-style:decimal;	">
				<li><spring:message code="engineering.catItemIntroText.p91"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p92"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p93"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p94"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p95"  /></li>
				<li><spring:message code="engineering.catItemIntroText.p96"  /></li>
			</ul>
			
			
			
			
			
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