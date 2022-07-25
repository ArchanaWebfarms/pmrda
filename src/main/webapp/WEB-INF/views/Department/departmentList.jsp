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
<script src="resources//plugins/jQuery/jquery-2.2.3.min.js"></script>

</head>
<body class="hold-transition skin-blue sidebar-mini">

 <div class="wrapper">
	<jsp:include page="../includes/header.jsp" />
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Departments Data Table<!-- <small>advanced tables</small> --></h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>       
        <li class="active">Department Data Table</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
        
        <div class="box">
            <div class="box-header">
              <h3 class="box-title">New Department Register Here...</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<div class="form-actions floatRight">
					 <input type="button" onclick="location.href='newDepartment'" value="New Department" class="btn btn-primary btn-flat margin">
				</div>
            </div>
            <!-- /.box-body -->
         </div>
        
        
          <div class="box">
 			<div class="box">
            <div class="box-header">
              <h3 class="box-title"> Departments Data Table</h3>
            </div>
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
                  <th>Action</th>
                  <th>Action</th>
                  <th>Action</th>
                </tr>
                </thead>
                
                <tbody>
					<c:forEach var="departments" items="${departments}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${departments.departmentName}</td>
								<td>${departments.departmentName_h}</td>
								<td>${departments.create_approval_status}</td>
								
								<td><input type="button" value="Add Contact Details" class="btn btn-primary btn-flat margin" onclick="return addContact(${departments.deptId})"/></td>
								 <td><input type="button" value="View Department" class="btn btn-primary btn-flat margin" onclick="return view(${departments.deptId})"/></td>
								<td><input type="button" value="Edit Department" class="btn btn-primary btn-flat margin" onclick="return edit(${departments.deptId})"/><br></td>			
								 <c:choose>
									<c:when test="${departments.create_approval_status eq 'Approved'}">
											<td><input type="button" value="Delete Department" class="btn btn-primary btn-flat margin" onclick="return deleteA(${departments.deptId},'${departments.create_approval_status}')"/></td>		                 		
									</c:when>
									<c:otherwise>
											<td><input type="button" value="Delete Department" class="btn btn-primary btn-flat margin" onclick="return deleteP(${departments.deptId},'${departments.create_approval_status}')"/></td>		                        		
									</c:otherwise>
 								</c:choose>	
							
						    	
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

<form:form  action="viewDepartment" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="viewid" name="deptId" />  
  </form:form>
  
  <form:form  action="editDepartment" id="editform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="editid" name="deptId" />  
  </form:form>
  
  <form:form  action="deleteAdminDepartment" id="deleteAform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="deleteAid" name="deptId" />  
  </form:form>
  
  <form:form  action="deleteDepartment" id="deleteform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="deleteid" name="deptId" />  
  </form:form>
  
   <form:form  action="addContactDetailst" id="contactform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="contactid" name="deptId" />  
  </form:form>

<script>
$( document ).ready(function() {
	$("#departmentList").addClass("active");
  	$("#UserElement").addClass("active");
});
  </script>
<script>
function view(id){    	
	$("#viewid").val(id);
	$("#viewform").submit();
	return true;
}

function edit(id){
	$("#editid").val(id);
	$("#editform").submit();
	return true;
}

function deleteA(id,status){
	if(deleteTender(status)){
		$("#deleteAid").val(id);
    	$("#deleteAform").submit();
    	return true;
	}
}

function deleteP(id,status){
	if(deleteTender(status)){
		$("#deleteid").val(id);
    	$("#deleteform").submit();
    	return true;
	}
}


function addContact(id){	
		$("#contactid").val(id);
    	$("#contactform").submit();
    	return true;
}


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
  
  
  function deleteTender(status){
  	if(status=="Approved"){
  		 if (!confirm("Do you want to delete record?")){
  	   	      return false;
  	   	  }else{
  	   		return true;
  	   	  }
  	}else{
  		if (!confirm("Department not approved yet.Do you want to delete record?")){
	   	      return false;
	   	  }else{
	   		return true;
	   	  }    		
  	}
 }
  
</script>
</body>
</html>