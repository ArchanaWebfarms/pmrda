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
</style>
   <head>
     <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
  <meta name="viewport" content="width=device-width" />
      <meta name="description" content=" "/>
    <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
    <title>.:: <spring:message code="objectives.title"  /> ::.</title>
    
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          <jsp:include page="../includes/Header.jsp" />
        
         


         <div  id="maincontent"   class="container-fluid au-container" style="margin-top:30px;"> 
            
            <div class="row" style="padding-bottom: 25px;">
             
               
                  <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
                        <li><a href="#"><spring:message code="background.b-l-m-container.li1"  /></a></li>
                        <li><a href="pmrda_background"><spring:message code="background.b-l-m-container.li2"  /></a></li>
                        <li><a href="vision_and_mission"><spring:message code="background.b-l-m-container.li3"  /></a></li>
                        <li><a href="leadership_and_core_team"><spring:message code="background.b-l-m-container.li5"  /></a></li>
                        <li><a class="active" href="objectives"><spring:message code="background.b-l-m-container.li4"  /></a></li>
                         <li><a href="master_plan"><spring:message code="background.b-l-m-container.li8"  /></a></li>
                          <%--  <li><a href="pmrda_establishment"><spring:message code="background.b-l-m-container.li7"  /></a></li>
                           <li><a href="digital_policy"><spring:message code="background.b-l-m-container.li9"  /></a></li>
                         <li><a href="administrative_structure"><spring:message code="background.b-l-m-container.li6"  /></a></li> --%>
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="bloginfo">
                                <h3 style="margin-bottom: 0px;"><spring:message code="objectives.title"  /> :</h3>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
				  <div class="heading-underline" style="width: 150px;">
					<div class="left"></div><div class="right"></div>
				</div>
				  <div class="blog_detail">


                           
                           
                            <div class="clear"></div>
                             <h4><spring:message code="objectives.blog_detail.h1"  />:</h4>
                           <p ><spring:message code="objectives.blog_detail.p11"  />  </p>
                            <p ><spring:message code="objectives.blog_detail.p12"  />  </p>
                            <ul>
                            	<li><spring:message code="objectives.blog_detail.p13"  /></li>
                            	<li><spring:message code="objectives.blog_detail.p14"  /></li>
                            	<li><spring:message code="objectives.blog_detail.p15"  /></li>
                            	<li><spring:message code="objectives.blog_detail.p16"  /></li>
                            	<li><spring:message code="objectives.blog_detail.p17"  /></li>
                            </ul>


						<h4><spring:message code="objectives.blog_detail.h2"  />:</h4>
						 <p ><spring:message code="objectives.blog_detail.p21"  />  </p>
						  <p ><spring:message code="objectives.blog_detail.p22"  />  </p>
						   <p ><spring:message code="objectives.blog_detail.p23"  />  </p>
						    <p ><spring:message code="objectives.blog_detail.p24"  />  </p>
						
						<ul>
							<li><spring:message code="objectives.blog_detail.p25"  /></li>
							<li><spring:message code="objectives.blog_detail.p26"  /></li>
							<li><spring:message code="objectives.blog_detail.p27"  /></li>
							<li><spring:message code="objectives.blog_detail.p28"  /></li>
							<li><spring:message code="objectives.blog_detail.p29"  /></li>
							<li><spring:message code="objectives.blog_detail.p210"  /></li>
						</ul>
						
						
						<h4><spring:message code="objectives.blog_detail.h3"  />:</h4>
						 <p ><spring:message code="objectives.blog_detail.p31"  />  </p>
						  <p ><spring:message code="objectives.blog_detail.p32"  />  </p>
						   <p ><spring:message code="objectives.blog_detail.p33"  />  </p>
						    <p ><spring:message code="objectives.blog_detail.p34"  />  </p>
						
						<ul>
							<li><spring:message code="objectives.blog_detail.p35"  /></li>
							<li><spring:message code="objectives.blog_detail.p36"  /></li>
							<li><spring:message code="objectives.blog_detail.p37"  /></li>
							<li><spring:message code="objectives.blog_detail.p38"  /></li>
							<li><spring:message code="objectives.blog_detail.p39"  /></li>
							<li><spring:message code="objectives.blog_detail.p310"  /></li>
							<li><spring:message code="objectives.blog_detail.p311"  /></li>
							<li><spring:message code="objectives.blog_detail.p312"  /></li>
						</ul>
						
						
						<h4><spring:message code="objectives.blog_detail.h4"  />:</h4>
						 <p ><spring:message code="objectives.blog_detail.p41"  />  </p>
						  <p ><spring:message code="objectives.blog_detail.p42"  />  </p>
						   <p ><spring:message code="objectives.blog_detail.p43"  />  </p>
						   <ul>
						   <li ><spring:message code="objectives.blog_detail.p44"  />  </li>
						    <li ><spring:message code="objectives.blog_detail.p45"  />  </li>
						    <li ><spring:message code="objectives.blog_detail.p46"  />  </li>
						   </ul>
						   
						   
						   <%-- <h4><spring:message code="objectives.blog_detail.h5"  /> :</h4>
						    <p ><spring:message code="objectives.blog_detail.p51"  />  </p>
						     <p ><spring:message code="objectives.blog_detail.p52"  />  </p>
						      <p ><spring:message code="objectives.blog_detail.p53"  />  </p>
						       <p ><spring:message code="objectives.blog_detail.p54"  />  </p>
						       
						       <ul>
						       	<li><spring:message code="objectives.blog_detail.p55"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p56"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p57"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p58"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p59"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p510"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p511"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p512"  /></li>
						       </ul> --%>
						       
						        <h4><spring:message code="objectives.blog_detail.h6"  />:</h4>
						       <p ><spring:message code="objectives.blog_detail.p61"  />  </p>
						       <p ><spring:message code="objectives.blog_detail.p62"  />  </p>
						       <ul>
						       	<li><spring:message code="objectives.blog_detail.p63"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p64"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p65"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p66"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p67"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p68"  /></li>
						       	<li><spring:message code="objectives.blog_detail.p69"  /></li>
						       </ul>
						       
						       
                        </div>
                  </div>
         </div>
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>