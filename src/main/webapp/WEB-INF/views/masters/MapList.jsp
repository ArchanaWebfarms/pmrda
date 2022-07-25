
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
  <link rel="stylesheet" href="resources/plugins/datatables/dataTables.bootstrap.css">
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
      <h1> Maps Data Table  <!-- <small>advanced tables</small> --></h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li class="active">Map List</li>   
      </ol>
     
      <!-- /.row -->
      <div class="box">
            <div class="box-header">
              <h3 class="box-title">For Map register Here...</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<div class="form-actions floatRight">
					 <button type="button" onclick="location.href='mapdashboard'" class="btn btn-primary btn-flat margin">Add New</button>
				</div>
            </div>
            <!-- /.box-body -->
         </div>
    </section>
    
    
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">

 			<div class="box">
 			<h3> Maps Table<!-- <small>advanced tables</small> --></h3>
            <div class="box-header">
             <!--  <h3 class="box-title">Data Table With Full Features</h3> -->
             
            </div>
            <!-- /.box-header -->
             
            <div class="box-body">
             
             
              <table id="example1" class="table table-bordered table-stripe">
                <thead>
                <tr align="center">
                  <th>S.N.</th>                
                  <th>Title in English</th>                 
                  <th>Title in Marathi</th>                  
                <th>    Action  </th> 
                 <th>    Action  </th> 
                  
                  </tr>
              </thead>
                
                    <tbody>
				    <c:forEach var="list" items="${list}" varStatus="status">
					<tr>
					<td>${status.index + 1}</td>					
				    <td>${list.title}</td>
				    <td>${list.title_h}</td>				     
                    <td><input type="button" value="View Map" class="btn btn-primary btn-flat margin" onclick="return view(${list.attachmentID })"/></td>
					<td><input type="button" value="Delete Map" class="btn btn-primary btn-flat margin" id="AB"  onclick="myFunction(${list.attachmentID })"/></td>		
                        		
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
<!-- DataTables -->
 
  <form:form  action="previewImage" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="viewid" name="id" />  
  </form:form>
  
<script>
 $(function () {
    $("#example1").DataTable();   
  });
</script>
 <script>
 function myFunction(id){
	  $.ajax({
		    url : 'deletePhoto?id='+id,   
		   	method :'POST',
		    success : function(response){
		    	alert("Map Deleted Successfully.")
		    	window.location.href="mapList";
		    }
		   
		});
 }

 function view(id){    	
	 	$("#viewid").val(id);
	 	$("#viewform").submit();
	 	return true;
	 }
 
    </script>
   <script>
$( document ).ready(function() {
	$("#mapList").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script>

</body>
</html>