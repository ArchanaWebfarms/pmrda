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
      <h1>  User Permission Form  </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="rightDashboard">Permission Dashboard</a></li>
        <li class="active">Permission Registration</li>
       </ol>
    </section>

    <!-- Main content -->
    <section class="content">

	<!-- Default box -->
<div class="box-body">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">User Permissions</h3>
					</div>
					<!-- /.box-header -->
					
		<div class="box-body">

	<form action="setUserPermission" id="givePermission">					
			
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="roleID">Roles</label>
					<span style="color: red" id="roleIDError"></span>
				<div class="col-md-7">
					<select path="roleID" class="form-control" id="roleID"  onchange="getUserByRoleID()">
						<option selected="selected" value="0">Select Role</option>
						<c:forEach var="roles" items="${roles}">
						<c:choose>
							<c:when test="${roles.role_type eq 'SUPERADMIN'}">							
							</c:when>
							<c:when test="${roles.role_type eq 'ADMIN'}">							
							</c:when>
							<c:otherwise>
									<option value="${roles.role_id}">${roles.role_type}</option>
							</c:otherwise>
						</c:choose>
							
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
									
	   <div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="userID">Select User</label>
				<div class="col-md-7">
					<select  class="form-control" name="userID"  id="userID" onchange="getModulesByUserID()" >
						<option selected="selected" value="0">Select User</option>
						<%-- <c:forEach var="userList" items="${userList}">
							<option value="${userList.user_id}">${userList.username}</option>
						</c:forEach> --%>
					</select>
					<div class="has-error">
						<form:errors path="userID" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
				
				<div id="data1"></div> 
				
	<%-- 	 <div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="moduleType">Select Module</label>
				<div class="col-md-7">
					<select class="form-control" id="moduleType">
						<option selected="selected" value="0">Select User</option>
						<c:forEach var="moduleType" items="${moduleType}">
							<option value="${moduleType.module_type}">${moduleType.module_type}</option>
						</c:forEach>
					</select>
					<div class="has-error">
						<form:errors path="moduleType" class="help-inline"/>
					</div>
				</div>
			</div>
		</div> --%>
		
		
				 <div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="moduleType">Select Module</label>
						<div class="col-md-7" id="moduleType">
								<c:forEach var="moduleType" items="${moduleType}">
									<input type="checkbox" class="moduleType" name="moduleID" key="${moduleType.module_type}" value="${moduleType.module_id}">&ensp;&ensp;${moduleType.module_type} <br>
								</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="box-header with-border">
					<table><tr>
				    	<td>
				        	<button type="button" class="btn bg-olive btn-flat margin" onclick="display()">Display</button>
				       	</td></tr>
				    </table>
				</div>	  
				
				<div id="showPermission">
					<div class="box box-default">
					  <div class="box-header with-border">
						<h3 class="box-title">Modules Permissions</h3>
					  </div>
					</div>
					<div id="data1">
					<!-- <div class="box-tools pull-right">
			            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
			            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
			        </div> -->
					</div> 
				</div>	
				
				<div id="data"></div> 
				
				<div class="box-header with-border">
					<table><tr>
				    	<td>
				        	<button type="submit" id="submitForm" class="btn bg-olive btn-flat margin">Submit</button>
				       	</td></tr>
				    </table>
				</div>	 
				
				</form>	
		</div>
						 
					</div>
				</div>

      <!-- /.box -->
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
	    function getUserByRoleID(){
	    	var roleID=$("#roleID").val();
	    	
	    	$.ajax({
			    url: "getUserByRoleID?roleID="+roleID,      
	   			success:function(response){	
	   				for(var i=0;i<response.length;i++){
						//alert("success "+response);	 
						var t=response;
			             $("#userID").html("<option value='0' >Select User</option>")
			             var options = t.map(function(val, ind){
			            	 return $("<option></option>").val(val.user_id).html(val.username);
			            	});
			             $('#userID').append(options);
	   				}
	   			},
	   			error:function(response){
	   				alert("Error "+response);
	   			}
	   		});	
		}
	</script>
	
	
	<script type="text/javascript">
		function getModulesByUserID(){ 
		 var userID=$("#userID").val();
			 
			 var issueHTML = '&ensp;&ensp;<label>User Permissions :- </label>&ensp;&ensp;';
			 
			 $.ajax({
		   			url: "getListOfUserPermissions?userID="+userID,
		   			success:function(response){	
		   				for(var i=0;i<response.length;i++){
		   					var j = i+1;
		   					issueHTML+='&ensp;'+j+'-'+
							''+response[i].permissionID.permissiontype+''+		
							'<b>('+response[i].permissionID.moduleID.module_type+')</b>,'; 
		   				}
		   				issueHTML+='</br></br>';
		   				$("#data1").html(issueHTML);
		   			},
		   			error:function(response){
		   				alert("Error "+response);
		   			}
		   		});		
}		
</script>
	
	
	
	<script type="text/javascript">
	    $('.moduleType').on('change', function() {
		    $('.moduleType').not(this).prop('checked', false);  
		});
    </script>

<script type="text/javascript">
   	
    $(document).ready(function() {
    	$('#downloadPermission').hide();   	
    	$('#tenderPermission').hide();	
    	$('#newsPermission').hide();
    	$('#showPermission').hide();
    	$('#submitForm').hide();
    });
 </script>


<script type="text/javascript">
function display(){ 
	     $('#showPermission').show();
	     $('#submitForm').show();
		 var moduleType=$('#moduleType').val(); 
		 var userID=$("#userID").val();
		 if(userID==0){
			 alert("Please select Valid User");
		 }
		 else{
		 $('#moduleType :checked').each(function() {
			// alert("Key "+$(this).val());
			 var moduleID = $(this).val();
			 var moduleName=$(this).attr('key');
			 var userID = $("#userID").val();
			 
			 var issueHTML = /* '<label align="center">Select Module Permissions</label><br>'+ */
				'<div class="row"><div class="form-group col-md-12">'+
			 	'<label class="col-md-3 control-lable">Select&ensp;'+moduleName+'&ensp;Permissions</label>'+
				'<div class="col-md-7">';
			 
			 $.ajax({
				    url: "getModulesPermissions?moduleID="+moduleID+"&userID="+userID,         // (?reportType="+reportType+"&contact="+contact+"&status="+status, "&startDate="+startDate+"&endDate="+endDate+)		 					   			
		   			success:function(response){	
		   				for(var i=0;i<response.length;i++){
		   					//alert("status "+response[i].status);
							issueHTML+='<input type="checkbox" name="permission_ID" id="permission_ID'+i+'"  value='+response[i].permissionID+'>&ensp;'+response[i].permissiontype+'&ensp;&ensp;&ensp;&ensp;' ;													  								   						   				  											
		   				}
		   				issueHTML+='</div></div></div>';
		   				$("#data").html(issueHTML);
		   				for(var i=0;i<response.length;i++){
		   				$('#permission_ID'+i).prop('checked', response[i].status == "A");
		   				}
		   			},
		   			error:function(response){
		   				alert("Error "+response);
		   			}
		   		});				 			
				// $("#data").clone().find("input, checkbox").each(function(){}).end().prependTo("#data1");	
		  });
		 }
}		
</script>

	<script>
$( document ).ready(function() {
	$("#rightDashboard").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script>

</body>
</html>