
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
<style>
sup{
color:red;
}
</style>
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
      <h1> Notifications Registration Form   </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="noticesList">Notifications List</a></li>
        <li class="active">New Notifications</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form  action="saveNotices?${_csrf.parameterName}=${_csrf.token}" modelAttribute="notices"  commandName="notices" enctype="multipart/form-data" class="form-horizontal" >
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
     
      <%--   <form:hidden path="attachment.attachmentID" id="attachmentID"  class="form-control"/> --%>
        <form:hidden path="noticeID" id="noticeID" name="noticeID"  class="form-control"/>
        
         <!-- /.box-header -->
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="title">Title in English<sup>*</sup></label>
				<form:errors style="color: red"  path='title' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					  <form:input type="text" path="title" id="title" class="form-control"/>
				    </div> 
				</div>
				<span style="color: red" id="titleError"></span>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="title">Title In Marathi<sup>*</sup></label>
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
					<label class="col-md-3 control-lable" for="type">Type<sup>*</sup></label>
					<form:errors style="color: red"  path='type' />
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="type" class="form-control" id="types" onchange="chooseType()"><!-- onChange="myNewFunction(this);" -->
						<c:if test="${not empty notices.type}"><option selected="selected" value="${notices.type}">${notices.type}</option></c:if>	
						<form:option value="">Select Type</form:option>
							<%-- <form:option value="NOTICE">NOTICE</form:option>
							<form:option value="DOWNLOADS">DOWNLOADS</form:option> --%>
							<form:option value="CIRCULERS">NOTIFICATIONS</form:option>
							<form:option value="PRESS NOTES">PRESS RELEASE</form:option>
							<%-- <form:option value="QUOTATIONS">QUOTATIONS</form:option> --%>
							<form:option value="CENTRAL GOV GR">GOVERNMENT RESOLUTION</form:option>
							<form:option value="STATE GOV GR">ACTS & RULES</form:option>
							<form:option value="POLICIES">POLICIES</form:option>
							<%-- <form:option value="NOTIFICATION">NOTIFICATION</form:option> --%>
							<form:option value="RTI">PROACTIVE DISCLOSURES</form:option>
							<form:option value="PMAY">PMAY</form:option>
							<form:option value="MEDIA CENTER">MEDIA CENTER</form:option>
							
						</form:select>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="display: none;" id="subtypeDiv">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="subtype">Subtype<sup>*</sup></label>
					<form:errors style="color: red"  path='subtype' />
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="subtype" class="form-control" id="subtype" ><!-- onChange="myNewFunction(this);" -->
						<c:if test="${not empty notices.subtype}"><option selected="selected" value="${notices.subtype}">${notices.subtype}</option></c:if>	
						<%-- <form:option value="">Select Type</form:option>		 --%>					
							<form:option value="Acts">ACTS</form:option>
							<form:option value="Rules">RULES</form:option>
							
						</form:select>
					</div>
				</div>
			</div>
		</div>
		
<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="department">Department<sup>*</sup></label>
					<span style="color: red" id="departmentError"></span>
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="department.deptId" class="form-control" id="department">
							<c:if test="${notices.department.deptId >'0'}"><option selected="selected" value="${notices.department.deptId}">${notices.department.departmentName}</option></c:if>	
							<%-- <c:if test="${notices.department.deptId==''}"><option selected="selected" value="0">Select Department</option></c:if>				 --%>
							<c:forEach var="departments" items="${departments}">
								<option value="${departments.deptId}">${departments.departmentName}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>
			</div>
		</div>

