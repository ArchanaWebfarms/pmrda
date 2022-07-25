<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>;url=login?timeout"/>
  <title>PMRDA</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="resources/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="resources/plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="resources/plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="resources/plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="resources/plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="resources/plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="resources/dist/css/skins/_all-skins.min.css">
  <script src="resources/js/user.js"></script>
<!-- jQuery 2.2.3 -->
<script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<jsp:include page="../includes/header.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> User Registration Form  <small>Preview</small> </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="userList">User List</a></li>
        <li class="active">New User</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form action="EditUser" modelAttribute="userDto" class="form-horizontal" onsubmit="return myFunction()">
	<!-- Default box -->
  	 <div class="box-body">
  	
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Basic Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <!--   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
          </div>
        </div>
        
        <form:hidden path="user_id" id="user_id"  class="form-control"/>
        <%-- <form:hidden path="created_by" id="created_by"  class="form-control"/>
        <form:hidden path="created_date" id="created_date"  class="form-control"/> --%>
        
         <!-- /.box-header -->
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>
		  <div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3  control-lable" for="firstName">First Name</label>
				<span style="color: red" id="firstNameError"></span>
				<div class="col-md-7">
					<form:input type="text" path="firstName" id="firstName" class="form-control"/>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="lastName">Last Name</label>
				<span style="color: red" id="lastNameError"></span>
				<div class="col-md-7">
					<form:input type="text" path="lastName" id="lastName" class="form-control"/>
				</div>
			</div>
		</div>


		<input type="hidden" id="uname" value="">

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="username">User Name</label>
				<span style="color: red" id="usernameError"></span>
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<form:input type="text" path="username" onkeyup="checkname();" id="username" class="form-control"/>
					</div>
				</div>
			</div>
		</div>
		
		 <div class="row" id="pass">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="password">Password</label>
				
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<form:input type="password" path="password" id="password" class="form-control"  readonly="true"/><!-- onkeyup = "CheckPasswordStrength(this.value)" --> 
					</div>
				</div><ul><form:errors style="color: red" path="password" id="password"/></ul>
			</div>
		</div> 

      </div>
      </div>
      </div>
      <!-- /.box -->           
      
      
       <div class="box-body">
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Contact Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <!--   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
          </div>
        </div>
        
         <!-- /.box-header -->
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>		
		  		
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="email">Email</label>
					<span style="color: red" id="emailError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
						<form:input type="text" path="email" id="email" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>	  		
		  		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="address">Address</label>
				<span style="color: red" id="addressError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:input type="text" path="address" id="address" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>	  
		
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="mobileNumber">Mobile Number</label>
					<span style="color: red" id="mobileNumberError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-phone"></i></span>
						<form:input type="text" path="mobileNumber" id="mobileNumber" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>	  
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="contactNummber">Contact Nummber</label>
				<span style="color: red" id="contactNummberError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-phone"></i></span>
						<form:input type="text" path="contactNummber" id="contactNummber" class="form-control"/>
					 </div>
				</div>
			</div>
		</div>	    		
		  		  		  
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="userProfiles">Roles</label>
					<span style="color: red" id="roleIDError"></span>
				<div class="col-md-7">
					<form:select path="roleID.role_id" class="form-control" id="roleID">
						<c:if test="${userDto.roleID.role_id >'0'}"><option selected="selected" value="${userDto.roleID.role_id}">${userDto.roleID.role_type}</option></c:if>	
						<c:if test="${userDto.roleID.role_id==''}"><option selected="selected" value="0">Select Role</option></c:if>				
						<c:forEach var="roles" items="${roles}">
							<option value="${roles.role_id}">${roles.role_type}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
		</div>
		
	          <div class="box-footer">
                  <div class="form-actions floatRight">
					 <input type="submit" value="Save" onclick="return myFunction()" class="btn btn-primary btn-flat margin"><%--  or <a href="<c:url value='/admin' />">Cancel</a> --%>
				 	 <input type="button" value="Cancel" onclick="location.href='userList'" class="btn btn-success">
				  	 <input type="reset" value="Reset"  class="btn">
				  </div>
              </div> 
           </div>  
       
      </div>
      
      </div>
      <!-- /.box -->
     
      
     </form:form>   
      </div>
	</section>		
	</div>
	<jsp:include page="../includes/footer.jsp" />
</div>




<!-- Bootstrap 3.3.6 -->
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="resources/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="resources/plugins/input-mask/jquery.inputmask.js"></script>
<script src="resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="resources/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="resources/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources/dist/js/demo.js"></script>
<!-- Page script -->

<script type="text/javascript">
function checkname(){
	var user_id=document.getElementById("user_id").value;
	 var username=document.getElementById("username").value;
	 if(username){
		 $.ajax({
				url:"checkEditedUsername?username="+username+"&user_id="+user_id,
				success:function(response){	
					$("#uname").val("");
					if(response.username != null){
						//alert(response.username);
						$("#uname").val(response.username);
						return false;
					}return true;
				}
			});
	  }else{
		  $("#uname").val("");
			return false; 
	 }
	}

		function myFunction(){
			if(validateEditUser()){
				  var value=document.getElementById("uname").value;
				  if(value===""){
				        document.getElementById("usernameError").innerHTML="";
				        return true;
				    }
				    else{
				        document.getElementById("usernameError").innerHTML="Username should be unique";
				        document.getElementById("username").focus();
				        return false;
				    }
			}else{
				return false;
			}
		}
	</script>

</body>
</html>