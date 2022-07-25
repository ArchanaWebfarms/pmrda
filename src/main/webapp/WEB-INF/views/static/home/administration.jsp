<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
    <meta name="keywords" content="Administration Department,dept of administration,administration department of pmrda pmrda administration">
      <meta name="description" content="  Increased focus on citizen welfare activity,Cost minimization by outsourcing of logistic services,"/>
     <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="Administration.title"  /> ::.</title>
	  <style>
	
p{
	text-align:justify;
}

.functionList li{
	list-style: upper-alpha;
}

.functionList li ul li{
	list-style: decimal;
}
.functionList li ul li ul li{
	list-style: disc;
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
     <%--  <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">  <spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway">  <spring:message code="department.navigation"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="Administration.title" /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>

		<div id="maincontent"    class="container-fluid t3-mainbody administration-container" style="margin-top:30px;">
			<div class="row">

<div class="t3-sidebar t3-sidebar-right col-xs-12 col-sm-2 col-md-2 col-lg-2"  style="padding-right: 25px;">

	
				<div class="nspArts bottom" style="width:100%;">
				<div class="nspArtScroll1">
				<div class="nspArtScroll2 nspPages1">
				<div class="nspArtPage active nspCol1">
				<div class="b-l-m-container">
                     <ul>
                        <li><a href="#"><spring:message code="department.b-l-m-container.li1"  /></a></li>
                        <li><a class="active" href="administration"><spring:message code="department.b-l-m-container.li8"  /></a></li>
                        <li><a href="account"><spring:message code="department.b-l-m-container.li7"  /></a></li>
                        <li><a  href="engineering"><spring:message code="department.b-l-m-container.li2"  /></a></li>
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

			<div id="t3-content" class="deptpage t3-content col-xs-12 col-sm-10 col-md-10 col-lg-10" style="padding-left: 25px;  border-left: 1px solid #eaeaea;">

			<div class="t3-component">

			<div id="k2Container" class="itemListView">


			<div class="itemList">

			<div id="itemListLeading">
			<div class="itemContainer itemContainerLast">

			<div class="catItemView groupLeading">

			<div class="itemHeader">

			<h3 class="itemTitle">
			
<spring:message code="Administration.itemTitle"  />
			</h3>

			</div>
			
			<div class="heading-underline" style="width: 200px;">
					<div class="left"></div><div class="right"></div>
			   </div>


			<div class="catItemBody">



			<div class="catItemIntroText">
			 <h4><spring:message code="Administration.catItemIntroText.h1"  /></h4> 

			<p><spring:message code="Administration.catItemIntroText.p1"  /></p>
			
			<p><spring:message code="Administration.catItemIntroText.p2"  /></p>
			
			<p><spring:message code="Administration.catItemIntroText.p3"  /></p>
			
		
			<h4><spring:message code="Administration.catItemIntroText.h2"  /></h4>	
 					  <img src="staticResources/t3-assets/images/departmentFlowchart/AdministrationFlowchart.png" alt="Administration Department Flowchart">
                
<h4><spring:message code="Administration.catItemIntroText.h3"  /></h4>

			<h4 class="nomargin"><spring:message code="Administration.catItemIntroText.h4"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="50%"><spring:message code="Administration.table.th1"  /></th>
						<th><spring:message code="Administration.table.th2"  /></th>
						<th><spring:message code="Administration.table.th3"  /></th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Administration.table.td1"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td2"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="Administration.catItemIntroText.h5"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="50%"><spring:message code="Administration.table.th1"  /></th>
						<th><spring:message code="Administration.table.th2"  /></th>
						<th><spring:message code="Administration.table.th3"  /></th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Administration.table.td1"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td2"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			<h4 class="nomargin"><spring:message code="Administration.catItemIntroText.h6"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="50%"><spring:message code="Administration.table.th1"  /></th>
						<th><spring:message code="Administration.table.th2"  /></th>
						<th><spring:message code="Administration.table.th3"  /></th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Administration.table.td1"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td2"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="Administration.catItemIntroText.h7"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="50%"><spring:message code="Administration.table.th1"  /></th>
						<th><spring:message code="Administration.table.th2"  /></th>
						<th><spring:message code="Administration.table.th3"  /></th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Administration.table.td4"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td5"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="Administration.table.td6"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td2"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="nomargin"><spring:message code="Administration.catItemIntroText.h8"  /></h4>
			<table>
				<thead>
					<tr>
						<th width="50%"><spring:message code="Administration.table.th1"  /></th>
						<th><spring:message code="Administration.table.th2"  /></th>
						<th><spring:message code="Administration.table.th3"  /></th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><spring:message code="Administration.table.td4"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td5"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td3"  /></td>
					</tr>
					<tr>
						<td><spring:message code="Administration.table.td6"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td2"  /></td>
						<td class="text-center"><spring:message code="Administration.table.td3"  /></td>
					</tr>
				</tbody>
			</table>
			
			<h4><spring:message code="Administration.catItemIntroText.h9"  /></h4>	
			<ul>
				<li><spring:message code="Administration.catItemIntroText.li1"  /></li>
				<li><spring:message code="Administration.catItemIntroText.li2"  /></li>
				<li><spring:message code="Administration.catItemIntroText.li3"  /></li>
				<li><spring:message code="Administration.catItemIntroText.li4"  /></li>
				<li><spring:message code="Administration.catItemIntroText.li5"  /></li>
				<li><spring:message code="Administration.catItemIntroText.li6"  /></li>
				<li><spring:message code="Administration.catItemIntroText.li777"  /></li>
			</ul>
			
			<h4><spring:message code="Administration.catItemIntroText.h10"  /></h4>	
			<ul class="functionList">
				<li><spring:message code="Administration.catItemIntroText.li7"  />
				<ul>
					<li><spring:message code="Administration.catItemIntroText.li8"  />
					<ul>
						<li><spring:message code="Administration.catItemIntroText.li9"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li10"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li11"  /></li>
					</ul>
					</li>
					<li><spring:message code="Administration.catItemIntroText.li12"  />
					<ul>
						<li><spring:message code="Administration.catItemIntroText.li13"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li14"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li15"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li16"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li17"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li18"  /></li>
						<li><spring:message code="Administration.catItemIntroText.li19"  /></li>
					</ul>
					</li>
					
				</ul>
				</li>
				<li><spring:message code="Administration.catItemIntroText.li20"  />
				<ul>
					<li><spring:message code="Administration.catItemIntroText.li21"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li22"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li23"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li24"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li25"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li26"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li27"  /></li>
				</ul>
				</li>
				<li><spring:message code="Administration.catItemIntroText.li28"  />
				<ul>
					<li><spring:message code="Administration.catItemIntroText.li29"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li30"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li31"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li32"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li33"  /></li>
					
				</ul>
				</li>
				<li><spring:message code="Administration.catItemIntroText.li34"  />
				<ul>
					<li><spring:message code="Administration.catItemIntroText.li35"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li36"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li37"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li38"  /></li>
						
				</ul>
				</li>
				<li><spring:message code="Administration.catItemIntroText.li39"  />
				<ul>
					<li><spring:message code="Administration.catItemIntroText.li40"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li41"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li42"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li43"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li44"  /></li>
					
				</ul>
				</li>
				<li><spring:message code="Administration.catItemIntroText.li45"  />
				<ul>
					<li><spring:message code="Administration.catItemIntroText.li46"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li47"  /></li>
					<%-- <li><spring:message code="Administration.catItemIntroText.li48"  /></li> --%>
					<li><spring:message code="Administration.catItemIntroText.li49"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li50"  /></li>
					
				</ul>
				</li>
				<li><spring:message code="Administration.catItemIntroText.li51"  />
				<ul>
					<li><spring:message code="Administration.catItemIntroText.li52"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li53"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li54"  /></li>
					
				</ul>
				</li>
			</ul>

			
			<h4><spring:message code="Administration.catItemIntroText.h11"  /></h4>	
				<ul class="projectList"style="list-style: decimal;">
					<li><spring:message code="Administration.catItemIntroText.li55"  /></li>
					<li><spring:message code="Administration.catItemIntroText.li56"  /></li>
<%-- 					<li><spring:message code="Administration.catItemIntroText.li57"  /></li> --%>
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