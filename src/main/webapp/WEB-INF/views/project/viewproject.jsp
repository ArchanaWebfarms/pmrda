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
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<jsp:include page="../includes/header.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> View Project Details  </h1>
      <ol class="breadcrumb">
       <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="projectlist">Project List</a></li>
        <li class="active">View Project</li>
       </ol>
    </section>

    <!-- Main content -->
    <section class="content">

	<!-- Default box -->
<div class="box-body">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Project Information</h3>
					</div>
					<!-- /.box-header -->
					
		<div class="box-body">
		<p class="lead">  <i class="fa fa-globe"></i> Basic Information :</p>
			<!-- Main content -->
		    <section class="invoice">
		      <div class="row invoice-info">
		        <!-- /.col -->
		        <div class="col-sm-12 invoice-col">
		          <h4><b>Title in English : </b>${project.title}</h4>
		          <h4><b>Title in Marathi : </b>${project.title_h}</h4>
		           <c:choose>
			<c:when test="${empty project.description}">			
			</c:when>	
			<c:otherwise>
				<h4><b>Brief of the Project in English : </b>${project.description}</h4>	
				<h4><b>Brief of the Project in Marathi : </b>${project.description_h}</h4>	  
			</c:otherwise>		
			</c:choose>
			 <c:choose>
			<c:when test="${empty project.projectCordinator}">			
			</c:when>	
			<c:otherwise>
				<h4><b>Implementing Partner in English : </b>${project.projectCordinator}</h4>	
				<h4><b>Implementing Partner in Marathi : </b>${project.projectCordinator_h}</h4>  
			</c:otherwise>		
			</c:choose>	
			 <c:choose>
			<c:when test="${empty project.contact}">			
			</c:when>	
			<c:otherwise>
				<h4><b>Contact Number : </b>${project.contact}</h4> 
			</c:otherwise>		
			</c:choose>		         	 
		           <c:choose>
			<c:when test="${empty project.email}">			
			</c:when>	
			<c:otherwise>
				<h4><b>Email ID : </b>${project.email}</h4>
			</c:otherwise>		
			</c:choose>
		           <c:choose>
			<c:when test="${empty project.project_status}">			
			</c:when>	
			<c:otherwise>
				<h4><b>Status in English : </b>${project.project_status}</h4> 
				<h4><b>Status in Marathi : </b>${project.project_status_h}</h4>  
			</c:otherwise>		
			</c:choose>
		          <c:choose>
			<c:when test="${empty project.specification}">			
			</c:when>	
			<c:otherwise>
				<h4><b>Target/numbers achieved as on in English : </b>${project.specification}</h4>
				<h4><b>Target/numbers achieved as on in Marathi : </b>${project.specification_h}</h4>   
			</c:otherwise>		
			</c:choose>
		             <c:choose>
			<c:when test="${empty project.scope_of_work}">			
			</c:when>	
			<c:otherwise>
				<h4><b>Scope of Work in English : </b>${project.scope_of_work}</h4>   
				<h4><b>Scope of Work in Marathi : </b>${project.scope_of_work_h}</h4>   
			</c:otherwise>		
			</c:choose>
			<%-- <h4><b>Created Date : </b>${project.created_date}</h4> --%> 
		          <h4><b>Current Status : </b>${project.approvedStatus}</h4> 
		        </div>
		      </div>
		      <br>
		      
		       <c:choose>
			<c:when test="${empty attachmentlist}">			
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
              <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
	            <tr>
	             		<td>${status.index + 1}</td>
						<td>${attachmentlist.attachmnt_name}</td> 
						<td>${attachmentlist.module_type}</td>						
	          			<td><input type="button" value="Download" class="btn btn-primary btn-flat margin" onclick="return attachmentDownload(${attachmentlist.attachmentID})"/></td>								
	          			
	            </tr>  
	            </c:forEach> 
            </tbody>
           
            
          </table>
				</div>
			</div>
		</div> 
		</c:otherwise>		
			</c:choose>   
		    </section>	
		</div>
		
		<%-- <div class="box-body" id="attachmentavailable">
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
              <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
	            <tr>
	             		<td>${status.index + 1}</td>
						<td>${attachmentlist.attachmnt_name}</td> 
						<td>${attachmentlist.module_type}</td>
						<td><a id="no-link" href="attachmentNewsDownload?path=${attachmentlist.path}">Download</a></td>
	            </tr>  
	            </c:forEach> 
            </tbody>
            
          </table>
        </div>
		</div>				 
		</div> --%>
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

<form:form  action="attachmentNewsDownload" id="viewAttachform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="attachid" name="id" />  
  </form:form>

<script>
$( document ).ready(function() {
	$("#projectlist").addClass("active");
  	$("#UserElement").addClass("active");
});
  </script>


<script type="text/javascript">
function attachmentDownload(id){
	  $("#attachid").val(id);
	  $("#viewAttachform").submit();
}

</script>

</body>
</html>