<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
    <meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>;url=login?timeout"/>
    <title>Reports</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="resources/plugins/select2/select2.min.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="resources/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="resources/plugins/datepicker/datepicker3.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="resources/dist/css/skins/_all-skins.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery 2.2.3 -->
    <script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Select2 -->
    <script src="resources/plugins/select2/select2.full.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
   
    <!-- SlimScroll -->
    <script src="resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    
    <!-- FastClick -->
    <script src="resources/plugins/fastclick/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="resources/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="resources/dist/js/demo.js"></script>
    <!-- page script -->  
    <style type="text/css">
    
    tbody {
 
  height: 150px;
  overflow-y: scroll;
}
.datepicker.dropdown-menu {
 visibility: visible;
 opacity: 1;
 width: auto;
}
</style>
</head>


<body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
        <jsp:include page="../includes/header.jsp" />
        
        <!-- =============================================== -->
        <!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1> User Login Report</h1>
			<ol class="breadcrumb">
				<li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
				<li><a href="reportsDashboard">Report Dashboard</a></li>
				<li class="active">User Login Report</li>
			</ol>
			</section>
			
			<!-- Main content -->
			<section class="content"> <!-- Default box -->

			<div class="box-body">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Report</h3>
					</div>
					<!-- /.box-header -->
					
					<div class="box-body">

						<form action="" id="generateReport" method="post">		
						
						
						<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>User Roles:</label> 									 	                     								
										<select  id=roles class="form-control select2" style="width: 100%;" onchange="getRoles()">
										 <option selected="selected" value="0">All</option>											
											<c:forEach var="roles" items="${roles}">
											
							<option value="${roles.role_id}">${roles.role_type}</option>
						</c:forEach>				
										</select>									
									</div>
								</div>
							</div>	
							
							<div class="row" id=userselect>
								<div class="col-md-6">
									<div class="form-group">
										<label>User:</label> 									 	                     								
										<select  id=user class="form-control select2" style="width: 100%;">
																			
											
											
						           <option selected="selected" value="0">All</option>	
					          			
										</select>									
									</div>
								</div>
							</div>	
						
						
									
										
							
							 
							 	
				
							
							
							
						</form>		
							
							<div class="box-header with-border">
								<table>
							    	<td>
							        	<button type="button" id="validate" class="btn bg-olive btn-flat margin" onclick="showdata()">Display</button>
							       	</td>
							    </table>
							</div>	
							
						<div class="box-body" style="max-height:400px; overflow: auto;">
                            	<div id="data"></div>
                        </div>                                              
				</div>
						 <div class="box-header with-border"  id="downloadReport" style="display: none;">
							<!-- <table>
								<td> -->
							    	<button type="button"  class="btn bg-olive btn-flat margin" id="download" onclick="download()">Download Report</button>
								<!-- </td> -->					
								<!-- <td>
							        <button type="button" id="viewAllMap" class="btn bg-olive btn-flat margin" onclick="viewAllMap()">View All Map</button>
							    </td> -->
							<!-- </table> -->
						</div>	
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>

		<jsp:include page="../includes/footer.jsp" />    
</div>
 <!-- DataTables -->
    <script src="resources/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/plugins/datatables/dataTables.bootstrap.min.js"></script>  
    <script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
 <input type="hidden" id = "download" value="<%=session.getAttribute("Download") %>">
<script src="resources/dist/js/table2excel.js" type="text/javascript"></script>

<!-- AdminLTE App -->
<script src="resources//dist/js/app.min.js"></script>

<script type="text/javascript">
   /*  $(function () {
        $("#download").click(function () {
        //	alert("you click on download");
            $("#example2").table2excel({
                filename: "CmsUserReport.xls"
            });
            var Download = $("#download").val();
            alert(Download);
        });
    }); */
</script>

<script>
function getRoles(){	 
	 var roleID=$("#roles").val(); 
	 $("#userselect").show(); 
 	 	 
	 $.ajax({
			url:"getRoleID?roleID="+roleID,
		
			success:function(reportlist){
	
				var t=reportlist;
	 
	             $("#user").html("<option value='0' >All</option>")
	             var options = t.map(function(val, ind){
	            	 return $("<option></option>").val(val.user_id).html(val.username);
	            	});
	            	$('#user').append(options);
			   },
			error:function(){
				alert("error");
			}
		}); 
	 
	}
</script>
 
<script type="text/javascript">
   	
    $(document).ready(function() {
    
    	$('#userselect').hide(); 
    
    	//$('#viewAllMap').hide();
    	$('#downloadReport').hide();   	
    	//$('#viewAllMap').hide();	
    	
    });
 </script>
 
<script type="text/javascript">
   
    
   
    function showdata(){   	
    	
    		
    		
    	var issueHTML = '<table id="example2" class="table table-bordered table-striped">'+
		'<thead>'+ 
		'<tr><th>S.N.</th><th>Username</th><th>Login Time</th></tr>'+
		'</thead>'+
		'<tbody>';
		 var user=$("#user").val();
			// alert(user);
		 var objFormData = new FormData();
		
		 objFormData.append('user', user);
		
   		$.ajax({
   			
   			url:"LoginInfo?${_csrf.parameterName}=${_csrf.token}",         //(?reportType="+reportType+"&contact="+contact+"&status="+status, "&startDate="+startDate+"&endDate="+endDate+)
   			type:"post",
 			data:objFormData,
 			processData: false,
 		    contentType: false, 
   			success:function(response){
   				//alert(response);
   				for(var i=0;i<response.length;i++){
					var j = i+1;
					issueHTML+='<tr> <td>'+j+'</td>'+
					 '<td>'+response[i].username+'</td>'+
					 '<td>'+response[i].time+'</td>' ;
				  
				}
   			
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
   			/*  $('#example2').DataTable({
   		      "searching": false,
   		    }); */
   		
   				$('#downloadReport').show();
   			},
   			error:function(){
   				alert("error");
   			}
   		});
    }
    
   
     
    </script>
  <script>

  function download(){
	  $("#example2").table2excel({
          filename: "CmsUserReport.xls"
      });
		
 } 
 
  
  </script>
  <script>
$( document ).ready(function() {
	$("#reportsDashboard").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script>
</body>
</html>