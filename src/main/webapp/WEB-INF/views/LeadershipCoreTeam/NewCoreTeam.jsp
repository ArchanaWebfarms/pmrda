
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
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
	
  <script src="resources/js/tenders.js"></script>
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
      <h1> Core Team Registration Form   </h1>
      <ol class="breadcrumb">      
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="leadershipCoreteamDash">Leadership and Core Team Dashboard</a></li>
        <li><a href="coreteamList">Core Team List</a></li>
        <li class="active">New Core Team</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form  action="saveCoreTeam?${_csrf.parameterName}=${_csrf.token}" modelAttribute="leader" commandName="leader"  enctype="multipart/form-data"   class="form-horizontal" >
	<!-- Default box --><!-- method="POST" -->
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
        <div class="box-body" >
             <%--  <%String add=null;%>	 --%>
             
             <div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3  control-lable">Sequence<sup>*</sup></label>
				<form:errors style="color: red"  path='sequence' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input path="sequence" id="sequence" class="form-control"/>
				    </div> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3  control-lable">Name in English<sup>*</sup></label>
				<form:errors style="color: red"  path='name' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input path="name" id="name" class="form-control"/>
				    </div> 
				</div>
			</div>
		</div>
		

	

		<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable">Name in Marathi<sup>*</sup></label>
					<form:errors style="color: red"  path='name_h' />
					<div class="col-md-7">	
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						<form:input  path="name_h" id="name_h" class="form-control" />
					</div>	
					</div>
			</div>
		</div>
		
		                     <div class="row">
				                  <div class="form-group col-md-12">
					               <label class="col-md-3 control-lable">Position in English<sup>*</sup></label>
					                <form:errors style="color: red"  path='positon' />
					                     <div class="col-md-7">	
					                           <div class="input-group">
					                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						                         <form:input  path="positon" id="positon" class="form-control" />
					                            </div>	
					                        </div>
			                           </div>
		                          </div>
		                          
		                            <div class="row">
				                  <div class="form-group col-md-12">
					               <label class="col-md-3 control-lable">Position in Marathi<sup>*</sup></label>
					                <form:errors style="color: red"  path='positon_h' />
					                     <div class="col-md-7">	
					                           <div class="input-group">
					                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						                         <form:input  path="positon_h" id="positon_h" class="form-control" />
					                            </div>	
					                        </div>
			                           </div>
		                          </div>
		                          
	                <div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" >Department<sup>*</sup></label>
					
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="department.deptId" class="form-control" id="department">	
						<c:if test="${leader.department.deptId >'0'}"><option selected="selected" value="${leader.department.deptId}">${leader.department.departmentName}</option></c:if>		
							<c:forEach var="departments" items="${departments}">
								<option value="${departments.deptId}">${departments.departmentName}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>
			</div>
		</div>
		        

		
	      </div>
	      
	    <div class="box-body">
         <!-- SELECT2 EXAMPLE -->
                    <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Other Information</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
         
          </div>
        </div>
        
		
		
		<div class="row"  id="attach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Photo</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-file"></i></span>
					  <%-- 	<input type="file" value="${tendors.attachment.attachmnt_name}" name="file" id="file" class="form-control"/> --%>				  
						<input type="file" name="english" id="english" class="form-control"  />
					 </div>	
				</div>
			</div>
		</div>	
		
		
		                    <div id = "newdiv"></div>
		
		<div class="row"  id="showAttach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Photo</label>
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
           <c:forEach var="attachmentlist" items="${leader.attachment}" varStatus="status">
	            <tr>
	             		<td>1</td>	             		
						<td>${attachmentlist.attachmnt_name}</td> 						
						<td><a id="no-link" href="attachmentNewsDownload?id=${attachmentlist.attachmentID}">Download</a></td>
						<td><input type="button" value="Delete" onclick="return deleteAttachment(${attachmentlist.attachmentID})" class="btn-success"></td>
	            </tr> 
	           </c:forEach>      
            </tbody>
            
          </table>
				</div>
			</div>
		</div>  
		
			 		  
		
		
	                  <div class="box-footer">
                          <div class="form-actions floatRight">
                  	           <input type="submit" value="Save" id="Save" class="btn btn-primary btn-flat margin">
				 	           <input type="button" value="Cancel" onclick="location.href='coreteamList'" class="btn btn-success">
				  	           <input type="reset" value="Reset"  class="btn">	
				           </div><!-- 264 -->
                        </div> <!-- 263 -->
                </div> <!--   164-->
            </div><!--  162-->
        </div><!--  78-->
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



<input type="hidden" id="action" value="${action}" /> 

<input type="hidden" id="size" value="${size}" /> 

<script type="text/javascript">
 $(function() {	
	
	 $("#attach").hide();	
	 $("#showAttach").hide();
		
		var action=$("#action").val();
		var size=$("#size").val();
		
		if(action=="new"){
			$("#attach").show();
			$("#showAttach").hide();
		} 
		else if(action=="edit"){
			if(size>0){
				$("#showAttach").show();
				$("#attach").hide();					
	        	
			}else{
				$("#showAttach").hide();
				$("#attach").show();					
	        	
			}
		        	
		}
		
		$('#Save').bind("click",function() 
			    { 
			    	var action=$("#action").val();
			    	
			    	if(action=="new"){
			    		$('#english').attr('required', 'required');			    		
			    	}
			    	
			    }); 
	    
	}); 
	
	
 
	
</script>

<script>
/* FILE VALIDATION */
  $(function () {
	    $('input[type=file]').change(function () {
	        var val = $(this).val().toLowerCase(),
	            regex = new RegExp("(.*?)\.(pdf)$");
	       
	        
	         if ((regex.test(val))) {
	            $(this).val('');
	            alert('You must select image file only');
	        }//if
              //if
	       });//change func
	});//funct
</script>
<script>
function deleteAttachment(id){
	
	if (!confirm("Do you want to delete")){
	      return false;
	   }else{
	
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
}

</script>

<script>
$( document ).ready(function() {
	$("#leadershipCoreteamDash").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script> 
</body>
</html>