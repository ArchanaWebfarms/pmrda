<%@page import="com.cmsManagement.util.MethodsHelper"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>

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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css" integrity="sha512-E4kKreeYBpruCG4YNe4A/jIj3ZoPdpWhWgj9qwrr19ui84pU5gvNafQZKyghqpFIHHE4ELK7L9bqAv7wfIXULQ==" crossorigin="anonymous" />
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.min.css" integrity="sha512-/Ae8qSd9X8ajHk6Zty0m8yfnKJPlelk42HTJjOHDWs1Tjr41RfsSkceZ/8yyJGLkxALGMIYd5L2oGemy/x1PLg==" crossorigin="anonymous" /> -->
	<!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> -->
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
.ui-timepicker-container{
	z-index:2!important;
}
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
      <h1> Tender Notice Registration Form   </h1>
      <ol class="breadcrumb">
       <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
        <li><a href="tenderList">Tender Notice List</a></li>
        <li class="active">New Tender Notice</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box-body">
	 <form:form  action="save_tenders?${_csrf.parameterName}=${_csrf.token}" modelAttribute="tendors" commandName="tendors"  enctype="multipart/form-data" class="form-horizontal" >
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
        
        <form:hidden path="id" id="tender_id"  name="tender_id" class="form-control"/>
       
       <%--  <form:hidden path="created_date" id="created_date"  class="form-control"/> --%>
        
         <!-- /.box-header -->
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3  control-lable" for="title">Title in English<sup>*</sup></label>
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
				<label class="col-md-3  control-lable" for="title_h">Title in Marathi<sup>*</sup></label>
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
				<label class="col-md-3 control-lable" for="subTitle">Tender ID in English<sup>*</sup></label>
				<form:errors style="color: red"  path='subTitle' />
				<div class="col-md-7">
				 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="text" path="subTitle" id="subTitle" class="form-control"/>
				</div>						
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="subTitle_h">Tender ID in Marathi<sup>*</sup></label>
				<form:errors style="color: red"  path='subTitle_h' />
				<div class="col-md-7">
				 <div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
					<form:input type="text" path="subTitle_h" id="subTitle_h" class="form-control"/>
				</div>						
				</div>
			</div>
		</div>

		

	<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="publish_date">Publish Date<sup>*</sup></label>
				<form:errors style="color: red"  path='publish_date' />
				<div class="col-md-7">
					 <div class="input-group date" id="publish_date">
					    <span class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>
						<form:input type="text" path="publish_date" id="inputPublish_date" class="form-control"/>
					 </div>
				</div>
			</div>
		</div>	
		<%-- <div class="row">
		<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="publish_date">Publish Date in Marathi<sup>*</sup></label>
				<form:errors style="color: red"  path='publish_date_h' />
				<div class="col-md-7">
					 <div class="input-group date" id="">
					    <span class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>
						<form:input type="text" path="publish_date_h" id="inputPublish_date_h" class="form-control" readonly=""/>
					 </div>
				</div>
			</div>
		</div>	 --%>
		
		<div class="row" onclick="PublishTimeInMr()">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="publishTime">Publish Time in English<sup>*</sup></label>
					<form:errors style="color: red"  path='publish_time' />
				<div class="col-md-7">
					<div class="input-group" onclick="PublishTimeInMr()">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>		
						<form:input path="publish_time" name="" id="publishTime" onclick="PublishTimeInMr()" class="form-control" />					
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" onclick="PublishTimeInMr()">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="publishTime_h">Publish Time in Marathi<sup>*</sup></label>
					<form:errors style="color: red"  path='publish_time_h' />
				<div class="col-md-7">
					<div class="input-group" onclick="PublishTimeInMr()">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>		
						<form:input path="publish_time_h" name="" id="publishTime_h" class="form-control" />					
					</div>
				</div>
			</div>
		</div>
		
			<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="closingDate">Closing Date<sup>*</sup></label>
					<form:errors style="color: red"  path='closingDate' />
				<div class="col-md-7">
					<div class="input-group date" id="closingDate">
						<span class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>
						<form:input path="closingDate" name="closingDate" id="inputClosingDate" class="form-control" />					
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" onclick="ClosingTimeInMr()">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="closingTime">Closing Time in English<sup>*</sup></label>
					<form:errors style="color: red"  path='closing_time' />
				<div class="col-md-7">
					<div class="input-group" onclick="ClosingTimeInMr()">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>		
						<form:input path="closing_time" name="" id="closingTime" onclick="ClosingTimeInMr()" class="form-control" />					
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" onclick="ClosingTimeInMr()">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="closingTime_h">Closing Time in Marathi<sup>*</sup></label>
					<form:errors style="color: red"  path='closing_time' />
				<div class="col-md-7">
					<div class="input-group" onclick="ClosingTimeInMr()">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>		
						<form:input path="closing_time_h" name="" id="closingTime_h" class="form-control" />					
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" >
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="openingDate">Opening Date<sup>*</sup></label>
				<form:errors style="color: red"  path='openingDate' />
				<div class="col-md-7">
				    <div class="input-group date" id="openingDate">
					  	<span class="input-group-addon" >
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>
					  <form:input  path="openingDate" id="inputOpeningDate"  class="form-control"/>
					</div>  
				</div>
			</div>
		</div>
		
		<div class="row" onclick="OpeningTimeInMr()">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="openingTime">Opening Time in English<sup>*</sup></label>
					<form:errors style="color: red"  path='opening_time' />
				<div class="col-md-7">
					<div class="input-group" onclick="OpeningTimeInMr()">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>		
						<form:input path="opening_time" name="" id="openingTime" onclick="OpeningTimeInMr()" class="form-control" />					
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="openingTimeh">Opening Time in Marathi<sup>*</sup></label>
					<form:errors style="color: red"  path='opening_time_h' />
				<div class="col-md-7">
					<div class="input-group">
					  <span class="input-group-addon"><i class="fa fa-edit"></i></span>		
						<form:input path="opening_time_h" name="" id="openingTime_h" class="form-control" />					
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
					<span style="color: red" id="descriptionhError"></span>
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
           <div class="box-body" >
             <%--  <%String add=null;%>	 --%>		
		  		
			
		  		
		
		
		<div class="row">
			<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="department">Department<sup>*</sup></label>
					<form:errors style="color: red"  path='tendorsDepartment.dept_id' />
				<div class="col-md-7">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-home"></i></span>
						<form:select path="tendorsDepartment.dept_id" class="form-control" id="department">
							<c:if test="${tendors.tendorsDepartment.dept_id > 0}"><option selected="selected" value="${tendors.tendorsDepartment.dept_id}">${tendors.tendorsDepartment.departmentName}</option></c:if>	
							<c:if test="${tendors.tendorsDepartment.dept_id==''}"><option selected="selected" value="0">Select Department</option></c:if>				
							<c:forEach var="departments" items="${departments}">
								<option value="${departments.dept_id}">${departments.departmentName}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row"  id="title">
			<div class="form-group col-md-12">
					<button type="button"  id ="AddMoreFields" class="btn bg-olive btn-flat margin">Add More Attachments</button>
				</div>
			</div>
		</div>
		
		<div id="attach">
		<div class="row"  id="">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="attachment">Title in English</label>
				<span style="color: red" id="titleError"></span>
				<div class="col-md-7">
					 <div class="input-group">
					 <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
				         <input type="text" name="atitle" id="atitle" class="form-control"/>
					 </div>	
				</div>
			</div>
		</div>
		
		<div class="row" >
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
              <th>S.N.</th>
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
						<td>${attachmentlist.attachmnt_name}</td> 
						<td>${attachmentlist.module_type}</td>
						<td><input type="button" value="Download" class="btn btn-primary btn-flat margin" onclick="return attachmentDownload(${attachmentlist.attachmentID})"/></td>								
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
					 <input type="submit" value="Save" id="Save" onclick="return chkData()" class="btn btn-primary btn-flat margin"><%--  or <a href="<c:url value='/admin' />">Cancel</a> --%>
				 	 <input type="button" value="Cancel" onclick="location.href='tenderList'" class="btn btn-success">
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
 <script src="resources/plugins/timepicker/0-5-2-bootstrap-timepicker.min.js"></script> 
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
<script src="resources/js/NumberConversion.js"></script>
<!-- Page script -->
 <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js" integrity="sha512-2xXe2z/uA+2SyT/sTSt9Uq4jDKsT0lV4evd3eoE/oxKih8DSAsOF6LUb+ncafMJPAimWAXdu9W+yMXGrCVOzQA==" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.js" integrity="sha512-tlmsbYa/wD9/w++n4nY5im2NEhotYXO3k7WP9/ds91gJk3IqkIXy9S0rdMTsU4n7BvxCR3G4LW2fQYdZedudmg==" crossorigin="anonymous"></script> --> 
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> -->
<input type="hidden" id="titlemsg" value="${titlemsg}" /> 
<input type="hidden" id="descriptionmsg" value="${descriptionmsg}" />
<script>
$( document ).ready(function() {
	$("#tenderList").addClass("active");
  	$("#UserElement").addClass("active");
});
  </script>
