<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
   
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
    <meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>;url=login?timeout"/>
    <title>Reports</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="resources/plugins/select2/select2.min.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="resources/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="resources/plugins/datepicker/datepicker3.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="resources/dist/css/skins/_all-skins.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- jQuery 2.2.3 -->
    <script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
   
 
    
    
<style>
.datepicker.dropdown-menu {
 visibility: visible;
 opacity: 1;
 width: auto;
}
</style>
    
</head>


<body class="hold-transition skin-blue sidebar-mini">
 
    <!-- Site wrapper -->
    <div class="wrapper">
        <jsp:include page="../includes/header.jsp" />
        
        <!-- =============================================== -->
        <!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Report</h1>
			<ol class="breadcrumb">
				<li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>
				<li><a href="reportsDashboard">Report Dashboard</a></li>
				<li class="active">Pmrda Data Report</li>
			</ol>
			</section>
			
			<!-- Main content -->
			<section class="content"> <!-- Default box -->

			<div class="box-body">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Report</h3>
					</div>
					<!-- /.box-header -->
					
					<div class="box-body">

						<form action="" id="generateReport" method="post">		
						
						
						<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Category:</label> 									 	                     								
										<select  id=Module  class="form-control select2" style="width: 100%;">											
											<option selected="selected" value="0">--Select--</option> 
											<option value="NEWS">WHAT'S NEW</option>
											<option value="NOTICES">NOTIFICATIONS</option>												
											<option value="TENDERS">TENDERS NOTICE</option>
											<option value="PROJECT">PROJECT</option>	
											<option value="OPENINGS">CUREENT OPENINGS</option>	
											<option value="DEPARTMENTS">DEPARTMENTS</option>									
										</select>									
									</div>
								</div>
							</div>	
						
						
									
												
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Date:</label> 									 	                     								
										<select  id="rpt" onchange="viewDesign()" class="form-control select2" style="width: 100%;">											
											<!-- <option selected="selected" value="0">Select Report Type</option> -->
											<option selected="selected" value="All">All</option>	
											<option value="Today">Today</option>																				
											<option value="Datewise">Date Wise</option>											
											<option value="BetweenDates">Between Dates</option>									
										</select>									
									</div>
								</div>
							</div>
							
							
						
							 
							  
							 <div class="row" id="datewise" style="display: none;">
			                 <div class="form-group col-md-12">
			                 <label>Select Date </label>
			                	<div class="form-group input-group " >
		                            <label class="input-group-btn" for="date"  >  
		                       <span class="btn btn-default" style="height:33px;background-color: white;">
		                        <span class="glyphicon glyphicon-calendar "></span>
		                       </span>
		                    </label>
		                   <input type="text" name ="publish_date"  class="form-control date-input" id="date" style="width:478px;" data-provide="datepicker" />
                             <span style="color: red;float:left;margin-left: 15px;" id="publishdateError"></span>  
            </div>
					
			</div>
			
		</div> 
							 
							<div class="row" id="betweenDates" style="display: none;">
			                 <div class="form-group col-md-12">
			                 <label>Select Start Date </label>
			                	<div class="form-group input-group " >
		                            <label class="input-group-btn" for="startDate"  >  
		                       <span class="btn btn-default" style="height:33px;background-color: white;">
		                        <span class="glyphicon glyphicon-calendar "></span>
		                       </span>
		                    </label>
		                   <input type="text" name ="publish_date"  class="form-control date-input" id="startDate" style="width:478px;"  data-provide="datepicker" />
                             <span style="color: red;float:left;margin-left: 15px;" id="startDateError"></span>  
            </div>
					 <label>Select End Date </label>
			                	<div class="form-group input-group " >
		                            <label class="input-group-btn" for="endDate"  >  
		                       <span class="btn btn-default" style="height:33px;background-color: white;">
		                        <span class="glyphicon glyphicon-calendar "></span>
		                       </span>
		                    </label>
		                   <input type="text" name ="publish_date"  class="form-control date-input" id="endDate" style="width:478px;"  data-provide="datepicker" />
                             <span style="color: red;float:left;margin-left: 15px;" id="endDateError"></span>  
            </div>
			</div>
			
		</div> 
		
	
			                
			                
							
							
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
								<label>Users : </label> 	<!-- name="status" -->								 	
										<select  id="user"  class="form-control select2" style="width: 100%;">											
											<!-- <option selected="selected" value="none">Select Status</option> -->
											 <option selected="selected" value="All">All</option>	
											 <c:forEach items="${userList}" var="userList" >
                       
                        <option value="${userList.user_id}"><c:out value="${userList.username}" /></option>
                        </c:forEach>
																			
										</select>
									</div>
								</div>
							</div>
							
							
							
							
						</form>		
							
							<div class="box-header with-border">
								<table>
							    	<td>
							        	<button type="button" id="validate" class="btn bg-olive btn-flat margin" onclick="display()">Display</button>
							       	</td>
							       	
							    </table>
							</div>	
							
						<div class="box-body" style="max-height:400px; overflow: auto;">
                            	<div id="data"></div>
                        </div>                                              
				</div>
						 <div class="box-header with-border" style="display: none;" id="downloadReport">
							<!-- <table>
								<td id="downloadReport"> -->
							    	<button type="button"  class="btn bg-olive btn-flat margin" id="btnExport" onclick="downloadReport()">Download Report</button>
								<!-- </td>					
								<td>
							        <button type="button" id="viewAllMap" class="btn bg-olive btn-flat margin" onclick="viewAllMap()">View All Map</button>
							    </td>
							</table> -->
						</div>	
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>

		<jsp:include page="../includes/footer.jsp" />    
