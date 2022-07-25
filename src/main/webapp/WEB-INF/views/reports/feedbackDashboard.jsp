<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
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
    <title>PMRDA</title>
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
     <!-- jQuery 2.2.3 -->
    <script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>

   
</head>


<body class="hold-transition skin-blue sidebar-mini">
<%-- <jsp:include page="../static/includes/HeaderAd.jsp" /> --%>
    <!-- Site wrapper -->
    <div class="wrapper">
        <jsp:include page="../includes/header.jsp" />
        
        <!-- =============================================== -->
        <!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Feedback Report</h1>
			<ol class="breadcrumb">
				<li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li>		
				<li class="active">Feedback Dashboard</li>
			</ol>
			</section>
			
			<!-- Main content -->
			<section class="content"> <!-- Default box -->

			<div class="box-body">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Feedback Report</h3>
					</div>
					<!-- /.box-header -->
					
			<div class="box-body">

				<form action="" id="generateReport" method="post">	
									
						<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Date:</label> 									 	                     								
										<select  id="reportType" onchange="viewDesign()" class="form-control select2" style="width: 100%;">											
											<!-- <option selected="selected" value="0">Select Report Type</option> -->
											<option selected="selected" value="All">All</option>	
											<option value="Today">Today</option>																				
											<option value="Datewise">Date Wise</option>											
											<option value="BetweenDates">Between Two Date</option>									
										</select>									
									</div>
								</div>
							</div>
														
						<div id="datewise">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Select Date:(तारीख निवडा) </label><span style="color: red" id="purchaseDateError"></span>
											<div class="input-group date" id="singleDate">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text"  id="date" class="form-control pull-right datepicker">
											</div>
										</div><!--name="date"  -->
									</div>
								</div>
							 </div>
 
						<div id="betweenDates">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Select From Date:(तारखेपासून)</label>	<span style="color: red" id="purchaseDateError"></span>
											<div class="input-group date" id="firstDate">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text"  id="startDate" class="form-control pull-right datepicker">
											</div><!-- name="startDate" -->
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group">
											<label>Select To Date:(तारखेपर्यंत)</label> <span style="color: red" id="purchaseDateError"></span>
											<div class="input-group date" id="lastDate">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text"  id="endDate" class="form-control pull-right datepicker">
											</div><!-- name="endDate" -->
										</div>
									</div>
								</div>
							</div>
				</form>			 
					
					      <div class="box-header with-border">
								<table><tr>
							    	<td>
							        	<button type="button" class="btn btn-primary btn-flat margin" onclick="display()">Display</button>
							       	</td></tr>
							    </table>
							</div>	
							
						<div class="box-body" style="padding-left:30px; padding-right:30px">
                            	<div id="data"></div>
                        </div>   
                        
                        <table id="example2"></table>          
			</div>		
							
			<div class="box-header with-border">
				<table>
					<tr>
					<td id="downloadReportList">
				    	<button type="button" class="btn bg-olive btn-flat margin" onclick="downloadReportList()">Download Report</button>
					</td>					
					<td>
				        <button type="button" id="viewAllMap" class="btn bg-olive btn-flat margin" onclick="viewAllMap()">View All Map</button>
				    </td>
				    </tr>
				</table>
			</div>				
			</div>
			</div>	
			</section>	
			</div>	


		<jsp:include page="../includes/footer.jsp" />    
</div>
<!-- <script src="resources/dist/js/table2excel.js" type="text/javascript"></script> -->


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
    <script src="resources/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="resources/dist/js/demo.js"></script>
    <!-- page script --> 
    
    <form:form  action="viewFeedBackDetails" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="viewid" name="feedBackID" />  
  </form:form>
  

    <script type="text/javascript">
    function view(id){    	
    	$("#viewid").val(id);
    	$("#viewform").submit();
    	return true;
    }
    
	    //Date picker
	      $('#singleDate').datepicker({
	        autoclose: true,
	        format:'yyyy-mm-dd'
	      }); 
	      $('#firstDate').datepicker({
		        autoclose: true,
		        format:'yyyy-mm-dd'
		   }); 
	      $('#lastDate').datepicker({
		        autoclose: true,
		        format:'yyyy-mm-dd'
		   }); 
     </script>		
   
   <script type="text/javascript">
   	
    $(document).ready(function() {
    	$('#downloadReportList').hide();   	
    	$('#viewAllMap').hide();	
    	$('#datewise').hide();
    	$('#betweenDates').hide();
    });
 </script>
   
   <script type="text/javascript">
       function viewDesign(){   	
    	var reportType=$('#reportType').val();
    	
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
   </script>
  
  
  
  
  <script type="text/javascript">
  $(function() {	
		display();
	});
  
  
      function display(){
    	  
    	var issueHTML = '<table id="example1" class="table table-bordered table-striped">'+
		'<thead>'+ 
		'<tr><th>S.N.</th><th>Name</th><th>Contact</th><th id="tableAction">Action</th></tr>'+
		'</thead>'+
		'<tbody>';
		 var reportType=$('#reportType').val(); 
		 
		 var objFormData = new FormData();
		 objFormData.append('reportType',reportType);
		 
		if(reportType==='Today'){
			
    	}else if(reportType==='All'){
			
    	}else if(reportType==='Datewise'){
    		objFormData.append('startDate', $('#date').val());
    		objFormData.append('endDate', "");
    	}else if(reportType==='BetweenDates'){
    		objFormData.append('startDate', $('#startDate').val());
    		objFormData.append('endDate', $('#endDate').val());
    	}
		
		/* console.log(...objFormData); */
		
		//data : {reportType: reportType, subject: subject, startDate: startDate, endDate: endDate},
		//alert(reportType+" reportType "+subject+" subject "+" objFormData "+objFormData);
   		$.ajax({
   			url:"getFeedbackReport?${_csrf.parameterName}=${_csrf.token}",   
 			data : objFormData,
 			type:"post",
 			processData: false,
 		    contentType: false,
   			success:function(response){
   				for(var i=0;i<response.length;i++){
					var j = i+1;
					issueHTML+='<tr> <td>'+j+'</td>'+					
					'<td>'+response[i].name+'</td>'+
					'<td>'+response[i].phone+'</td>'+	
					'<td><input type="button" value="View Details" class="btn btn-primary btn-flat margin" onclick="return view('+response[i].feedBackID+')"/></td>';
   				}
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
   		
   				$("#example1").DataTable();
   				/* $('#downloadReportList').show(); */
   			},
   			error:function(){
   				alert("error");
   			}
   		});
    }
    </script>
   <script>
$( document ).ready(function() {
	$("#feedbackDashboard").addClass("active");
  	$("#AdminElement").addClass("active");
});
  </script> 
</body>
</html>