<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
  <meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <section class="invoice">
		      <div class="row invoice-info">
		        <!-- /.col -->
		        <div class="col-sm-6 invoice-col">
		            <h4><b>Title : </b>${tendors.title}</h4>  
		           <h4><b>Title : </b>${tendors.title_h}</h4>        
		          <h4><b>Sub Title : </b>${tendors.subTitle}</h4>
		          <h4><b>Description : </b>${tendors.description}</h4>        
		          <h4><b>Opening Date : </b>${tendors.openingDate}</h4>
		          <h4><b>Closing Date : </b>${tendors.closingDate}</h4>        
		          <h4><b>Publish Date : </b>${tendors.publish_date}</h4>
		          <h4><b>Tags : </b>${tendors.tags}</h4>
		          <h4><b>Department : </b>${tendors.tendorsDepartment.departmentName}</h4>
		          <h4><b>Status : </b>${tendors.publishStatus}</h4>
		          
		          
		          
		          <a href="${tendors.url}${tendors.id}">view</a>
		      <br>
		    </section>	
</body>
</html>