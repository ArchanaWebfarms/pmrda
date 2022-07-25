
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
        <li><a href="projectlist">Project List</a></li>
        <li class="active">Add Scope</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">

	 <form:form  action="saveProject_features"  method="POST"   modelAttribute="features" commandName="features"   class="form-horizontal" >
	 <!-- Default box --><!-- method="POST" -->
  	 <div class="box-body">
  	
      <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}" />

        <form:hidden path="id" id="id"  class="form-control"/>
        <input type="hidden" id="project_id" name="project_id" value="${project_id}" class="form-control"/>
       
	    <div class="box-body">
         <!-- SELECT2 EXAMPLE -->
                    <div class="box box-default">
                       <div class="box-header with-border">
                             <h3 class="box-title">Scope Of Project Form</h3>
                                 <div class="box-tools pull-right">
                                  <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                       
                                   </div>
                         </div>
                                 <div class="box-body" >
                                         <%--  <%String add=null;%>	 --%>		
		                                 <div class="row"  id="title">
			                                 <div class="form-group col-md-12">
					                           <button type="button"  id ="AddMoreFields" class="btn bg-olive btn-flat margin">Add More Scope</button>
				                              </div>
			                               </div>
		                              </div>
		
		
		<div class="row"  id="featureDiv">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="feature">Scope Of Work</label>
				<span style="color: red" id="featureError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				          <input type="text"  name="feature" id="feature" class="form-control" > 		         
					 </div>	
				</div>
			</div>
		</div>
		
	<div class="row"  id="featureDiv">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="feature">Scope Of Work In Marathi</label>
				<span style="color: red" id="featureError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				          <input type="text"  name="feature_h" id="feature_h" class="form-control" > 		         
					 </div>	
				</div>
			</div>
		</div>

		
		         <div id = "newdiv"> </div>
		
	
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
         </form:form>  
         <div id = "data"> </div>
      </div>
      <!-- /.box -->           
     
     
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
	 getScopeList();
	 $('#AddMoreFields').click( function(){
	        add_inputs()
	    });
	 
	}); 
	
	
 function add_inputs(){
   
var html = '<br><div class="row">'+
		    	  '<div class="form-group col-md-12">'+
					'<label class="col-md-3 control-lable" for="tags">Scope Of Work</label>'+
						'<div class="col-md-7">'+
							' <div class="input-group">'+
								'<span class="input-group-addon">'+
									'<i class="fa fa-pencil"></i></span>'+
										'<input type="text"  name="feature" id="feature" class="form-control" > '+			 
		'</div></div></div></div>'+
		'<div class="row">'+
  	  '<div class="form-group col-md-12">'+
			'<label class="col-md-3 control-lable" for="tags">Scope Of Work In Marathi</label>'+
				'<div class="col-md-7">'+
					' <div class="input-group">'+
						'<span class="input-group-addon">'+
							'<i class="fa fa-pencil"></i></span>'+
								'<input type="text"  name="feature_h" id="feature_h" class="form-control" > '+			 
'</div></div></div></div>'
			;
     
     $('#newdiv').append(html);
   
 }
 
 function getScopeList(){
	 var issueHTML = '<div class="box"><div class="box"><div class="box-header"><h3 class="box-title">Project Data Table</h3></div>'+
		'<div class="box-body"><table id="example1" class="table table-bordered table-striped">'+ 
		'<thead><tr><th>S.N.</th><th>Scope Of Work</th><th>Scope Of Work In Marathi</th><th id="tableAction">Action</th></tr>'+
		'</thead>'+
		'<tbody>';
	 
	 var project_id=$("#project_id").val();
	 
	 $.ajax({
		    url : 'GetProjectScope?project_id='+project_id,      
		    success : function(response){
		    	console.log(response)
		    	for(var i=0;i<response.length;i++){		    		
		    			var j = i+1;
						issueHTML+='<tr> <td>'+j+'</td>'+
						'<td>'+response[i].feature+'</td>'+				
						'<td>'+response[i].feature_h+'</td>'+				
						'<td><a href="deleteProjectScope?id='+response[i].id+'&project_id='+response[i].project_id+'">Delete</a></td>'; 		    			
		    		}//for 
		    	issueHTML+='</tbody></table></div></div></div>';
				$("#data").html(issueHTML);
			 $("#example1").DataTable();

	    },//success func
	    error:function(response){
        	alert("Error");
        }//err func

	});//ajax
	 
 }
	
</script>



</body>
</html>