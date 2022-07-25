<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
  %>
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
  <script src="resources/js/password.js"></script>
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
      <h1> Change Password Form   </h1>
   
      <ol class="breadcrumb">
       <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="userList">User List</a></li>
        <li class="active">Change Password</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form  action="updatepassword" class="form-horizontal" method="post">
	 <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}" />
	<!-- Default box -->
  	 <div class="box-body">
  	
  	
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <!-- <h3 class="box-title">Basic Information</h3> -->
           <div>
     <h4 id = "p"></h4>
    </div>
    <script>
    var msg= $("#msg").val();
    $("#p").text("<%=session.getAttribute("msg")%>");
    </script>
    <input type="hidden" name="msg" id="msg" value="<%=session.getAttribute("msg")%>"> 
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <!--   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
          </div>
        </div>
        <div class="box-body">
        <input type="hidden" name="user_id" id="user_id" value="${userID}"  class="form-control"/>
        
		<div class="row" id="pass">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="password">Old Password</label>
					<span style="color: red" id="oldPasswordError"></span> 
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" name="oldPassword" id="oldPassword" class="form-control" onkeyup="CheckOldPassword()"/>
					</div>
				</div>
			</div>
		</div>
		
<input type="hidden" name="action" id="action" value="<%=session.getAttribute("action")%>">
		<div class="row" id="pass">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="password">New Password</label>
					<span style="color: red" id="newPasswordError"></span>
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" name="newPassword" id="newPassword" class="form-control" onkeyup = "PasswordPolicy()"/>
					</div>
					<div class="has-error">
						<%-- <form:errors path="password" class="help-inline"/> --%>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" id="conPass">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="conPassword">Confirm New Password</label>
				<span style="color: red" id="conPasswordError"></span> 
			
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" name="conPassword" id="conPassword" class="form-control"/>					
					</div>
				</div>
			</div>
		</div>

			<div class="box-footer">
                  <div class="form-actions floatRight">
                  <input type="submit" value="Update"  class="btn btn-primary btn-flat margin" onclick="return foo();">
				  	 <input type="button" value="Cancel" onclick="location.href='userList'" class="btn btn-success">
				  	 <input type="reset" value="Reset"  class="btn">
				  </div>
              </div> 
         
         </div>    
      </div>
      </div>
     </form>   
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



   
<script>
function CheckOldPassword(){
	var oldPassword = $("#oldPassword").val();
	document.getElementById("oldPasswordError").innerHTML="password not matched";
	 var user_id = document.getElementById("user_id").value;
	 var departments = "CheckOldPassword";
	 $.ajax({
			url:"CheckOldPassword?oldPassword="+oldPassword+"&user_id="+user_id,
			success:function(response){
				if(response=="Sucess"){
				//	alert(response);
					document.getElementById("oldPasswordError").innerHTML="password matched";
					document.getElementById("oldPasswordError").style.color = "green";
			     return true;
				}
				
				},
			error:function(response){
				document.getElementById("oldPasswordError").innerHTML="*";
				 return false;
				//alert("error");
				
	        }
		}); 
};

function PasswordPolicy(){
	var newPassword = $("#newPassword").val();
	document.getElementById("newPasswordError").innerHTML="*";
	document.getElementById("newPasswordError").style.color = "red";
	
	 $.ajax({
			url:"PasswordPolicy?newPassword="+newPassword,
			success:function(response){
			if(response=="Sucess"){
					document.getElementById("newPasswordError").innerHTML="password matches the policy";
					document.getElementById("newPasswordError").style.color = "green";
			     return true;
			} 
				},
			error:function(response){
				
				
				document.getElementById("newPasswordError").innerHTML="*";
				 return false;
				//alert("error");
				
	        }
		}); 
};
function foo() {
	   //alert("Submit button clicked!");
	   var oldPassword = $("#oldPassword").val();
	   var newPassword = $("#newPassword").val();
	   var conPassword = $("#conPassword").val();
	  
	   
		var newPassword = document.getElementById("newPassword").value;
		 var conPassword = document.getElementById("conPassword").value;
		 
	   var firstName =  document.getElementById("oldPasswordError").style.color;
	   var newPasswordError = document.getElementById("newPasswordError").style.color;
	
	   if(oldPassword=="" || newPassword=="" || conPassword==""){
      	 alert("please fill all fields");
         return false;
      } else if(firstName=="red"){
    	  alert("old password can not match with existing");
			return false;
	  }else if(newPasswordError=="red"){
			   alert("Password should contains at least 8 letters,one special character,upperCase,lowercase letter and one number");
			   return false;
	   } else if(oldPassword == newPassword){
			alert("old password and new password can not be same");
			return false;
		}else if(conPassword != newPassword){
				alert("Password and Confirmed password does not matched");
				return false;
		}
	 
	 
	   
	   return true;
	   
	}
</script>

</body>
</html>