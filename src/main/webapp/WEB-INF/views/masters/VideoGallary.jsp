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
								 <h1> Video Gallery  </h1>
								<ol class="breadcrumb">
									<li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>		
									<li><a href="videoGallaryList">Video Gallery</a></li>						
									<li class="active">New Video</li>
								</ol>
							</section>
<hr>
							<!-- Main content -->
							<section class="content">

								<!-- Default box -->
								<div class="box-body">
									<div class="row">
										<form method="POST"
										action="uploadVideoGallary?${_csrf.parameterName}=${_csrf.token}"
										enctype="multipart/form-data">
										<input type="hidden" value="${video.id}" name="id" id="id">
										<div class="row" id="attach">
											<div class="form-group col-md-12">
												<label class="col-md-3 control-lable" >Title in English
												</label> <span style="color: red" id="titleError"></span>
												<div class="col-md-7">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-pencil"></i></span>														
														<input type="text" name="title" id="title" value="${video.title}" class="form-control" />
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
														<input type="text" name="title_h" id="title_h" value="${video.title_h}" class="form-control" />
													</div>
													
												</div>
											</div>
										</div>
										<div class="row" id="attach">
											<div class="form-group col-md-12">
												<label class="col-md-3 control-lable" for="attachment">Video Link
												</label> <span style="color: red" id="linkError"></span>
												<div class="col-md-7">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-pencil"></i></span>
														<%-- 	<input type="file" value="${tendors.attachment.attachmnt_name}" name="file" id="file" class="form-control"/> --%>
														<input type="text" name="link" id="link" value="${video.link}"
															class="form-control" />

													</div>
													
												</div>
											</div>
										</div>


										<div class="box-footer">
											<div class="form-actions floatRight">
												<input type="submit" value="Save" id="Save"
													class="btn btn-primary btn-flat margin"> 
													<input type="button" value="Cancel" onclick="location.href='videoGallaryList'" class="btn btn-success">&nbsp;&nbsp;
				  									 <input type="reset" value="Reset"  class="btn">	
											</div>
										</div>

									</form>

								</div>
								</div>
								<!-- /.box -->
							</section>
						<!-- 	<div class="form-group col-md-12">
									<div id="data"></div>
								</div> -->
							
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
  $('#Save').bind("click",function(){		     
		    		
		    		validateTitle();
		    		validateTitleH();
		    		validateFile();
		    		
		    		if(validateTitle() && validateTitleH() && validateFile()){
		    			alert("Video Saved Successfully.");
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
	  var title=$("#link").val();
	  if(title==""){
		  document.getElementById("linkError").innerHTML="**Required";
  			return false;
	  }else{
		  document.getElementById("linkError").innerHTML=" ";
		  return true;
	  }
  }
  
 /*  function photoGallaryList(){
	  
			var issueHTML = '<div class="box"><div class="box"><div class="box-header"><h3 class="box-title">Photo Gallary Data Table</h3></div>'+
			'<div class="box-body"><table id="example1" class="table table-bordered table-striped">'+ 
			'<thead><tr><th>S.N.</th><th>Title in English</th><th>Title in Marathi</th>'+
			'<th id="tableAction">Action</th><th id="tableAction">Action</th></tr>'+
			'</thead>'+
			'<tbody>';	
			
			$.ajax({
			    url : 'photoGallaryList?type=GALLARY',      
			    success : function(response){
			    	console.log(response)
			    	for(var i=0;i<response.length;i++){			    		
			    			var j = i+1;
							issueHTML+='<tr> <td>'+j+'</td>'+
							'<td>'+response[i].title+'</td>'+	
							'<td>'+response[i].title_h+'</td>'+							
							'<td><a href="staticResources/galary/'+ response[i].attachmnt_name+ '" target="_blank" class="btn btn-success">View Photo</a><br></td>'+
							'<td><input type="button" value="Delete Photo" class="btn btn-success" id="AB"  onclick="myFunction(${"'+ response[i].attachmentID+ '"})"/>' + '</td>';
			    								
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
		    	alert("Photo Deleted Successfully.")
		    	photoGallaryList();
		    }
		   
		});
  } */
  
</script>
<script>
$( document ).ready(function() {
	$("#videoGallaryList").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script>

</body>
</html>