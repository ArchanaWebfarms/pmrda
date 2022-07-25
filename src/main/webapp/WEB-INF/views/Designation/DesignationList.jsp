
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PMRDA</title>
<!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="resources//plugins/datatables/dataTables.bootstrap.css">
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
      <h1>Designation  Data Table<!-- <small>advanced tables</small> --></h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> Home</a></li>
       
        <li class="active">Designation table</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
        
        <div class="box">
            <div class="box-header">
              <h3 class="box-title">For Designation register Here...</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<div class="form-actions floatRight">
					<input type="button" onclick="location.href='newDesignation'" value="New Designation" class="btn btn-primary btn-flat margin">
				</div>
            </div>
            <!-- /.box-body -->
         </div>
         
         
         
       <div class="box">
 		<div class="box">
            <div class="box-header">
              <h3 class="box-title">Designation Data Table</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>S.N.</th>
                  <th>Designation Name</th>
                   <th>Designation Name In Hindi</th>
                  <th>Description</th>
                  <th>Action</th>
                  <th>Action</th>
                    <th>Action</th>
                </tr>
                </thead>
                
                <tbody>
					<c:forEach var="designationlist" items="${designationlist}" varStatus="status">
							<tr>
								<td >${status.index + 1}</td>
								<td>${designationlist.designation}</td>
								<td>${designationlist.designation_h}</td>
								<td>${designationlist.description}</td>
								
								<td><a href="viewDesignation?designationId=${designationlist.designationId}">View Details</a></td>		
								<td><a href="editDesignation?designationId=${designationlist.designationId}">Edit Details</a></td>		
								<td><a href="deleteDesignation?designationId=${designationlist.designationId}" onclick="return deleteDepartment()">Delete Designation</a></td>									
							</tr>
					</c:forEach>
				</tbody>
              </table>
            </div>
            <!-- /.box-body -->
         </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <jsp:include page="../includes/footer.jsp" /> 
    </div>  


<!-- Bootstrap 3.3.6 -->
<script src="resources//bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="resources//plugins/datatables/jquery.dataTables.min.js"></script>
<script src="resources//plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="resources//plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="resources//plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources//dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources//dist/js/demo.js"></script>

<script>
$(function () {
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  alert(token);
	  alert(header);
	  $(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	    alert(xhr.setRequestHeader(header, token));
	  });
	});
function deleteDepartment(){
	 if (!confirm("Do you want to delete")){
	      return false;
	   }
	 return true;
};

  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
</body>
</html>