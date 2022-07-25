<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
<%@ page import="com.cmsManagement.util.NumbersEnglishToMarathi"%>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
   <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
      <meta name="viewport" content="width=device-width" />
      <title>.:: <spring:message code="pagetitle.tender.notice"  /> ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
       <!-- <script src="staticResources/js/searchTenderByDepartment.js"></script>  -->
      <style type="text/css">
      .archiveLink{          
		 font-size: 20px;
          color:yellow;      
      
      }
      </style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
      <%-- <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active"><spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway"><spring:message code="navigation.container.li2"  /></a></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="tender.pagetitle"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>


<input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>


      <div id="maincontent"  class="container-fluid t3-mainbody dl-container" style="margin-top:30px;">
      <div class="row">
         <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
            		<li>	<a href="#"> <spring:message code="index.Tender"  /> </a></li>
					<li>	   <a href="https://mahatenders.gov.in/nicgep/app" onClick="return confirm('<spring:message code="index.confirm.msg"  />')" target="_blank"><spring:message code="index.mtendrlik"  /></a></li>
						<li>      <a class="active" href="pmrda_tenders"><spring:message code="pagetitle.tender.notice"  /></a></li>
						    <li>  <a href="https://gem.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"  />')" target="_blank"><spring:message code="index.portllik"  /></a></li>
                       
                     </ul>
                  </div>
            </div>
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
            <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h3 class="itemTitle">
               
                  <spring:message code="pagetitle.tender.notice"  />  <a href ="Archive_tenders" style="color:green; font-size:16px;"  class="archiveLink"><spring:message code="archive.archived.tender" /></a>
               </h3>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>




         </div>
        <form action = "">
         
          <div class="row filter-container filter_table_input">
        
           <%--  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"> <spring:message code="filter.form.fromdate"  /></h5>
               <input class="form-control" type="date" name="" id ="fromdate">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.todate"  /></h5>
               <input class="form-control" type="date" name="" id ="todate">
            </div> --%>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 l-w">
               <h5 class="text-left"><spring:message code="filter.form.documenttype"  /> </h5>
               <select name="departments" id="departments"  onchange="searchTendersByDepartment()" class="form-control">
							 	 <c:choose>
								 	  <c:when test="${localLang eq 'marathi'}">
								 	  	
								 	  	 <option selected="selected" value="0">विभाग निवडा</option>
									  	 <c:forEach var="departments" items="${departments}">
									  		
									  		<option value="${departments.dept_id}">${departments.dept_name_h}</option>
									  	 </c:forEach>
								 	  </c:when>
								 	  <c:otherwise>
								 	  	    <option selected="selected" value="0">Select Department</option>
										  	<c:forEach var="departments" items="${departments}">
										  <option value="${departments.dept_id}">${departments.departmentName}</option>
										  	</c:forEach>	
								 	  </c:otherwise>
							 	 </c:choose>
							  </select>
            </div>
           <%--  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.Searchkeyword"  /></h5>
               <input class="form-control" type="text" name="" id="search">
            </div> --%>
            
         </div> 
         <div class="clear"></div>
         <br/>
        <%--  <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnSearch pull-right btn btn-warning" type="button" value="<spring:message code="filter.form.Searchbutton"  />" style="margin-right: 25px;" onclick="SubmitDates()">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnClear btn btn-warning" type="reset" value="<spring:message code="filter.form.Clearbutton"  />" style="margin-left: 25px;">
            </div>
         </div> --%>
         </form>
         
         
         <div class="row" id="data" style="overflow-x: auto;">
      <div id="englishtable" style="display: visible; width:100%;">
         <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
        
         <tr style="white-space: nowrap;">
            <th style="width:5%;" scope="col">S.N.</th><th scope="col">Tender ID</th><th scope="col">Department</th><th scope="col">Publish Date</th><th scope="col">Closing Date</th><th scope="col">Opening Date</th><th scope="col">Download</th>
         </tr>
         
         
          <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
           
         <tr>
         
                             
             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblSN_0">${status.index + 1}</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0"> <%-- <a href="getTenderById?id=${approvedNotice.id}"> --%>[${approvedNotice.subTitle}]&nbsp;${approvedNotice.title}</span>
                             </td><%--<td >
                                ${approvedNotice.subTitle}
                            </td> --%>
                            <td class="A">${approvedNotice.tendorsDepartment.departmentName}</td>
                            <td style="text-align:center;" class="filterDates">${approvedNotice.publish_date} &nbsp;${approvedNotice.publish_time}</td>
                            
                             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.closingDate} &nbsp;${approvedNotice.closing_time}</span>
                            </td>
                             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.openingDate} &nbsp;${approvedNotice.opening_time}</span>
                            </td>
                            
                            <td>
                                
                                 <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
							<c:if test="${approvedNotice.id ==  attachmentlist.moduleID}">
								<c:if test="${attachmentlist.module_type == 'English Attachment'}">
								<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:${attachmentlist.size}KB]</a><br>
										</c:if>						
							</c:if>
					</c:forEach> 
                            </td> 
         </tr>
      
        </c:forEach> 
      </tbody>
      
      </table>  
      </div>
       <div id="marathitable" style="display: none; width:100%">
       
         <table class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
      
         <tr style="white-space: nowrap;">
            <th style="width:5%;" scope="col">अ.क्र.</th><th scope="col">निविदा आयडी</th><th scope="col">विभाग</th><th scope="col">प्रकाशन तारीख</th><th scope="col">अखेरची तारीख</th><th scope="col">प्रारंभिक तारीख</th><th scope="col">डाउनलोड</th>
         </tr>
         
         <% int n=0; %>
          <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
           <% n=n+1; %>
			<% String numb=NumbersEnglishToMarathi.convertInMarathi(String.valueOf(n)); %>
         <tr>
         
                             
             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblSN_0"><%=numb %></span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0"><%-- <a href="getTenderById?id=${approvedNotice.id}"> --%>[${approvedNotice.subTitle_h}] ${approvedNotice.title_h}<!-- </a> --></span>
                            </td>
                             <td class="A">${approvedNotice.tendorsDepartment.dept_name_h}</td>
                            <td style="text-align:center;" class="filterDates">${approvedNotice.publish_date_h} &nbsp;${approvedNotice.publish_time_h}</td>
                            <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.closingDate_h} &nbsp;${approvedNotice.closing_time_h}</span>
                            </td>
                             <td style="text-align:center;">
                                <span id="SitePH_grdupload_lblsize_0"> ${approvedNotice.openingDate_h} &nbsp;${approvedNotice.opening_time_h}</span>
                            </td>
                             
                            <td>
                                
                                 <c:forEach var="attachmentlist" items="${attachmentlist}" varStatus="status">
								<c:if test="${approvedNotice.id ==  attachmentlist.moduleID}">
							
								<c:if test="${attachmentlist.module_type == 'Marathi Attachment'}">
								<a  href="javascript:attachmentDownload(${attachmentlist.attachmentID})">${attachmentlist.title} <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [आकार:${attachmentlist.size}केबी]</a><br>
										</c:if>						
							</c:if>
					</c:forEach> 
                            </td> 
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
         <script src="staticResources/js/submitDates.js"></script>
        <script src="resources/js/NumberConversion.js"></script> 
        	
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
       $(function() {	
    		  
    		  
    		  
    		  var language=$("#lang").val();
    		//  alert(language);
    		  if(language=="marathi")
    			 {
    			  
    			  $("#marathitable").show();
    			  $("#englishtable").hide();
    			  document.getElementById("marathitable").style.visibility = "visible";
    			  document.getElementById("englishtable").style.visibility = "none";
    			 }
    		 
    		  
    		  
    		  
    	});  


