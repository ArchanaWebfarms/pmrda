<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder"%>
<%@ page import="com.cmsManagement.util.NumbersEnglishToMarathi"%>

<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr"
	class='com_content view-featured itemid-550 j38 mm-hover'>
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="staticResources/css/night-mode.css">
<link rel="stylesheet" href="resources/plugins/datepicker/datepicker3.css">
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
	crossorigin="anonymous"></script> -->
<link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
<meta name="viewport" content="width=device-width" />



	
	 <!-- DataTables -->
  <link rel="stylesheet" href="resources//plugins/datatables/dataTables.bootstrap.css">
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
<title>.:: <spring:message code="pagetitle.whatnew"  /> ::.
</title>
<meta name="description" content="Free Web tutorials">

<style>
 .row{
	width:100%!important;
}
</style>

</head>
<body>
	<div class="t3-wrapper t3-homepage-2">
		<jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>		

		<input type="hidden" name="lang" id="lang"
			value="<%=LocaleContextHolder.getLocale()%>">
		<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>" />



		<div id="maincontent" class="container-fluid t3-mainbody dl-container" style="margin-top:30px;">
		<div class="row">
         <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
             <li> <a href="#"><spring:message code="Header.Menu.AboutUs.mediacntr"  />  </a></li>
						    
						      <li><a  href="press_notes"><spring:message code="pressnotes.title"  /></a></li>
						      <li><a class="active" href="pmrda_news"><spring:message code="pagetitle.whatnew"  /></a></li>
						      <li><a href="videos"><spring:message code="index.module-ct.span1"  /></a></li>
						       <li><a href="gallery"><spring:message code="index.module-ct.span2"  /></a></li>
                        <li><a href="mediacenter"><spring:message code="Header.Menu.AboutUs.mediacntr"  /></a></li>
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
            <div class="row">
				<div class="itemHeader"  style="width:100%;">

					<h3 class="itemTitle">
						<spring:message code="pagetitle.whatnew" />
					</h3>

				</div>

				<div class="heading-underline" style="width: 200px;">
					<div class="left"></div>
					<div class="right"></div>
				</div>




			</div>
			<form action="">

				<div class="row filter-container filter_table_input">

					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 l-w">
						<h5 class="text-left">
							<spring:message code="filter.form.fromdate" />
						</h5>
						<div class="input-group date" id="engFromDateDiv">
					  <input class="form-control" type="text" name="" id ="fromdate" placeholder="yyyy-mm-dd" autocomplete="off">
              			<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
					
					<div class="input-group date" id="marathiFromDateDiv" style="display: none;">
					<input class="form-control" type="text" name="" id ="fromdatemr" placeholder="yyyy-mm-dd" autocomplete="off">
					  	<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 l-w">
						<h5 class="text-left">
							<spring:message code="filter.form.todate" />
						</h5>
						<div class="input-group date" id="engTODateDiv">
					  <input class="form-control" type="text" name="" id ="todate" placeholder="yyyy-mm-dd" autocomplete="off">
              			<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
					
					<div class="input-group date" id="marathiTODateDiv" style="display: none;">
					<input class="form-control" type="text" name="" id ="todatemr" placeholder="yyyy-mm-dd" autocomplete="off">
					  	<span class="input-group-addon" >
			            	<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
			            </span>
					</div>
					</div>

					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 l-w">
						<h5 class="text-left">
							<spring:message code="filter.form.Searchkeyword" />
						</h5>
						<input class="form-control" type="text" name="" id="search">
					</div>

				</div>
				<div class="clear"></div>
				
				<div class="row" style="margin:10px 0px;">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<input class="btnSearch pull-right btn btn-warning" type="button"
							value="<spring:message code="filter.form.Searchbutton"  />"
							style="margin-right: 25px;" onclick="SubmitDates()">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<input class="btnClear btn btn-warning" type="reset" onclick="ReserData()"
							value="<spring:message code="filter.form.Clearbutton"  />"
							style="margin-left: 25px;">
					</div>
				</div>
			</form>
            
            <div class="row" id="data" style="overflow-x: auto;">
				<div id="englishtable" style="display: visible; width:100%;">
					<table class="table table-bordered  dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;" id="example1">
						<tbody>

							<tr style="white-space:nowrap;">
								<th style="width:5%;" scope="col">S.N.</th>								
								<th style="width:50%;" scope="col">Title</th>
								<th style="width:17%;" scope="col">Date</th>								
								<th scope="col">Download</th>
							</tr>
							
							<c:forEach var="approvedNotice" items="${approvedNotice}"
								varStatus="status">

								<tr>


									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
									</td>
									
									<td><span id="SitePH_grdupload_lblCategory_0">
											<%-- <a href="getNewsById?id=${approvedNotice.newsid}"> --%>${approvedNotice.title}<!-- </a> --></span></td>
									<td style="text-align:center;" class="filterDates">${approvedNotice.publish_date}</td>
									
									<td><c:forEach var="attachmentlist"
											items="${attachmentlist}" varStatus="status">
										<c:if test="${approvedNotice.newsid ==  attachmentlist.moduleID}">
										<c:if
												test="${attachmentlist.module_type == 'English Attachment'}">
												<c:choose>
										<c:when test="${attachmentlist.extension == 'pdf'}">
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title}<img src="staticResources/images/pdf1.ico" height="20px" width="20px">[size:${attachmentlist.size}KB]</a><br>
										</c:when>
										<c:otherwise>
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title}<img src="staticResources/images/img2.png" height="20px" width="20px">[size:${attachmentlist.size}KB]</a><br>
										</c:otherwise>
									</c:choose>
											</c:if>
										</c:if>
											

										</c:forEach></td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
				<div id="marathitable" style="display: none; width:100%;">

					<table class="table table-bordered  dl-table"
						cellspacing="0" rules="cols" border="1" id="SitePH_grdupload"
						style="width: 100%; border-collapse: collapse;" id="example2">
						<tbody>

							<tr style="white-space:nowrap;">
								<th style="width:5%;" scope="col">अ.क्र.</th>								
								<th style="width:50%;" scope="col">शीर्षक</th>
								<th style="width:17%;" scope="col">तारीख</th>								
								<th scope="col">डाउनलोड</th>
							</tr>
							<% int n=0; %>
							<c:forEach var="approvedNotice" items="${approvedNotice}"
								varStatus="status">
							<% n=n+1; %>
							<% String numb=NumbersEnglishToMarathi.convertInMarathi(String.valueOf(n)); %>
								<tr>

									<td style="text-align:center;"><span id="SitePH_grdupload_lblSN_0"><%=numb %></span>
									</td>
									
									<td><span id="SitePH_grdupload_lblCategory_0">
											<%-- <a href="getNewsById?id=${approvedNotice.newsid}"> --%>${approvedNotice.title_h}<!-- </a> --></span></td>
									<td style="text-align:center;" class="filterDates">${approvedNotice.publish_date_h}</td>
									
									<td><c:forEach var="attachmentlist"
											items="${attachmentlist}" varStatus="status">
										<c:if test="${approvedNotice.newsid ==  attachmentlist.moduleID}">

											<c:if
												test="${attachmentlist.module_type == 'Marathi Attachment'}">
													<c:choose>
										<c:when test="${attachmentlist.extension == 'pdf'}">
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title}<img src="staticResources/images/pdf1.ico" height="20px" width="20px">[आकार:${attachmentlist.size}केबी]</a><br>
										</c:when>
										<c:otherwise>
											<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title}<img src="staticResources/images/img2.png" height="20px" width="20px">[आकारe:${attachmentlist.size}केबी]</a><br>
										</c:otherwise>
									</c:choose>
											</c:if>
											</c:if>	
										</c:forEach></td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>

				
			</div>
            
            
            
            
            
            </div>
            </div>
		
			
			
			

		</div>



		<footer id="t3-footer" class="wrap t3-footer footer-section">
			<jsp:include page="../includes/Footer.jsp" />
		</footer>
		<!--  var todate = $("#todate").val();  -->
		<!-- DataTables -->
