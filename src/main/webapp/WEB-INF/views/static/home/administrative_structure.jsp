<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
       <meta name="keywords" content="administrative strucutre of pmrda,pmrda administrative ">
      <meta name="description" content=" Establishing high-efficiency Virtual Offices spread across Pune Metropolitan Region , which will in turn deliver online services"/>
      <title>.:: <spring:message code="administrative.title"  /> ::.</title>
     
     <style>
     .table-responsive th{
     
    border-top: 1px solid #eaeaea;
    padding: 8px;
    background:#cc4042;
    color:white;
    
    }
      .table-responsive td{
     
    border-top: 1px solid #eaeaea;
    padding: 5px;
    
    }
   
     </style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          <jsp:include page="../includes/Header.jsp" />
          <div id="maincontent"   class="container-fluid au-container" style="margin-top:30px;"> 
           <%--  <div class="row">
               <img class="about-us-img" src="staticResources/t3-assets/images/aboutus.jpg">
            </div>
            <section class="wrap t3-navhelper ">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active"><spring:message code="navigation.container.li1"  /> </li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway"><spring:message code="navigation.container.li2"  /></a><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway"><spring:message code="about.navigation.container.li3"  /> </a><span class="divider">\</span></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="administrative.title"  /></span></li></ol>
               </div>
            </section>
            <hr/> --%>
            <div class="row" style="padding-bottom: 25px;">
             
               
               
               <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div class="b-l-m-container">
                     <ul>
                        <li><a href="#"><spring:message code="background.b-l-m-container.li1"  /></a></li>
                        <li><a href="pmrda_background"><spring:message code="background.b-l-m-container.li2"  /></a></li>
                        <li><a href="vision_and_mission"><spring:message code="background.b-l-m-container.li3"  /></a></li>
                        <li><a href="objectives"><spring:message code="background.b-l-m-container.li4"  /></a></li>
                         <li><a href="pmrda_establishment"><spring:message code="background.b-l-m-container.li7"  /></a></li>
                          <li><a href="master_plan"><spring:message code="background.b-l-m-container.li8"  /></a></li>
                           <li><a href="digital_policy"><spring:message code="background.b-l-m-container.li9"  /></li>
                        <li><a href="leadership_and_core_team"><spring:message code="background.b-l-m-container.li5"  /></a></li>
                        <li><a class="active" href="administrative_structure"><spring:message code="background.b-l-m-container.li6"  /></a></li>
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;"><spring:message code="administrative.title"  /></h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
			<div class="heading-underline" style="width: 325px;">
					<div class="left"></div><div class="right"></div>
			   </div>
				             </p>
                  <p class="" style="opacity: 1;;color: black">
<spring:message code="administrative.col-sx-12col-sm-12col-md-9.p5"  />                   </p>

             

                  

                  

           <div class="table-responsive">
            <table border="1" cellpadding="0" >
               <tbody>
               <tr style="color: black">
                  <th ><p align="center" >
                        <strong><spring:message code="administrative.table1.th1"  /></strong>
                     </p></th>
                  <th><p align="center">
                        <strong><spring:message code="administrative.table1.th2"  /></strong>
                     </p></th>
                  <th><p align="center">
                        <strong><spring:message code="administrative.table1.th3"  /></strong>
                     </p></th>
                  <th width="312"><p align="center">
                        <strong><spring:message code="administrative.table1.th4"  /></strong>
                     </p></th>
                     <th width="312"><p align="center">
                        <strong><spring:message code="administrative.table1.th5"  /></strong>
                     </p></th>
                       <th width="312"><p align="center">
                        <strong><spring:message code="administrative.table1.th6"  /></strong>
                     </p></th>
               </tr>
               <tr>
                  <td><p align="center" style="color: black">
                        <spring:message code="administrative.table1.td1"  />
                     </p></td>
                  <td><p align="center" style="color: black">
                        <spring:message code="administrative.table1.td2"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td3"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td4"  />
                     </p></td>
                     <td width="312"><p align="center" style="color: black">
                      <spring:message code="administrative.table1.td5"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td6"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td7"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td8"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td9"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td10"  />
                     </p></td>
                     <td width="312"><p align="center" style="color: black">
                      <spring:message code="administrative.table1.td11"  />
                     </p></td>
                     <td width="312"><p align="center" style="color: black">
                       <spring:message code="administrative.table1.td12"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td13"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td14"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td15"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td16"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td17"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td18"  />
                     </p></td>
               </tr>
               <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td19"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td20"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td21"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td22"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td23"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td24"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td31"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td32"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td33"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td34"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td35"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td36"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td37"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td38"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td39"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td40"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td41"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td42"  />
                     </p></td>
               </tr>
               <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td43"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td44"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td45"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td46"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td47"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td48"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td49"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td50"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td51"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td52"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td53"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td54"  />
                     </p></td>
               </tr>
               <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td55"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td56"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td57"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td58"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td59"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td60"  />
                     </p></td>
               </tr>
               <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td61"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td62"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td63"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td64"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td65"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td66"  />
                     </p></td>
               </tr>
               <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td67"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td68"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td69"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td70"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td71"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td72"  />
                     </p></td>
               </tr>
               <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td73"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td74"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td75"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td76"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td77"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td78"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td79"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td80"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td81"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td82"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td83"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td84"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td85"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td86"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td87"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td88"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td89"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td90"  />
                     </p></td>
               </tr>
               
            
               
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td91"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td92"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td93"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td94"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td95"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td96"  />
                     </p></td>
               </tr>
               
               <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td97"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td98"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td99"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td100"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td101"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td102"  />
                     </p></td>
               </tr>
                <tr>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td103"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                        <spring:message code="administrative.table1.td104"  />
                     </p></td>
                  <td><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td105"  />
                     </p></td>
                  <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td106"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                      <spring:message code="administrative.table1.td107"  />
                     </p></td>
                     <td width="312"><p align="center"style="color: black">
                       <spring:message code="administrative.table1.td108"  />
                     </p></td>
               </tr>
            </tbody></table><br/>
</div>
               </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>