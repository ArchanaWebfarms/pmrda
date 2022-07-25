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
       <meta name="keywords" content="help section,section of help]">
      <title>.:: <spring:message code="help.title" /> ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
	  <style>

.bloginfo p{
	text-align:justify;
	}
	
	table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 30px;
}
thead th{
	background: linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%);;
	color:white;
}
td, th {
  border: 1px solid #dddddd!important;
  text-align: left;
  padding: 8px!important;
}

tr:nth-child(even) {
  background-color: #efefef!important;
}

tbody td a{
	color:#777;
	text-decoration:none;
}
tbody td a:hover{
	color:red;
	text-decoration:underline;
}
.table1 td a{
	color:blue;
	text-decoration:underline;
}
</style>  
	
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          
         <jsp:include page="../includes/Header.jsp" />
        
      <div class="clear"></div>
      <div id="maincontent"   class="container-fluid" style="margin-top:30px;">
         
            
                 <div class="col-sx-12 col-sm-12 col-md-12" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="static_content">
                            <div class="bloginfo">
                            <h3 style="margin-bottom: 0px;"><spring:message code="help.title" /></h3><br>
                          <!--   <div class="heading-underline" style="width: 200px;">
					<div class="left"></div><div class="right"></div>
			   </div> -->
                            <div class="bloginfo">
                            <h4 style="margin-bottom: 0px;"><spring:message code="help.div.div1.h4" /></h4><br>
                            <p><spring:message code="help.div.div1.p1" /></p>
                            
                            <table class="table1">
                            	<thead>
                            		<tr>
                            			<th><spring:message code="help.table.tr1.th1" />	</th>
                            			<th><spring:message code="help.table.tr1.th2" /></th>
                            			<th><spring:message code="help.table.tr1.th3" />
                            			</th>
                            		</tr>
                            	</thead>
                            	<tbody>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th1" />	</td>
                            			<td><a href="http://www.nabdelhi.org/NAB_SAFA.htm">http://www.nabdelhi.org/NAB_SAFA.htm</a></td>
                            			<td><spring:message code="help.table.tr2.th3" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th4" />	</td>
                            			<td><a href="http://www.nvda-project.org/">http://www.nvda-project.org/</a></td>
                            			<td><spring:message code="help.table.tr2.th3" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th5" />	</td>
                            			<td><a href="http://www.satogo.com/">http://www.satogo.com/</a></td>
                            			<td><spring:message code="help.table.tr2.th3" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th6" />	</td>
                            			<td><a href="http://www.screenreader.net/index.php?pageid=2">http://www.screenreader.net/index.php?pageid=2</a></td>
                            			<td><spring:message code="help.table.tr2.th3" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th7" />	</td>
                            			<td><a href="http://webanywhere.cs.washington.edu/wa.php">http://webanywhere.cs.washington.edu/wa.php</a></td>
                            			<td><spring:message code="help.table.tr2.th3" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th8" /></td>
                            			<td><a href="	http://www.yourdolphin.co.uk/productdetail.asp?id=5">	http://www.yourdolphin.co.uk/productdetail.asp?id=5</a></td>
                            			<td><spring:message code="help.table.tr2.th9" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th10" /></td>
                            			<td><a href="http://www.freedomscientific.com/jaws-hq.asp">http://www.freedomscientific.com/jaws-hq.asp</a></td>
                            			<td><spring:message code="help.table.tr2.th9" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th11" /></td>
                            			<td><a href="http://www.yourdolphin.co.uk/productdetail.asp?id=1">http://www.yourdolphin.co.uk/productdetail.asp?id=1	</a></td>
                            			<td><spring:message code="help.table.tr2.th9" /></td>
                            		</tr>
                            		<tr>
                            			<td><spring:message code="help.table.tr2.th12" /></td>
                            			<td><a href="http://www.gwmicro.com/Window-Eyes/">http://www.gwmicro.com/Window-Eyes/</a></td>
                            			<td><spring:message code="help.table.tr2.th9" /></td>
                            		</tr>
                            	</tbody>
                            	
                            	
                            </table>
                            
                            
                            </div>
                            
                             <div class="bloginfo">
                            <h4 style="margin-bottom: 0px;"><spring:message code="help.div.div2.h4" /></h4><br>
                           <p><spring:message code="help.div.div2.p1" /></p>
                           
                           <table>
                           <thead>
                           	<tr>
                           		<th><spring:message code="help.table.tr3.th1" /> </th>
                           		<th><spring:message code="help.table.tr3.th2" /> </th>
                           	</tr>
                           	</thead>
                           	<tbody>
                           		<tr>
                           			<td><spring:message code="help.table.tr3.td1" /></td>
                           			<td>
                           				<img src="staticResources/images/icon/MS logo/pdf.png"  alt=" " width="24px"><br>
                           				<a href="https://get.adobe.com/reader/"><spring:message code="help.table.tr3.td2" /></a><br>
                           				<a href="https://acrobat.adobe.com/us/en/acrobat/features.html"><spring:message code="help.table.tr3.td3" /></a>
                           			</td>
                           		</tr>
                           		<tr>
                           			<td><spring:message code="help.table.tr3.td4" />	</td>
                           			<td>
                           				<img src="staticResources/images/icon/MS logo/word.png" alt=" " width="24px"><br>
                           				<a href="https://www.microsoft.com/en-us/download/"><spring:message code="help.table.tr3.td5" /></a><br>
                           				<a href="https://www.microsoft.com/en-us/download/"><spring:message code="help.table.tr3.td6" /></a>
                           			</td>
                           		</tr>
                           		<tr>
                           			<td><spring:message code="help.table.tr3.td7" />	</td>
                           			<td>
                           				<img src="staticResources/images/icon/MS logo/excel.png" alt=" " width="24px"><br>
                           				<a href="https://www.microsoft.com/en-us/download/"><spring:message code="help.table.tr3.td8" /></a><br>
                           				<a href="https://www.microsoft.com/en-us/download/"><spring:message code="help.table.tr3.td9" /></a>
                           			</td>
                           		</tr>
                           		<tr>
                           			<td><spring:message code="help.table.tr3.td10" />	</td>
                           			<td>
                           				<img src="staticResources/images/icon/MS logo/powerpoint.png" alt=" " width="24px"><br>
                           				<a href="https://www.microsoft.com/en-us/download/"><spring:message code="help.table.tr3.td11" /></a><br>
                           				<a href="https://www.microsoft.com/en-us/download/"><spring:message code="help.table.tr3.td12" /></a>
                           			</td>
                           		</tr>
                           	</tbody>
                           </table>
                           
                            </div>
                            
                             
                         
                            
                            </div>
                        </div>
               </div>
               
               
      </div>


	</div>	
				
			
	<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>	
</div>   
   </body>
</html>