<script src="resources//plugins/datatables/jquery.dataTables.min.js"></script>
<script src="resources//plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
         <script src="resources/plugins/datepicker/bootstrap-datepicker.js"></script>
         <script src="resources/plugins/timepicker/0-5-2-bootstrap-timepicker.min.js"></script>
         <script src="resources/plugins/datepicker/locales/bootstrap-datepicker.mr.js"></script>
          <script src="resources/js/NumberConversion.js"></script> 
          <script src="staticResources/js/submitDates.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
          <form:form  action="attachmentNewsDownload" id="viewAttachform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="attachid" name="id" />  
  </form:form>
  
<script type="text/javascript">
function attachmentDownload(id){
	  $("#attachid").val(id);
	  $("#viewAttachform").submit();
	  return true;
}
</script>
           
        <script>
        $("#fromdate").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd'
        });
        $("#todate").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd'
            
        });
        $("#fromdatemr").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd',
            language: 'mr'
        });
        $("#todatemr").datepicker({
        	autoclose: true,  
        	format: 'yyyy-mm-dd',
            language: 'mr'
        });
     

        </script>
		<script>
        	
        	
        	</script>
		<script>

  $(function() {	
	  
	  
	  
	  var language=$("#lang").val();
	//  alert(language);
	  if(language=="marathi")
		 {
		  
		  $("#marathitable").show();
		  $("#englishtable").hide();
		  document.getElementById("marathitable").style.visibility = "visible";
		  document.getElementById("englishtable").style.visibility = "none";
		  $("#engFromDateDiv").hide();
		  $("#engTODateDiv").hide();
		  $("#marathiFromDateDiv").show();
		  $("#marathiTODateDiv").show();
		 }else{
				$("#marathitable").hide();
	 			  $("#englishtable").show();
	 			  document.getElementById("marathitable").style.visibility = "none";
	 			  document.getElementById("englishtable").style.visibility = "visible";
				 
				 $("#engFromDateDiv").show();
				  $("#engTODateDiv").show();
				  $("#marathiFromDateDiv").hide();
				  $("#marathiTODateDiv").hide();
			 }
	 
	  
	  
	  
});  
 
  function ReserData(){
	  window.location.reload();
  }
  

