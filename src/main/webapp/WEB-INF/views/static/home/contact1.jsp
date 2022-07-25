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
      <title>.::<spring:message code="contact.title"  /> ::.</title>
     <style>
     		.t3-mainbody .card-header{
     		width:100%!important;
     			padding: .75rem 1.25rem;
			    margin-bottom: 0;
			    background-color: rgba(0,0,0,.03);
			    border-bottom: 1px solid rgba(0,0,0,.125);
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
    box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, .15);
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
   	height:30px!important;
   }
   .form-horizontal .form-group{
   	    margin-bottom: 10px!important;
   }
   
   .panel-body{
   	    margin: 15px;
   	       
   }
   
   .form-horizontal .form-actions{
   	padding: 10px!important;
    margin: 0px!important;
        background-color: inherit!important;
   }
   
   .reachinfo{
   	padding:10px;
   }
   
   .card-body i{
   	margin-right:10px;
   }
   .t3-mainbody .card:hover .card-header{
   	color: white;
   }
   .t3-mainbody .card:hover{
		   border: 1px solid rgb(204, 64, 66);
		   transition:0.8s;
   }
   .t3-mainbody .card:hover .card-header{
   		    background: #cc4042;
        	transition:0.8;
   }
   
   .contactBanner{
   	    text-align: center;
    background: aliceblue;
    padding: 75px;
    background-image: url("staticResources/images/contact-banner.jpg");
        color: white;
   }
   .contact-form input,select{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 90%!important;
   	        margin:auto;
   	            border-radius: 10px!important;
   }
   .contact-form select{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 90%!important;
   	        margin:auto;
   	            border-radius: 10px!important;
   }
   .contact-form textarea{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 95%!important;
   	        margin:auto;
   	            border-radius: 10px!important;
   }
   
   .t3-module .module-innercon .module-title{
   	text-align:center;
   }
   .module-innercon{
   		    background: indianred;
   }
   .mapnrerach{
   	    width: 100%;
    margin: 20px auto;
        border: 1px solid #cccccc;
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
      </div> --%>

		

         <div id="t3-mainbody" class="container-fluid t3-mainbody cu-container" style="margin-top:30px;">
         <div class="row">
         	<div class="col-md-12">
         	<div class="contactBanner">
         		<h1 style="color:white;">Get in touch</h1>
         		<p>Want to get in touch? We'd love to hear from you. Here's how you can reach us...</p>
         	</div>
         		
         	</div>
         </div>
         <div class="row" style="    position: relative;    top: -70px;">
         	<%-- <div class="page-header" style="border:none; margin:0px;">
<h3 style="margin-bottom: 0px;    text-align: center;">
<span class="contact-name" itemprop="name">  <spring:message code="contact.contact-name"  /> </span>
</h3>
<div class="heading-underline" style="width: 190px;    margin: 10px auto 25px">
                        <div class="left"></div><div class="right"></div>
                      </div>
</div> --%>

<div class="col-md-4">
	<div class="card bg-light mb-3" style=" ">
	<div class="row">
		
		<div class="card-header"><spring:message code="contact.accordion-toggle"  /><img src="staticResources/images/icon/bookmark.png" width="40" height="35"></div>
		<div class="col-md-6">
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-map-marked-alt"></i><spring:message code="contact.address"  /></h5>
    <p class="card-text"><spring:message code="contact.contact-street1"  /><br>
		 <spring:message code="contact.contact-street2"  /> 
		 <spring:message code="contact.contact-street3"  /> <br>
		  <spring:message code="contact.contact-street4"  /></p>
  </div>
		</div>
		<div class="col-md-6">
		<div class="row">
		
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-paper-plane"></i><spring:message code="contact.email"  /></h5>
    <p class="card-text"><span id="cloakca1209a5eb7861c0bbc38a4ac8d57a39"><a href="mailto:email@email.com"><spring:message code="contact.emailAddress"  /></a></span></p>
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

<div class="col-md-4">
<div class="card bg-light mb-3" style=" ">
	<div class="row">
		
		<div class="card-header"><spring:message code="contact.accordion-toggle1"  /><img src="staticResources/images/icon/bookmark.png" width="40" height="35"></div>
		<div class="col-md-6">
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-map-marked-alt"></i><spring:message code="contact.address1"  /></h5>
    <p class="card-text"> <spring:message code="contact.contact-street5"  /><br>
		 <spring:message code="contact.contact-street6"  /> <br>
		 <spring:message code="contact.contact-street7"  /> 
		  <spring:message code="contact.contact-street9"  /><br>
		  <spring:message code="contact.contact-street8"  /></p>
  </div>
		</div>
		<div class="col-md-6">
		<div class="row">
		
		<div class="card-body">
    <h5 class="card-title"><i class="fas fa-paper-plane"></i><spring:message code="contact.email"  /></h5>
    <p class="card-text"><span id="cloakca1209a5eb7861c0bbc38a4ac8d57a39"><a href="mailto:email@email.com"><spring:message code="contact.emailAddress"  /></a></span></p>
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
<div class="col-md-4">
<div class="card bg-light mb-3" style=" ">
	<div class="row">
		<div class="card-header">Other Contact Details<img src="staticResources/images/icon/bookmark.png" width="40" height="35"></div>
		<div class="row">
		<div class="card-body">
    <h5 class="card-title"><a href="#">Contact List of all Employees</a></h5>
    
  </div>
		</div>
		<div class="row">
		<div class="card-body">
    <h5 class="card-title">Office hours: 10am to 6pm</h5>
    
  </div>
		</div>
		<div class="row">
		<div class="card-body">
    <h5 class="card-title">Weekly Off: 2nd and 4th Saturday and Sunday</h5>
    
  </div>
		</div>
		
	</div>
  
  
</div>
</div>


         </div>
         
         <div class="row">
         	
         	<div class="col-md-12">
         	<div class="t3-module module " id="Mod226" style="width:100%!important;"><div class="module-inner module-innercon"><h3 class="module-title " style="padding: 30px 10px; color:white;"><span>We’d love to hear from you!<%-- <spring:message code="contact.form"  /> --%></span></h3>
<!-- <div class="heading-underline" style="width: 55px; margin-left: 10px;">
                        <div class="left"></div><div class="right"></div>
                      </div> -->
  <div class="panel-body">
<div class="contact-form">
<form:form action="saveComplaint?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="complaint" commandName="complaint" class="form-horizontal">
 
<input type="hidden" id="uname" value=""> 

	   <div class="row">
			<div class="form-group col-md-6">
			<%-- <label class="col-md-5 control-lable" for="title"><spring:message code="contact.form.li1"  /></label> --%>
				<form:errors style="color: red"  path='title' />		
		<form:input type="text" path="title" id="title" class="form-control" placeholder="Enter Title" />
			</div>
			<div class="form-group col-md-6">
			
				<%-- <label class="col-md-5 control-lable" for="name"><spring:message code="contact.form.li2"  /></label> --%>
				<form:errors style="color: red"  path='name' />	
			
				
					<form:input type="text" name="name" path="name" id="name" class="form-control" placeholder="Enter Name" />				
				 
			</div>
			
		</div>

		<div class="row">
			<div class="form-group col-md-6">
			<form:errors style="color: red"  path='phone' />				
				<form:input type="text" path="phone" id="phone" class="form-control" placeholder="Enter Mobile No."  />	
			</div>
				<div class="form-group col-md-6">
			<form:errors style="color: red"  path='email' />	
				<form:input type="email" path="email" id="email" class="form-control"  placeholder="Enter Email-ID"/>				
			</div>
			    
		</div>

		<div class="row">
			<div class="form-group col-md-6">
			<form:errors style="color: red"  path='subject' />			
				<form:select path="subject" id="subject" name="subject" style="width: 100%;">
						<option value="" selected="selected"><spring:message code="contact.form.select.option1"  /></option>
						<option value="solved"><spring:message code="contact.form.select.option2"  /></option>
						<option value="pending"><spring:message code="contact.form.select.option3"  /></option>
						<option value="delayed"><spring:message code="contact.form.select.option4"  /></option>
					</form:select>  
			</div>
			
			
			
		</div>

		<div class="row">
			<div class="form-group col-md-12">
			
			
				<form:errors style="color: red"  path='description' />	
			
					
					<form:textarea path="description" id="description" class="form-control" placeholder="Write Description"/>	
				  
			</div>
		</div>
		
	<%-- 	<div class="row">
			<div class="form-group col-md-12">
			
				<label class="col-md-5 control-lable" for="description"><spring:message code="contact.form.li7"  /></label>
				<span style="color: red" id="answerError"></span>
				<div class="col-md-7">
				  <img id="captcha" src="simpleCaptcha.jpg" width="135" height="30" style="    margin-bottom: 10px;">
				  <input type="button" value="Refresh" onclick="showRecaptcha()" class="btn btn-success btn-xs" style="    margin-bottom: 10px;">
				  <div class="input-group">
						<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
						<input type="text" name="answer"  id="answer" class="form-control" required="required"/>
				  </div>
				</div>
			</div>
		</div> --%>
		<input type="hidden" name="returnAnswer" id="returnAnswer">
		
		     <div class="row">
		          <div class="col-md-4"></div>
                  <div class="form-actions" style="text-align:center;"><!--   -->
					 <button type="submit" style="background:inherit; border: 2px solid white!important; font-size: 18px; width: 120px; border-radius:15px;" onclick="return save()" class="btn pull-center btn-sm btn-flat margin"><spring:message code="contact.form.submit"  /></button>
				 	
				  </div>
              </div> 
        </form:form>
</div>
</div>
</div>

</div>
         	
         	</div>
         	
         </div>
         <section class="mapnrerach">
         <div class="row">
         	
         		<div class="col-md-6">
         	<div class="row">
         		<div class="t3-module module " id="Mod226"><div class="module-inner"><%-- <h3 class="module-title " style="padding: 10px 10px;"><span><spring:message code="contact.map"  /></span></h3> --%>

   <div class="map">
   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.237464435184!2d73.81057641489343!3d18.56332998738408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x48967284fcf3bf86!2sPune+Metropolitan+Regional+Development+Authority!5e0!3m2!1sen!2sus!4v1510252824711" width="100%" height="432" frameborder="0" style="border:0" allowfullscreen="allowfullscreen" ></iframe>
   </div>
</div>

</div>
         	</div>
         	
         	
         	</div>
         	<div class="col-md-6" style="padding: 20px;">
         		<div class="row">
         		<h4 style="color: #cc4042;">How to reach to PMRDA</h4>
         		<div class="col-md-12">
         		Aundh:
         					<ul>
         					<li>from swargate
         						<ul>
         							<li>Follow Ghorpade Peth Rd and Bhau Manasaram Naik Rd to Shankar Sheth Rd</li>
         							<li>Take Bajirao Rd, MH SH 114 and Ganeshkhind Rd to Aundh Rd/Aundh-Wakad Rd/Vidyapeeth Rd in Ward No. 8</li>
         						</ul>
         					</li>
         					<li>from Pimpri chinchwad</li>
         					</ul>
         		</div>
         		<div class="col-md-12">
         		Akurdi:
         					<ul>
         					<li>from swargate
         						<ul>
         							<li>Take Jawaharlal Nehru Rd to Dr Baba Saheb Ambedkar Rd/Mumbai Hwy/Mumbai - Pandharpur Rd</li>
         							<li>Drive from NH60 and Mumbai - Pandharpur Rd/Old Mumbai Rd/Old Mumbai - Pune Hwy to Chinchwad, Pimpri-Chinchwad</li>
         							<li>Take Service Rd and Ganga Nagar Rd to your destination in Pradhikaran</li>
         						</ul>
         					</li>
         					<li>from Pimpri chinchwad</li>
         					</ul>
         		</div>
         			
         		
         	</div>
         	</div>
         	
         	
         	</div>
         	</section>
         
        <!--  <div class="page-header" style="border:none; margin:0px;    margin-top: 15px;">
<h4 style="margin-bottom: 0px;    text-align: center;">
<span class="contact-name" itemprop="name">How to reach to PMRDA Office</span>
</h4>
<div class="heading-underline" style="width: 250px;    margin: 10px auto 0px;">
                        <div class="left"></div><div class="right"></div>
                      </div>
</div> -->
         
<%-- <div class="row">

<div id="t3-content" class="t3-content col-xs-12 col-sm-8 col-md-8 col-lg-9" style="padding-right: 25px;">

<div class="t3-component">
<div class="contact" itemscope="" itemtype="https://schema.org/Person">
<div class="page-header">
<h2 style="margin-bottom: 0px;">
<span class="contact-name" itemprop="name">  <spring:message code="contact.contact-name"  /> </span>
</h2>
<div class="heading-underline" style="width: 190px;">
                        <div class="left"></div><div class="right"></div>
                      </div>
</div>

<div class="panel-group" id="slide-contact">
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a class="accordion-toggle" data-toggle="collapse" data-parent="#slide-contact" href="#basic-details" style="display: block;">
<spring:message code="contact.accordion-toggle"  />   </a>
</h4>
</div>
<div id="basic-details" class="panel-collapse collapse in">
<div class="panel-body">

<div class="container">
<div class="row">
	<div class="col-md-6">
		<spring:message code="contact.address"  />: <br>
		 <spring:message code="contact.contact-street1"  /><br>
		 <spring:message code="contact.contact-street2"  /> 
		 <spring:message code="contact.contact-street3"  /> <br>
		  <spring:message code="contact.contact-street4"  />
	</div>
	<div class="col-md-6" style="padding-left: 30px;">
			<div class="row">
				<div class="col-md-12">
				<spring:message code="contact.email"  />:<br>
				<span id="cloakca1209a5eb7861c0bbc38a4ac8d57a39"><a href="mailto:email@email.com"><spring:message code="contact.emailAddress"  /></a></span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				 <spring:message code="contact.phone"  />: <br>
				 <spring:message code="contact.phoneNo"  /> 
				</div>
			</div>
	</div>
</div>
</div>

</div>
</div>
</div>







<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a class="accordion-toggle" data-toggle="collapse" data-parent="#slide-contact" href="#basic-details" style="display: block;">
<spring:message code="contact.accordion-toggle1"  />   </a>
</h4>
</div>
<div id="basic-details" class="panel-collapse collapse in">
<div class="panel-body">
<div class="container">
<div class="row">
	<div class="col-md-6">
		<spring:message code="contact.address1"  />: <br>
		 <spring:message code="contact.contact-street5"  /><br>
		 <spring:message code="contact.contact-street6"  /> <br>
		 <spring:message code="contact.contact-street7"  /> 
		  <spring:message code="contact.contact-street9"  /><br>
		  <spring:message code="contact.contact-street8"  />
	</div>
	<div class="col-md-6" style="padding-left: 30px;">
			<div class="row">
				<div class="col-md-12">
				<spring:message code="contact.email"  />:<br>
				<span id="cloakca1209a5eb7861c0bbc38a4ac8d57a39"><a href="mailto:email@email.com"><spring:message code="contact.emailAddress"  /></a></span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				 <spring:message code="contact.phone1"  />: <br>
				 <spring:message code="contact.phoneNo1"  /> 
				</div>
			</div>
	</div>
</div>
</div>

</div>
</div>
</div>





<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a class="accordion-toggle" data-toggle="collapse" data-parent="#slide-contact" href="#display-form" style="display: block;">
<spring:message code="contact.panel-title"  /></a>
</h4>
</div>
<div id="display-form" class="panel-collapse collapse">
<div class="panel-body">
<div class="contact-form">
<form:form action="saveComplaint?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="complaint" commandName="complaint" class="form-horizontal">
 
<input type="hidden" id="uname" value=""> 

	   <div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="title"><spring:message code="contact.form.li1"  /></label>
				<form:errors style="color: red"  path='title' />		
				<div class="col-md-6">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="text" path="title" id="title" class="form-control" />
				  </div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="name"><spring:message code="contact.form.li2"  /></label>
				<form:errors style="color: red"  path='name' />	
				<div class="col-md-6">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="text" name="name" path="name" id="name" class="form-control" />				
				  </div>
				</div> 
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="phone"><spring:message code="contact.form.li3"  /></label>
				
				<form:errors style="color: red"  path='phone' />				
				<div class="col-md-6">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="text" path="phone" id="phone" class="form-control"  />	
				  </div>
				</div>
			</div>      
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="email"><spring:message code="contact.form.li4"  /></label>
				<form:errors style="color: red"  path='email' />	
				<div class="col-md-6">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="email" path="email" id="email" class="form-control" />				
				  </div>
				</div>
			</div>
		</div>

		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="subject"><spring:message code="contact.form.li5"  /></label>
				<form:errors style="color: red"  path='subject' />			
				<div class="col-md-6">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:select path="subject" id="subject" name="subject">
						<option value="" selected="selected"><spring:message code="contact.form.select.option1"  /></option>
						<option value="solved"><spring:message code="contact.form.select.option2"  /></option>
						<option value="pending"><spring:message code="contact.form.select.option3"  /></option>
						<option value="delayed"><spring:message code="contact.form.select.option4"  /></option>
					</form:select>  
				  </div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="description"><spring:message code="contact.form.li6"  /></label>
				<form:errors style="color: red"  path='description' />	
				<div class="col-md-6">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:textarea path="description" id="description" class="form-control"/>	
				  </div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="description"><spring:message code="contact.form.li7"  /></label>
				<span style="color: red" id="answerError"></span>
				<div class="col-md-6">
				  <img id="captcha" src="simpleCaptcha.jpg" width="200" height="30">
				  <input type="button" value="Refresh" onclick="showRecaptcha()" class="btn btn-success btn-xs">
				  <div class="input-group">
						<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
						<input type="text" name="answer"  id="answer" class="form-control" required="required"/>
				  </div>
				</div>
			</div>
		</div>
		<input type="hidden" name="returnAnswer" id="returnAnswer">
		
		     <div class="row">
		          <div class="col-md-4"></div>
                  <div class="form-actions floatRight"><!--   -->
					 <input type="submit" value="<spring:message code="contact.form.submit"  />" onclick="return save()"   class="btn btn-success btn-flat margin">
				 	
				  </div>
              </div> 
        </form:form>
</div>
</div>
</div>
</div>



<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a class="accordion-toggle" data-toggle="collapse" data-parent="#slide-contact" href="#display-misc" style="display: block;">
<spring:message code="contact.jicons-text"  /> </a>
</h4>
</div>
<div id="display-misc" class="panel-collapse collapse">
<div class="panel-body">
<div class="contact-miscinfo">
<dl class="dl-horizontal">
 <dt>
<span class="jicons-text">
<spring:message code="contact.jicons-text"  /> </span>
</dt>
<dd>
<span class="contact-misc">
<p><spring:message code="contact.contact-misc"  /></p> </span>
</dd>
</dl>
</div>
</div>
</div>
</div>

</div>





</div>
</div>
</div>


<div class="t3-sidebar t3-sidebar-right col-xs-12 col-sm-4 col-md-4 col-lg-3">
<div class="t3-module module " id="Mod226"><div class="module-inner"><h3 class="module-title " style="padding: 10px 10px;"><span><spring:message code="contact.map"  /></span></h3>
<div class="heading-underline" style="width: 55px; margin-left: 10px;">
                        <div class="left"></div><div class="right"></div>
                      </div>
   <div class="map">
   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.237464435184!2d73.81057641489343!3d18.56332998738408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x48967284fcf3bf86!2sPune+Metropolitan+Regional+Development+Authority!5e0!3m2!1sen!2sus!4v1510252824711" width="400" height="250" frameborder="0" style="border:0" allowfullscreen="allowfullscreen"></iframe>
   </div>
</div>

</div>
</div>

</div> --%>

</div>

         <footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>