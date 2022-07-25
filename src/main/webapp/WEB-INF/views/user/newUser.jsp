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
      <h1> User Registration Form  </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="userList">User List</a></li>
        <li class="active">New User</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <%-- <form:form action="saveUser" modelAttribute="userDto" class="form-horizontal" > --%>
	<form:form action="saveUser?${_csrf.parameterName}=${_csrf.token}" modelAttribute="userDto" class="form-horizontal" commandName="userDto">
	 
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
				<label class="col-md-3 control-lable" for="firstName">First Name</label>
				<form:errors style="color: red"  path='firstName' />				
				<div class="col-md-7">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="text" path="firstName" id="firstName" class="form-control" onkeyup="GetSpecailCharactor()" />
				  </div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="lastName">Last Name</label>
				<form:errors style="color: red"  path='lastName' />	
				<div class="col-md-7">
				  <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="text" path="lastName" id="lastName" class="form-control" onkeyup="GetSpecailCharactor()"/>					
				  </div>
				</div>
			</div>
		</div>

 <input type="hidden" id="uname" value="">

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="username">User Name</label>
				<form:errors style="color: red"  path='username' />	
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<form:input type="text" path="username" id="username"  class="form-control"/>   <!-- onkeyup="checkname();" -->
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
						<form:input type="password" path="password" id="password" class="form-control" /><!-- onkeyup = "CheckPasswordStrength(this.value)" --> 
					</div>
				</div><ul><form:errors style="color: red" path="password" id="password"/></ul>
			</div>
		</div> 
		
		<div class="row" id="conPass">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="conPassword">Re-Type Password</label>
					<form:errors style="color: red"  path='confirmPassword' />	
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						
						<form:input type="password" path="confirmPassword" id="conPassword" class="form-control" />					
					</div>
				</div>
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
				<form:errors style="color: red"  path='email' />	
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
				<form:errors style="color: red"  path='address' />
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:input type="text" path="address" id="address" class="form-control" onkeyup="GetSpecailCharactor()"/>
					 </div>	
				</div>
			</div>
		</div>	  
		
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="mobileNumber">Mobile Number</label>
					<form:errors style="color: red"  path='mobileNumber' />
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
				<form:errors style="color: red"  path='contactNummber' />
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
					<form:errors style="color: red" path='roleID'/>
				<div class="col-md-7">
					<form:select path="roleID.role_id" class="form-control" id="roleID">  <!-- required="true" -->
						<c:if test="${userDto.roleID.role_id >'0'}"><option selected="selected" value="${userDto.roleID.role_id}">${userRole}</option></c:if>	
						<c:if test="${userDto.roleID.role_id==''}"><option selected="selected" value="">Select Role</option></c:if>			
						<c:forEach var="roles" items="${roles}">
							<option value="${roles.role_id}">${roles.role_type}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
		</div> 
		
	          <div class="box-footer">
                  <div class="form-actions floatRight">
					 <input type="submit" value="Save"  class="btn btn-primary btn-flat margin"><%--  or <a href="<c:url value='/admin' />">Cancel</a>  id ="Save" onclick="return myFunction()"--%>
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
		 var username=document.getElementById("username").value;
		 if(username){
			 $.ajax({
					url:"checkUsername?username="+username,
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
		 if(validateNewUser()){
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
<script>
function GetSpecailCharactor(){
	
    var departments = "GetSpecailCharactor";
	 $.ajax({
			url:"GetSpecailCharactor?departments="+departments,
			success:function(response){
		     for(var i=0;i<response.length;i++){
					 var addressinput;
					
					
					 var validationName = document.getElementById("firstName").value;
						var validationName_h = document.getElementById("lastName").value;
						var description = document.getElementById("username").value;
						var address = document.getElementById("address").value;
					   $(".form-control").change(function() {
		              addressinput = $(this).val();
		                });
					   if(new RegExp(response[i]).test(validationName) ||    new RegExp(response[i]).test(validationName_h) || new RegExp(response[i]).test(description) || new RegExp(response[i]).test(address))
					    {
					
						   var replace =   document.activeElement.value.replace(response[i], '');
						    document.getElementById(document.activeElement.id).value=replace;
                             }
				       else{}
				          }
				          },
			error:function(response){
	        	alert("Error");
	        }
		}); 
	 
	} 
</script>
<script>
var firstName = $("#firstName").val();
var lastName = $("#lastName").val();
var username = $("#username").val();
var password = $("#password").val();
var email = $("#email").val();
var address = $("#address").val();
var mobileNumber = $("#mobileNumber").val();
var contactNummber = $("#contactNummber").val();
var roleID = $(roleID).val();
$(document).ready(function(){	
	 $("#Save").on("click", function(){
	     
if(firstName!="" && lastName!="" && username!="" && password!="" && email!="" && address!="" && mobileNumber!="" && contactNummber!="" && roleID!="")
	{
	alert("data inserted successfully");
	}
	 });
});
</script>
<script>
$('#username').on('keypress', function (event) {
    var regex = new RegExp("^[a-zA-Z0-9]+$");
    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
       event.preventDefault();
       return false;
    }
});
</script>
<script type="text/javascript">
        function CheckPasswordStrength(password) {
            var password_strength = document.getElementById("passwordError");

            //TextBox left blank.
            if (password.length == 0) {
                password_strength.innerHTML = "";
                return;
            }

            //Regular Expressions.
            var regex = new Array();
            regex.push("[A-Z]"); //Uppercase Alphabet.
            regex.push("[a-z]"); //Lowercase Alphabet.
            regex.push("[0-9]"); //Digit.
            regex.push("[$@$!%*#?&]"); //Special Character.

            var passed = 0;

            //Validate for each Regular Expression.
            for (var i = 0; i < regex.length; i++) {
                if (new RegExp(regex[i]).test(password)) {
                    passed++;
                }
            }

            //Validate for length of Password.
            if (passed > 5 && password.length <= 8) {
                passed++;
            }

            //Display status.
            var color = "";
            var strength = "";
            switch (passed) {
                case 0:
                case 1:
                    strength = "Weak";
                    color = "red";
                    break;
                case 2:
                    strength = "Good";
                    color = "darkorange";
                    break;
                case 3:
                case 4:
                    strength = "Strong";
                    color = "green";
                    break;
                case 5:
                    strength = "Very Strong";
                    color = "darkgreen";
                    break;
            }
            password_strength.innerHTML = strength;
            password_strength.style.color = color;
            
        
            
        }
        
           
       
    </script>
   
    <script>
    $("#Save").click(function(){
        var myLength = $("#password").val().length;
      //	 alert(myLength);
      	var aaa =    document.getElementById("passwordError").style.color
      	
    	 document.getElementById("passwordError").value;   // $("#passwordError").val();
          //  alert(aaa);
             if(aaa!="green" ){
            	 alert("password should contain at least 1 special character and 1 number");
                document.getElementById("passwordError").innerHTML="* Required ";
                document.getElementById("password").focus();
               return false;
            }
            else{
                document.getElementById("passwordError").innerHTML="";
                return true
            } 
        
});
    
</script>
<script>
$( document ).ready(function() {
	$("#userList").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script>
</body>
</html>