/* function SubmitDates(){//alert("in tender")
	var language=$("#lang").val();//alert(language)
	
  var issueHTML;
  
  if(language=="marathi")
	 {
	 issueHTML = 
		 '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
			'<thead><tr style="white-space: nowrap;"><th style="width:5%;">अ.क्र.</th><th>निविदा आयडी</th><th>विभाग </th><th>प्रकाशन तारीख </th><th>उघडण्याची तारीख</th><th>बंद होण्याची तारीख</th><th>डाउनलोड करा</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
  else{
	  issueHTML = 
		  '<div class="box-body"  style="width:100%;"><table id="example" class="table table-bordered  dl-table">'+ 
			'<thead><tr style="white-space: nowrap;"><th style="width:5%;">S.N.</th><th>Tender ID</th><th>Department</th><th>Publish Date </th><th>Opening Date </th><th>Closing Date </th><th>Download</th></tr>'+
			'</thead>'+
			'<tbody>';	
  }
	
	 var fromdate = $("#fromdate").val(); //alert(fromdate)
	 var todate = $("#todate").val();// alert(todate)
	
     $.ajax({
		 url:"tenderbydates?fromdate="+fromdate+"&todate="+todate,
			success:function(response){
				console.log(response)
				
				for(var i=0;i<response.tendor.length;i++){   
					var title;
					var deptName;
					var pathName;
					var atitle;
					
					if(language=="marathi"){
						title=response.tendor[i].title_h;
						deptName=response.tendor[i].tendorsDepartment.dept_name_h;
					}else{
						title=response.tendor[i].title;	
						deptName=response.tendor[i].tendorsDepartment.departmentName;
					} 
					
					
				    var j = i+1;
					issueHTML+='<tr><td style="text-align:center;">'+j+'</td>'+
					'<td>'+response.tendor[i].subTitle+'&nbsp;'+title+'</td>'+	
					/* '<td>'+response.tendor[i].subTitle+'</td>'+ */
					/* '<td>'+deptName+'</td>'+
					'<td style="text-align:center;">'+response.tendor[i].publish_date+'</td>'+
					'<td style="text-align:center;">'+response.tendor[i].openingDate+'</td>'+
					'<td style="text-align:center;">'+response.tendor[i].closingDate+'</td>'+
					'<td>';
					
						for(var j=0;j<response.attachment.length;j++){   
							if(response.tendor[i].id==response.attachment[j].moduleID){
								if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
										issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
								}else if(language=="en_US"){
									if(response.attachment[j].module_type=="English Attachment"){
										atitle=response.attachment[j].title; 
										issueHTML+='<a href="attachmentDownload?path='+response.attachment[j].path+'" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
									}
									 
								}
							
							
						}
							
					}
						issueHTML+='</td>';
			        }
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
	
			},
			error:function(response){
	        	alert("Error");
	        }
		});
} */ 

