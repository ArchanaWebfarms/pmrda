<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
      <h1> Order  Table</h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Order table</li>
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
            
            <!-- <form action=""> -->
            <div class="row">
				<div class="form-group col-md-12">
				<div class="col-md-3">
					<label class=" control-lable" for="ordersStatus">Select status</label>
					<span style="color: red" id="noticesStatusError"></span>
				</div>	
					<div class="col-md-7">
						<div class="input-group">
						  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
						  <select name="ordersStatus" id="ordersStatus" class="form-control">
						  	<option selected="selected" value="All">All</option>
						  	<option value="Approved">Approved</option>
						  	<option value="Pending">Pending</option>
						  	<option value="Reject">Reject</option>
						  	<option value="Unpublished">Unpublished</option>
						  </select>
					    </div> 
						</div>
					</div>
				</div>
				
				  <div class="row">
					<div class="form-group col-md-12">
						<div class="col-md-3">
							<label class="control-lable" for="type">Select Type</label>
							<span style="color: red" id="typeError"></span>
						</div>	
						<div class="col-md-7">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-home"></i></span>
								<select name="type" class="form-control" id="Ordertype">
								    <option value="All">All</option>
									<option value="HISTORY OF POSTING">HISTORY OF POSTING</option>
									<option value="OFFICE ORDERS">OFFICE ORDERS</option>
									<option value="DESPOSITION LIST">DEPOSITION LIST</option>
								</select>
							</div>
						</div>
					</div>
				 </div>
				 
				  <input type="submit" value="Submit" onclick="selectStatus()" class="btn btn-primary btn-flat margin">
				  
				<!--  </form>  -->
         </div>         
         
       <div id="data"></div>
       
				
        
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
$(function() {	
	selectStatus();
});


function selectStatus(){
  
	var issueHTML = '<div class="box"><div class="box"><div class="box-header"><h3 class="box-title">Order Data Table</h3></div>'+
	'<div class="box-body"><table id="example1" class="table table-bordered table-striped">'+ 
	'<thead><tr><th>S.N.</th><th>Published Date</th><th>Title and Ref.No./Tender ID</th><th>Type</th><th>Status</th><th id="tableAction">Action</th></tr>'+
	'</thead>'+
	'<tbody>';	
	
	var ordersStatus = $("#ordersStatus").val();
	var Ordertype = $("#Ordertype").val();
	//alert(ordersStatus);
	//alert(Ordertype);
	
	 $.ajax({
			url:"getOrdersListByStatus?ordersStatus="+ordersStatus+"&Ordertype="+Ordertype,
			success:function(response){
				//alert(response);
				for(var i=0;i<response.length;i++){
					var  status = response[i].publishStatus;
					if(status==='Approved')
					{
					var j = i+1;
					issueHTML+='<tr> <td>'+j+'</td>'+
					'<td>'+response[i].date+'</td>'+			
					'<td>'+response[i].title+'</td>'+
					'<td>'+response[i].type+'</td>'+
					'<td bgcolor="#7FFF00">'+response[i].publishStatus+'</td>'+
					'<td><a href="adminOrdersView?noticeId='+response[i].noticeID+'">Change Status</a></td>'; 
					}
					if(status==='Pending')
					{
					var j = i+1;
					issueHTML+='<tr> <td>'+j+'</td>'+
					'<td>'+response[i].date+'</td>'+			
					'<td>'+response[i].title+'</td>'+
					'<td>'+response[i].type+'</td>'+
					'<td bgcolor=" #668cff">'+response[i].publishStatus+'</td>'+
					'<td><a href="adminOrdersView?noticeId='+response[i].noticeID+'">Change Status</a></td>'; 
					}
					if(status==='Reject')
					{
					var j = i+1;
					issueHTML+='<tr> <td>'+j+'</td>'+
					'<td>'+response[i].date+'</td>'+			
					'<td>'+response[i].title+'</td>'+
					'<td>'+response[i].type+'</td>'+
					'<td bgcolor=" #ff0000">'+response[i].publishStatus+'</td>'+
					'<td><a href="adminOrdersView?noticeId='+response[i].noticeID+'">Change Status</a></td>'; 
					}
				}
   				issueHTML+='</tbody></table></div></div></div>';
   				$("#data").html(issueHTML);
			},
			error:function(response){
	        	alert("Error");
	        }
		});
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
</script>
</body>
</html>