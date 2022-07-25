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
<script src="resources/js/department.js"></script>
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
      <h1> New Department Registration Form</h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="departmentList">Department List</a></li>
        <li class="active">New Department</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

	<!-- Default box -->
   <div class="box-body">
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
        
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <!--   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
          </div>
        </div>
        
         <!-- /.box-header -->
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>
		<form:form action="saveDepartmentRegistration?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="departments" commandName="departments" enctype="multipart/form-data" class="form-horizontal">
			
			
			<form:hidden path="deptId" id="deptId" class="form-control"/>
			<%-- <form:hidden path="attachment" id="aid" class="form-control"/> --%>
			
			<input type="hidden" id="dptName" value="">
		   <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="departmentName">Department Name in English</label>
					<form:errors style="color: red"  path='departmentName' />
					<div class="col-md-7">
						<form:input type="text" path="departmentName" id="departmentName" class="form-control"/>						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="title_h">Department Name in Marathi</label>
					<form:errors style="color: red"  path='departmentName_h' />
					<div class="col-md-7">
						<form:input type="text" path="departmentName_h"  id="title_h" class="form-control"/>						
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="description">About the Department in English</label>
				<form:errors style="color: red"  path='description' />
					<div class="col-md-7">
						<form:textarea path="description" id="description" class="form-control"/>						
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="description">About the Department in Marathi</label>
				<form:errors style="color: red"  path='description_h' />
					<div class="col-md-7">
						<form:textarea path="description_h" id="description_h" class="form-control"/>						
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="objectives">Objectives in English</label>
				<form:errors style="color: red"  path='objectives' />
					<div class="col-md-7">
						<form:textarea path="objectives" id="objectives" class="form-control"/>						
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="objectives_h">Objectives in Marathi</label>
				<form:errors style="color: red"  path='objectives_h' />
					<div class="col-md-7">
						<form:textarea path="objectives_h" id="objectives_h" class="form-control"/>						
					</div>
				</div>
			</div>
			          
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="functions">Functions in English</label>
				<form:errors style="color: red"  path='functions' />
					<div class="col-md-7">
						<form:textarea path="functions" id="functions" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="functions_h">Functions in Marathi</label>
				<form:errors style="color: red"  path='functions_h' />
					<div class="col-md-7">
						<form:textarea path="functions_h" id="functions_h" class="form-control"/>						
					</div>
				</div>
			</div> 			  
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="roles_and_responsibility">Roles and Responsibility in English</label>
				<form:errors style="color: red"  path='roles_and_responsibility' />
					<div class="col-md-7">
						<form:textarea path="roles_and_responsibility" id="roles_and_responsibility" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="roles_and_responsibility_h">Roles and Responsibility in Marathi</label>
				<form:errors style="color: red"  path='roles_and_responsibility_h' />
					<div class="col-md-7">
						<form:textarea path="roles_and_responsibility_h" id="roles_and_responsibility_h" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="projects">Projects in English</label>
				<form:errors style="color: red"  path='projects' />
					<div class="col-md-7">
						<form:textarea path="projects" id="projects" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="projects_h">Projects in Marathi</label>
				<form:errors style="color: red"  path='projects_h' />
					<div class="col-md-7">
						<form:textarea path="projects_h" id="projects_h" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="achievements">Achievements in English</label>
				<form:errors style="color: red"  path='achievements' />
					<div class="col-md-7">
						<form:textarea path="achievements" id="achievements" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for=achievements_h>Achievements in Marathi</label>
				<form:errors style="color: red"  path='achievements_h' />
					<div class="col-md-7">
						<form:textarea path="achievements_h" id="achievements_h" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="salient_features">Salient Features in English</label>
				<form:errors style="color: red"  path='salient_features' />
					<div class="col-md-7">
						<form:textarea path="salient_features" id="salient_features" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="salient_features_h">Salient Features in Marathi</label>
				<form:errors style="color: red"  path='salient_features_h' />
					<div class="col-md-7">
						<form:textarea path="salient_features_h" id="salient_features_h" class="form-control"/>						
					</div>
				</div>
			</div>    
			<hr>
			  <div class="box-header with-border">
          <h3 class="box-title">More Information<small>&nbsp;(if required)</small></h3>
        </div>
        <br>
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="other_title">Title in English</label>
				<form:errors style="color: red"  path='other_title' />
					<div class="col-md-7">
						<form:input path="other_title" id="other_title" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="other_title_h">Title in Marathi</label>
				<form:errors style="color: red"  path='other_title_h' />
					<div class="col-md-7">
						<form:input path="other_title_h" id="other_title_h" class="form-control"/>						
					</div>
				</div>
			</div> 
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="other_content">Content in English</label>
				<form:errors style="color: red"  path='other_content' />
					<div class="col-md-7">
						<form:textarea path="other_content" id="other_content" class="form-control"/>						
					</div>
				</div>
			</div> 
			
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="other_content_h">Content in Marathi</label>
				<form:errors style="color: red"  path='other_content_h' />
					<div class="col-md-7">
						<form:textarea path="other_content_h" id="other_content_h" class="form-control"/>						
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
        
		
		<br>
		<div class="row"  id="attach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Hierarchy Chart in English</label>
				<span style="color: red" id="fileError"></span>
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
				<label class="col-md-3 control-lable" for="attachment">Hierarchy Chart in Marathi</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-file"></i></span>					
						<input type="file" name="marathi" id="marathi" class="form-control"  />
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
              <c:forEach var="attachmentlist" items="${departments.attachment}" varStatus="status">
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
              <c:forEach var="attachmentlist" items="${departments.attachment}" varStatus="status">
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
					 <input type="submit" value="Save" id="Save"  class="btn btn-primary"><%--  onclick="return save()" --%>
				  	 <input type="button" value="Cancel" onclick="location.href='departmentList'" class="btn btn-success">
				  	 <input type="reset" value="Reset"  class="btn">	
				  </div>
              </div>  
	          </div>
	          </div>
	               
	                            
	              </form:form>                        
     
           </div>     
        
        
        <!-- <div class="box-footer">
          Visit <a href="https://select2.github.io/">Select2 documentation</a> for more examples and information about
          the plugin.
        </div> -->
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
<script>
$( document ).ready(function() {
	$("#departmentList").addClass("active");
  	$("#UserElement").addClass("active");
});
  </script>
<script type="text/javascript">
function checkDepartment(){
	 var departmentName=document.getElementById("departmentName").value;
	 if(departmentName){
		 $.ajax({
				url:"checkDepartment?departmentName="+departmentName,
				success:function(response){	
					//alert("response.departmentName "+response.departmentName);
					$("#dptName").val("");
					if(response.departmentName != null){
						//alert(response.departmentName);
						$("#dptName").val(response.departmentName);
						return false;
					}return true;
				}
			});
	  }else{
		  $("#dptName").val("");
			return false; 
	 }
	}
		
</script>
<script>
$(document).ready(function(){	
	
	 $("#attach").hide();
	 $("#attach1").hide();
	 $("#showAttach").hide();
	 $("#showMarathiAttach").hide();		
		
		var action=$("#action").val();
		var size=$("#size").val();
		
		if(action=="new"){
			$("#attach").show();
			 $("#attach1").show();
			$("#showAttach").hide();
			$("#showMarathiAttach").hide();		
		} 
		else if(action=="edit"){
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
			}
		        	
		}   
		
		
	    
		
});

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
}

</script>
</body>
</html>