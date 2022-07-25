
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
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
  <script src="resources/js/notice.js"></script>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<jsp:include page="../includes/header.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Orders Registration Form  <!-- <small>Preview</small> --> </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Order  Elements</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form  action="saveOrders?${_csrf.parameterName}=${_csrf.token}" modelAttribute="orders"  commandName="orders"  enctype="multipart/form-data" class="form-horizontal" >
	<!-- Default box --><!-- method="POST" -->
  	 <div class="box-body">
  	
  	
  	<!--  <form method="POST" 
      enctype="multipart/form-data" 
      action="doUpload?${_csrf.parameterName}=${_csrf.token}">
      ... -->
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  	
  	
  	
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Basic Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <!--   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
          </div>
        </div>
     
        <form:hidden path="attachment.attachmentID" id="attachmentID"  class="form-control"/>
        <form:hidden path="noticeID" id="noticeID"  class="form-control"/>
        
         <!-- /.box-header -->
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="title">Title</label>
				<form:errors style="color: red"  path='title' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input type="text" path="title" id="title" class="form-control"/>
				    </div> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="title_hError">Title In Marathi</label>
				<form:errors style="color: red"  path='title_h' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input type="text" path="title_h" id="title_h" class="form-control"/>
				    </div> 
				</div>
			</div>
		</div>

		<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="description">Description</label>
					<form:errors style="color: red"  path='description' />
					<div class="col-md-7">	
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						<form:textarea type="text" path="description" id="description" class="form-control" />
					</div>	
					</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="date"> Date</label>
				<form:errors style="color: red"  path='date' />
				<div class="col-md-7">
				    <div class="input-group date" id="date">
					    <span class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>
					  <form:input  path="date" id="inputDate" class="form-control"/>
					</div>  
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="type">Type</label>
					<form:errors style="color: red"  path='type' />
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="type" class="form-control" id="type">
							<%-- <form:option value="HISTORY OF POSTING">HISTORY OF POSTING</form:option> --%>
							<form:option value="OFFICE ORDERS">OFFICE ORDERS</form:option>
							<form:option value="DESPOSITION LIST">DESPOSITION LIST</form:option>
							<form:option value="MINUTES OF MEETINGS">MINUTES OF MEETINGS</form:option>
							<form:option value="HQ POSTING ORDERS">HQ POSTING ORDERS</form:option>
							<form:option value="LIST OF HOLIDAYS">LIST OF HOLIDAYS</form:option>
							<form:option value="RAJBHASA:MINUTES OF QUARTERLY MEETINGS">RAJBHASA:MINUTES OF QUARTERLY MEETINGS</form:option>
							<form:option value="RAJBHASA:MINUTES FOR RAJBHASA PAKHWARA CELEBRATION">RAJBHASA:MINUTES FOR RAJBHASA PAKHWARA CELEBRATION</form:option>
							<form:option value="RAJBHASA:OTHER NOTICES">RAJBHASA:OTHER NOTICES</form:option>
							
							
						</form:select>
					</div>
				</div>
			</div>
		</div>
		

      </div>
      </div>
      </div>
      <!-- /.box -->           
      
      
       <div class="box-body">
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Other Information</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <!--   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
          </div>
        </div>
        
         <!-- /.box-header -->
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>		
		  		
			
		  		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="tags">Tags</label>
				<form:errors style="color: red"  path='tags' />
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-tags"></i></span>
						<form:input type="text" path="tags" id="tags" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="department">Department</label>
					<span style="color: red" id="departmentError"></span>
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="department.deptId" class="form-control" id="department">
							<c:if test="${orders.department.deptId >'0'}"><option selected="selected" value="${orders.department.deptId}">${orders.department.departmentName}</option></c:if>	
							<c:if test="${orders.department.deptId==''}"><option selected="selected" value="0">Select Department</option></c:if>				
							<c:forEach var="departments" items="${departments}">
								<option value="${departments.deptId}">${departments.departmentName}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row"  id="attach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Attachment</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-file"></i></span>
					  <%-- 	<input type="file" value="${tendors.attachment.attachmnt_name}" name="file" id="file" class="form-control"/>	 --%>			  
						<input type="file" name="file" id="file" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>	    		
		
		<div class="row"  id="showAttach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Attachment</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					<table  class="table table-striped">
            <thead>
            <tr>
              <th>S.N.</th>
		      <th>File Name</th>
		      <th>Download/View</th>
		      <th>Action</th>
            </tr>
            </thead>
            <tbody>
	            <tr>
	             		<td>${status.index + 1}</td>
						<td>${orders.attachment.attachmnt_name}</td>
						<td><a href="attachmentDownload?path=${orders.attachment.path}">Download</a></td>
						<td><input type="button" value="Delete" onclick="return deleteAttachment(id)" class="btn-success"></td>
	            </tr>   
            </tbody>
          </table>
				</div>
			</div>
		</div>	    
			  		  
		
		
	          <div class="box-footer">
                  <div class="form-actions floatRight">
					 <input type="submit" value="Save"  class="btn btn-primary btn-flat margin"><%--  or <a href="<c:url value='/admin'  id="Save" onclick="return myFunction()" />">Cancel</a> --%>
				 	 <input type="button" value="Cancel" onclick="location.href='ordersList'" class="btn btn-success">
				  	 <input type="reset" value="Reset"  class="btn">	
				  </div>
              </div> 
           </div>  
       
      </div>
      
      </div>
      <!-- /.box -->
     
      
     </form:form>   
     
      </div>
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

