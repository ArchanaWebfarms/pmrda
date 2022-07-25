
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
      <h1> What's New Data Table  <!-- <small>advanced tables</small> --></h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> <b>Home</b></a></li> 
        <li class="active">News List</li>   
      </ol>
     
      <!-- /.row -->
      <div class="box">
            <div class="box-header">
              <h3 class="box-title">For New News Register Here...</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<div class="form-actions floatRight">
					 <button type="button" onclick="location.href='newNews'" class="btn btn-primary btn-flat margin">New News</button>
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
 			<h3> What's New Data Table<!-- <small>advanced tables</small> --></h3>
            <div class="box-header">
             <!--  <h3 class="box-title">Data Table With Full Features</h3> -->
             
            </div>
            <!-- /.box-header -->
             
            <div class="box-body">
             
             
              <table id="example1" class="table table-bordered table-stripe">
                <thead>
                <tr align="center">
                  <th>S.N.</th>
                  <th>Title in English</th>
                   <th>Title in Marathi</th>
                  <!-- <th>News Paper</th>
                  <th>News Subtitle</th> -->
                  <th> Date</th>
                  <th>Status</th>
                <th>    Action  </th> 
                 <th>    Action  </th> 
                  <th>    Action  </th> 
                  </tr>
              </thead>
                
                    <tbody>
                    
				    <c:forEach var="newslist" items="${newslist}" varStatus="status">
					<tr>
					<td>${status.index + 1}</td>					
				    <td>${newslist.title}</td>
				     <td>${newslist.title_h}</td>
				     <%-- <td>${newslist.newspaper}</td> 
				    <td>${newslist.subtitle}</td> --%>
				    <td>${newslist.publish_date}</td>
				    <td>${newslist.status}</td>                       
                                <td><input type="button" value="View News" class="btn btn-primary btn-flat margin" onclick="return viewNews(${newslist.newsid})"/></td>
								 <td><input type="button" value="Edit News" class="btn btn-primary btn-flat margin" onclick="return editNews(${newslist.newsid})"/><br></td>			
								 <c:choose>
								 <c:when test="${newslist.status eq 'Approved'}">
								 		<td><input type="button" value="Delete News" class="btn btn-primary btn-flat margin" onclick="return deleteANews(${newslist.newsid},'${newslist.status}')"/><%-- <a href="deleteApprovedNews?id=${newslist.newsid}"  onclick="return deleteTender('${newslist.status}')">Delete News </a>--%></td>		                 		
								 </c:when>
								 <c:otherwise>
								 	<td><input type="button" value="Delete News" class="btn btn-primary btn-flat margin" onclick="return deleteNews(${newslist.newsid},'${newslist.status}')"/><%--<a href="deletenews?id=${newslist.newsid}"  onclick="return deleteTender('${newslist.status}')">Delete News</a>--%></td>		                        		
								 </c:otherwise>
								 </c:choose>					 
								 
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

 
  <form:form  action="view_News" id="viewform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="id" name="id" />  
  </form:form>
  
  <form:form  action="editNews" id="editform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="editid" name="id" />  
  </form:form>
  
  <form:form  action="deleteApprovedNews" id="deleteAform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="deleteAid" name="id" />  
  </form:form>
  
  <form:form  action="deletenews" id="deleteform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="deleteid" name="id" />  
  </form:form>
	
  <script>
  $( document ).ready(function() {
		$("#newsList").addClass("active");
	  	$("#UserElement").addClass("active");
	});
  </script>
<script>
 $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    }); 
  });
</script>
 
   
<script type="text/javascript">
    $(document).ready(function(){
       
            var pageURL = $(location).attr("href");
           // alert(pageURL);
            var newUrl = pageURL.replace("http://", "https://"); // Create new url
           // alert(newUrl);
            $(this).attr("href", newUrl); 
            
      
    });
    function deleteTender(status){
    	if(status=="Approved"){
    		 if (!confirm("Do you want to delete record?")){
    	   	      return false;
    	   	  }else{
    	   		return true;
    	   	  }
    	}else{
    		if (!confirm("News not approved yet.Do you want to delete record?")){
  	   	      return false;
  	   	  }else{
  	   		return true;
  	   	  }    		
    	}
   }
    
    
    function viewNews(id){    	
    	$("#id").val(id);
    	$("#viewform").submit();
    	return true;
    }
    
    function editNews(id){
    	$("#editid").val(id);
    	$("#editform").submit();
    	return true;
    }
    
    function deleteANews(id,status){
    	if(deleteTender(status)){
    		$("#deleteAid").val(id);
        	$("#deleteAform").submit();
        	return true;
    	}
    }
    
    function deleteNews(id,status){
    	if(deleteTender(status)){
    		$("#deleteid").val(id);
        	$("#deleteform").submit();
        	return true;
    	}
    }
</script>

</body>
</html>