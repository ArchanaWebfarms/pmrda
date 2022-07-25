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
		<form:form action="saveDemoDepartment?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="departments" commandName="departments" enctype="multipart/form-data" class="form-horizontal">
			
			
			<form:hidden path="id" id="id" class="form-control"/>
			
			<input type="hidden" id="dptName" value="">
		   <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="departmentName">Department Name </label>					
					<div class="col-md-7">
						<form:input type="text" path="name" id="name" class="form-control"/>						
					</div>
				</div>
			</div>
			
	
			<div class="row">
			<label class="col-md-3 control-lable" for="description"><u>Functions</u></label>
			</div>
				<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="function_title">Title</label>				
					<div class="col-md-7">
						<form:input path="function_title" id="function_title" class="form-control"/>						
					</div>
					</div>
					</div>
					<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="function_priority">Priority</label>				
					<div class="col-md-7">
						<form:input path="function_priority" id="function_priority" class="form-control"/>						
					</div>
					</div>
					</div>
					<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="function_type">Type</label>				
					<div class="col-md-7">
						<form:select path="function_type" id="function_type" class="form-control" onchange="getInputType()">	
						<form:option value="Text">Text</form:option>
						<form:option value="Multi-line Text">Multi-line Text</form:option>
						<form:option value="Bulletine">Bulletine</form:option>
						<form:option value="Link">Link</form:option>						
						</form:select>					
					</div>
					</div>
					</div>
					<div class="row" id="addMoreButton" style="display: none;">
						<div class="form-group col-md-12">
						<div class="col-md-7">
					<button type="button"  id ="AddMoreFields" class="btn bg-olive btn-flat margin">Add More Text</button>
					</div>
				</div>
			</div>
			<div class="row" id="addBullenineButton" style="display: none;">
						<div class="form-group col-md-12">
						<div class="col-md-7">
					<button type="button"  id ="AddMoreHeaderFields" class="btn bg-olive btn-flat margin">Add Header</button>					
					</div>
				</div>
			</div>
					<div class="row" id="textDiv">
					<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="function_content">Content</label>				
					<div class="col-md-7">
						<textarea rows="2" cols="30" id="function_content_text" name="function_content_text" class="form-control"></textarea>						
					</div>					
				</div>
			</div>
					<div id="paraDiv"></div>
					<div id="headerDiv"></div>
					<div id="bulletineDiv"></div>
			
			
			   
			     <div class="box-body">
         <!-- SELECT2 EXAMPLE -->
                    <div class="box box-default">
       
			        
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


function getInputType(){
	var type=$("#function_type").val();//alert(type)
	if(type=="Text"){
		$("#textDiv").show();
		$("#addMoreButton").hide();
		$("#addBullenineButton").hide();
		//$("#").show();
	}else if(type=="Multi-line Text"){
		$("#textDiv").show();
		$("#addMoreButton").show();
		$("#addBullenineButton").hide();
	}else if(type=="Bulletine"){
		$("#textDiv").hide();
		$("#addMoreButton").hide();
		$("#addBullenineButton").show();
	}else if(type=="Link"){
		$("#textDiv").hide();
		$("#addMoreButton").hide();
		$("#addBullenineButton").hide();
	}
}	

function add_inputs(){
		var html ='<div class="row">'+
					'<div class="form-group col-md-12">'+
						'<label class="col-md-3 control-lable" for="function_content">Content</label>'+				
							'<div class="col-md-7">'+
								'<textarea rows="2" cols="30" id="function_content_text" name="function_content_text" class="form-control"/></textarea>'	+					
							'</div></div></div>';		
		
		 $('#paraDiv').append(html);
}	

function add_point_inputs(h){	
	var html ='<div class="row" id="ptDiv'+h+'">'+
				'<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="function_content">Total Points</label>'+				
						'<div class="col-md-7">'+
							'<input type="text" id="fun_cont_points_total'+h+'" name="fun_cont_points_total" class="form-control"/></div>'	+
							'<div class="col-md-2"><input style="margin:0px;" type="button" value="+" onclick="add_points('+h+')" class="btn bg-olive btn-flat margin"></div>'+
							'</div></div>';
	
	 $('#bulletineDiv').append(html);
	
}	

function add_points(h){
	var total=$("#fun_cont_points_total"+h).val();
	
	var html ;
	for(var i=0;i<total;i++){
	 html ='<div class="row">'+
				'<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="function_content">Point Content</label>'+				
						'<div class="col-md-7">'+
							'<input type="text" id="function_content_point_text" name="function_content_point_text'+h+'" class="form-control"/></div>'	+
							'<div class="col-md-2"><input style="margin:0px;" type="button" value="Add Sub-Point" onclick="add_sub_points('+h+','+i+')" class="btn bg-olive btn-flat margin"></div>'+
						'</div></div>'+
						'<div id="bullSubptDiv'+h+''+i+'"></div>';
						
	 $('#bulletineDiv').append(html);
	}	
	
}

function add_inputs_header(h){
	var html ='<div class="row" id="headerDiv'+h+'">'+
				'<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="function_content">Header Content</label>'+				
						'<div class="col-md-7">'+
							'<input type="text" id="fun_cont_bull_header'+h+'" name="fun_cont_bull_header" class="form-control"/></div>'	+
							'<div class="col-md-2"><input style="margin:0px;" type="button" value="Add Point" onclick="add_point_inputs('+h+')" class="btn bg-olive btn-flat margin"></div>'+
							'</div></div>';
							

	
	 $('#bulletineDiv').append(html);
	
}

 function add_sub_points(h,i){
	var html ='<div class="row" id="subptDiv'+h+''+i+'">'+
	'<div class="form-group col-md-12">'+
		'<label class="col-md-3 control-lable" for="function_content">Total Sub-Points</label>'+				
			'<div class="col-md-7">'+
				'<input type="text" id="fun_cont_subpoints_total'+h+''+i+'" name="fun_cont_subpoints_total" class="form-control"/></div>'	+
				'<div class="col-md-2"><input style="margin:0px;" type="button" value="+" onclick="add_sub_points_con('+h+','+i+')" class="btn bg-olive btn-flat margin"></div>'+
				'</div></div>';
				
$('#bullSubptDiv'+h+''+i).append(html);
} 

 function add_sub_points_con(h,i){
	var total=$("#fun_cont_subpoints_total"+h+''+i).val();
	
	var html ;
	for(var j=0;j<total;j++){
	 html ='<div class="row">'+
				'<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="function_content">Sub-Point Content</label>'+				
						'<div class="col-md-7">'+
							'<input type="text" id="function_content_subpoint_text" name="function_content_subpoint_text'+h+''+i+'" class="form-control"/></div>'	+							
						'</div></div>';
						
	 $('#bullSubptDiv'+h+''+i).append(html);
	}	
	
}
 

</script>
<script>
$(document).ready(function(){
	var h=0;
	$('#AddMoreFields').click( function(){	
			add_inputs();
	    });
	
		    
	    $('#AddMoreHeaderFields').click( function(){	
	    	h=h+1;
	    	add_inputs_header(h);
			
	    });  
		
});



</script>

</body>
</html>