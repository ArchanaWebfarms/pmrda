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
      <h1> Department Office Contact Form</h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i><b> Home</b></a></li>
        <li><a href="departmentList"> Department List</a></li>
        <li class="active"> Department Office Contact</li>
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
		<form:form action="saveDepartmentContact?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="contact" commandName="contact" class="form-horizontal">
			
			
			 <form:hidden path="department.deptId" id="deptId" class="form-control"/> 
			<form:hidden path="id" id="id" class="form-control"/>
			
			
		   <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="">Office</label>
					<form:errors style="color: red"  path="" />
					<div class="col-md-7">
						<form:select path="deptOffice.id" class="form-control" id="office">	
						<c:if test="${contact.deptOffice.id eq '0'}"><option selected="selected" value="0">Select</option></c:if>		
						<c:if test="${contact.deptOffice.id >'0'}"><option selected="selected" value="${contact.deptOffice.id}">${contact.deptOffice.name}</option></c:if>		
							<c:forEach var="office" items="${officeList}">
								<option value="${office.id}">${office.name}</option>
							</c:forEach>
						</form:select>				
					</div>
				</div>
			</div>
			
	
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="name">Name in English</label>
				<form:errors style="color: red"  path="name" />
					<div class="col-md-7">
						<form:input path="name" id="name" class="form-control"/>						
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="name_h">Name in Marathi</label>
				<form:errors style="color: red"  path="name_h" />
					<div class="col-md-7">
						<form:input path="name_h" id="name_h" class="form-control"/>						
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="contact_no">Contact Number</label>
				<form:errors style="color: red"  path="contact_no" />
					<div class="col-md-7">
						<form:input path="contact_no" id="contact_no" class="form-control"/>						
					</div>
				</div>
			</div>
			
			  
			 <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="email">Email ID</label>
				<form:errors style="color: red"  path="email" />
					<div class="col-md-7">
						<form:input path="email" id="email" class="form-control"/>						
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
	          
	               
	                            
	              </form:form>    
	              
	               <div id = "data"></div>                    
     
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

<form:form  action="deleteDepartmentContact" id="deleteform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="deleteid" name="id" />  
  <input type="hidden" id="deletedeptId" name="deptId" />  
  </form:form>
  
  <form:form  action="editDepartmentContact" id="editform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="editid" name="id" />  
  </form:form>

<script>
function deleteC(id,deptId){    	
	$("#deleteid").val(id);
	$("#deletedeptId").val(deptId);
	$("#deleteform").submit();
	return true;
}

function edit(id){
	$("#editid").val(id);
	$("#editform").submit();
	return true;
}

$(document).ready(function(){
	
	getOfficeList();
		
});

function getOfficeList(){
	var issueHTML = '<div class="box"><div class="box"><div class="box-header"><h3 class="box-title">Department Office Contact Data Table</h3></div>'+
	'<div class="box-body"><table id="example1" class="table table-bordered table-striped">'+ 
	'<thead><tr><th>S.N.</th><th>Name</th><th>Contact Number</th><th>Email ID</th>'+
	'<th>Office</th><th id="tableAction">Action</th><th id="tableAction">Action</th></tr>'+
	'</thead>'+
	'<tbody>';	
	

	var deptid = $("#deptId").val();//alert(deptid)
	
	$.ajax({
	    url : 'getOfficeContactList?deptid='+deptid, 
	    		
	    success : function(response){	    	
	    	//alert(response.length)
	    	 for(var i=0;i<response.length;i++){
	    			    	
	    			var j = i+1;
					issueHTML+='<tr> <td>'+j+'</td>'+
					'<td>'+response[i].name+'</td>'+
					'<td>'+response[i].contact_no+'</td>'+
					'<td>'+response[i].email+'</td>'+ 
					'<td class="A">'+response[i].deptOffice.name+'</td>'+	
					'<td><input type="button" value="Edit Details" class="btn btn-primary btn-flat margin" onclick="return edit('+response[i].id+')"/></td>'+
					'<td><input type="button" value="Delete Details" class="btn btn-primary btn-flat margin" onclick="return deleteC('+response[i].id+','+response[i].department.deptId+')"/></td>';
					/* '<td><a href="editDepartmentContact?id='+response[i].id+'">Edit Details</a></td>'+
					'<td><a href="deleteDepartmentContact?id='+response[i].id+'&deptId='+response[i].department.deptId+'">Delete Details</a></td>';	    	 */
			
	    	} //for
	    	 issueHTML+='</tbody></table></div></div></div>';
				$("#data").html(issueHTML);
			 $("#example1").DataTable(); 

	    },//success func
	    error:function(response){
        	alert("Error");
        }//err func

	});//ajax
}//function

</script>

</body>
</html>