<input type="hidden" id="action" value="<%=session.getAttribute("action") %>" /> 
<script type="text/javascript">
$(function() {	
	//alert($("#attachmentID").val());
		var action=$("#action").val();
		//alert($("#action").val());
		$("#attach").hide();
		if(action=="newNotices"){
			$("#attach").show();
			$("#showAttach").hide();
			$("#file").prop('required',true);
			$('#file').attr('required', 'required');
		} 
		else if(action=="editNews"){
			//	alert($("#attachmentID").val());
				if($("#attachmentID").val()==0){
					$("#attach").show();
					$("#showAttach").hide();
					document.getElementById("showAttach").style.display = "none";
					$('#file').removeAttr('required');
					
				}else{
					$("#attach").hide();
					$("#showAttach").show();
					document.getElementById("showAttach").style.display = "";
					$('#file').attr('required', 'required');
					
				}  
			}
	});
	
	
	function deleteAttachment(){
		var attachmentID=$("#attachmentID").val();
		if (!confirm("Do you want to delete")){
		      return false;
		   }
	 	 $.ajax({
			url:"deleteAttachmentById?attachmentID="+attachmentID,
			success:function(response){			
				$("#attachmentID").val(0);
				$("#attach").show();
				$("#showAttach").hide();
			},
			error:function(){
	        	alert("Error");
	        }
		});
	}
	
</script>

	
<script type="text/javascript">
	 $("#date").datepicker({ autoclose: true, format: 'dd-mm-yyyy' });
		function myFunction(){
			if($("#attachmentID").val()==0){
				if(validateWithFile()){
					alert("Data Inserted Succesfully");
			 		return true;
		    	}else{
					return false;
				}
			}else{
				if(validateWithoutFile()){
					alert("Data Updated Succesfully");
			 		return true;
		   		 }else{
					return false;
				}  
			}
		}
</script>

<!-- <script>
$(document).ready(function(){	
	 $("#Save").on("click", function(){
	     
	   
	var x = document.getElementById("title_h").value;
  if(x==""){
	   document.getElementById("title_hError").innerHTML="* Required";
      document.getElementById("title_h").focus();
      return false;
  }
  else
	   {
	   document.getElementById("title_hError").innerHTML="";
	   return true;
	   }
  
	 });	
});
</script> -->
<script>
/* FILE VALIDATION */
  $(function () {
	    $('input[type=file]').change(function () {
	        var val = $(this).val().toLowerCase(),
	            regex = new RegExp("(.*?)\.(jpg|png)$");
	        var filesizeinMB = 2094127;
	        var size = this.files[0].size;
	        var type = this.files[0].type;
	        
	        var fruits = new Array("image/png", "image/JPG");
	        for(var j=0;j<fruits.length;j++){if(fruits[j]==type){}}
	        
	     
	      
	         if (!(regex.test(val))) {
	            $(this).val('');
	            alert('You must select an image file only');
	        }
	        if ( size>filesizeinMB) {
	            $(this).val('');
	            alert('Can Not Upload File Greater than 2MB');
	        }
	       
	    });
	});


</script>
<!-- <script>
$(".form-control").keyup(function(){
	 var departments = "GetSpecailCharactor";
	 $.ajax({
			url:"GetSpecailCharactor?departments="+departments,
			success:function(response){
		     for(var i=0;i<response.length;i++){
					 var addressinput;
					
					
					  var title=document.getElementById("title").value;
					  var title_h=document.getElementById("title_h").value;
					
					  var tag=document.getElementById("tags").value;
					  var description=document.getElementById("description").value;
					
					   $(".form-control").change(function() {
		              addressinput = $(this).val();
		                });
					   if(new RegExp(response[i]).test(title) ||    new RegExp(response[i]).test(title_h) || new RegExp(response[i]).test(description) ||  new RegExp(response[i]).test(tag))
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
});

</script> -->


</body>
</html>