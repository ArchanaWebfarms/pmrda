
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
  %> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PMRDA</title>
<!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="resources/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="resources/dist/css/skins/_all-skins.min.css">

<!-- jQuery 2.2.3 -->
<script src="resources//plugins/jQuery/jquery-2.2.3.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">

 <div class="wrapper">
	<jsp:include page="../includes/header.jsp" />
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> User Mannual  <!-- <small>advanced tables</small> --></h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li class="active">User Mannual</li>   
      </ol>
     
      <!-- /.row -->
      <div class="box">
            <div class="box-header">
              <h3 class="box-title">Add User Mannual Here...</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<div class="form-actions floatRight"><br>
             	<form method="POST"	action="uploadUserMannual?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
					 <div class="row" id="">
											<div class="form-group col-md-12">
												<label class="col-md-3 control-lable" for="title">Title
												</label> <span style="color: red" id="titleError"></span>
												<div class="col-md-7">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-pencil"></i></span>														
														<input type="text" name="title" id="title"
															class="form-control" />

													</div>
													
												</div>
											</div>
										</div>
										
										
										 <div class="row" id="attach">
											<div class="form-group col-md-12">
												<label class="col-md-3 control-lable" for="attachment">User Mannual 
												</label> <span style="color: red" id="fileError"></span>
												<div class="col-md-7">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-file"></i></span>
														<%-- 	<input type="file" value="${tendors.attachment.attachmnt_name}" name="file" id="file" class="form-control"/> --%>
														<input type="file" name="attachment" id="attachment"
															class="form-control" />

													</div>
													
												</div>
											</div>
										</div>
										
										
										
										<div class="box-footer">
											<div class="form-actions floatRight">
												<input type="submit" value="Save" id="Save"
													class="btn btn-primary btn-flat margin"> 
											</div>
										</div>
										</form>
				</div>
            </div>
            <!-- /.box-body -->
         </div>
    </section>
    
    
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">

 			<div class="box">
 			<h3> User Mannual Table<!-- <small>advanced tables</small> --></h3>
            <div class="box-header">
             <!--  <h3 class="box-title">Data Table With Full Features</h3> -->
             
            </div>
            <!-- /.box-header -->
             
            <div class="box-body">
             
             
              <table id="example1" class="table table-bordered table-stripe">
                <thead>
                <tr align="center">
                 <th>S.N.</th>
                  <th>User Mannual</th>
                <th>    Action  </th> 
                 <th>    Action  </th> 
                  
                  </tr>
              </thead>
                
                    <tbody>
				    <c:forEach var="list" items="${list}" varStatus="status">
					<tr>	
					 <td>${status.index+1}</td>		
				    <td>${list.title}</td>				    			     
                    <td><input type="button" value="View User Mannual" class="btn btn-primary btn-flat margin" onclick="return view(${list.attachmentID })"/></td>													 
					<td><input type="button" value="Delete User Mannual" class="btn btn-primary btn-flat margin" id="AB"  onclick="myFunction(${list.attachmentID })"/></td>		
                        		
							</tr>
					</c:forEach>
				</tbody>
              </table>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <jsp:include page="../includes/footer.jsp" /> 
    </div>  


<!-- Bootstrap 3.3.6 -->
<script src="resources//bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="resources//plugins/datatables/jquery.dataTables.min.js"></script>
<script src="resources//plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="resources//plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="resources//plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources//dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources//dist/js/demo.js"></script>
<!-- DataTables -->
 
 <form:form  action="previewPdf" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="viewid" name="id" />  
  </form:form>
  
<script>
 $(function () {
   $("#example1").DataTable({
	      "paging": false,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": false,
	      "info": false,
	      "autoWidth": false
	    });  
   
   $('input[type=file]').change(function () {
       var val = $(this).val().toLowerCase(),
           regex = new RegExp("(.*?)\.(pdf)$");
      
        if (!(regex.test(val))) {
           $(this).val('');
           alert('You must select pdf file only');
       }
  });
   
   $('#Save').bind("click",function(){		     
		
	   validateFile();
	   validateTitle();
	   
		if(validateFile() && validateTitle()){
			alert("User Mannual Saved Successfully.");
			return true;
		}else{
			return false;
		}
		
}); 
 });
 
 function validateTitle(){
	 var title=$("#title").val();
	  if(title==""){
		  document.getElementById("titleError").innerHTML="**Required";
			return false;
	  }else{
		  document.getElementById("titleError").innerHTML=" ";
		  return true;
	  }
 }
 
 function validateFile(){
	  var title=$("#attachment").val();
	  if(title==""){
		  document.getElementById("fileError").innerHTML="**Required";
 			return false;
	  }else{
		  document.getElementById("fileError").innerHTML=" ";
		  return true;
	  }
 }
</script>
 <script>
 function myFunction(id){
	  $.ajax({
		    url : 'deletePhoto?id='+id,      
		    success : function(response){
		    	alert("User Mannual Deleted Successfully.")
		    	window.location.href="user_mannual";
		    }
		   
		});
 }

 function view(id){    	
	 	$("#viewid").val(id);
	 	$("#viewform").submit();
	 	return true;
	 }
	 
 
    </script>
   

</body>
</html>