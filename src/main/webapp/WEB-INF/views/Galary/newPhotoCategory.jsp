
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<h1>
					Images Category Form <small>Preview</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="home"><i class="fa fa-dashboard"></i> Home</a></li>					
					<li class="active">Image Category Dashboard</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="box-body">
					<div class="box box-default">
						<div class="box-header with-border">
							<!-- <h3 class="box-title">Module</h3> -->
						</div>
						<!-- /.box-header -->

						<div class="box-body">

							<form action="" id="SubCategoryForm?${_csrf.parameterName}=${_csrf.token}">

<div class="box-header">
              <h3 class="box-title">Select Category Here...</h3>
            </div>
           <!--  <div class="row">
				<div class="form-group col-md-12">
				<div class="col-md-3">
					<label class=" control-lable" for="tendorStatus">Select Category</label>
					
				</div>	
					<div class="col-md-7">
						<div class="input-group">
						  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
						  <select name="tendorStatus" id="GalaryStatus" class="form-control">
						  	<option selected="selected" value="All">All</option>
						  	<option value="Parlimentary Committee Inspection Meeting">Photo Gallery of Parlimentary Committee Inspection Meeting for Rajbhasa dated 02.05.2018 </option>
						  	<option value="SWACHCHHATA GALARY">Photo Gallery for Swachchhata Pakhwada</option>
						  	<option value="GALARY">Galary</option>
						  
						  </select>
					    </div> 
						</div>
						<span style="color: red" id="GalaryStatusError"></span>
					</div>
				</div>
         -->


								<div class="row" id="SubcategoryDiv">
									<div class="form-group col-md-12">
										<label class="col-md-3 control-lable" for="PhotocategoryError">Enter Category Name</label> <span style="color: red"
											id="PhotocategoryError"></span>
										<div class="col-md-7">
											<input type="text" name="Photocategory" id="Photocategory" class="form-control" onkeyup="GetSpecailCharactor()"/>
										</div>
									</div>
								</div>


								<div class="box-header with-border">
									<table>
										<tr>
											<td>
												<button type="button" id="submitForm" onclick="sendData()" class="btn bg-olive btn-flat margin">Submit</button>
											</td>
										</tr>
									</table>
								</div>


								<div class="form-group col-md-12" id="B">

									<span style="color: red" id="departmentNameError"></span>
									<div class="col-md-7">
										<%-- 					
 --%>
										<div id="A">
											<input type="text"
												value="No Data Availbale For Selectd Category"
												style="display: none" id="EmptyMsg">
										</div>
									</div>
								</div>



							</form>
						</div>

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
	$(document).ready(function(){	
		 $("#submitForm").on("click", function(){
		     
		   
		var x = document.getElementById("Photocategory").value;
	   if(x==""){
		   document.getElementById("PhotocategoryError").innerHTML="*";
	       document.getElementById("Photocategory").focus();
	       return false;
	   }
	   else
		   {
		   document.getElementById("PhotocategoryError").innerHTML="";
		   return true;
		   }
	   
		 });	
	});
	$(document).ready(function(){	
		 $("#submitForm").on("click", function(){
		     
		   
		/* var x = document.getElementById("GalaryStatus").value;
		//alert(x);
	   if(x=="All"){
		   document.getElementById("GalaryStatusError").innerHTML="*";
	       document.getElementById("GalaryStatus").focus();
	       return false;
	   }
	   else
		   {
		   document.getElementById("GalaryStatusError").innerHTML="";
		   return true;
		   } */
	   
		 });	
	});
		function sendData() {
			var p = document.getElementById("Photocategory").value;
			//var g = document.getElementById("GalaryStatus").value;
			if(p==""){
				return false;
				alert("Please Fill All Inputs");
				
			}
			else
				{
				
				
			var issueHTML = '<table id="example2" class="table table-bordered table-striped  form-group col-md-12">'
					+ '<thead>'
					+ '<tr><th>S.N.</th><th>Category</th><th>Action</th><th>Action</th><th>Action</th></tr>'
					+ '</thead>' + '<tbody>';

			//alert("hi");
			var Photocategory = $("#Photocategory").val();
			var type = $("#GalaryStatus").val();
			

			//	var CateID = $("#userIDc").val();
			//	alert(Photocategory);
			//alert(CateID);
			$
					.ajax({
						url : "AddPhotoCategory?Photocategory="+Photocategory+"&type="+type,
						
						success : function(response) {
							alert("Photo Category  Addedd Sussefully");
							for (var i = 0; i < response.length; i++) {
								var j = i+1;
								issueHTML+='<tr> <td>'+j+'</td>'+
								'<td >'+response[i].galary_cate_name+'</td>'+ 
								
							

								' <td><a href="AddImagesInCategory?id='
								+ response[i].id
								+ '" class="btn btn-success">Add Phots</a><br></td>'
								+ ' <td><a href="ViewImagesByCategory?id='
								+ response[i].id
								+ '" class="btn btn-success">View Photos</a><br></td>'
								+

								'<td>'
								+ '<input type=button value=DeleteCategory   class="btn btn-success" id="AB"  onclick="myFunction(${"'
								+ response[i].id
								+ '"})"/>' + '</td>';


							}

							issueHTML += '</tbody></table>';

							$("#A").html(issueHTML);

							document.getElementById("Photocategory").value = "";
							/* '<td>'+"<a href "+ "onclick="+"abc()"+    ">"+"Delete SubCategory</a>"+'</td>'; */
						},

						error : function(response) {
							alert("Error " + response);
						}
					});
				}
		}
	</script>


	<script>
		$(document)
				.ready(
						function() {
							var issueHTML = '<table id="example2" width:100px class="table table-bordered table-striped " >'
									+ '<thead>'
									+ '<tr><th>S.N.</th><th >Category</th><th>Action</th><th>Action</th><th>Action</th></tr>'
									+ '</thead>' + '<tbody>';

							$
									.ajax({
										url : "GalaryCategoryList",

										success : function(response) {
											//alert(response);

											for(var i=0;i<response.length;i++){
												var j = i+1;
												issueHTML+='<tr> <td>'+j+'</td>'+
												'<td style=max-width:100% >'+response[i].galary_cate_name+'</td>'+ 
											

												' <td><a href="AddImagesInCategory?id='
												+ response[i].id
												+ '" class="btn btn-success">Add Phots</a><br></td>'
												+ ' <td><a href="ViewImagesByCategory?id='
												+ response[i].id
												+ '" class="btn btn-success">View Photos</a><br></td>'
												+

												'<td>'
												+ '<input type=button value=DeleteCategory   class="btn btn-success" id="AB"  onclick="myFunction(${"'
												+ response[i].id
												+ '"})"/>' + '</td>';

									}
											issueHTML += '</tbody></table>';
											$("#A").html(issueHTML);

											/* '<td>'+"<a href "+ "onclick="+"abc()"+    ">"+"Delete SubCategory</a>"+'</td>'; */
										},

										error : function(response) {
											alert("Error " + response);
										}
									});
					
						});
	</script>
	<script>
		function myFunction(id) {

			var issueHTML = '<table id="example2" class="table table-bordered table-striped">'
					+ '<thead>'
					+ '<tr><th>S.N.</th><th>Category</th><th>Action</th></tr>'
					+ '</thead>' + '<tbody>';

			alert("Delete This Category?");

			$
					.ajax({
						url : "DeleteCategory?id=" + id,

						success : function(response) {
							for (var i = 0; i < response.length; i++) {
								var j = i+1;
								issueHTML+='<tr> <td>'+j+'</td>'+
								'<td >'+response[i].galary_cate_name+'</td>'+ 
								

								' <td><a href="AddImagesInCategory?id='
								+ response[i].id
								+ '" class="btn btn-success">Add Phots</a><br></td>'
								+ ' <td><a href="ViewImagesByCategory?id='
								+ response[i].id
								+ '" class="btn btn-success">View Photos</a><br></td>'
								+

								'<td>'
								+ '<input type=button value=DeleteCategory   class="btn btn-success" id="AB"  onclick="myFunction(${"'
								+ response[i].id
								+ '"})"/>' + '</td>';


							}
							issueHTML += '</tbody></table>';
							$("#A").html(issueHTML);
						},

						error : function(response) {
							alert("Error " + response);
						}
					});
		}
	</script>
	<script>
		/* FILE VALIDATION */
		$(function() {
			$('input[type=file]')
					.change(
							function() {
								var val = $(this).val().toLowerCase(), regex = new RegExp(
										"(.*?)\.(jpg|png)$");
								var filesizeinMB = 2094127;
								var size = this.files[0].size;
								var type = this.files[0].type;

								var fruits = new Array("image/png", "image/JPG");
								for (var j = 0; j < fruits.length; j++) {
									if (fruits[j] == type) {
									}
								}

								if (!(regex.test(val))) {
									$(this).val('');
									alert('You must select an image file only');
								}
								if (size > filesizeinMB) {
									$(this).val('');
									alert('Can Not Upload File Greater than 2MB');
								}

							});
		});
	</script>
	<script>
function GetSpecailCharactor(){
	
    var departments = "GetSpecailCharactor";
	 $.ajax({
			url:"GetSpecailCharactor?departments="+departments,
			success:function(response){
		     for(var i=0;i<response.length;i++){
					 var addressinput;
					
					
					 var validationName = document.getElementById("Photocategory").value;
				//	alert(validationName);
					   $(".form-control").change(function() {
		              addressinput = $(this).val();
		                });
					   if(new RegExp(response[i]).test(validationName))
					    {
					
						   var replace =   document.activeElement.value.replace(response[i], '');
						    document.getElementById(document.activeElement.id).value=replace;
                             }
				       else{}
				          }
				          },
			error:function(response){
	        	alert("Error");
	        }
		}); 
	 
	} 
</script>
</body>
</html>