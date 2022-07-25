
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
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<jsp:include page="../includes/header.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Project Registration Form  <small>Preview</small> </h1>
      <ol class="breadcrumb">
       <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Advanced Elements</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form  action="saveProject?${_csrf.parameterName}=${_csrf.token}" modelAttribute="project" commandName="project"  enctype="multipart/form-data"   class="form-horizontal" >
	<!-- Default box --><!-- method="POST" -->
  	 <div class="box-body">
  	
  	
  	<!--  <form method="POST" 
      enctype="multipart/form-data" 
      action="doUpload?${_csrf.parameterName}=${_csrf.token}">
      ...</form>-->
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
				<label class="col-md-3  control-lable" for="title">Title</label>
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
					<label class="col-md-3 control-lable" for="Specification">Specification</label>
					<form:errors style="color: red" id="specificationError"  path='specification' />
					<div class="col-md-7">	
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						<form:input type="text" path="specification" id="specification" class="form-control" />
					</div>	
					</div>
			</div>
		</div>
		
		                     <div class="row">
				                  <div class="form-group col-md-12">
					               <label class="col-md-3 control-lable" for="project_coordinator">Project_Coordinator</label>
					                <form:errors style="color: red"  path='projectCordinator' />
					                     <div class="col-md-7">	
					                           <div class="input-group">
					                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>			
						                         <form:input  type="text" path="projectCordinator" id="projectCordinator" class="form-control" />
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
		                          
		                       
		                          

		
	      </div>
	      
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
		                                 <div class="row"  id="title">
			                                 <div class="form-group col-md-12">
					                           <button type="button"  id ="AddMoreFields" class="btn bg-olive btn-flat margin">Add More Attachments</button>
				                              </div>
			                               </div>
		                              </div>
		
		
		<div class="row"  id="titleDiv">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Title</label>
				<span style="color: red" id="titleError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <input type="text" name="atitle" id="atitle" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>
		
		<div class="row"  id="attach">
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
		<div class="row"  id="attach1">
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
		
		                    <div id = "newdiv"></div>
		
	<div class="row"  id="showAttach">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Attachment</label>
				<span style="color: red"  id="fileError"></span>
				<div class="col-md-7">
					<table  class="table table-striped" id ="myTable">
            <thead>
            <tr>
              <th>S.N.</th>
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
						<td><a id="no-link" href="attachmentNewsDownload?path=${attachmentlist.path}">Download</a></td>
						<td><input type="button" value="Delete" onclick="return deleteAttachment(${attachmentlist.attachmentID},'${attachmentlist.module_type}')" class="btn-success"></td>
	            </tr>  
	            </c:forEach> 
            </tbody>
            
          </table>
				</div>
			</div>
		</div>    
			 		  
		
		
	                  <div class="box-footer">
                          <div class="form-actions floatRight">
                  	           <input type="submit" value="Save"   class="btn btn-primary btn-flat margin">
				 	           <input type="button" value="Cancel" onclick="location.href='projectlist'" class="btn btn-success">
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

<input type="hidden" id="module" value="<%=session.getAttribute("module") %>" /> 
<input type="hidden" id="size" value="<%=session.getAttribute("size") %>" /> 
<input type="hidden" id="titlemsg" value="${titlemsg}" /> 
<input type="hidden" id="descriptionmsg" value="${description}" />

<script>
var titlemsg=$("#titlemsg").val();
var descriptionmsg = $("#descriptionmsg").val();
//alert(titlemsg);
if(titlemsg != ""){
	//alert(titlemsg);
	document.getElementById("titleError").innerHTML=titlemsg;
}
else{
	document.getElementById("titleError").innerHTML="";
}
if(descriptionmsg != ""){
	//alert(titlemsg);
	  document.getElementById("descriptionError").innerHTML=descriptionmsg;
}
else{
	
	document.getElementById("descriptionError").innerHTML="";
}

</script>

<script type="text/javascript">
$(function () {
	/* $.datepicker.setDefaults({
	     dateFormat: 'yy-mm-dd'
	}); */
	 $("#date").datepicker({ autoclose: true,  format: 'dd-mm-yyyy'});
	
});	 
</script>
<input type="hidden" id="action" value="<%=session.getAttribute("action") %>" /> 
<script type="text/javascript">
 $(function() {	
	 $('#AddMoreFields').click( function(){
	        add_inputs()
	    });
	 
		var action=$("#action").val();
		var size=$("#size").val();
		//alert(size);
		$("#attach").hide();
		if(action=="newProject"){
			$("#attach").show();
			$("#attach1").show();
			$("#showAttach").hide();
			
			$('#file').attr('required', 'required');
			$(document).ready(function() {
			    $('#Save').bind("click",function() 
			    { 
			        var imgVal = $('#english').val(); 
			        if(imgVal=='') 
			        { 
			            alert("empty input file"); 
			            return false; 
			        } 


			    }); 
			});
		} 
		else if(action=="editProject"){
			 var module=$("#module").val();
		        var size=$("#size").val();
		        if(size>1)
		        	{
		        	$("#showAttach").show();
		        	$("#attach").hide();
					$("#attach1").hide();
					$("#titleDiv").hide();
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
	    
	}); 
	
	
 function add_inputs(){
   
var html = '<br><div class="row">'+
				'<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="tags">Title</label>'+
						'<div class="col-md-7">'+
							' <div class="input-group">'+
								'<span class="input-group-addon">'+
									'<i class="fa fa-pencil"></i></span>'+
										'<input type="text" name="atitle" id="atitle" class="form-control"/>'+
			'</div></div></div></div>'+
			'<div class="row">'+
				'<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="tags">English Attachment</label>'+
						'<div class="col-md-7">'+
							' <div class="input-group">'+
								'<span class="input-group-addon">'+
									'<i class="fa fa-file"></i></span>'+
										'<input type="file" name="english" id="english" class="form-control"  />'+
			'</div></div></div></div>'+
			'<div class="row"  id="attach">'+
				'<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="attachment">Marathi Attachment</label>'+
						'<span style="color: red" id="fileError"></span>'+
							'<div class="col-md-7">'+
								'<div class="input-group">'+
									'<span class="input-group-addon"><i class="fa fa-file"></i></span>'+
										'<input type="file" name="marathi" id="marathi" class="form-control"  />'+
			'</div>	</div></div></div>	';
     
     $('#newdiv').append(html);
   
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
	         var fruits = new Array("image/png", "image/JPG","pdf ");
	        for(var j=0;j<fruits.length;j++){
	        	if(fruits[j]==type){
	        	}//if
	        }//for
	         if (!(regex.test(val))) {
	            $(this).val('');
	            alert('You must select an image/pdf  file only');
	        }//if
              if ( size>filesizeinMB) {
	            $(this).val('');
	            alert('Can Not Upload File Greater than 2MB');
	        } //if
	       });//change func
	});//funct
</script>
<script>
function deleteAttachment(id,type){
	//alert(id);
//	alert(type);
	var noticeId=$("#newsid").val();
	if (!confirm("Do you want to delete")){
	      return false;
	   }
	if(type=='English Attachment'){
		 $.ajax({
				url:"deleteNoticeAttachmentById?attachmentID="+id,
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
				url:"deleteNoticeAttachmentById?attachmentID="+id,
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

</script>


</body>
</html>