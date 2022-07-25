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
    <meta name="keywords" content="pmrda permissions,permissions,bulding permission">
      <meta name="description" content=" The Building Permission department of Pune metropolitan region development authority"/>
     <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="building.title"  /> ::.</title>
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
    
		<div id="maincontent"    class="deptpage container-fluid t3-mainbody administration-container" style="margin-top:30px;">
			<div class="row">
            


			<div class="t3-sidebar t3-sidebar-right col-xs-12 col-sm-3 col-md-2 col-lg-2"  style="padding-right: 25px;">

	
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
                       <li><a class="active"  href="permission"><spring:message code="department.b-l-m-container.li3"  /></a></li>
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
			
			<div id="t3-content" class="t3-content col-xs-12 col-sm-10 col-md-10 col-lg-10" style="padding-left: 25px;  border-left: 1px solid #eaeaea;">
			<div class="t3-component">
			<div id="k2Container" class="itemListView">
           
			<div class="itemList">

			<div id="itemListLeading">
			<div class="itemContainer itemContainerLast">

			<div class="catItemView groupLeading">

			<div class="itemHeader">

			<h3 class="itemTitle">
			
			<spring:message code="building.itemTitle"  /> 
			</h3>

			</div>
			
			<div class="heading-underline" style="width: 200px;">
					<div class="left"></div><div class="right"></div>
			   </div>


			<div class="catItemBody">



			<div class="catItemIntroText">
				
		

			<h4><spring:message code="building.catItemIntroText.h1"  /></h4>
			<p><spring:message code="building.catItemIntroText.p1"  /></p>
			<p><spring:message code="building.catItemIntroText.p10"  /></p>
			
			<h4><spring:message code="building.catItemIntroText.h2"  /></h4>
			 <img src="staticResources/t3-assets/images/departmentFlowchart/BuildingPermissionFlowchart.png" alt="Building Permission Department Flowchart">
			
			<h4><spring:message code="building.catItemIntroText.h3"  /></h4>
			
			 <h4 class="nomargin"><spring:message code="building.catItemIntroText.h31"  /></h4>
		 <table>
				<thead>
					<tr>
						<th><spring:message code="building.table.th1"  /></th>
						<th><spring:message code="building.table.th2"  /></th>
						<th><spring:message code="building.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="building.table.td1"  /></td>
						<td class="text-center"><spring:message code="building.table.td2"  /></td>
						<td class="text-center"><spring:message code="building.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			 <h4 class="nomargin"><spring:message code="building.catItemIntroText.h32"  /></h4>
		 <table>
				<thead>
					<tr>
						<th><spring:message code="building.table.th1"  /></th>
						<th><spring:message code="building.table.th2"  /></th>
						<th><spring:message code="building.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="building.table.td1"  /></td>
						<td class="text-center"><spring:message code="building.table.td2"  /></td>
						<td class="text-center"><spring:message code="building.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			 <h4 class="nomargin"><spring:message code="building.catItemIntroText.h33"  /></h4>
		 <table>
				<thead>
					<tr>
						<th><spring:message code="building.table.th1"  /></th>
						<th><spring:message code="building.table.th2"  /></th>
						<th><spring:message code="building.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="building.table.td1"  /></td>
						<td class="text-center"><spring:message code="building.table.td2"  /></td>
						<td class="text-center"><spring:message code="building.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			 <h4 class="nomargin"><spring:message code="building.catItemIntroText.h34"  /></h4>
		 <table>
				<thead>
					<tr>
						<th><spring:message code="building.table.th1"  /></th>
						<th><spring:message code="building.table.th2"  /></th>
						<th><spring:message code="building.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="building.table.td1"  /></td>
						<td class="text-center"><spring:message code="building.table.td2"  /></td>
						<td class="text-center"><spring:message code="building.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			 <h4 class="nomargin"><spring:message code="building.catItemIntroText.h35"  /></h4>
		 <table>
				<thead>
					<tr>
						<th><spring:message code="building.table.th1"  /></th>
						<th><spring:message code="building.table.th2"  /></th>
						<th><spring:message code="building.table.th3"  /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="building.table.td1"  /></td>
						<td class="text-center"><spring:message code="building.table.td2"  /></td>
						<td class="text-center"><spring:message code="building.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4><spring:message code="building.catItemIntroText.h6"  /></h4>
			<ul>
				<li><spring:message code="building.catItemIntroText.p61"  /></li>
				<li><spring:message code="building.catItemIntroText.p62"  /></li>
				<li><spring:message code="building.catItemIntroText.p63"  /></li>
				<li><spring:message code="building.catItemIntroText.p64"  /></li>
			</ul>
			
			<h4><spring:message code="building.catItemIntroText.h7"  /></h4>
			<ul>
				<li><spring:message code="building.catItemIntroText.p71"  /></li>
				<li><spring:message code="building.catItemIntroText.p72"  /></li>
				<li><spring:message code="building.catItemIntroText.p73"  /></li>
				<li><spring:message code="building.catItemIntroText.p74"  /></li>
				<li><spring:message code="building.catItemIntroText.p75"  /></li>
			</ul>
			
			<h4><spring:message code="building.catItemIntroText.h8"  /></h4>
			<p><spring:message code="building.catItemIntroText.p8"  /></p>
			<ul style="list-style:decimal;">
				<li><spring:message code="building.catItemIntroText.p81"  /></li>
				<li><spring:message code="building.catItemIntroText.p82"  /></li>
				<li><spring:message code="building.catItemIntroText.p83"  /></li>
				<li><spring:message code="building.catItemIntroText.p84"  /></li>
				<li><spring:message code="building.catItemIntroText.p85"  /></li>
				<li><spring:message code="building.catItemIntroText.p86"  /></li>
				<li><spring:message code="building.catItemIntroText.p87"  /></li>
				<li><spring:message code="building.catItemIntroText.p88"  /></li>
			</ul>
			
			<h4><spring:message code="building.catItemIntroText.h9"  /></h4>
			<p><spring:message code="building.catItemIntroText.p91"  /></p>
			<p><spring:message code="building.catItemIntroText.p92"  /></p>
			<p><spring:message code="building.catItemIntroText.p93"  /></p>
			
			
			<h4><spring:message code="building.catItemIntroText.h10"  /></h4>
			<ul style="list-style:decimal;">
				<li><spring:message code="building.catItemIntroText.p101"  /></li>
				<li><spring:message code="building.catItemIntroText.p102"  /></li>
				
				
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
			
			
	</div>
	<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>	
</div>   
   </body>
</html>