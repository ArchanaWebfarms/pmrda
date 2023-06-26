<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="nl.captcha.Captcha"%> --%>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login page</title>
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
		<style>
       #password{
           -webkit-text-security:disc;
       }
   </style>
	</head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<h2 style="color:white; text-align:center; margin-top:20px;">Admin Login</h2>
			<div class="login-container" style="margin-top:10px;">
				<div class="login-card">
					<div class="login-form">
						<%-- <c:url var="loginUrl" value="/login" />
						<form action="${loginUrl}" method="post" class="form-horizontal"> --%>
						<%-- <form  action="<c:url value='/j_spring_security_check' />" method='POST' class="form-horizontal"> --%>
						<form  action="j_spring_security_check?${_csrf.parameterName}=${_csrf.token}" method='POST' class="form-horizontal" autocomplete="off">  <!--  method='POST' -->
							<c:choose>
							<c:when test="${param.error != null}">
								<div class="alert alert-danger">
									<p align="center">Invalid username OR password.</p>
								</div>
							</c:when>
							<c:when test="${param.timeout != null}">
							<div class="alert alert-danger">
									<p align="center">You are Time Out.</p>
								</div>
							</c:when>
							<c:when test="${param.logout != null}">
								<div class="alert alert-success">
									<p align="center">You have been logged out successfully.</p>
								</div>
							</c:when>
							<c:when test="${param.captchaError != null}">
								<div class="alert alert-danger">
									<p align="center">Captcha Verification Failed.</p>
								</div>
							</c:when>
							<c:when test="${param.errorMessage != null}">
								<div class="alert alert-success">
									<p align="center">=The session is expired due to another user logging in with your user name and password.</p>
								</div>
							</c:when>
							<c:when test="${param.LoginAtteptError != null}">
								<div class="alert alert-danger">
									<p align="center"><%=session.getAttribute("LoginAtteptError") %></p>
								</div>
							</c:when>
												
							</c:choose>
							
							<div class="input-group input-sm">
								<label class="input-group-addon" for="username"><i class="fa fa-user"></i></label>
								<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" autocomplete="off" required>
							</div>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="password"><i class="fa fa-lock"></i></label> 
								<input type="text" class="form-control" id="password" name="password" placeholder="Enter Password"  autocomplete="off" required>
							</div>
							
							<!-- <div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" style="margin-top:20px;" for="description">Word Verification</label>
									<span style="color: red" id="answerError"></span>
									<div class="col-md-9">
									  <img id="captcha" src="simpleCaptcha.jpg" width="160" height="30">
									  <input type="button" value="Refresh" onclick="showRecaptcha()" class="btn btn-success btn-xs">
									  <div class="input-group" style="margin-top:5px;">
											<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
											<input type="text" name="answer"  id="answer" class="form-control"/>
									  </div>
									</div>
								</div>
							</div> -->
							<div class="row">
								<div class="form-group col-md-12">
								
									<label class="col-md-3 control-lable" style="margin-top:20px;" for="description">Word Verification</label>
									<span style="color: red" id="answerError"></span>
									<div class="col-md-9">
									<%--  <input id="captchaCode" type="text" name="captchaCode"  value="${basicExample.captchaCode}"/> --%>
									  <botDetect:captcha id="exampleCaptcha" userInputID="captchaCode" codeStyle="ALPHANUMERIC" />
									  <div class="input-group" style="margin-top:5px;">
											<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
											<input type="text" name="captchaCode"  id="captchaCode" class="form-control"/>
									  </div>
									</div>
								</div>
							</div>
							<input type="hidden" name="returnAnswer" id="returnAnswer">
								
							<div class="form-actions">
								<input type="submit" class="btn btn-block btn-primary btn-default" value="Log in">
							</div>
							<div class="row">
								<div class="col-md-12" style="text-align:center; padding:15px;">
									<a style="padding:10px;" href="forgotPass">Forgot Password?Click Here</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
<script>
/* 	function showRecaptcha(){
		 $('#captcha').attr('src', 'simpleCaptcha.jpg');
	} */
      
</script>
<script type="text/javascript">



</script>		
		
			
<script type="text/javascript"> 
if (!!window.performance && window.performance.navigation.type === 2) {
    //value 2 means "The page was accessed by navigating into the history"
    console.log('Reloading');
   // $('#captcha').attr('src', 'simpleCaptcha.jpg');
    window.location.reload(); // reload whole page
}
    </script>   	
	</body>
</html>