<script>
function chkData(){
	//alert($("#title_h").val());
	return true;
}

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
<input type="hidden" id="action" value="<%=session.getAttribute("action") %>" /> 
<input type="hidden" id="size" value="<%=session.getAttribute("size") %>" /> 
<input type="hidden" id="module" value="<%=session.getAttribute("module") %>" /> 
<input type="hidden" id="dateValidation" value="${dateValidation}" /> 
<script type="text/javascript">
 $(function() {	
	  document.getElementById('publishTime_h').readOnly = true; 
	  document.getElementById('closingTime_h').readOnly = true; 
	  document.getElementById('openingTime_h').readOnly = true; 
	  
	  	 $("#openingDate").datepicker({ autoclose: true,  format: 'dd-mm-yyyy'});
		 $("#closingDate").datepicker({ autoclose: true, format: 'dd-mm-yyyy'});
		 $("#publish_date").datepicker({ autoclose: true, format: 'dd-mm-yyyy'}); 
		 $("#closingTime").timepicker({ timeFormat: 'HH:mm', step: 1}); 
		 $("#openingTime").timepicker({ timeFormat: 'HH:mm' });
		 $("#publishTime").timepicker({ timeFormat: 'HH:mm' });
		
		  PublishTimeInMr();
		  ClosingTimeInMr();
		  OpeningTimeInMr();
		 
	 var i=0;
	 $('#AddMoreFields').click( function(){
		 i=i+1;
	        add_inputs(i)
	    });
	 
	var action=$("#action").val();
	$("#attach").hide();
	
	 $('#Save').bind("click",function() 
			    { 
			    	var action=$("#action").val();
			    	
			    	if(action=="newTender"){
			    		$('#english').attr('required', 'required');
			    		$('#marathi').attr('required', 'required');
			    		$('#mtitle').attr('required', 'required');
			    		$('#atitle').attr('required', 'required');
			    	}
			    	
			    }); 
	
	
	if(action=="newTender"){
		$("#attach").show();
		$("#attach1").show();
		$("#showAttach").hide();
		
	} 
	else if(action=="editTender"){
		var module=$("#module").val();
        var size=$("#size").val();
        if(size>1)
        	{
        	$("#showAttach").show();
        	$("#attach").hide();
			$("#attach1").hide();
			//$("#titleDiv").hide();
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
	
	var dateValidation=$("#dateValidation").val();
	 if(dateValidation=="invalidTime"){
		 alert("Opening time should be greater than Closing time.")
		 $("#dateValidation").val(" ");
	 }else if(dateValidation=="invalidDate"){
		 alert("Opening date should be equal or greater than Closing date.")
		 $("#dateValidation").val(" ");
	 }
	 
	
}); 

 
 
 function add_inputs(i){
	   
	 var html = '<div id="a'+i+'"><br><div class="row">'+
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
	 			'<div class="row"  id="attach">'+
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

 function deleteAttachmentDiv(i){	
		$("#a"+i).remove();
		//  input.parentNode.remove();
		  
	 }
</script>

	
<script type="text/javascript">
 
	 
		function myFunction(){
			//alert($("#file").val());
			if($("#attachmentID").val()==0){
				if(validateWithFile()){
					alert("Data inserted Succesfully");
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
	            regex = new RegExp("(.*?)\.(pdf)$");
	        var filesizeinMB = 2094127;
	        var size = this.files[0].size;
	        var type = this.files[0].type;
	        
	        var fruits = new Array("pdf");
	        for(var j=0;j<fruits.length;j++){
	        	
	        	if(fruits[j]==type){
	        		
	        	}
	        	}
	        
	        if (!(regex.test(val))) {
	            $(this).val('');
	            alert('You must select an Pdf file only');
	        }
	       /*  if ( size>filesizeinMB) {
	            $(this).val('');
	            alert('Can Not Upload File Greater than 2MB');
	        }
	        */
	    });
	});
</script>
 <script type="text/javascript">

function PublishTimeInMr(){ 
	 var publishTime=$("#publishTime").val();
	 
	 var time1=publishTime.split(" ");
	 var time2=publishTime.split(":"); 
		
	 var hr=NumbersInEngToMar(time2[0]);
	 var min=NumbersInEngToMar(time2[1]);
	 var zone;
	 
	 if(time1[1]=="PM"){
		 zone="दु.";
	 }else{
		 zone="स.";
	 }
	 
	 var mr_time=((hr.concat(":")).concat(min)).concat(" ").concat(zone);
	
	 $("#publishTime_h").val(mr_time);
}

function ClosingTimeInMr(){ 
	 var closingTime=$("#closingTime").val();
	 
	 var time1=closingTime.split(" ");
	 var time2=closingTime.split(":"); 
		
	 var hr=NumbersInEngToMar(time2[0]);
	 var min=NumbersInEngToMar(time2[1]);
	 var zone;
	 
	 if(time1[1]=="PM"){
		 zone="दु.";
	 }else{
		 zone="स.";
	 }
	 
	 var mr_time=((hr.concat(":")).concat(min)).concat(" ").concat(zone);
	
	 $("#closingTime_h").val(mr_time);
}

function OpeningTimeInMr(){ 
	 var openingTime=$("#openingTime").val();
	 
	 var time1=openingTime.split(" ");
	 var time2=openingTime.split(":"); 
		
	 var hr=NumbersInEngToMar(time2[0]);
	 var min=NumbersInEngToMar(time2[1]);
	 var zone;
	 
	 if(time1[1]=="PM"){
		 zone="दु.";
	 }else{
		 zone="स.";
	 }
	 
	 var mr_time=((hr.concat(":")).concat(min)).concat(" ").concat(zone);
	
	 $("#openingTime_h").val(mr_time);
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