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
		 .otpbox{
		     display: flex;
    justify-content: space-between;
        width: 90%;
    margin: 10px auto;
		 }
		.otpbox input{
			width: 40px;
			height: 40px;
			padding: 0;
			margin-right: 12px;
			text-align: center;
			border: 2px solid gray;
			border-radius: 5px;
			}
			#codeBox6{
			margin:0px;
			}
			.otpbox input::-webkit-inner-spin-button, 
			 .otpbox input::-webkit-outer-spin-button { 
				-webkit-appearance: none;
				appearance: none;
				margin: 0;
			}
			 .otpbox input:focus,
			 .otpbox input.focus{
				border-color: green!important;
				outline: none;
				box-shadow: none;
			}
			.otpbox input::-webkit-outer-spin-button,
			.otpbox input::-webkit-inner-spin-button {
				  -webkit-appearance: none!important;
				  margin: 0!important;
				}
				.error{
					color:red;
				}
		</style>
		
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("a[title ~= 'BotDetect']").removeAttr("style");
    $("a[title ~= 'BotDetect']").removeAttr("href");
    $("a[title ~= 'BotDetect']").css('visibility', 'hidden');

});
</script>
	</head>

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
<div id="otpHead">
<h2 style="color:white; text-align:center; margin-top:20px;">Confirm OTP</h2>
</div>
<div id="passHead" style="display: none;">
<h2 style="color:white; text-align:center; margin-top:20px;">Change Password</h2>
</div>
			<div class="login-container" style="margin-top:10px;">
				<div class="login-card">
					<div class="login-form">
						
						<form:form id="formData" modelAttribute="changePassword"  method='POST' class="form-horizontal">  <!--  method='POST' -->
							<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}" />
							<input type="hidden" value="${id}" name="id" id="id">
							<input type="hidden" value="${status}"  id="status">
							<div id="OtpDiv">
							<div class="otpmsg" style="padding:5px; text-align:center;">
							<h4><span id="otpError"  style="color: red;"></span></h4>
								<span>Enter the 6 digit OTP</span>
							</div>
							<div class="otpbox">
								<input id="codeBox1" type="number" maxlength="1" onkeyup="onKeyUpEvent(1, event)" onfocus="onFocusEvent(1)">
								<input id="codeBox2" type="number" maxlength="1" onkeyup="onKeyUpEvent(2, event)" onfocus="onFocusEvent(2)">
								<input id="codeBox3" type="number" maxlength="1" onkeyup="onKeyUpEvent(3, event)" onfocus="onFocusEvent(3)">
								<input id="codeBox4" type="number" maxlength="1" onkeyup="onKeyUpEvent(4, event)" onfocus="onFocusEvent(4)">
								<input id="codeBox5" type="number" maxlength="1" onkeyup="onKeyUpEvent(5, event)" onfocus="onFocusEvent(5)">
								<input id="codeBox6" type="number" maxlength="1" onkeyup="onKeyUpEvent(6, event)" onfocus="onFocusEvent(6)">
							</div>
							</div>
							
							<div id="hideDiv" style="display: none;">
							<div class="otpmsg" style="padding:5px; text-align:center;">
							<h4><span id="passError"  style="color: red;"></span></h4>
							</div>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="newPass"><i class="fa fa-lock"></i></label> 
								<input type="password" class="form-control" id="newPass" name="newPass" placeholder="Enter New Password" required>
							</div><span id="pError"  style="color: red;"></span>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="confPass"><i class="fa fa-lock"></i></label> 
								<input type="password" class="form-control" id="confPass" name="confPass" placeholder="Confirm New Password" required>
							</div><span id="cpError"  style="color: red;"></span>
							
							<div class="row">
								<div class="input-group input-sm">								
									<label class="col-md-3 control-lable" style="margin-top:20px;" for="description">Word Verification</label>
									<span style="color: red" id="answerError"></span>
									<div class="col-md-9">
									<%--  <input id="captchaCode" type="text" name="captchaCode"  value="${basicExample.captchaCode}"/> --%>
									  <botDetect:captcha id="passwordCaptcha" userInputID="passCaptchaCode" codeStyle="ALPHANUMERIC" />
									  <div class="input-group" style="margin-top:5px;">
											<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
											<input type="text" name="passCaptchaCode"  id="passCaptchaCode" class="form-control"/>
									  </div>
									</div>
								</div>
							</div>
								</div>
							<div class="form-actions" style="text-align:center; padding:10px;" id="verifyDiv">
							 <input type="button" onclick="save()" class="btn btn-block btn-primary btn-default" value="Verify"> 
							</div>
							<div class="form-actions" style="text-align:center; padding:10px;display: none;" id="saveDiv">
							 <input type="button" onclick="changePassword()" class="btn btn-block btn-primary btn-default" value="Change Password"> 
							</div>
							<div class="row" id="resendDiv">
								<div class="col-md-12" style="text-align:center; padding:15px;" >
									<a style="padding:10px; color:black;" href="javascript:resendOtp(${id})">Didn't receive OTP? <strong style="color: #2565a6;"> RESEND OTP</strong></a>
								</div>								
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		
	<form:form  action="resendOtp" method="POST" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="otpid" name="id" />  
 <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}" />
  </form:form>
  
<script type="text/javascript"> 
$(document).ready(function(){	
	
	var token = $("input[name='_csrf']").val();
    var header = "X-CSRF-TOKEN";
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

});

