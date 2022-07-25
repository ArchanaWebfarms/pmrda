<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
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
      <title>.::  <spring:message code="news.pagetitle"  /> ::.</title>
      
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
      <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">You are here: &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">Home</a></li><li><i class="fas fa-caret-right"></i> <a href="./downloads.html" class="pathway">Downloads</a></li><li><i class="fas fa-caret-right"></i> <span>Notices And Circulars</span></li></ol>
               </div>
            </section>
            <hr/>
      </div>

          <input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>



      <div id="t3-mainbody  maincontent" class="container-fluid t3-mainbody dl-container">
         <div class="row">
            <div class="itemHeader">

               <h2 class="itemTitle">
               
              
               <spring:message code="news.t3-mainbody.itemTitle.h2"  />
               </h2>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>




         </div>
          <form action = "">
         
         <div class="row filter-container">
        
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"> <spring:message code="filter.form.fromdate"  /></h5>
               <input class="form-control" type="date" name="" id ="fromdate">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.todate"  /></h5>
               <input class="form-control" type="date" name="" id ="todate">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.documenttype"  /> </h5>
               <select class="form-control">
                  <option value="-Document Type-"><spring:message code="filter.form.documenttype"  /></option>
                  <option value="ABC">ABC</option>
                  <option value="XYZ">XYZ</option>
               </select>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left"><spring:message code="filter.form.Searchkeyword"  /></h5>
               <input class="form-control" type="text" name="" id="search">
            </div>
            
         </div>
         <div class="clear"></div>
         <br/>
         <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnSearch pull-right btn btn-warning" type="button" value="<spring:message code="filter.form.Searchbutton"  />" style="margin-right: 25px;" onclick="SubmitDates()">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnClear btn btn-warning" type="reset" value="<spring:message code="filter.form.Clearbutton"  />" style="margin-left: 25px;">
            </div>
         </div>
         </form>
         <br/>
         <div class="row" id="data" style="overflow-x: auto;">
      
           <section class="invoice">
		      <div class="row invoice-info">
		        <!-- /.col -->
		        <div class="col-sm-6 invoice-col">
		           <h4><b>Title : </b>${News.title}</h4>   
		             <h4><b>Title In Marathi: </b>${News.title_h}</h4>   
		            <h4><b>News Paper : </b>${News.newspaper}</h4>  
		             <h4><b>News Paper  In Marathi : </b>${News.newspaper_h}</h4>  
		          <h4><b>Sub Title : </b>${News.subtitle}</h4>
		          <h4><b>Description : </b>${News.description}</h4>        
		          <h4><b>Publish Date : </b>${News.publish_date}</h4>
		          <h4><b>Tags : </b>${News.tag}</h4>        
		          <h4><b>Creation Date : </b>${News.created_date}</h4>
		          <h4><b>Status : </b>${News.status}</h4>
		        </div>
		      </div><a href="${News.url}${News.id}">view</a>
		      <br>
		    </section>	<br/>
         </div>

      </div>

         
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
        
        	
       <script>



function SubmitDates(){
	var language=$("#lang").val();
	//alert(language);
	 var issueHTML;
	 if(language=="marathi")
		 {
		 issueHTML = 
			 '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
				'<thead><tr><th>अनुक्रमांक</th><th>मराठीतील शीर्षक</th><th>तारीख </th><th>वृत्तपत्र</th><th>डाउनलोड करा</th></tr>'+
				'</thead>'+
				'<tbody>';	
		 }
	 else{
	 issueHTML = 
		 '<div class="box-body"><table id="example" class="table table-bordered table-striped dl-table">'+ 
			'<thead><tr><th>Sr. No.</th><th>Title</th><th>Date </th><th>News Paper </th><th>Download</th></tr>'+
			'</thead>'+
			'<tbody>';	
	 }
	 var fromdate = $("#fromdate").val(); 
	 var todate = $("#todate").val(); 
     $.ajax({
		 url:"newsbydates?fromdate="+fromdate+"&todate="+todate,
			success:function(response){
				
				for(var i=0;i<response.length;i++){
					var title;
					var newspaper;
					if(language=="marathi"){
						title=response[i].title_h;
						newspaper=response[i].newspaper_h;
					}else{
						title=response[i].title;
						newspaper=response[i].newspaper;
					} 
				    var j = i+1;
					issueHTML+='<tr><td>'+j+'</td>'+
					'<td>'+title+'</td>'+			
					'<td>'+response[i].publish_date+'</td>'+
					'<td>'+newspaper+'</td>'+
					'<td><a href="attachmentDownload?path='+response[i].attachment.path+'">Download</a></td>' ; 
			        }
   				issueHTML+='</tbody></table>';
   				$("#data").html(issueHTML);
			},
			error:function(response){
	        	alert("Error");
	        }
		});
}

</script>
<script type="text/javascript">
	 // Write on keyup event of keyword input element
   $("#search").keyup(function(){
    _this = this;
    $.each($("#example tbody").find("tr"), function() {
        console.log($(this).text());
      //  alert($(this).text());
       if($(this).find('td').eq(1).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
           $(this).hide();
        else
             $(this).show();                
    });
}); 
    </script>
      </div>   
   </body>
</html>