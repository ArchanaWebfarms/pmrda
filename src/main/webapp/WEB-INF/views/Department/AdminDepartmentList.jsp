<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
  %>
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
      <h1> Departments Data Table<!-- <small>advanced tables</small> --></h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li> 
         <li><a href="adminDepartmentDashboard">Admin Departments Dashboard</a></li>       
        <li class="active">Admin Departments List</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
         
         
         
          <div class="box">
          <br>
	        <div class="box-header">
              <h3 class="box-title">Select Status Here...</h3>
            </div>
            <div class="row">
				<div class="form-group col-md-12">
				<div class="col-md-3">
					<label class=" control-lable" for="tendorStatus">Change status</label>
					<span style="color: red" id="tendorStatusError"></span>
				</div>	
					<div class="col-md-7">
						<div class="input-group">
						  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
						  <select name="tendorStatus" id="tendorStatus" onchange="selectStatus()" class="form-control">
						  	<option selected="selected" value="All">All</option>
						  	<option value="Approved">Approved</option>
						  	<option value="Pending">Pending</option>
						  	<option value="Reject">Reject</option>
						  
						  </select>
					    </div> 
						</div>
					</div>
				</div>
         </div>
         
       <div id="data"></div>
         
         
       <div class="box"><div class="box"><div class="box-header"><h3 class="box-title">Departments Data Table</h3></div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>S.N.</th>
                   <th>Department Name in English</th>
                  <th>Department Name In Marathi</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
                </thead>
                
                <tbody>
					<c:forEach var="departments" items="${list}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${departments.departmentName}</td>
								<td>${departments.departmentName_h}</td>
								<td>${departments.create_approval_status}</td>
								<td><input type="button" value="Change Status" class="btn btn-primary btn-flat margin" onclick="return view(${departments.deptId})"/></td>
															
							</tr>
					</c:forEach>
				</tbody>
              </table>
            </div>
            <!-- /.box-body 
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

<form:form  action="adminViewDepartment" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="viewid" name="id" />  
  </form:form>


<script>
function view(id){    	
	$("#viewid").val(id);
	$("#viewform").submit();
	return true;
}

function selectStatus(){
	var tendorStatus = $("#tendorStatus").val();//alert(tendorStatus)
	
	if (tendorStatus=="Pending")
	{
		$(function() {
		    $('.A').filter(function() {
		    	
		       // return $(this).text() != 'pendding';
		        if( $(this).text() != 'Pending')
		        	{
		        //	alert("yoo");
		        	 $(this).parent().hide();
		        	}
		        else
		        	{
		        	$(this).parent().show();
		        	}
		      
		        
		        
		    })
		});
	}
	else if (tendorStatus=="Approved")
	{
		$(function() {
		    $('.A').filter(function() {
		    	
		       // return $(this).text() != 'pendding';
		        if( $(this).text() != 'Approved')
		        	{
		        //	alert("yoo");
		        	 $(this).parent().hide();
		        	}
		        else
		        	{
		        	$(this).parent().show();
		        	}
		      	        
		    })
		});
	}
	else if (tendorStatus=="Reject")
	{
		$(function() {
		    $('.A').filter(function() {
		    	
		       // return $(this).text() != 'pendding';
		        if( $(this).text() != 'Reject')
		        	{
		        //	alert("yoo");
		        	 $(this).parent().hide();
		        	}
		        else
		        	{
		        	$(this).parent().show();
		        	}
		    })
		});
	}else{
		$(function() {
		    $('.A').filter(function() {		    	
		        	$(this).parent().show();	
		    })
		});
	}
	
	
}


</script>

<script>


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
<script>
$( document ).ready(function() {
	$("#adminDepartmentDashboard").addClass("active");
  	$("#AdminElement").addClass("active");
});
  </script>
</body>
</html>