<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="date">Date<sup>*</sup></label>
				<form:errors style="color: red"  path='publish_date' />
				<div class="col-md-7">
				    <div class="input-group date" id="date">
					    <span class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>
					  <form:input  path="publish_date" id="inputDate" class="form-control"/>
					</div>  
				</div>
			</div>
		</div>


		<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="description">Description in English</label>
					<form:errors style="color: red"  path='description' />
					<div class="col-md-7">	
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						<form:textarea type="text" path="description" id="description" class="form-control" />
					</div>	
					</div>
					<span style="color: red" id="descriptionError"></span>
			</div>
		</div>

		<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="description_h">Description in Marathi</label>
					<form:errors style="color: red"  path='description_h' />
					<div class="col-md-7">	
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						<form:textarea type="text" path="description_h" id="description_h" class="form-control" />
					</div>	
					</div>
					<span style="color: red" id="descriptionError"></span>
			</div>
		</div>
		
		
		
		
	<%-- 	<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="date1">Closing Date</label>
				<form:errors style="color: red"  path='closingDate' />
				<div class="col-md-7">
				    <div class="input-group date" id="date1">
					    <span class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>
					  <form:input  path="closingDate" id="inputDate" class="form-control"/>
					</div>  
				</div>
			</div>
		</div> --%>
		
		
		
		
		
		

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
		  		
			
		  		
		
		
		
		
		<div class="row"  id="">
			<div class="form-group col-md-12">
					<button type="button"  id ="AddMoreFields" class="btn bg-olive btn-flat margin">Add More Attachments</button>
				</div>
			</div>
		</div>
		
		<div  id="attach">
		<div class="row"  id="">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Title in English</label>
				<span style="color: red" id="titleError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <input type="text" name="atitle" id="atitle1" class="form-control"/>
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
						<input type="file" name="english" id="english1" class="form-control"  />
					 </div>	
				</div>
			</div>
		</div>	
		</div>
		<div  id="attach1">
		<div class="row" >
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Title in Marathi</label>
				<span style="color: red" id="titlehError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <input type="text" name="mtitle" id="mtitle1" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>
		<div class="row" >
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Marathi Attachment</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-file"></i></span>
					  <%-- 	<input type="file" value="${tendors.attachment.attachmnt_name}" name="file" id="file" class="form-control"/> --%>				  
						<input type="file" name="marathi" id="marathi1" class="form-control"  />
					 </div>	
				</div>
			</div>
		</div>		    		
		</div>
		<div id = "newdiv">			
		</div>
		
		<div class="row"  id="showAttach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Attachment</label>
				<span style="color: red" id="fileError"></span>
				<div class="col-md-7">
					<table  class="table table-striped" id ="myTable">
            <thead>
            <tr>
              <th>Sr. No</th>
              <th>Title</th>
		      <th>File Name</th>
		       <th>File Type</th>
		      <th>Download</th>
		       <th>Action</th>
            </tr>
            </thead>
            <tbody>
              <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
	            <tr>
	             		<td>${status.index + 1}</td>
	             		<td>${attachmentlist.title}</td>
						<td>${attachmentlist.attachmnt_name}</td> 
						<td>${attachmentlist.module_type}</td>
						<td><input type="button" value="Download" class="btn btn-primary btn-flat margin" onclick="return download(${attachmentlist.attachmentID})"/></td>								
						<td><input type="button" value="Delete" onclick="return deleteAttachment(${attachmentlist.attachmentID},'${attachmentlist.module_type}')" class="btn btn-primary btn-flat margin"></td>
	            </tr>  
	            </c:forEach> 
            </tbody>
            
          </table>
				</div>
			</div>
		</div>	    
			  		  
		
		
	          <div class="box-footer">
                  <div class="form-actions floatRight">
					 <input type="submit" value="Save" id="Save" class="btn btn-primary btn-flat margin"><%--   onclick="return myFunction()" --%>
				 	 <input type="button" value="Cancel" onclick="location.href='noticesList'" class="btn btn-success">
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


<input type="hidden" id="titlemsg" value="${titlemsg}" /> 
<input type="hidden" id="descriptionmsg" value="${descriptionmsg}" />


<form:form  action="attachmentNewsDownload" id="downloadform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="aid" name="id" />  
  </form:form>
  
<script>
$( document ).ready(function() {
	$("#noticesList").addClass("active");
  	$("#UserElement").addClass("active");
});
  
  </script>
<script>
function download(id){
	$("#aid").val(id);
	$("#downloadform").submit();
	return true;
}

function deleteAttachment(id,type){
	//alert(id);
	//alert(type);
	var noticeId=$("#noticeId").val();
	if (!confirm("Do you want to delete")){
	      return false;
	   }
	if(type=='English Attachment'){
		 $.ajax({
			 url:"deleteAttachmentById?attachmentID="+id,
				method:"post",
				success:function(response){	
					
					$("#attachmentID").val(0);
					$("#attach").show();
					$("#attach1").hide();
					window.location.reload();
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
					$("#attachmentID").val(0);
					$("#attach").hide();
					$("#attach1").show();
					window.location.reload();
				},
				error:function(){
		        	alert("Error");
		        }
			}); 
	}
 	
}


function chooseType(){
	var types=document.getElementById("types").value;
	
	if(types=="STATE GOV GR"){
		$("#subtypeDiv").show();
	}else{
		$("#subtypeDiv").hide();
	} 
	

}


function chooseTypeAtEdit(){
	var types=document.getElementById("types").value;
	
	if(types=="ACTS & RULES"){
		$("#subtypeDiv").show();
	}else{
		$("#subtypeDiv").hide();
	}
	
	
}






