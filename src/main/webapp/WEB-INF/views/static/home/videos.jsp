<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale" %>
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
      <title>.:: <spring:message code="index.module-ct.span1"  /> ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
     <style>
body {font-family: Arial, Helvetica, sans-serif;}


#maincontent .row > .column {
  padding:8px;
}

#maincontent .row:after {
  content: "";
  display: table;
  clear: both;
}

#maincontent .column {
  float: left;
  width: 25%;
}

/* The Modal (background) */
#maincontent .modal {
  display: none;
  position: fixed;
  z-index: 101;
  padding-top: 50px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: black;
}

/* Modal Content */
#maincontent .modal-content {
  position: relative;
  background-color: black;
  margin: auto;
  padding: 0;
  width: 90%;
  max-width: 1200px;
  border-radius:0px;
      height: calc(100vh - 50px);
}

#maincontent .mySlides img{
	    width: auto!important;
    height: auto!important;
    max-height: calc(100vh - 80px)!important;
}

/* The Close Button */
#maincontent .close {
  color: white;
  position: absolute;
  top: 10px;
  right: 25px;
  font-size: 35px;
  font-weight: bold;
}

#maincontent .close:hover,
#maincontent .close:focus {
  color: #999;
  text-decoration: none;
  cursor: pointer;
}

#maincontent .mySlides {
  display: none;
}

#maincontent .cursor {
  cursor: pointer;
}

/* Next & previous buttons */
#maincontent .prev,
#maincontent .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

#maincontent .prev {
  left: 0;
  border-radius: 3px 0 0 3px;
}

/* Position the "next button" to the right */
#maincontent .next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
#maincontent .prev:hover,
#maincontent .next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
#maincontent .numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

#maincontent img {
  margin-bottom: -4px;
  border-radius:0px!important;
}

#maincontent .caption-container {
  text-align: center;
  background-color: black;
  padding: 2px 16px;
  color: white;
}

#maincontent .active{
  opacity: 1;
}

#maincontent img.hover-shadow {
  transition: 0.3s;
}

#maincontent .hover-shadow:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
/* .au-cmm-container img{
height:auto!important;
} */

.caption{
	padding:5px;
	background:lightgray;
	text-align:center;
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
                  <li class="active"><spring:message code="navigation.container.li1"  />  &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">Home</a><li><i class="fas fa-caret-right"></i> <a href="./background.html" class="pathway"><spring:message code="gallery.title"  /> </a></li></ol>
               </div>
            </section>
            <hr/>
      </div>
 --%>
		

         <div  id="maincontent"   class="container-fluid au-cmm-container contrast "> 
         <div class="row">
         <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
             <li> <a href="#"><spring:message code="Header.Menu.AboutUs.mediacntr"  />  </a></li>
						    
						      <li><a  href="press_notes"><spring:message code="pressnotes.title"  /></a></li>
						      <li><a href="pmrda_news"><spring:message code="pagetitle.whatnew"  /></a></li>
						      <li><a class="active" href="videos"><spring:message code="index.module-ct.span1"  /></a></li>
						       <li><a href="gallery"><spring:message code="index.module-ct.span2"  /></a></li>
                        <li><a href="mediacenter"><spring:message code="Header.Menu.AboutUs.mediacntr"  /></a></li>
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
            <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h3 class="itemTitle">
               
             <spring:message code="index.module-ct.span1"  />
               </h3>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>

         </div>
         
         <div class="row" style="margin-bottom:50px;" id="engDiv">
         
         <c:forEach items="${videoList}" var="video">
         		<div class="col-md-6" style="padding:0px 10px;">
   					 <iframe width="100%" height="250px" src="${video.link}" frameborder="0" allowfullscreen=""></iframe>
 						<div class="caption">
 							<span>${video.title}</span>
 						</div>
  				</div>
         </c:forEach>
         
 
</div>

 <div class="row" style="margin-bottom:50px;display: none;" id="marathiDiv">
         
         <c:forEach items="${videoList}" var="video">
         		<div class="col-md-6" style="padding:0px 10px;">
   					 <iframe width="100%" height="250px" src="${video.link}" frameborder="0" allowfullscreen=""></iframe>
 						<div class="caption">
 							<span>${video.title_h}</span>
 						</div>
  				</div>
         </c:forEach>
         
 
</div>


            
            
            </div>
            </div>
          </div> 
      <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
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