
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
      <h1> Current Opening Registration Form  </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="currOpeningList">Current Opening List</a></li>
        <li class="active">New Opening</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form  action="saveOpening?${_csrf.parameterName}=${_csrf.token}" modelAttribute="opening" commandName="opening"  enctype="multipart/form-data"   class="form-horizontal" >
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
				<label class="col-md-3  control-lable">Name of the Post in English<sup>*</sup></label>
				<form:errors style="color: red"  path='post' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input path="post" id="post" class="form-control"/>
				    </div> 
				</div>
			</div>
		</div>
		

	

		<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable">Name of the Post in Marathi<sup>*</sup></label>
					<form:errors style="color: red"  path='post_h' />
					<div class="col-md-7">	
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						<form:input  path="post_h" id="post_h" class="form-control" />
					</div>	
					</div>
			</div>
		</div>
		
		                     <div class="row">
				                  <div class="form-group col-md-12">
					               <label class="col-md-3 control-lable">Required Number<sup>*</sup></label>
					                <form:errors style="color: red"  path='total_vacancy' />
					                     <div class="col-md-7">	
					                           <div class="input-group">
					                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						                         <form:input  path="total_vacancy" id="total_vacancy" class="form-control" />
					                            </div>	
					                        </div>
			                           </div>
		                          </div>
		                          
		                          
		                          <%--  <div class="row">
				                  <div class="form-group col-md-12">
					               <label class="col-md-3 control-lable">Required Number in Marathi<sup>*</sup></label>
					                <form:errors style="color: red"  path='total_vacancy_h' />
					                     <div class="col-md-7">	
					                           <div class="input-group">
					                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						                         <form:input  path="total_vacancy_h" id="total_vacancy_h" class="form-control" />
					                            </div>	
					                        </div>
			                           </div>
		                          </div> --%>
		                          
		                          
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" >Department<sup>*</sup></label>
					
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="department.deptId" class="form-control" id="department">	
						<c:if test="${opening.department.deptId >'0'}"><option selected="selected" value="${opening.department.deptId}">${opening.department.departmentName}</option></c:if>		
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
        
		
		<div id="attach">
		<div class="row"  id="">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable">Title in English</label>
				<span style="color: red" id="titleError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <input type="text" name="atitle" id="atitle" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>
		
		<div class="row"  id="">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">English Attachment</label>
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
		</div>
		<div id="attach1">
			<div class="row"  id="">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable">Title in Marathi</label>
				<span style="color: red" id="titlehError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <input type="text" name="mtitle" id="mtitle" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>
		
		<div class="row"  id="">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Marathi Attachment</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-file"></i></span>
					  <%-- 	<input type="file" value="${tendors.attachment.attachmnt_name}" name="file" id="file" class="form-control"/> --%>				  
						<input type="file" name="marathi" id="marathi" class="form-control"  />
					 </div>	
				</div>
			</div>
		</div>		    		
		</div>	    		
		
		                    <div id = "newdiv"></div>
		
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
              <c:forEach var="attachmentlist" items="${opening.attachment}" varStatus="status">
              <c:if test="${attachmentlist.module_type eq 'English Attachment'}">   
	            <tr>
	             		<td>1</td>	             		
						<td>${attachmentlist.attachmnt_name}</td> 						
						<td><input type="button" value="Download" class="btn btn-primary btn-flat margin" onclick="return attachmentDownload(${attachmentlist.attachmentID})"/></td>								
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
              <c:forEach var="attachmentlist" items="${opening.attachment}" varStatus="status">
              <c:if test="${attachmentlist.module_type eq 'Marathi Attachment'}">   
	            <tr>
	             		<td>1</td>	             		
						<td>${attachmentlist.attachmnt_name}</td> 						
						<td><input type="button" value="Download" class="btn btn-primary btn-flat margin" onclick="return attachmentDownload(${attachmentlist.attachmentID})"/></td>								
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
                  	           <input type="submit" value="Save" id="Save" class="btn btn-primary btn-flat margin">
				 	           <input type="button" value="Cancel" onclick="location.href='currOpeningList'" class="btn btn-success">
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


<input type="hidden" id="size" value="${size}" /> 
<input type="hidden" id="action" value="${action}" /> 


<script>
$( document ).ready(function() {
	$("#currOpeningList").addClass("active");
  	$("#UserElement").addClass("active");
});
  </script>
<script type="text/javascript">
 $(function() {	
	
	 $("#attach").hide();
	 $("#attach1").hide();
	 $("#showAttach").hide();
	 $("#showMarathiAttach").hide();		
		
		var action=$("#action").val();
		var size=$("#size").val();
		
		if(action=="newOpening"){
			$("#attach").show();
			$("#attach1").show();
			$("#showAttach").hide();
			$("#showMarathiAttach").hide();		
		} 
		else if(action=="editOpening"){			
		        
		        	$("#showAttach").show();
		        	$("#showMarathiAttach").show();		
		        	$("#attach").hide();
					$("#attach1").hide();					
		        	
		}
		
		$('#Save').bind("click",function() 
			    { 
			    	var action=$("#action").val();
			    	
			    	if(action=="newOpening"){
			    		$('#english').attr('required', 'required');
			    		$('#marathi').attr('required', 'required');
			    		$('#mtitle').attr('required', 'required');
			    		$('#atitle').attr('required', 'required');
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
	        var filesizeinMB = 2094127;
	        var size = this.files[0].size;
	        var type = this.files[0].type;
	         var fruits = new Array("pdf ");
	        for(var j=0;j<fruits.length;j++){
	        	if(fruits[j]==type){
	        	}//if
	        }//for
	         if (!(regex.test(val))) {
	            $(this).val('');
	            alert('You must select pdf file only');
	        }//if
              //if
	       });//change func
	});//funct
</script>
<script>
function deleteAttachment(id,type){
	
	if (!confirm("Do you want to delete")){
	      return false;
	   }else{
	if(type=='English Attachment'){
		 $.ajax({
				url:"deleteAttachmentById?attachmentID="+id,
				method:"post",		
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
				method:"post",	
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
}

</script>

 <form:form  action="attachmentNewsDownload" id="viewAttachform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="attachid" name="id" />  
  </form:form>
  
<script type="text/javascript">
function attachmentDownload(id){
	  $("#attachid").val(id);
	  $("#viewAttachform").submit();
	  return true;
}

</script>

</body>
</html>