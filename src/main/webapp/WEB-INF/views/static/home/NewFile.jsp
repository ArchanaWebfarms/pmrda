<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
     <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
      <title>.:: Downloads ::.</title>
      <meta name="viewport" content="width=device-width" />
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />

		<div class="clear"></div>
      <div id="maincontent"   class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active">You are here: &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway">Home</a></li><li><i class="fas fa-caret-right"></i> <a href="./downloads.html" class="pathway">Downloads</a></li><li><i class="fas fa-caret-right"></i> <span>Notices And Circulars</span></li></ol>
               </div>
            </section>
            <hr/>
      </div>





      <div id="t3-mainbody" class="container-fluid t3-mainbody dl-container">
         <div class="row">
            <div class="itemHeader">

               <h2 class="itemTitle">
               
               Downloads
               </h2>

            </div>
               
            <div class="heading-underline" style="width: 200px;">
               <div class="left"></div><div class="right"></div>
            </div>




         </div>
         <div class="row filter-container">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left">From Date</h5>
               <input class="form-control" type="date" name="">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left">To Date</h5>
               <input class="form-control" type="date" name="">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left">Document Type</h5>
               <select class="form-control">
                  <option value="-Document Type-">Document Type</option>
                  <option value="ABC">ABC</option>
                  <option value="XYZ">XYZ</option>
               </select>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 l-w">
               <h5 class="text-left">Keyword Search</h5>
               <input class="form-control" type="text" name="">
            </div>
         </div>
         <div class="clear"></div>
         <br/>
         <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnSearch pull-right btn btn-warning" type="submit" value="Search" style="margin-right: 25px;">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
               <input class="btnClear btn btn-warning" type="reset" value="Clear" style="margin-left: 25px;">
            </div>
         </div>
         <br/>
         <div class="row" style="overflow-x: auto;">
            <table class="table table-bordered table-striped dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody><tr>
            <th scope="col" style="width:10%;">SrNo</th><th scope="col">Subject</th><th scope="col">Document Type</th><th scope="col">Date</th><th scope="col">Size (MB)</th><th scope="col">Download</th>
         </tr><tr>
            <td>
                                <span id="SitePH_grdupload_lblSN_0">1</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblsub_0">SLP Matters</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCategory_0">Circular Notice Court Order</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblCreatedDate_0">17/05/2017</span>
                            </td><td>
                                <span id="SitePH_grdupload_lblsize_0">1.14</span>
                            </td><td>
                                <a class="align-center" href="../../Site/Upload/GR/SLP -2015 Thane CVC.pdf" target="_blank">
                                    <i class="fas fa-file-pdf"></i></a>
                            </td>
         </tr>
      </tbody></table><br/>
         </div>

      </div>

         
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>