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
<script src="resources/js/changeStatus.js"></script>
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
      <h1>  Tender Details <small>Preview</small> </h1>
      <ol class="breadcrumb">
       <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Advanced Elements</li>
       </ol>
    </section>

    <!-- Main content -->
    <section class="content">

	<!-- Default box -->
<div class="box-body">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Complaint Information</h3>
					</div>
					<!-- /.box-header -->
					
		<div class="box-body">
		<h3 class="lead">  <i class="fa fa-globe"></i> Basic Information :</h3>
			<!-- Main content -->
		    <section class="invoice">
		      <div class="row invoice-info">
		        <!-- /.col -->
		        <div class="col-sm-6 invoice-col">
		          <h4><b>Title : </b>${complaint.title}</h4>        
		          <h4><b>Name : </b>${complaint.name}</h4>
		          <h4><b>Phone : </b>${complaint.phone}</h4>        
		          <h4><b>Email : </b>${complaint.email}</h4>
		          <h4><b>Subject : </b>${complaint.subject}</h4>        
		          <h4><b>Description : </b>${complaint.description}</h4>
		          <h4><b>Status : </b>${complaint.state}</h4>
		        </div>
		      </div>		      
		    </section>			    
		</div>
		
		<div class="box-body">
		<h3 class="lead">  <i class="fa fa-globe"></i> Change Status :</h3>
       
         <!-- /.box-header -->
      <section class="invoice">
      <form action="addComplaintDptComments">
      
      <input type="hidden" name="complaintID" value="${complaint.complaintID }">
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="status">Change status</label>
				<span style="color: red" id="statusError"></span>
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <select name="status" id="status" class="form-control">
					  	<option selected="selected" value="0">Select Status</option>
					  	<option value="Solved">Solved</option>	
						<option value="Under Observation">Under Observation</option>
					  </select>
				    </div> 
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="publish_date">Comment</label>
				<span style="color: red" id="commentError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
						<textarea name="comment" id="comment" class="form-control"></textarea>
					 </div>
				</div>
			</div>
		</div>	  	
					 <input type="submit" value="Save" onclick="return myFunction()" class="btn btn-primary btn-flat margin">
				  	 <input type="reset" value="Reset"  class="btn">
				  	 
		</form> 		  	 
		</section>
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

	function myFunction(){
		if(validateChangeStatus()){
			alert("Status Changed Succesfully.....");
	 		return true;
    	}else{
			return false;
		}
	}
	
</script>

</body>
</html>