</script>

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
<input type="hidden" id="size" value="<%=session.getAttribute("size") %>" /> 
<input type="hidden" id="module" value="<%=session.getAttribute("module") %>" /> 
<script type="text/javascript">
$(function() {	
	 var i=0;
	$('#AddMoreFields').click( function(){
		i=i+1;
        add_inputs(i)
    });
	var action=$("#action").val();
     $("#attach").hide();
     $("#attach1").hide();
    // alert(action);
	if(action=="newNotices"){
		$("#attach").show();
		$("#attach1").show();
		$("#showAttach").hide();
		
	} 
	else if(action=="editNotices"){///alert("in edit")
		chooseTypeAtEdit();
	        var module=$("#module").val();
	        var size=$("#size").val();
	        if(size>1)
	        	{//alert(size)
	        	$("#showAttach").show();
	        	$("#attach").hide();
				$("#attach1").hide();
			//	$("#titleDiv").hide();
	        	}
	        if(size==0)
        	{
        	$("#showAttach").hide();
        	$("#attach").show();
			$("#attach1").show();
        	}
	        if(size==1){
	        	if(module=="Marathi Attachment"){
					$("#attach").show();
					$("#attach1").hide();
					$("#showAttach").show();
			}
				else if(module=="English Attachment"){
					$("#attach").hide();
					$("#attach1").show();
					$("#showAttach").show();
			}
	        	}
		
	        }
			
	$('#Save').bind("click",function() 
		    { 
		    	var action=$("#action").val();
		    	
		    	if(action=="newNotices"){
		    		$('#english').attr('required', 'required');
		    		$('#marathi').attr('required', 'required');
		    		$('#mtitle').attr('required', 'required');
		    		$('#atitle').attr('required', 'required');
		    	}
		    	
		    }); 
	
	
}); 
	
	
function add_inputs(i){
	   
	 var html = '<br><div id="a'+i+'"><div class="row">'+
	 				'<div class="form-group col-md-12">'+
	 					'<label class="col-md-3 control-lable" for="tags">Title in English</label>'+
	 						'<div class="col-md-7">'+
	 							' <div class="input-group">'+
	 								'<span class="input-group-addon">'+
	 									'<i class="fa fa-pencil"></i></span>'+
	 										'<input type="text" name="atitle" id="atitle" class="form-control"/>'+
	 										'</div></div>'+
	 										'<div class="col-md-2"><input style="margin:0px;" type="button" value="Delete" onclick="deleteAttachmentDiv('+i+')" class="btn bg-red btn-flat margin"></div>'+
	 										'</div></div>'+
	 			'<div class="row">'+
	 				'<div class="form-group col-md-12">'+
	 					'<label class="col-md-3 control-lable" for="tags">English Attachment</label>'+
	 						'<div class="col-md-7">'+
	 							' <div class="input-group">'+
	 								'<span class="input-group-addon">'+
	 									'<i class="fa fa-file"></i></span>'+
	 										'<input type="file" name="english" id="english" class="form-control"  />'+
	 			'</div></div></div></div>'+
	 			'<div class="row">'+
 				'<div class="form-group col-md-12">'+
 					'<label class="col-md-3 control-lable" for="tags">Title in Marathi</label>'+
 						'<div class="col-md-7">'+
 							' <div class="input-group">'+
 								'<span class="input-group-addon">'+
 									'<i class="fa fa-pencil"></i></span>'+
 										'<input type="text" name="mtitle" id="mtitle" class="form-control"/>'+
 			'</div></div></div></div>'+
	 			'<div class="row"  id="">'+
	 				'<div class="form-group col-md-12">'+
	 					'<label class="col-md-3 control-lable" for="attachment">Marathi Attachment</label>'+
	 						'<span style="color: red" id="fileError"></span>'+
	 							'<div class="col-md-7">'+
	 								'<div class="input-group">'+
	 									'<span class="input-group-addon"><i class="fa fa-file"></i></span>'+
	 										'<input type="file" name="marathi" id="marathi" class="form-control"  />'+
	 			'</div>	</div></div></div></div>';
	      
	      $('#newdiv').append(html);
	    
	  }
	
</script>

	
<script type="text/javascript">
	 $("#date").datepicker({ autoclose: true, format: 'dd-mm-yyyy' });
	 $("#date1").datepicker({ autoclose: true, format: 'dd-mm-yyyy' });
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


<script>
/* FILE VALIDATION */
  $(function () {
	    $('input[type=file]').change(function () {
	        var val = $(this).val().toLowerCase(),
	            regex = new RegExp("(.*?)\.(jpg|png|pdf)$");
	        var filesizeinMB = 2094127;
	        var size = this.files[0].size;
	        var type = this.files[0].type;
	        
	        var fruits = new Array("image/png", "image/JPG","pdf");
	        for(var j=0;j<fruits.length;j++){if(fruits[j]==type){}}
	        
	     
	      
	         if (!(regex.test(val))) {
	            $(this).val('');
	            alert('You must select an image/pdf file only');
	        }
	       
	       
	    });
	});

  function deleteAttachmentDiv(i){	
		$("#a"+i).remove();
		//  input.parentNode.remove();
		  
	 }
</script>


<!-- SCRIPT TO HIDE LINK ON MOUSE HOVER ON DOWNLOAD BUTTON	 -->	
		<script>
		  $(document).ready(function () {
		         setTimeout(function () {

		               $('a[href]#no-link').each(function () {
		                   var href = this.href;

		                   $(this).removeAttr('href').css('cursor', 'pointer').click(function () {
		                       if (href.toLowerCase().indexOf("#") >= 0) {

		                       } else {
		                           window.open(href, '_blank');
		                       }
		                   });
		               });

		         }, 500);
		   });
		
		</script>
</body>


</body>
</html>