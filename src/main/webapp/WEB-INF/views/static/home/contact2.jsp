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
   
   .contact-form input{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 90%!important;
   	        margin:auto;
   	            border: none!important;
    border-bottom: 1px solid #d0d0d0!important;
    background: none!important;
   }
   .contact-form select{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 90%!important;
   	        margin:auto;
   	            border: none!important;
    border-bottom:  1px solid #d0d0d0!important;
    background: none!important;
   }
   .contact-form textarea{
   	height:45px!important;
   	    width: 100%!important;
   	        width: 95%!important;
   	        margin:auto;
   	            border: none!important;
    border-bottom:  1px solid #d0d0d0!important;
    background: none!important;
   }
   
   .contact-form input[type=text]:focus{
   	-webkit-box-shadow: none;
   	border-bottom: 2px solid #0172bb!important;
   }
   .contact-form input[type=email]:focus{
   	-webkit-box-shadow: none;
   	border-bottom: 2px solid #0172bb!important;
   }
   .contact-form select:focus{
   	-webkit-box-shadow: none;
   	border-bottom: 2px solid #0172bb!important;
   }
   .contact-form textarea:focus{
   	-webkit-box-shadow: none;
   	border-bottom: 2px solid #0172bb!important;
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
    position: relative;
    top: -125px;
   }
   .contactarea{
   	    position: relative;
    top: -120px;
   }
   .conmerge{
   	 height: 515px;
    margin-top: 150px;
   }
   
   }
   .conmerge{
    background: whitesmoke;
   }
   .card{
        
            min-height: 362px;
    }
    
    .maincontacthead{
    	text-align:center;
    	    background: #004f50;
    color: white;
            padding: 0px 225px 20px;
    }
    
    .maincontacthead h4{
    	color: white;
    }
    .maincontacthead label{
    	color: white;
    	padding:0px;
    	margin:0px;
    }
    .maincontacthead i{
    	    border: 1px solid white;
    font-size: 30px;
    padding: 10px 15px;
    background: hsla(0, 0%, 100%, 0.61);
    border-radius: 50%;
        margin-bottom: 10px;
    }
     .maincontacthead p{
    	      margin: 0 0 10px;
    }
    
    .othdet{
    	padding: 45px 10px;
    background: aliceblue;
        margin-top: 40px;
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
         
         
         <div class="row" style="    background: #004f50;">
         <div class="col-md-12">
         		<h1 style="text-align:center; color:white; padding:20px;margin:0px;">GET IN TOUCH WITH US</h1>
         	</div>
         </div>
         	<div class="row maincontacthead" style="text-align:center;">
         	
         	
         	<div class="col-md-4">
         	<i class="fas fa-phone"></i>
         	<h4>PHONE</h4>
         	<label><b>Aundh</b></label>
         	<p>020 259 333 44</p>
         	<label><b>Akurdi</b></label>
         	<p>020 276 598 55</p>
         	</div>
         	
         	<div class="col-md-4">
         	<i class="fas fa-map-marker-alt"></i>
         	<h4>ADDRESS</h4>
         	<label><b>Aundh</b></label>
         	<p>Survey No. 152-153,
Maharaja Sayaji Gaikwad Udyog Bhavan, Aundh, Pune,
411067</p>
<label><b>Akurdi</b></label>
         	<p>3rd Floor, PCNTDA
New Administrative Building
Near Akurdi Railway Station Akurdi, Pune
411044</p>
         	</div>
         	
         	<div class="col-md-4">
         	<i class="far fa-envelope"></i>
         	<h4>EMAIL</h4>
         	<label><b>Aundh</b></label>
         	<p>comm@pmrda.gov.in</p>
         	<label><b>Akurdi</b></label>
         	<p>comm@pmrda.gov.in</p>
         	</div>
         </div>
         
         <section class="formninfo">
         	<div class="container">
         		<div class="row">
         		<div class="col-md-3">
         		<div class="othdet">
         			<h4>Other Contact Details</h4>
         		<ul>
         			<li><a href="#">Contact List of all Employees</a></li>
         			<li>Office hours: 10am to 6pm</li>
         			<li>Weekly Off: 2nd and 4th Saturday and Sunday</li>
         		</ul>
         		</div>
         		



         		</div>
         		<div class="col-md-9">
         			<div class="t3-module module " id="Mod226" style="width:100%;"><div class="module-inner">

                      
  <div class="panel-body">
  <h3 style="padding-left: 30px; color: #004f50;">Message Us</h3>
<div class="contact-form">
<form:form action="saveComplaint?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="complaint" commandName="complaint" class="form-horizontal">
 
<input type="hidden" id="uname" value=""> 

	   <div class="row" style="margin-bottom:10px;">
			
			
				<%-- <label class="col-md-2 control-lable" for="title"><spring:message code="contact.form.li1"  /> :</label>
				<form:errors style="color: red"  path='title' />		 --%>
				<div class="col-sm-6">
				
				<form:input type="text" path="title" id="title" class="form-control" placeholder="Enter Title Here"/>
				
				</div>
				
				<form:errors style="color: red"  path='name' />	
				<div class="col-sm-6">
				  
					
					<form:input type="text" name="name" path="name" id="name" class="form-control" placeholder="Enter Your Name Here" />				
			
				</div> 
			
		</div>

	<div class="row" style="margin-bottom:10px;">
				
				<form:errors style="color: red"  path='phone' />				
				<div class="col-sm-6">
				  
					
					<form:input type="text" path="phone" id="phone" class="form-control" placeholder="Enter Your Contact No. Here" />	
				  
				</div>
				
				<form:errors style="color: red"  path='email' />	
				<div class="col-sm-6">
				
					
					<form:input type="email" path="email" id="email" class="form-control" placeholder="Enter Your Email Here" />				
				 
				</div>
			     
		</div>

	
		<div class="row" style="margin-bottom:10px;">
			
				<form:errors style="color: red"  path='subject' />			
				<div class="col-sm-6">
					<form:select path="subject" id="subject" name="subject" style="width: 100%;" placeholder="Select Subject Here">
						<option value="" selected="selected"><spring:message code="contact.form.select.option1"  /></option>
						<option value="solved"><spring:message code="contact.form.select.option2"  /></option>
						<option value="pending"><spring:message code="contact.form.select.option3"  /></option>
						<option value="delayed"><spring:message code="contact.form.select.option4"  /></option>
					</form:select>  
				
				</div>
		
				
				<form:errors style="color: red"  path='description' />	
				<div class="col-sm-6">
				 <div class="row" style="    width: 90%;    margin: auto;">
					<div class="col-sm-5">
						<img id="captcha" src="simpleCaptcha.jpg" width="100%" height="45" style="    margin-bottom: 10px;">
					</div>
					<div class="col-sm-1">
						<button type="button" onclick="showRecaptcha()" class="btn btn-success btn-xs" style="margin-bottom: 10px; height:45px; padding:5px;"><i style="font-size:20px;" class="fas fa-sync-alt"></i></button>
					</div>
					
					<div class="col-sm-6">
						<input type="text" name="answer"  id="answer" class="form-control" required="required" placeholder="Please Enter Captcha Here" style="width:100%!important;"/>
					</div>
					</div>
				</div>
		</div>

	<div class="row" style="margin-bottom:20px;">
			
				<span style="color: red" id="answerError"></span>
				<div class="col-sm-12">
				<form:textarea path="description" id="description" class="form-control" placeholder="Your Message Here"/>	
				</div>
			</div>
		</div>
		
		<input type="hidden" name="returnAnswer" id="returnAnswer">
			<div class="row">
		          <div class="col-md-12">
		           <div class="subbutton"><!--   -->
					 <input type="submit" value="<spring:message code="contact.form.submit"  />" onclick="return save()"   class="btn btn-sm btn-success btn-flat margin" style="width:120px;" />
				 </div>
		          </div>
              </div> 
        </form:form>
</div>
</div>
</div>
         		</div>
         		</div>
         		
         	

         	</div>
         	
         </section>
         
         <div class="row">
         	<div class="col-md-12">
         	<div class="row">
         		<div class="t3-module module " id="Mod226"><div class="module-inner">
	<div class="map">
   		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.237464435184!2d73.81057641489343!3d18.56332998738408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x48967284fcf3bf86!2sPune+Metropolitan+Regional+Development+Authority!5e0!3m2!1sen!2sus!4v1510252824711" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen="allowfullscreen" ></iframe>
    </div>
   <!--  <div class="page-header" style="border:none; margin:0px;    margin-top: 15px;">
<h4 style="margin-bottom: 0px;    text-align: center;">
<span class="contact-name" itemprop="name">How to reach to PMRDA Office</span>
</h4>
<div class="heading-underline" style="width: 250px;    margin: 10px auto 0px;">
                        <div class="left"></div><div class="right"></div>
                      </div>
</div> -->
         <div class="row" style="    background: #e54b49;">
         		<div class="col-md-12">
         			<h3 style="text-align:center; color:white; padding:10px; margin:0px;    text-decoration: underline;">How to Reach to PMRDA Office</h3>
         		</div>
         	
         		<div class="col-md-6" style="    color: white;    padding: 10px;">
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
         		<div class="col-md-6" style="    color: white;    padding: 10px;">
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
         	</div>
         	
         	
         	</div>
         	
         </div>
         
         
         </div>
         
         
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
<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
</div>

         
      </div>   
   </body>
</html>