</script>
<script type="text/javascript">
	 // Write on keyup event of keyword input element
    $("#search").keyup(function(){
        _this = this;
        $.each($("input").find("text"), function() {
            console.log($(this).text());
            alert($(this).text());
           if($(this).find('text').eq(1).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
               $(this).hide();
            else
                 $(this).show();                
        });
    }); 
    </script>
    <script>
   
    function searchTendersByDepartment(){
    	var language=$("#lang").val();
    	
      var issueHTML;
      if(language=="marathi")
 	 {
 	 issueHTML = 
 		 '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">'+ 
 			'<thead><tr style="white-space: nowrap;"><th style="width:5%;">अ.क्र.</th><th>निविदा आयडी</th><th>विभाग </th><th>प्रकाशन तारीख </th><th>अखेरची तारीख</th><th>प्रारंभिक तारीख</th><th>डाउनलोड</th></tr>'+
 			'</thead>'+
 			'<tbody>';	
 	 }
   else{
 	  issueHTML = 
 		  '<div class="box-body" style="width:100%;"><table id="example" class="table table-bordered  dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">'+ 
 			'<thead><tr style="white-space: nowrap;"><th style="width:5%;">S.N.</th><th>Tender ID</th><th>Department</th><th>Publish Date </th><th>Closing Date </th><th>Opening Date </th><th>Download</th></tr>'+
 			'</thead>'+
 			'<tbody>';	
   }
    	
      var departments = $("#departments").val();
         $.ajax({
        	 url:"searchTendersByDepartment?departments="+departments,
    			success:function(response){
    				console.log(response)
    				
    				for(var i=0;i<response.tendor.length;i++){   
    					var title;
    					var deptName;
    					var pathName;
    					var atitle;
    					var cdate;
    					var pdate;
    					var odate;
    					var subtitle;
    					var numb;
    					
   					 	var j = i+1;
    					    					
    					if(language=="marathi"){
    						title=response.tendor[i].title_h;
    						deptName=response.tendor[i].tendorsDepartment.dept_name_h;
    						cdate=response.tendor[i].closingDate_h+' '+response.tendor[i].closing_time_h
    						pdate=response.tendor[i].publish_date_h+' '+response.tendor[i].publish_time_h;
    						odate=response.tendor[i].openingDate_h+' '+response.tendor[i].opening_time_h;
    						subtitle=response.tendor[i].subTitle_h;		
    						numb=NumbersInEngToMar(String(j));
    					}else{
    						title=response.tendor[i].title;	
    						deptName=response.tendor[i].tendorsDepartment.departmentName;
    						cdate=response.tendor[i].closingDate+' '+response.tendor[i].closing_time
    						pdate=response.tendor[i].publish_date+' '+response.tendor[i].publish_time;
    						odate=response.tendor[i].openingDate+' '+response.tendor[i].opening_time;
    						subtitle=response.tendor[i].subTitle;
    						numb=j;
    					} 
    					    					
    					issueHTML+='<tr><td style="text-align:center;">'+numb+'</td>'+
    					'<td>['+subtitle+'] '+title+'</td>'+	
    					/* '<td>'+response.tendor[i].subTitle+'</td>'+ */
    					'<td>'+deptName+'</td>'+
    					'<td style="text-align:center;">'+pdate+'</td>'+
    					'<td style="text-align:center;">'+cdate+'</td>'+
    					'<td style="text-align:center;">'+odate+'</td>'+
    					
    					'<td>';
    					
    						for(var j=0;j<response.attachment.length;j++){   
    							if(response.tendor[i].id==response.attachment[j].moduleID){
    								if(language=="marathi" && response.attachment[j].module_type=="Marathi Attachment"){
    										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [आकार:'+response.attachment[j].size+'केबी]</a><br> ';  
    								}else if(language=="en_US"){
    									if(response.attachment[j].module_type=="English Attachment"){
    										atitle=response.attachment[j].title; 
    										issueHTML+='<a href="javascript:attachmentDownload('+response.attachment[j].attachmentID+')" >'+response.attachment[j].title+' <img src="staticResources/images/pdf1.ico" height="20px" width="20px"> [size:'+response.attachment[j].size+'KB]</a><br> ';  
    									}
    									 
    								}						
    						}
    							
    					}
    						issueHTML+='</td>';
    			        }
       				issueHTML+='</tbody></table>';
       				$("#data").html(issueHTML);
    	
    			},
    			error:function(response){
    	        	alert("Error");
    	        }
    		});
    }
    
    /* function searchNoticesByDepartment(){
   	 var tendorStatus = $("#departments").val();
 	
 	
 	if(tendorStatus!="Planning Department" && tendorStatus!="Building Permission Department" &&  tendorStatus!="Engineering Department"&&  tendorStatus!="Illegal Construction Department" 
 		&& 	tendorStatus!="Land and Estate Department" && tendorStatus!="Accounts and Finance Department" && tendorStatus!="Administration Department"
 		&& tendorStatus!="Centre for Excellence"  && tendorStatus!="Private and Foreign Direct Investment Department" 
 			 && tendorStatus!="Fire Department"   )
 				{
 	
 	
 	
 				}
 	
 	else if (tendorStatus=="Planning Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		       
 		        if( $(this).text() != 'Planning Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	else if (tendorStatus=="Building Permission Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Building Permission Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	else if (tendorStatus=="Engineering Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Engineering Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	
 	
 	else if (tendorStatus=="Illegal Construction Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Illegal Construction Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	
 	
 	else if (tendorStatus=="Land and Estate Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Land and Estate Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	
 	else if (tendorStatus=="Accounts and Finance Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Accounts andFinance Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	else if (tendorStatus=="Administration Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Administration Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	
 	else if (tendorStatus=="Centre for Excellence")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Centre for Excellence')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	else if (tendorStatus=="Private and Foreign Direct Investment Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Private and Foreign Direct Investment Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	else if (tendorStatus=="Fire Department")
 	{
 		$(function() {
 		    $('.A').filter(function() {
 		    	
 		      
 		        if( $(this).text() != 'Fire Department')
 		        	{
 		       
 		        	$(this).parent().hide();
 		        	}
 		        else
 		        	{
 		        	$(this).parent().show();
 		        	}
 		      
 		        
 		        
 		    })
 		});
 	}
 	else
 	{
 		
 		location.reload();
 	}
 } */
    </script>
      </div>   
   </body>
</html>