function resendOtp(id){
	$("#otpid").val(id);
	$("#viewform").submit();
}

$(function() {
	var status=$("#status").val();
	
	if(status=="resend"){
		alert("OTP re-sends successfully to your registered email ID.")
		$("#status").val("");
	}
});

function save(){
	var otp1=$("#codeBox1").val();
	var otp2=$("#codeBox2").val();
	var otp3=$("#codeBox3").val();
	var otp4=$("#codeBox4").val();
	var otp5=$("#codeBox5").val();
	var otp6=$("#codeBox6").val();
	var otp=otp1+otp2+otp3+otp4+otp5+otp6;
	var id=$("#id").val();	
	
		 $.ajax({
		    url : 'verifyOTP?otp='+otp+'&id='+id,
		   // data:objFormData,
		    method : 'POST',		
		    success : function(response){
		    	if(response==1){
		    		document.getElementById("otpError").innerHTML="Invalid OTP";
		    		$("#codeBox1").val(" ");
		    		$("#codeBox2").val(" ");
		    		$("#codeBox3").val(" ");
		    		$("#codeBox4").val(" ");
		    		$("#codeBox5").val(" ");
		    		$("#codeBox6").val(" ");
		    	}else{
		    		$("#hideDiv").show();
		    		$("#saveDiv").show();
		    		$("#passHead").show();
		    		$("#OtpDiv").remove();
		    		$("#resendDiv").remove();
		    		$("#verifyDiv").remove();
		    		$("#otpHead").remove();
		    	}
		    	
		    }
	}); 
	
	
}

var clicks = 0;
function changePassword(){
	 clicks += 1;//alert(clicks)   	 
	 if(clicks>1){
		resetErrors();
		changePassword1();
  }
  else{   	 
	  changePassword1();
	}
}

function resetErrors() {
	 $('form input').removeClass('error');
	 $('span.error').remove();
	 }

function changePassword1(){
	var password=$("#newPass").val();
	var conpassword=$("#confPass").val();
	var id=$("#id").val();
		
	
		var formData=$("#formData").serialize();
		
	  $.ajax({
		    url : 'changeForgotPassword',
		    method : 'POST',		
		    data : formData,
		    success : function(response){
		    	document.getElementById("passError").innerHTML="";
		    	if(response.status=="FAIL"){
		    		$.each(response.errorMessages,function(key,value){
		  	            $('input[name='+key+']').after('<span class="error">'+value+'</span>');   			  	          	
		              });	
		    		$('.BDC_ReloadIcon').trigger('click');
		    	}else if(response.status=="FieldUnmatch"){
		    		document.getElementById("passError").innerHTML="Password and Confirm Password must be same.";
		    		$('.BDC_ReloadIcon').trigger('click');
		    	}else if(response.status=="captchaError"){
		    		document.getElementById("passError").innerHTML="Captcha Verification Failed.";
		    		$('.BDC_ReloadIcon').trigger('click');
		    	}else if(response.status==="SUCCESS"){
		    		alert("Password Changed Successfully.");
			    	window.location.href="login";
		    	}else{
		    		alert("Something went wrong.Try again.");
		    		$('.BDC_ReloadIcon').trigger('click');
		    	}
		    	
		    }
	 }); 
	/* }
  } */
}

function validateP(password){
	if(password==""){
		document.getElementById("pError").innerHTML="**Required";		
		return false;
	}else{
		document.getElementById("pError").innerHTML=" ";
		return true;
	}
}

function validateCP(password){
	if(password==""){
		document.getElementById("cpError").innerHTML="**Required";
		return false;
	}else{
		document.getElementById("cpError").innerHTML=" ";
		return true;
	}
}


function validatePassword(password,conpassword){
	var pattern=/^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
	
	if(pattern.test(password)){
		if(matchPassword(password,conpassword)){
			document.getElementById("passError").innerHTML=" ";
			return true;
		}else{			
			return false;
		}
	}else{
		document.getElementById("passError").innerHTML="Password must have atleast 1 capital letter,1 number, 1 special letter and length should be 8 or greater. ";
		return false;
	}
}


function matchPassword(password,conpassword){
	if(password!=conpassword){
		document.getElementById("passError").innerHTML="Password and Confirm Password must be same.";
		return false;
	}else{
		document.getElementById("passError").innerHTML=" ";
		return true;
	}
} 
    </script>   
    <script>
    function getCodeBoxElement(index) {
    	  return document.getElementById('codeBox' + index);
    	}
    	function onKeyUpEvent(index, event) {
    	  const eventCode = event.which || event.keyCode;
    	  if (getCodeBoxElement(index).value.length === 1) {
    		 if (index !== 6) {
    			getCodeBoxElement(index+ 1).focus();
    		 } else {
    			getCodeBoxElement(index).blur();
    			// Submit code
    			console.log('submit code ');
    		 }
    	  }
    	  if (eventCode === 8 && index !== 1) {
    		 getCodeBoxElement(index - 1).focus();
    	  }
    	}
    	function onFocusEvent(index) {
    	  for (item = 1; item < index; item++) {
    		 const currentElement = getCodeBoxElement(item);
    		 if (!currentElement.value) {
    			  currentElement.focus();
    			  break;
    		 }
    	  }
    	}
    </script>	
	</body>
</html>