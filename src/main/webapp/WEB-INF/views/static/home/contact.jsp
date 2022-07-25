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
      <title>.:: <spring:message code="contact.div.h3.title"  /> ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
     <style>
     .full-width{
     	width:100%;
     }
     
     		.t3-mainbody .card-header{
     			padding: .75rem 1.25rem;
			    margin-bottom: 0;
			    background:linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%)!important;
			    border-bottom: 1px solid rgba(0,0,0,.125);
			    width:100%!important;
			    font-weight:bold;
			    color:white;
			    
     		}
     		.t3-mainbody .card-header img{
     			    position: absolute;
    top: -3px;
    right: 30px;
     		}
     		.t3-mainbody .card-body{
     			flex: 1 1 auto;
			    min-height: 1px;
			    padding: 1.25rem;
			    overflow:auto;
     		}
     		
     	.t3-mainbody .card{		
     position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
        box-shadow: 0px 15px 10px rgba(0, 0, 0, .15);
    }
    
    .card{
        margin: 10px;
            min-height: 228px;
    }
    
   .card-body .card-title{
   margin: 0px;
   }
    .card-body .card-text{
      margin: 5px 0px;
     
   }
   
   .contact-form input,select{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 90%!important;
   	        margin:auto;
   }
   .contact-form select{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 90%!important;
   	        margin:auto;
   }
   .contact-form textarea{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 95%!important;
   	        margin:auto;
   }
   .form-horizontal .form-group{
   	    margin-bottom: 10px!important;
   }
   
   .panel-body{
   	    margin: 15px;
   	        background: whitesmoke;
   }
   
   .form-horizontal .form-actions{
   	padding: 10px!important;
    margin: 0px!important;
   }
   
   .reachinfo{
   	padding:10px;
   }
   
   .card-body i{
   	margin-right:10px;
   }
 
   
   .maincontacthead h1{
   	    color: white;
    font-size: 36px;
    text-align: center;
    padding: 30px;
    text-decoration: underline;
    background: #55524b;
   }
   
   
   .contact-form label{
   	padding-left:20px;
   }
   
   .subbutton{
   	text-align:center;
   }
    @media only screen and (min-width: 1200px){
     .card{
        
            min-height: 228px!important;
    }
    }
    
   @media only screen and (min-width: 920px){
   .ofimptab{
   	    z-index: 9;
   
   }
   .contactarea{
   	    position: relative;
    top: -120px;
   }
  
   
   }
  
   .card{
        
            min-height: 362px;
    }
    
    .card-body .card-text a, .card-body .card-title a{
    	color:blue;
    }
    .card-body .card-text a:hover,  .card-body .card-title a:hover{
    	color:blue;
    	text-decoration:underline;
    }
    .conmerge .ofimptab .card{
    background-color:white;
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
                  <li class="active">  <spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">  <spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="contact.title"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div>
 --%>
		

         <div id="t3-mainbody" class="container-fluid t3-mainbody cu-container" style="margin-top:30px;">
        <div class="row">
            <div class="itemHeader" style="width:100%; text-align:center;">

               <h3 class="itemTitle">
               
              <spring:message code="contact.div.h3.title"  />
               </h3>

            </div>
               
            <div class="heading-underline" style="width: 200px;    margin: 10px auto 25px!important;">
               <div class="left"></div><div class="right"></div>
            </div>

         </div>
         <div class="row">
         	
         	
         		<div class="t3-module module " id="Mod226"><div class="module-inner">
         		
         	<div class="col-md-6" style="padding:10px;">
         	<h5><spring:message code="contact.div.h5.map1"  />:</h5>
         	<div class="map">
   		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.237464435184!2d73.81057641489343!3d18.56332998738408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x48967284fcf3bf86!2sPune+Metropolitan+Regional+Development+Authority!5e0!3m2!1sen!2sus!4v1510252824711" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen="allowfullscreen" ></iframe>
    </div>
         	</div>
         	
         	<div class="col-md-6" style="padding:10px;">
         	<h5><spring:message code="contact.div.h5.map2"  />:</h5>
         	 <div class="map">
   		<iframe scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=PMRDA%20akurdi+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="100%" height="400" frameborder="0"></iframe>
    </div>
         	</div>	
	
  
   
   
         <div class="row contact_page" style="   width:100%;">
         		<div class="col-md-12">
         			<h3 style="text-align:center;  padding:10px;     text-decoration: underline;"><spring:message code="contact.div.h3.htrpo"  /></h3>
         		</div>
         	
         		<div class="col-md-6" style="       padding: 10px;">
         		<spring:message code="contact.div.title.aundh"  />:
         					<ul>
         					<li><spring:message code="contact.div.ul1.li1"  />
         						<ul>
         							<li><spring:message code="contact.div.ul1.ul1.li1"  /></li>
         							<li><spring:message code="contact.div.ul1.ul1.li2"  /></li>
         						</ul>
         					</li>
         					<li><spring:message code="contact.div.ul1.li2"  />
         						<ul>
         							<li><spring:message code="contact.div.ul1.ul2.li1"  /></li>
         							<li><spring:message code="contact.div.ul1.ul2.li2"  /></li>
         						</ul>
         					</li>
         					</ul>
         		</div>
         		<div class="col-md-6" style="   padding: 10px;">
         		<spring:message code="contact.div.title.akurdi"  />:
         					<ul>
         					<li><spring:message code="contact.div.ul2.li1"  />
         						<ul>
         							<li><spring:message code="contact.div.ul2.ul1.li1"  /></li>
         							<li><spring:message code="contact.div.ul2.ul1.li2"  /></li>
         							<li><spring:message code="contact.div.ul2.ul1.li3"  /></li>
         						</ul>
         					</li>
         					<li><spring:message code="contact.div.ul2.li2"  />
         						<ul>
         							<li><spring:message code="contact.div.ul2.ul2.li1"  /></li>
         							<li><spring:message code="contact.div.ul2.ul2.li2"  /></li>
         							<li><spring:message code="contact.div.ul2.ul2.li3"  /></li>
         						</ul>
         					</li>
         					</ul>
         		</div>
         			
         		
         	</div>
</div>

</div>
         	
         	
         </div>
         <section class="container-fluid conmerge">
         
         <div class="ofimptab">
         	<div class="row">
         	<%-- <div class="page-header" style="border:none; margin:0px;">
<h3 style="margin-bottom: 0px;    text-align: center;">
<span class="contact-name" itemprop="name">  <spring:message code="contact.contact-name"  /> </span>
</h3>
<div class="heading-underline" style="width: 190px;    margin: 10px auto 25px">
                        <div class="left"></div><div class="right"></div>
                      </div>
</div>
		--%>
<div class="col-sm-4">
	<div class="card mb-3" style=" ">
	<div class="row">
		<!-- <img src="staticResources/images/icon/bookmark.png" width="40" height="35"> -->
		<div class="card-header"><spring:message code="contact.accordion-toggle"  /></div>
		<div class="col-sm-12 col-md-6">
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-map-marked-alt"></i><spring:message code="contact.address"  /></h5>
    <p class="card-text"><spring:message code="contact.contact-street1"  /><br>
		 <spring:message code="contact.contact-street2"  /> 
		 <spring:message code="contact.contact-street3"  /> <br>
		  <spring:message code="contact.contact-street4"  /></p>
  </div>
		</div>
		<div class="col-sm-12 col-md-6">
		<div class="row">
		
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-paper-plane"></i><spring:message code="contact.email"  /></h5>
    <p class="card-text"><span id="cloakca1209a5eb7861c0bbc38a4ac8d57a39"><spring:message code="contact.emailAddress"  /></span></p>
  </div>
		</div>
		<div class="row">
		
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-phone"></i> <spring:message code="contact.phone"  /></h5>
    <p class="card-text"> <spring:message code="contact.phoneNo"  /> </p>
  </div>
		</div>
		
		</div>
	</div>
  
  
</div>
</div>
<div class="col-sm-4">
<div class="card  mb-3" style=" ">
	<div class="row">
		
		<div class="card-header"><spring:message code="contact.accordion-toggle1"  /></div>
		<div class="col-sm-12 col-md-6">
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-map-marked-alt"></i><spring:message code="contact.address1"  /></h5>
    <p class="card-text"> <spring:message code="contact.contact-street5"  /><br>
		 <spring:message code="contact.contact-street6"  /> <br>
		 <spring:message code="contact.contact-street7"  /> 
		  <spring:message code="contact.contact-street9"  /><br>
		  <spring:message code="contact.contact-street8"  /></p>
  </div>
		</div>
		<div class="col-sm-12 col-md-6">
		<div class="row">
		
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-paper-plane"></i><spring:message code="contact.email"  /></h5>
    <p class="card-text"><span id="cloakca1209a5eb7861c0bbc38a4ac8d57a39"><spring:message code="contact.emailAddress"  /></span></p>
  </div>
		</div>
		<div class="row">
		
		<div class="card-body">
    <h5 class="card-title"> <i class="fas fa-phone"></i><spring:message code="contact.phone1"  /></h5>
    <p class="card-text"> <spring:message code="contact.phoneNo1"  />  </p>
  </div>
		</div>
		
		</div>
	</div>
  
  
</div>
</div>
<div class="col-sm-4">
<div class="card  mb-3" style=" ">
	<div class="row">
		<div class="card-header"><spring:message code="contact.div.title.ocd"  /></div>
		<div class="row">
		<div class="card-body">
    <p class="card-title"><a href="staticResources/PMRDAIntercomDetails_new.pdf" target="_blank"><spring:message code="contact.div.p.title.cloae"  /></a></p>
    
  </div>
		</div>
		<div class="row" style="width:100%">
		<div class="card-body">
    <p class="card-title"><spring:message code="contact.div.p1.ohr"  /></p>
    
  </div>
		</div>
		<div class="row" style="width:100%">
		<div class="card-body">
    <p class="card-title"><spring:message code="contact.div.p2.weekoff"  /></p>
    
  </div>
		</div>
		
	</div>
  
  
</div>
</div>
<div class="col-sm-12">
<div class="card  mb-3" style=" ">
	<div class="row">
		<div class="card-header"><spring:message code="contact.div.title.cdi"  /></div>
		
		
		<div class="card-body">
		<div class="row">
		<div class="col-md-4" style="margin-bottom:20px;">
		
    <h5 class="card-title full-width"><spring:message code="contact.div.h51.mcpa"  /></h5>
    <p style="margin:0px;"><spring:message code="contact.div.p.ph1"  /></p>
    
  
		</div>
		<div class="col-md-4" style="margin-bottom:20px;">
		
    <h5 class="card-title full-width"><spring:message code="contact.div.h52.obpas"  /> </h5>
    <p style="margin:0px;"><spring:message code="contact.div.p.ph2"  /></p>
    
  
		</div>
		<div class="col-md-4" style="margin-bottom:20px;">
		
    <h5 class="card-title full-width"><spring:message code="contact.div.h53.acpa"  /></h5>
    <p style="margin:0px;"><spring:message code="contact.div.p1.ph3"  /></p>
    
  
		</div>
		<div class="col-md-4" style="margin-bottom:20px;">
		
    <h5 class="card-title full-width"><spring:message code="contact.div.h54.apa"  /></h5>
    <p style="margin:0px;"><spring:message code="contact.div.p1.ph4"  /></p>
    
  
		</div>
		<div class="col-md-4" style="margin-bottom:20px;">
		
    <h5 class="card-title full-width"><spring:message code="contact.div.h55.pmay"  />  </h5>
    <p style="margin:0px;"><spring:message code="contact.div.p1.ph5"  /></p>
    
  
		</div>
		</div>
		
		
		</div>
	</div>
  
  
</div>
</div>

 </div>
         </div>
         	
         
         	
         </section>
         
         </div>
         
         

<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
</div>

         
      </div>   
   </body>
</html>