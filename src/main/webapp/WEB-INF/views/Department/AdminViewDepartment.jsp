<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body class="hold-transition skin-blue sidebar-mini" >
<div class="wrapper" >
	<jsp:include page="../includes/header.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Departments Details  </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
         <li><a href="adminDepartmentDashboard">Admin Departments Dashboard</a></li>      
        <li><a href="adminDepartmentList">Admin Departments List</a></li>
        <li class="active">Change Status</li>
       </ol>
    </section>

    <!-- Main content -->
    <section class="content">

	<!-- Default box -->
<div class="box-body">
 			<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Department Information</h3>
					</div>
					<!-- /.box-header -->
					
		<div class="box-body">
		<p class="lead">  <i class="fa fa-bars" aria-hidden="true"></i> Basic Information :</p>
		 
			<!-- Main content -->
		    <section class="invoice">
		      <div class="row invoice-info">
		        <!-- /.col -->
		        <div class="col-sm-12 invoice-col">
		        
		             <h5><b>Name of the Department in English : </b>${department.departmentName}</h5>   
		             <h5><b>Name of the Department in Marathi: </b>${department.departmentName_h}</h5>   
		           <c:choose>
			<c:when test="${empty department.description}">			
			</c:when>	
			<c:otherwise>
				<h5><b>Description in English : </b>${department.description}</h5>	
		        <h5><b>Description in Marathi : </b>${department.description_h}</h5> 	  
			</c:otherwise>		
			</c:choose>
			<c:choose>
			<c:when test="${empty department.objectives}">			
			</c:when>	
			<c:otherwise>
				<h5><b>Objectives in English : </b>${department.objectives}</h5> 	        	                
		          <h5><b>Objectives in Marathi : </b>${department.objectives_h}</h5>	  
			</c:otherwise>		
			</c:choose>
			<c:choose>
			<c:when test="${empty department.functions}">			
			</c:when>	
			<c:otherwise>
				<h5><b>Functions in English : </b>${department.functions}</h5> 	        	                
		          <h5><b>Functions in Marathi : </b>${department.functions_h}</h5>	  
			</c:otherwise>		
			</c:choose>
		    <c:choose>
			<c:when test="${empty department.projects}">			
			</c:when>	
			<c:otherwise>
				<h5><b>Projects in English : </b>${department.projects}</h5> 	        	                
		          <h5><b>Projects in Marathi : </b>${department.projects_h}</h5>  
			</c:otherwise>		
			</c:choose>        
		           <c:choose>
			<c:when test="${empty department.roles_and_responsibility}">			
			</c:when>	
			<c:otherwise>
				<h5><b>Roles and Responsibility in English : </b>${department.roles_and_responsibility}</h5> 	        	                
		          <h5><b>Roles and Responsibility in Marathi : </b>${department.roles_and_responsibility_h}</h5>
			</c:otherwise>		
			</c:choose>     
		           <c:choose>
			<c:when test="${empty department.achievements}">			
			</c:when>	
			<c:otherwise>
				 <h5><b>Achievements in English : </b>${department.achievements}</h5> 	        	                
		          <h5><b>Achievements in Marathi : </b>${department.achievements_h}</h5>
			</c:otherwise>		
			</c:choose> 
		            <c:choose>
			<c:when test="${empty department.salient_features}">			
			</c:when>	
			<c:otherwise>
				<h5><b>Salient Features in English : </b>${department.salient_features}</h5> 	        	                
		          <h5><b>Salient Features in Marathi : </b>${department.salient_features_h}</h5>
			</c:otherwise>		
			</c:choose> 
			   <c:choose>
			<c:when test="${empty department.other_title}">			
			</c:when>	
			<c:otherwise>
				<h5><b>Other Title in English : </b>${department.other_title}</h5> 	        	                
		          <h5><b>Other Title in Marathi : </b>${department.other_title_h}</h5>
		          <h5><b>Other Content in English : </b>${department.other_content}</h5> 	        	                
		          <h5><b>Other Content in Marathi : </b>${department.other_content_h}</h5>
			</c:otherwise>		
			</c:choose> 
		          
		          <h5><b>Creation Status : </b>${department.create_approval_status}</h5> 	        	                
		          <h5><b>Created Date : </b>${department.created_date}</h5>
		          
		        </div>
		  </div>
		      <br>
		    </section>	
		
		    <c:choose>
			<c:when test="${empty department.officeContact}">			
			</c:when>	
			<c:otherwise>
			 
		<div class="box-body" id="">
		<div class="row">
        <div class="col-xs-12 table-responsive">
         <p class="lead">  <i class="fa fa-globe"></i> Important Contact Details :</p>
          <table  class="table table-striped" id ="myTable">
            <thead>
            <tr>
              <th>S.N.</th>
              <th>Office Name</th>
		      <th>Name</th>
		       <th>Contact Number</th>
		      <th>Email ID</th>
            </tr>
            </thead>
            <tbody>
              <c:forEach var="office" items="${department.officeContact}" varStatus="status">
	            <tr>
	             		<td>${status.index + 1}</td>
	             		<td>${office.deptOffice.name}</td> 
						<td>${office.name}</td> 
						<td>${office.contact_no}</td>
						<td>${office.email}</td>
	            </tr>  
	            </c:forEach> 
            </tbody>
            
          </table>
        </div>
		</div>				 
		</div>
		</c:otherwise>		
			</c:choose>
		
		
		 <c:choose>
			<c:when test="${empty department.attachment}">			
			</c:when>	
			<c:otherwise>
			
		<div class="box-body" id="attachmentavailable">
		<div class="row">
        <div class="col-xs-12 table-responsive">
         <p class="lead">  <i class="fa fa-globe"></i> Attachment :</p>
          <table  class="table table-striped" id ="myTable">
            <thead>
            <tr>
              <th>S.N.</th>
		      <th>File Name</th>
		       <th>File Type</th>
		      <th>Download</th>
            </tr>
            </thead>
            <tbody>
              <c:forEach var="attachmentlist" items="${department.attachment}" varStatus="status">
	            <tr>
	             		<td>${status.index + 1}</td>
						<td>${attachmentlist.attachmnt_name}</td> 
						<td>${attachmentlist.module_type}</td>
						<td><input type="button" value="Download" class="btn btn-primary btn-flat margin" onclick="return attachmentDownload(${attachmentlist.attachmentID})"/></td>								
						
						<%-- <td><a id="no-link" href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">Download</a></td> --%>
	            </tr>  
	            </c:forEach> 
            </tbody>
            
          </table>
        </div>
		</div>				 
		</div>
		</c:otherwise>		
			</c:choose>
			
		
		
		
		<form:form action="saveAdminCreationStatus"  class="form-horizontal" >
	
		<input type="hidden" value="${department.deptId}" name="id" id="id">
		<div class="box-body" id="attachmentavailable">
		<div class="row">
        <div class="col-xs-12 table-responsive">
         <p class="lead">  <i class="fa fa-globe"></i> Change Status :</p>
         
          
          <div class="row">
			<div class="form-group col-md-12">
			<div class="col-md-3">
		
				<label class="control-lable" for="subTitle">Change Status</label>
			
			</div>	
				<div class="col-md-7">
				 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
						
					 <select name ="approvedStatus"  id="Approved"  class="form-control">
		              <option value="Pending" >Select Status</option>
		              <option value="Approved" >Approved</option>
                      <option value="Reject">Reject</option>
                         
		         
				 </select>
				</div>						
				</div>
				
			</div>
		</div>
		
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3  control-lable" for="title">Comments</label>
				<span style="color: red" id="commentError"></span>
				
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <input type="text" name="comment" id="comment" class="form-control" /> 
				    </div> 
				</div>
			</div>
		</div>
          
          <div class="box-footer">
                  <div class="form-actions floatRight">
					 <input type="submit" value="Save" id="Save"  class="btn btn-primary btn-flat margin">
				 	 <input type="button" value="Cancel" onclick="location.href='adminDepartmentList'" class="btn btn-success">
				  	 <input type="reset" value="Reset"  class="btn">	
				  </div>
              </div> 
          
          
          
        </div>
		</div>				 
		</div>
		</form:form>
					</div>
					   
				</div>

      <!-- /.box -->
	</section>
	
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>
	<!-- <script src="resources/bootstrap/js/NewNews.js"></script> -->
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


<!-- SCRIPT TO HIDE LINK ON MOUSE HOVER ON DOWNLOAD BUTTON	 -->	
		<script>
		  $(document).ready(function () {
		         setTimeout(function () {

		               $('a[href]#no-link').each(function () {
		                   var href = this.href;

		                   $(this).removeAttr('href').css('cursor', 'pointer').click(function () {
		                       if (href.toLowerCase().indexOf("#") >= 0) {

		                       } else {
		                           window.open(href, '_blank');
		                       }
		                   });
		               });

		         }, 500);
		   });
		
		</script>
		<form:form  action="attachmentNewsDownload" id="viewAttachform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="attachid" name="id" />  
  </form:form>
  
	<script type="text/javascript">
	function attachmentDownload(id){
		  $("#attachid").val(id);
	  	  $("#viewAttachform").submit();
	  	  return true;
	  }
	</script>
</body>
</html>