function SubmitDates(){
	var language=$("#lang").val();
	var fromdate;
	var todate;
	
	 var issueHTML;
	 if(language=="marathi")
		 {
		  fromdate = $("#fromdatemr").val(); 
		  todate = $("#todatemr").val(); 
		 
		 issueHTML = 
			 '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
				'<thead><tr style="white-space:nowrap;"><th style="width:5%;">अ.क्र.</th><th style="width:50%;">शीर्षक</th><th style="width:17%;">तारीख</th><th>डाउनलोड</th></tr>'+
				'</thead>'+
				'<tbody>';	
		 }
	 else{
		  fromdate = $("#fromdate").val(); 
		  todate = $("#todate").val(); 	 
		 
	 issueHTML = 
		 '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
			'<thead><tr style="white-space:nowrap;"><th style="width:5%;">S.N.</th><th style="width:50%;">Title</th><th style="width:17%;">Date</th><th>Download</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
	//alert(fromdate);alert(todate);
	
     $.ajax({
		 url:"newsbydates?fromdate="+fromdate+"&todate="+todate,
			success:function(response){
				console.log(response)
				for(var i=0;i<response.news.length;i++){
										
					var title;
					var newspaper;
					var date;
					var numb;
					
					 var j = i+1;
					if(language=="marathi"){
						title=response.news[i].title_h;
						newspaper=response.news[i].newspaper_h;
						date=response.news[i].publish_date_h;
						numb=NumbersInEngToMar(String(j));
					}else{
						title=response.news[i].title;
						newspaper=response.news[i].newspaper;
						date=response.news[i].publish_date;
						numb=j;
					} 
				   
					issueHTML+='<tr><td style="text-align:center;">'+numb+'</td>'+
					
					'<td>'+title+'</td>'+			
					'<td style="text-align:center;">'+date+'</td>'+					
					'<td>';
					for(var j=0;j<response.attachment.length;j++){   
						if(response.news[i].newsid==response.attachment[j].moduleID){
							if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
								if(response.attachment[j].extension=="pdf"){
									issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [आकार:'+response.attachment[j].size+'केबी]</a><br> ';  
								}else{
									issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/img2.png" height="20px" width="20px"> [आकार:'+response.attachment[j].size+'केबी]</a><br> ';  
								}
							}else if(language=="en_US"){
								if(response.attachment[j].module_type=="English Attachment"){
									atitle=response.attachment[j].title; 
									if(response.attachment[j].extension=="pdf"){
										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
									}else{
										issueHTML+='<a href="javascript:attachmentDownload(='+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/img2.png" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
									}
								}
								 
							}
					}
						
				}
					issueHTML+='</td>'; 
			        }
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
   				/* $("#example").DataTable(); */
			},
			error:function(response){
	        	alert("Error");
	        }
		});
}

</script>

		<script> 
$(function(){
$("body").nightMode({
    keepNormal: "",
    brightnessControler: true,
    autoEnable: true, 
    successText: "Night Mode Successfully Enabled !",
    adjustText: "Would you like to adjust brightness?",
   });
   
$("#example1").DataTable();
$("#example2").DataTable();
});
</script>
		
</body>
</html>