</div>
 
 <input type="hidden" id = "download" value="<%=session.getAttribute("Download") %>">
  <!-- Select2 -->
    <script src="resources/plugins/select2/select2.full.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="resources/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/plugins/datatables/dataTables.bootstrap.min.js"></script>  
    <script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- SlimScroll -->
    <script src="resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="resources/plugins/fastclick/fastclick.js"></script>
    <!-- AdminLTE App -->
   
    <!-- page script -->  
	<script src="resources/dist/js/table2excel.js" type="text/javascript"></script>
	 <script src="resources/plugins/daterangepicker/moment.js" type="text/javascript"></script> 
	 <script src="resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
  <script src="resources/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="resources/dist/js/demo.js"></script>
 
 
<script type="text/javascript">
$(function () {
	
	 $("#startDate").datepicker({ autoclose: true,  format: 'dd-mm-yyyy'});
	 $("#endDate").datepicker({ autoclose: true, format: 'dd-mm-yyyy'});
	 $("#date").datepicker({ autoclose: true, format: 'dd-mm-yyyy'});
});
</script>
   

<script type="text/javascript">
    function viewDesign(){   	
    	var reportType=$('#rpt').val();
    	
	    	if(reportType==='Today'){
	    		$('#datewise').hide();
	        	$('#betweenDates').hide();
	    	}else if(reportType==='All'){
	    		$('#datewise').hide();
	        	$('#betweenDates').hide();
	    	}else if(reportType==='Datewise'){
	    		$('#datewise').show();
	        	$('#betweenDates').hide();
	    	}else if(reportType==='BetweenDates'){
	    		$('#datewise').hide();
	        	$('#betweenDates').show();
	    	}    	
       }
    
   
    function display(){   	
    	
    	var issueHTML = '<table id="example1" class="table table-bordered table-striped">'+
		'<thead>'+ 
			'<tr><th>S.N.</th><th>Title</th><th>Created By</th><th>Created Date</th><th>Approved By</th><th>Approved Date</th></tr>'+
		'</thead>'+
		'<tbody>';
		 var Module=$('#Module').val(); 
		 var reportType=$('#rpt').val(); 
		 var contact=$("#contact").val();
		 var user=$("#user").val();
			 
		 var objFormData = new FormData();
		 objFormData.append('reportType',reportType);
		 objFormData.append('contactNo', contact);
		 objFormData.append('user', user);
		 objFormData.append('Module', Module);
		
				
		if(reportType==='Today'){
			
    	}else if(reportType==='All'){
			
    	}else if(reportType==='Datewise'){
    		objFormData.append('startDate', $('#date').val());
    		objFormData.append('endDate', "");
    	}else if(reportType==='BetweenDates'){
    		objFormData.append('startDate', $('#startDate').val());
    		objFormData.append('endDate', $('#endDate').val());
    	} 
		
   		$.ajax({
   			
   			url:"getReports?${_csrf.parameterName}=${_csrf.token}",         //(?reportType="+reportType+"&contact="+contact+"&status="+status, "&startDate="+startDate+"&endDate="+endDate+)
   			type:"post",
 			data:objFormData,
 			processData: false,
 		    contentType: false, 
   			success:function(response){
   				//alert(response.length);
   				console.log(response)
   				for(var i=0;i<response.length;i++){   	
   					var created_date;
   					var approved_by;
   					var approved_date;
   					var title;
   					var created_by;
   					
   					if(Module=="PROJECT"){
   						created_date=response[i].created_on;
   						approved_by=response[i].approved_by;
   						approved_date=response[i].approved_on;
   						title=response[i].title;
   						created_by=response[i].user.firstName+" "+response[i].user.lastName;
   					}else if(Module=="OPENINGS"){
   						created_date=response[i].created_date;
   						approved_by=response[i].approved_by;
   						approved_date=response[i].approved_date;
   						title=response[i].post;
   						created_by=response[i].user.firstName+" "+response[i].user.lastName;
   					}else if(Module=="DEPARTMENTS"){
   						created_date=response[i].created_date;
   						approved_by=response[i].create_approved_by;
   						approved_date=response[i].create_approval_date;
   						title=response[i].departmentName;
   						created_by=response[i].user.firstName+" "+response[i].user.lastName;
   					}else{
   						created_date=response[i].created_date;
   						approved_by=response[i].approvalBy;
   						approved_date=response[i].approveddate;	
   						title=response[i].title;
   						created_by=response[i].user.firstName+" "+response[i].user.lastName;
   					}
   					
   					
   				     var j = i+1;
   					
					issueHTML+='<tr> <td>'+j+'</td>'+
					'<td>'+title+'</td>'+					
					'<td>'+created_by+'</td>' +		
					'<td>'+created_date+ '</td>' +
					'<td>'+approved_by+'</td>'+
					'<td >'+approved_date+'</td>'
				  
				}
   			
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
   		
   				$('#downloadReport').show();
   			},
   			error:function(){
   				alert("error");
   			}
   		});
    }
    
   
     function downloadReport(){

         $("#example1").table2excel({
             filename: "CmsDataReport.xls"
             	
         });
	        
		/* var Module=$('#Module').val(); 
		 var reportType=$('#rpt').val(); 
		 var contact=$("#contact").val();
		 var user=$("#user").val();
    	var startDate;
    	var endDate;
    	if(reportType==='Today'){
			startDate="";
			endDate="";
    	}else if(reportType==='All'){
			startDate="";
			endDate="";
    	}else if(reportType==='Datewise'){
    		startDate=$('#date').val();
    		endDate="";
    	}else if(reportType==='BetweenDates'){
    		startDate=$('#startDate').val();
    		//endDate="";
    		endDate=$('#endDate').val();
    	}   	
    	  $("#th").remove();
    	  $("#ahref").remove();
    	  $("#td").remove();
		window.location="downloadReport?reportType="+reportType+"&Module="+Module+"&user="+user+"&startDate="+startDate+"&endDate="+endDate;	
		 */
    } 
    </script>
   <!-- <script type="text/javascript">
	 $("#xxx").datepicker({format: 'yyyy-mm-dd' });//mm/dd/yyyy
	 
 </script> -->
 <script>
$( document ).ready(function() {
	$("#reportsDashboard").addClass("active");
  	$("#MasterElement").addClass("active");
});
  </script> 
</body>
</html>