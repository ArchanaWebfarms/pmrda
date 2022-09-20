
 <%@ page import="com.cmsManagement.controller.LoginController" %>
  <%@ page import="com.cmsManagement.model.FinancialYear" %>
   <%@ page import="com.cmsManagement.dao.FinancialYearDao" %>
   <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    
    <style>
    .user-menu:hover:after #nameOne{
    	background: #3c8dbc!important;
    }
    .navbar-nav .user-menu{
    	width:100%!important;
    }
     
    .sidetogbut{
    	display:none!important;
    }
    @media (max-width: 767px){
    .navbar-nav .user-menu{
    	width:fit-content!important;
    }
    #main-sidebar.active{
    	    transform: translate(0, 0);
    	        margin-top: 180px!important;
    }
    #main-sidebar{
    	   		padding:0px!important;
    	        margin-top: 180px!important;
    }
    .sidetogbut{
    	display:block!important;
    }
    .navbar-custom-menu{
    	margin:0px!important;
    }
    .Pnavbar-custom-menu{
    	padding:0px;
    }
    .navbar-nav{
    	    display: contents!important;
    }
    .barsposition{
    	    position: absolute!important;
    transform: translate(230px, 0px);
    width: 100%;
    transition:all 0.2s linear;
    }
    
    }
    table tbody>tr>td:first-child{
	
	text-align:center!important;
}
#example1_wrapper{
	padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
#example1_wrapper .row{
	    overflow: auto!important;
}
    </style>
    
    <script>
$(function () {
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	 // alert(token);
	 // alert(header);
	  $(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	   // alert(xhr.setRequestHeader(header, token));
	  });
	});
</script>
<div class="headerlogin" style="background:white;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7">
                <a href="index" target="_blank" style="display:flex; text-decoration:none; color:black!important; padding-top:8px;">
                    <div>
                    <img src="staticResources/images/PMRDALogo1.png" alt="PMRDA LOGO" title="Pune Metropolitan Region Development Authority" width="60px">
                </div>
                <div>
                    <h3 style="margin:5px 0px;">Pune Metropolitan Region Development Authority (PMRDA)</h3>
                    <h5 style="margin:0px;">Government of Maharashtra</h5>
                    </div>
                </a>
            </div>
            
            	<div class="col-md-2 col-sm-7" style="text-align:center;">
                  <a href="https://www.maharashtra.gov.in/1125/Home" onClick="return confirm('This is external link, Are you sure you want to continue?')" target="_blank"><img src="staticResources/images/gov_of_Maharashtra.png" title="Government of Maharashtra" alt="Government of Maharashtra" height="60px" width="60px" style="margin-top:5px;" /></a>
                  <a href="https://www.india.gov.in/" onClick="return confirm('This is external link, Are you sure you want to continue?')" target="_blank"><img  src="staticResources/images/satyamevajayate.jpg" title="Satyamevajayate" alt="Satyameva Jayate" height="70px" width="70px" /></a>
                  </div>
            <div class="col-md-3 col-sm-5 Pnavbar-custom-menu">
            	<div class="row navbar-custom-menu" style="background: #3580a8; padding:0px; width:100%;">
      <%-- 	<div class="col-md-12">
      	<c:catch var="CatchNullPointerException">
      	<span id = "currentYear" class="sidebar-toggle"><b>	Financial Year : "<%=session.getAttribute("financialYearID") %>"  </b></span>	
      	</c:catch>
      	</div> --%>
      	
      	
      	<c:catch var="CatchNullPointerException">
     	<input type="hidden" name="typeid" id="typeid" value="<%=LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type()%>">
     	</c:catch>
      	
      	<ul class="nav navbar-nav" style="width:100%;"	>
         <li id="barsposition">
         <button id="toggle-side" class="sidetogbut" style="padding:19px;"><i class="fa fa-bars" aria-hidden="true" style="font-size:25px;"></i></button>
         </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"  id = "d" style="padding:23px 15px; display:flex; background: #3580a8!important;">
              <img src="resources/dist/img/user.png" class="user-image" alt="User Image">
              <input type="text"  id="nameOne"  style="background-color:#3580a8!important; color:white!important; border-style:none; width:100%;" readonly="readonly">
              
              <span class="hidden-xs" id="nameOne"> </span><!-- ${user} -->
            </a>
            <ul class="dropdown-menu" id = dropdown>
              <!-- User image -->
              <li class="user-header" style="height:140px;">
               <p style="width:70%; float:left; padding:0px 15px;">
                <img src="resources/dist/img/user.png" class="user-image" alt="User Image" style="margin:5px; width:35%; height:auto;">
                 <input type="text"  id="nameTwo" style="background-color:#3C8DBC; font-size:16px; border-style:none; width:inherit; text-align:center;"  readonly="readonly">
                </p>
                <div class="pull-right" style="width:30%; display:grid; margin-top:10px;">
                 <a href="javascript:viewUser()" class="btn btn-default btn-flat" style="margin:8px 5px;">Profile</a>
                  <a href="logout" class="btn btn-default btn-flat" style="margin:8px 5px;">Sign out</a>
                </div>
              </li>
             
             
            </ul>
          </li>
        
        </ul>
      	
      	
        
      </div>
            </div>
        </div>

    </div>
