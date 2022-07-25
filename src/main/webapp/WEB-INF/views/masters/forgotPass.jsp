<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="nl.captcha.Captcha"%> --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Forgot Password</title>
		<link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link>
		<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
		<script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="resources/js/login.js"></script>
		<style>
		.headerlogin{
			background:white;
		}
		</style>
	</head>
<script>
$(document).ready(function(){
    $("a[title ~= 'BotDetect']").removeAttr("style");
    $("a[title ~= 'BotDetect']").removeAttr("href");
    $("a[title ~= 'BotDetect']").css('visibility', 'hidden');

});
</script>
	<body>
	
		<div id="mainWrapper" style="padding:0px;">
		
		 <div class="headerlogin" style="padding:10px 0px;">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <a href="index" target="_blank" style="display:flex; text-decoration:none; color:black!important;">
                    <div>
                    <img src="staticResources/images/PMRDALogo1.png" alt="PMRDA LOGO" title="Pune Metropolitan Region Development Authority" width="100px">
                </div>
                <div>
                    <h3>Pune Metropolitan Region Development Authority (PMRDA)</h3>
                    <h5>Government of Maharashtra</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-3" style="text-align:center; display:flex; justify-content:center;">
                  <a href="https://www.maharashtra.gov.in/1125/Home" onClick="return confirm('This is external link, Are you sure you want to continue?')" target="_blank"><img src="staticResources/images/gov_of_Maharashtra.png" title="Government of Maharashtra" alt="Government of Maharashtra" height="70px" width="70px" style="margin-top:10px;" /></a>
                  <a href="https://www.india.gov.in/" onClick="return confirm('This is external link, Are you sure you want to continue?')" target="_blank"><img  src="staticResources/images/satyamevajayate.jpg" title="Satyamevajayate" alt="Satyameva Jayate" height="80px" width="80px" style="margin-top:5px;" /></a>
             </div>
        </div>

    </div>
</div> 
<h2 style="color:white; text-align:center; margin-top:20px;">Forgot Password</h2>
			<div class="login-container" style="margin-top:10px;">
				<div class="login-card">
					<div class="login-form">
						
						<form method='POST' class="form-horizontal" id="formData">  <!--  method='POST' -->
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="email"><i class="fa fa-envelope" aria-hidden="true"></i></label>
								<input type="text" class="form-control" id="email" name="email" placeholder="Enter Email-Id" required>
							</div><span id="emailError" style="color: red;"></span>
								<div class="row">
								<div class="form-group col-md-12">
								
									<label class="col-md-3 control-lable" style="margin-top:20px;" for="description">Word Verification</label>
									
									<div class="col-md-9">
									<%--  <input id="captchaCode" type="text" name="captchaCode"  value="${basicExample.captchaCode}"/> --%>
									  <botDetect:captcha id="emailCaptcha" userInputID="forgetEmailcaptchaCode" codeStyle="ALPHANUMERIC" />
									  <div class="input-group" style="margin-top:5px;">
											<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
											<input type="text" name="forgetEmailcaptchaCode"  id="forgetEmailcaptchaCode" class="form-control"/>
									  </div>
									</div>
								</div><span style="color: red" id="passError"></span>
							</div>
								
							<div class="form-actions" style="text-align:center; padding:10px;">								
								<input type="button" value="Send OTP"  class="btn btn-primary btn-default" onclick="save()">
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<form:form method="POST" action="otpPage" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
 <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}" />
  <input type="hidden" id="otpid" name="id" />  
  </form:form>
		
<script type="text/javascript">
$(document).ready(function(){	
	
	var token = $("input[name='_csrf']").val();
    var header = "X-CSRF-TOKEN";
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

});

function save(){
	
	
//	var email=$("#email").val();
	var formData=$("#formData").serialize();
	
	if(validateEmail(email)){
		$.ajax({
		    url : 'sendOTP', 
		    data : formData,
		    method : 'POST',
		    success : function(response){
		    	$("#emailError").empty();
		    	$("#passError").empty();
		    	$('.BDC_ReloadIcon').trigger('click'); 
		    	if(response==-1){
		    		document.getElementById("emailError").innerHTML="**Unregistered Email ID.Try another Email ID.";
		    	}else if(response>0){
		    		alert("OTP has been sent to registered email-id.")		    		
		    		window.location.href="javascript:otpPage("+response+")";
		    	}else if(response==-2){
		    		document.getElementById("passError").innerHTML="Captcha Verification Failed.";		    		   		
		    	}else{
		    		alert("Try Again.")
		    	}
		    	
		    }
	});
	}
	
}

function validateEmail(email){
	if(email==""){
		document.getElementById("emailError").innerHTML="**Required";
		return false;
	}else{
		document.getElementById("emailError").innerHTML="";
		return true;
	}
}

function otpPage(id){
	$("#otpid").val(id);
	$("#viewform").submit();
}

</script>  	
	</body>
</html>