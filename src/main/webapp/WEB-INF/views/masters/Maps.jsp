<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
  %>
<style>
.form-control c:hover .tooltiptext {
	visibility: visible;
}
</style>
<meta charset="utf-8">
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval()%>;url=login?timeout" />
<title>PMRDA</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="resources/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="resources/plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="resources/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="resources/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="resources/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="resources/plugins/select2/select2.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="resources/dist/css/skins/_all-skins.min.css">
<script src="resources/js/tenderDepartment.js"></script>
<!-- jQuery 2.2.3 -->
<script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>

<!-- DataTables -->
  <link rel="stylesheet" href="resources//plugins/datatables/dataTables.bootstrap.css">

</head>


<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="../includes/header.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content">
				<div class="box-body">
					<div class="box box-default">
						<div class="box-header with-border">
							<!-- Content Header (Page header) -->
							<section class="content-header">
								 <h1> Maps  </h1>
								<ol class="breadcrumb">
									<li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>	
									<li><a href="mapList">Maps</a></li>							
									<li class="active">New Map</li>
								</ol>
							</section>
<hr>
							<!-- Main content -->
							<section class="content">

								<!-- Default box -->
								<div class="box-body">
									<div class="row">
										<form method="POST"
										action="uploadMap?${_csrf.parameterName}=${_csrf.token}"
										enctype="multipart/form-data">
										
										<div class="row" id="attach">
											<div class="form-group col-md-12">
												<label class="col-md-3 control-lable" >Title in English
												</label> <span style="color: red" id="titleError"></span>
												<div class="col-md-7">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-pencil"></i></span>														
														<input type="text" name="title" id="title" class="form-control" />
													</div>
													
												</div>
											</div>
										</div>
										<div class="row" id="attach">
											<div class="form-group col-md-12">
												<label class="col-md-3 control-lable">Title in Marathi
												</label> <span style="color: red" id="title_hError"></span>
												<div class="col-md-7">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-pencil"></i></span>														
														<input type="text" name="title_h" id="title_h" class="form-control" />
													</div>
													
												</div>
											</div>
										</div>
										<div class="row" id="attach">
											<div class="form-group col-md-12">
												<label class="col-md-3 control-lable" for="attachment">Map
												</label> <span style="color: red" id="fileError"></span>
												<div class="col-md-7">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-file"></i></span>
														<%-- 	<input type="file" value="${tendors.attachment.attachmnt_name}" name="file" id="file" class="form-control"/> --%>
														<input type="file" name="attachment" id="attachment"
															class="form-control" />

													</div>
													
												</div>
											</div>
										</div>


										<div class="box-footer">
											<div class="form-actions floatRight">
												<input type="submit" value="Save" id="Save"
													class="btn btn-primary btn-flat margin"> 
											</div>
										</div>

									</form>

								</div>
								</div>
								<!-- /.box -->
							</section>
							<div class="form-group col-md-12">
									<div id="data"></div>
								</div>
							
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>








	<jsp:include page="../includes/footer.jsp" />
	</div>


<!-- DataTables -->
<script src="resources//plugins/datatables/jquery.dataTables.min.js"></script>
<script src="resources//plugins/datatables/dataTables.bootstrap.min.js"></script>

	<!-- Bootstrap 3.3.6 -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script src="resources/plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="resources/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap datepicker -->
	<script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- bootstrap color picker -->
	<script
		src="resources/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
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

	
<script>
/* FILE VALIDATION */
  $(function () {
	//  photoGallaryList();
	  
	  $('#example1').DataTable({
	      "paging": true,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });
	  
	    $('input[type=file]').change(function () {
	        var val = $(this).val().toLowerCase(),
	            regex = new RegExp("(.*?)\.(jpg|png|jpeg)$");
	        var filesizeinMB = 2094127;
	        var size = this.files[0].size;
	        var type = this.files[0].type;
	        
	        var fruits = new Array("image/png", "image/JPG","image/JPEG");
	        for(var j=0;j<fruits.length;j++){if(fruits[j]==type){}}
	        
	     
	      
	         if (!(regex.test(val))) {
	            $(this).val('');
	            alert('You must select an image file only');
	        }
	       /*  if ( size>filesizeinMB) {
	            $(this).val('');
	            alert('Can Not Upload File Greater than 2MB');
	        }
	        */
	    });
	});

  $('#Save').bind("click",function(){		     
		    		
		    		validateTitle();
		    		validateTitleH();
		    		validateFile();
		    		
		    		if(validateTitle() && validateTitleH() && validateFile()){
		    			alert("Map Saved Successfully.");
		    			return true;
		    		}else{
		    			return false;
		    		}
		    		
 }); 
  
  function validateTitle(){
	  var title=$("#title").val();
	  if(title==""){
		  document.getElementById("titleError").innerHTML="**Required";
  			return false;
	  }else{
		  document.getElementById("titleError").innerHTML=" ";
		  return true;
	  }
  }
  
  function validateTitleH(){
	  var title=$("#title_h").val();
	  if(title==""){
		  document.getElementById("title_hError").innerHTML="**Required";
  			return false;
	  }else{
		  document.getElementById("title_hError").innerHTML=" ";
		  return true;
	  }
  }
  
  function validateFile(){
	  var title=$("#attachment").val();
	  if(title==""){
		  document.getElementById("fileError").innerHTML="**Required";
  			return false;
	  }else{
		  document.getElementById("fileError").innerHTML=" ";
		  return true;
	  }
  }
  
 /*  function photoGallaryList(){
	  
			var issueHTML = '<div class="box"><div class="box"><div class="box-header"><h3 class="box-title">Maps Data Table</h3></div>'+
			'<div class="box-body"><table id="example1" class="table table-bordered table-striped">'+ 
			'<thead><tr><th>S.N.</th><th>Title in English</th><th>Title in Marathi</th>'+
			'<th id="tableAction">Action</th><th id="tableAction">Action</th></tr>'+
			'</thead>'+
			'<tbody>';	
			
			$.ajax({
			    url : 'photoGallaryList?type=MAP',      
			    success : function(response){
			    	console.log(response)
			    	for(var i=0;i<response.length;i++){			    		
			    			var j = i+1;
							issueHTML+='<tr> <td>'+j+'</td>'+
							'<td>'+response[i].title+'</td>'+	
							'<td>'+response[i].title_h+'</td>'+							
							'<td><a href="staticResources/Map/'+ response[i].attachmnt_name+ '" target="_blank" class="btn btn-success">View Map</a><br></td>'+
							'<td><input type="button" value="Delete Map" class="btn btn-success" id="AB"  onclick="myFunction(${"'+ response[i].attachmentID+ '"})"/>' + '</td>';
			    								
			    	}//for
			    	issueHTML+='</tbody></table></div></div></div>';
						$("#data").html(issueHTML);
						$("#example1").DataTable();

			    },//success func
			    error:function(response){
		        	//alert("Error");
		        }//err func

			});//ajax
  }
  
  function myFunction(id){
	  $.ajax({
		    url : 'deletePhoto?id='+id,      
		    success : function(response){
		    	alert("Map Deleted Successfully.")
		    	photoGallaryList();
		    }
		   
		});
  } */
  
</script>

 <script>
$( document ).ready(function() {
	$("#mapList").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script>
</body>
</html>