</div> 
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" id="main-sidebar" style="margin-top:90px;">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
         <img src="resources/dist/img/user.png" class="user-image" alt="User Image">
        </div>
        <div class="pull-left info">
          <p> <input type="text" id="nameThree" style="background-color: #222D33; border-style:none" readonly="readonly"></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
          
        </div>
      </div>
      <!-- search form -->
      <!-- <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form> -->
      <br>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
      
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview" id="UserElement">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>User Elements</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" >
          <!--   <li class="Active"><a href="masterDashboard"><i class="fa fa-circle-o"></i> Master Dashboard</a></li> -->
           <!--  <li><a href="downloadList"><i class="fa fa-circle-o"></i> Download Dashboard </a></li> -->
            <li id="newsList"><a href="newsList"><i class="fa fa-circle-o"></i> What's New Dashboard</a></li>
             <li id="noticesList"><a href="noticesList"><i class="fa fa-circle-o"></i> Notifications Dashboard</a></li>
            <!--   <li><a href="ordersList"><i class="fa fa-circle-o"></i> Order Dashboard </a></li> -->
            <li id="tenderList"><a href="tenderList"><i class="fa fa-circle-o"></i> Tender Notice Dashboard</a></li>
             <li id="projectlist"><a href="projectlist"><i class="fa fa-circle-o"></i> Project Dashboard</a></li>
    		 <li id="currOpeningList"><a href="currOpeningList"><i class="fa fa-circle-o"></i> Current Openings Dashboard </a></li> 	
           <li id="departmentList"><a href="departmentList"><i class="fa fa-circle-o"></i> Departments Dashboard </a></li>
           
          </ul>
        </li>
        
        
         <li class="treeview" id="AdminElement">
          <a href="#">
            <i class="fa fa-table"></i> <span>Content Approval Elements</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <!--  <li><a href="complaintDashboard"><i class="fa fa-circle-o"></i> Complaint Dashboard </a></li> -->            
             <li id="adminNewsDashboard"><a href="adminNewsDashboard"><i class="fa fa-circle-o"></i> Admin What's New Dashboard </a></li>
             <li id="adminNoticesDashboard"><a href="adminNoticesDashboard"><i class="fa fa-circle-o"></i> Admin Notifications Dashboard </a></li>
             <li id="adminTenderDashboard"><a href="adminTenderDashboard"><i class="fa fa-circle-o"></i> Admin Tender Notice Dashboard</a></li>
             <li id="adminProjectDashboard"><a href="adminProjectDashboard"><i class="fa fa-circle-o"></i> Admin Project Dashboard</a></li>
          <!--    <li><a href="adminOrdersList"><i class="fa fa-circle-o"></i> Admin Orders Dashboard </a></li> -->
          <li id="adminOpeningDashboard"><a href="adminOpeningDashboard"><i class="fa fa-circle-o"></i> Admin Current Openings Dashboard </a></li> 	 
           <li id="adminDepartmentDashboard"><a href="adminDepartmentDashboard"><i class="fa fa-circle-o"></i> Admin Departments Dashboard </a></li> 	 
             <li id="enquiryDashboard"><a href="enquiryDashboard"><i class="fa fa-circle-o"></i> Admin Enquiry Dashboard </a></li>      
              <li id="feedbackDashboard"><a href="feedbackDashboard"><i class="fa fa-circle-o"></i> Admin Feedback Dashboard </a></li>   
                       
         <!--    <li><a href="adminDownloadList"><i class="fa fa-circle-o"></i> Admin Download Dashboard </a></li> -->
            
          
          </ul>
        </li>
        
        <li class="treeview" id="MasterElement">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>Master Elements</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          <li id="reportsDashboard"><a href="reportsDashboard"><i class="fa fa-circle-o"></i>Reports Dashboard </a></li>
           <li id="listOfRoles"><a href="listOfRoles"><i class="fa fa-circle-o"></i> Role Dashboard </a></li>
           <li id="userList"><a href="userList"><i class="fa fa-circle-o"></i> User Dashboard </a></li>
            <li id="rightDashboard"><a href="rightDashboard"><i class="fa fa-circle-o"></i> Right Dashboard</a></li>
            <!--  <li><a href="financialYearDashboard"><i class="fa fa-circle-o"></i> Financial Year Dashboard </a></li> -->
          
         <!--  <li><a href="DesignationList"><i class="fa fa-circle-o"></i> Designation Dashboard </a></li> -->           
            <li id="tendorDepartmentList"><a href="tendorDepartmentList"><i class="fa fa-circle-o"></i> Tender Department Dashboard </a></li>  
            <li id="talukaList"><a href="talukaList"><i class="fa fa-circle-o"></i> Taluka Dashboard </a></li>          
             <!--  <li><a href="NewImages"><i class="fa fa-circle-o"></i> Galary Dashboard </a></li>  -->
              <li id="photoGallaryList"><a href="photoGallaryList"><i class="fa fa-circle-o"></i> Photo Gallery Dashboard </a></li> 
               <li id="videoGallaryList"><a href="videoGallaryList"><i class="fa fa-circle-o"></i> Video Gallery Dashboard </a></li> 
              <li id="mapList"><a href="mapList"><i class="fa fa-circle-o"></i> Maps Dashboard </a></li>   
               <li id="leadershipCoreteamDash"><a href="leadershipCoreteamDash"><i class="fa fa-circle-o"></i> Leadership and Core Team Dashboard </a></li>       
                <li id="RTIDashboard"><a href="RTIDashboard"><i class="fa fa-circle-o"></i> RTI Dashboard </a></li>               
              <li id="metadatalist"><a href="metadatalist"><i class="fa fa-circle-o"></i> MetaData Dashboard </a></li>
               <li id="user_mannual"><a href="user_mannual"><i class="fa fa-circle-o"></i> User Mannual Dashboard </a></li>
           
            </ul>
        </li>
            
        <%-- <li id="documentation"><a href="staticResources/UserMannual/<%=(String)session.getAttribute("userMannual")%>" target="_blank"><i class="fa fa-book"></i> <span>Documentation</span></a></li> --%>
      <li id="documentation"><a href="showMannual"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>



