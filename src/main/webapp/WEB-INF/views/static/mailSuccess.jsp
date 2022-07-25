<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Spring MVC Email Example</title>
	</head>
	<body> --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale" %>
<!DOCTYPE html>
<html>
	
<!--  05:45:20 GMT -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
		<!-- Meta Tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Title -->
		<title><spring:message code="allpages.title" /></title>
		<meta name="description" content="">
		
		<style type="text/css">
	    	#emailFormDiv {
	    		text-align: center;
    			padding-top: 16px;
	    	}
	    	
    		#emailFormPage {
    			text-decoration: none;
    			text-align: center;
    			cursor: pointer;
    		}
    		
    		#successMessage1 {
    			text-align: center; 
    			color: green; 
    			font-size: 25px; 
    			padding-top: 17px;
    		}
    		#successMessage2 {
    			text-align: center; 
    			font-size: 25px; 
    			padding-top: 17px;
    		}
    	</style>
		
		<%-- <jsp:include page="includes/scriptHeader.jsp" /> --%>
</head>

<body class="sticky-header-on tablet-sticky-header">
		<!-- Container -->
		<div class="container">
<%-- <jsp:include page="includes/adminHeader.jsp" />
	 --%>
	
	
	
	    <center>
	    	<h2>Email</h2>
	    </center>
	    <div id="successMessage1">
	        <strong>${messageObj1}</strong>
	    </div>
	     <div id="successMessage2">
	        <strong>${messageObj2}</strong>
	    </div>
	    <div id="emailFormDiv">
	    	<a id="emailFormPage" href="contact">Go To Complaint Page</a>
	    </div>
	    <br>
	<%-- <jsp:include page="includes/adminFooter.jsp" /> --%>

<!-- Back To Top -->
			<a href="#" id="button-to-top"><i class="icons icon-up-dir"></i></a>			
		</div>
		<!-- /Container -->		
		<%-- <jsp:include page="includes/scriptFooter.jsp" /> --%>		
	</body>

<!-- trade-notices.php 06:27:14 GMT -->
</html>