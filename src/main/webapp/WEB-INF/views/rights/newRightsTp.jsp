<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Registration Form</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	
	<a href="<c:url value="/logout" />">Logout</a> 
	
 	<div class="form-container">
 	
 	<h1>New Right Registration Form</h1>
 	
	<form:form method="POST" modelAttribute="rights" class="form-horizontal">

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="firstName">Enter Right</label>
				<div class="col-md-7">
					<form:input type="text" path="right_type" id="right_type" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="right_type" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="lastName">Description</label>
				<div class="col-md-7">
					<form:textarea path="description" id="description" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="description" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-actions floatRight">
				<input type="submit" value="Save" class="btn btn-primary btn-sm"><%--  or <a href="<c:url value='/admin' />">Cancel</a> --%>
			</div>
		</div>
	</form:form>
	</div>
</body>
</html>