<!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
     <!--  <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li> -->
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>        
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>
          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>
          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  
  <script>
 
 /*  $(function() {
	  $('.treeview-menu li a').each(function() {
	    var isActive = this.pathname === location.pathname;
	    $(this).parent().toggleClass('active', isActive);
	  });
	}); */
    </script>
  
  <!-- /.control-sidebar -->
  <script type="text/javascript">
  $("#toggle-side").click(function(){
	  $("#main-sidebar").toggleClass("active");
	  $("#barsposition").toggleClass("barsposition");
	});
  
  </script>
  
  <script>
      	var tp = $("#financialYearID").val();
      //	document.getElementById("fyear").textContent=tp;
      	</script>
   <input type="hidden" id="doc" value="<%=(String)session.getAttribute("userMannual")%>">
  <script>
  $(document).ready(function(){
	  var typeid = $("#typeid").val();
	 // alert(typeid);
	  if(typeid=="USER")
		  {
		  document.getElementById("MasterElement").style.display = "none";
			document.getElementById("AdminElement").style.display = "none";
			 document.getElementById("UserElement").style.display = "";
		  }
	  if(typeid=="ADMIN" || typeid=="SUPERADMIN")
	  {
		  document.getElementById("MasterElement").style.display = "";
			document.getElementById("AdminElement").style.display = "";
			 document.getElementById("UserElement").style.display = "";
		
	  }
	  
	  var doc=$("#doc").val();//alert(doc)
	    if(doc=="NoMannual"){
	    	$("#documentation").hide();
	    }else{
	    	$("#documentation").show();
	    }
  });
 </script>
  	<c:catch var="CatchNullPointerException">
  	
 <%--  <input type="hidden" name="type" id="type" value="<%=LoginController.getCurrentLoggedInUser().getUser().getUsername()%>"> --%>
   <input type="hidden" name="type" id="type" value="<%=(String)session.getAttribute("userName")%>">
  
  </c:catch>
  <script>
   var type = $("#type").val();
 
 
	 document.getElementById("nameOne").value = type;
	 document.getElementById("nameTwo").value = type;
	 document.getElementById("nameThree").value = type;
	
  
  </script>
 
 <script>
$(document).ready(function(){
    $("#d").mouseover(function(){
        $("#nameOne").css("background-color", "#3580A8");
    });
    $("#d").mouseout(function(){
        $("#nameOne").css("background-color", "#3C8DBC");
    });
});
</script>
 <script>
$(document).ready(function(){
    $("#dropdown").mouseover(function(){
        $("#nameOne").css("background-color", "#3580A8");
    });
    $("#dropdown").mouseout(function(){
        $("#nameOne").css("background-color", "#3C8DBC");
    });
    
   
});

</script>
<form:form  action="viewUser" id="viewUserform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" >  	
  <input type="hidden" id="viewUserid" name="userId" value="<%=session.getAttribute("loginID")  %>"/>  
  </form:form>
<script type="text/javascript">
function viewUser(){
	//$("#viewUserid").val(id);
	$("#viewUserform").submit();
}

</script>

<!-- <script>
$(document).ready(function () {
    $('.treeview-menu li a').click(function(e) {

        $('.treeview-menu li.active').removeClass('active');

        var $parent = $(this).parent();
        $parent.addClass('active');
        e.preventDefault();
    });
});
</script> -->
