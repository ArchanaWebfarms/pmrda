<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
  %>
  <meta charset="UTF-8">
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
	
  <script src="resources/js/news.js"></script>
   <!-- jQuery 2.2.3 -->
<script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>

<style>

sup{
color:red;
}
</style>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<jsp:include page="../includes/header.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Taluka Registration Form  </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="talukaList">Taluka List</a></li>
        <li class="active">New Taluka</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form  action="saveTaluka?${_csrf.parameterName}=${_csrf.token}" modelAttribute="taluka"  enctype="multipart/form-data" class="form-horizontal" >
	<div class="box-body">
  	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}" />
		
  	      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Basic Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <!--   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
          </div>
        </div>
        
        <form:hidden path="id" id="id"  class="form-control"/>
      
        
         <!-- /.box-header -->
           <div class="box-body" >
            
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3  control-lable" >Taluka in English<sup>*</sup></label>				
				<form:errors style="color: red" path='taluka' />				
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input type="text" path="taluka" id="taluka1" class="form-control"  /> 
				    </div> 
				</div>				 
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3  control-lable" for="title_h">Taluka in Marathi<sup>*</sup></label>
				<form:errors style="color: red"  path='taluka_h' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input type="text" path="taluka_h" id="taluka_h" class="form-control" />
				    </div> 
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" >Total No.of Villages<sup>*</sup></label>
				<form:errors style="color: red"  path='total_villages' />
				<div class="col-md-7">
				 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <form:input type="text" path="total_villages" id="total_villages" class="form-control" />
				</div>						
				</div>
			</div>
		</div>
		
		<%-- <div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" >Total No.of Villages in Marathi<sup>*</sup></label>
				<form:errors style="color: red"  path='total_villages_h' />
				<div class="col-md-7">
				 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <form:input type="text" path="total_villages_h" id="total_villages_h" class="form-control" />
				</div>						
				</div>
			</div>
		</div> --%>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" >Remarks in English</label>
				<form:errors style="color: red"  path='remark' />
				<div class="col-md-7">
				 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <form:textarea type="text" path="remark" id="remark" class="form-control" />
				</div>						
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" >Remarks in Marathi</label>
				<form:errors style="color: red"  path='remark_h' />
				<div class="col-md-7">
				 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <form:textarea type="text" path="remark_h" id="remark_h" class="form-control" />
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
         
		<br>
		
		<div class="row"  id="attach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">English Attachment</label>
				<span style="color: red" id="englishError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-file"></i></span>					 
						<input type="file" name="english" id="english" class="form-control"  />
					 </div>	
				</div>
			</div>
		</div>	
		<div class="row"  id="attach1">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Marathi Attachment</label>
				<span style="color: red" id="marathiError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-file"></i></span>					 
						<input type="file" name="marathi" id="marathi" class="form-control"  />
					 </div>	
				</div>
			</div>
		</div>		    		
		
		<div id = "newdiv">			
		</div>
		
		<div class="row"  id="showAttach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">English Attachment</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					<table  class="table table-striped" id ="myTable">
            <thead>
            <tr>
              <th>S.N.</th>              
		      <th>File Name</th>		      
		      <th>Download</th>
		       <th>Action</th>
            </tr>
            </thead>
            <tbody>
              <c:forEach var="attachmentlist" items="${taluka.attachment}" varStatus="status">
              <c:if test="${attachmentlist.module_type eq 'English Attachment'}">   
	            <tr>
	             		<td>1</td>	             		
						<td>${attachmentlist.attachmnt_name}</td> 						
						<td><a id="no-link" href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">Download</a></td>
						<td><input type="button" value="Delete" onclick="return deleteAttachment(${attachmentlist.attachmentID},'${attachmentlist.module_type}')" class="btn-success"></td>
	            </tr> 
	            </c:if> 
	            </c:forEach> 
            </tbody>
            
          </table>
				</div>
			</div>
		</div>  
		
		
		<div class="row"  id="showMarathiAttach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Marathi Attachment</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					<table  class="table table-striped" id ="myTable">
            <thead>
            <tr>
              <th>S.N.</th>              
		      <th>File Name</th>		      
		      <th>Download</th>
		       <th>Action</th>
            </tr>
            </thead>
            <tbody>
              <c:forEach var="attachmentlist" items="${taluka.attachment}" varStatus="status">
              <c:if test="${attachmentlist.module_type eq 'Marathi Attachment'}">   
	            <tr>
	             		<td>1</td>	             		
						<td>${attachmentlist.attachmnt_name}</td> 						
						<td><a id="no-link" href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">Download</a></td>
						<td><input type="button" value="Delete" onclick="return deleteAttachment(${attachmentlist.attachmentID},'${attachmentlist.module_type}')" class="btn-success"></td>
	            </tr> 
	            </c:if> 
	            </c:forEach> 
            </tbody>
            
          </table>
				</div>
			</div>
		</div>   
			  		  
		
		
	          <div class="box-footer">
                  <div class="form-actions floatRight">
                  	
					 <input type="submit" value="Save" onclick=""  class="btn btn-primary btn-flat margin">
				 	 <input type="button" value="Cancel" onclick="location.href='talukaList'" class="btn btn-success">
				  	 <input type="reset" value="Reset"  class="btn">	
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
<script src="resources/dist/js/jquerysession.js"></script>
<!-- Page script -->


<input type="hidden" id="action" value="${action}" /> 
<input type="hidden" id="size" value="${size}" /> 

<script type="text/javascript">
$(function() {
	
	var action=$("#action").val();
	if(action=="new"){
		$("#showAttach").hide(); 
		$("#showMarathiAttach").hide();
		$('#english').attr('required', 'required');
		$('#marathi').attr('required', 'required');
	}else if(action=="edit"){
		var size=$("#size").val();
		if(size>0){
			$("#showAttach").show();
			$("#showMarathiAttach").show();
			$("#attach").hide();
			$("#attach1").hide();
		}else{
			$("#showAttach").hide();
			$("#showMarathiAttach").hide();
			$("#attach").show();
			$("#attach1").show();
			$('#english').attr('required', 'required');
			$('#marathi').attr('required', 'required');
		}
		
	}
});

 

function deleteAttachment(id,type){		
	if (!confirm("Do you want to delete")){
	      return false;
	   }
	if(type=='English Attachment'){
		 $.ajax({
				url:"deleteAttachmentById?attachmentID="+id,
				success:function(response){							
					$("#attach").show();
					$("#showAttach").hide();
						
				},
				error:function(){
		        	alert("Error");
		        }
			}); 	
	}
	else{
		 $.ajax({
				url:"deleteAttachmentById?attachmentID="+id,
				success:function(response){	
					$("#attach1").show();	
					$("#showMarathiAttach").hide();		
				},
				error:function(){
		        	alert("Error");
		        }
			}); 
	}
 	
}
</script>
<script>
/* FILE VALIDATION */
  $(function () {
	    $('input[type=file]').change(function () {
	        var val = $(this).val().toLowerCase(),
	        regex = new RegExp("(.*?)\.(pdf)$");
	        
	        if (!(regex.test(val))) {            
	       	 alert("pdf file required")
	       	  $(this).val("");
	           return false;
	       }else{
	   		return true;
	   	}   
	       
	    });//change func
	});//funct

</script>
 <script>
$( document ).ready(function() {
	$("#talukaList").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script>
</body>
</html>