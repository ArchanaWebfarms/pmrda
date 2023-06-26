<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%><%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %><%@ page trimDirectiveWhitespaces="true" %><%@ page contentType="text/html;charset=UTF-8"%><%@ page import="java.util.*" %><%@ page session="true" %>
<link href="staticResources/t3-assets/css/indexStyle.css" rel="stylesheet"  type="text/css" media="all" />
<link rel="stylesheet" href="staticResources/t3-assets/css/bootstrap.min.css">
<link href="staticResources/t3-assets/css/css-53bde-52498.css" rel="stylesheet" type="text/css" media="all" />
<link href="staticResources/t3-assets/css/css-ae08a-09948.css" rel="stylesheet" type="text/css" media="all" />
<link href="staticResources/t3-assets/css/headerStyle.css" rel="stylesheet" type="text/css" media="all" />
<input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>
<c:set var="engLang" value="en_US"/>
<div id="t3-topbars" class="t3-topbars" style="max-height: initial;">
   <div class="container-fluid">
      <div class="row">
         <div class="topmenu col-xs-8 col-md-8 col-lg-8">
            <div class="row">
               <div class="col-md-2 subhead" >
                  <ul class="nav menu" style="padding:5px; text-align:center;">
                     <li class="item-444"> <a href="?lang=en_US"><b>English</b></a> </li>
                     <li class="item-207"> <a href="?lang=marathi"><b>मराठी</b></a> </li>
                  </ul>
               </div>
               <div class="col-md-5 hide-small">
                  <ul class="nav menu" style="padding:0px; text-align:center;">
                     <li class="item-207">
                        <a href="screen_reader" style="position:relative; top:5px;">
                           <b>
                              <spring:message code="label.screenReader" />
                           </b>
                        </a>
                     </li>
                     <li class="item-207">
                        <span class="textresize">
                           <button type="button" onclick="normal()" id="normal" style="height:30px; border: 1px solid #00000061;"><i class="fas fa-sun"></i></button><button type="button" onclick="contrast()" id="Contrast" style="height:30px; border: 1px solid #00000061;"><i class="fas fa-moon"></i></button>
                           <button id="myD" onmousedown="mouseDownD()" onmouseup="mouseUpD()" onclick="decreaseFontSize();">
                              <spring:message code="ID.font" />
                              <sup>-</sup>
                           </button>
                           <button id="myN" onmousedown="mouseDownN()" onmouseup="mouseUpN()" onclick="normalFontSize()" style="background: #0072bb;">
                              <spring:message code="ID.font" />
                           </button>
                           <button id="myI" onmousedown="mouseDownI()" onmouseup="mouseUpI()" onclick="increaseFontSize()">
                              <spring:message code="ID.font" />
                              <sup>+</sup>
                           </button>
                        </span>
                     </li>
                  </ul>
               </div>
               <div class="col-md-5 hide-small">
                  <ul class="nav menu" style="padding:5px; text-align:center;">
                     <li>
                        <a href="javascript:scrollToMain()">
                           <b>
                              <spring:message code="Header.Menu.skipcontent" />
                           </b>
                        </a>
                     </li>
                     <li>
                        <a href="javascript:scrollToNav()">
                           <b>
                              <spring:message code="Header.Menu.skipnavigation" />
                           </b>
                        </a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="col-md-1 col-xs-4" style="padding:5px;">
            <a style="font-size:11px;" href="login" target="_blank">
               <spring:message code="Admin.Login" />
            </a>
         </div>
         <div class="t3-date col-xs-12 col-sm-12 col-md-3 col-lg-3 animatesearch hide-small" style="padding:0px;">
            <form>
               <input type="text" class="on-page-search" name="search" placeholder="<spring:message code="filter.form.Searchbutton" />.."> 
               <div class="display-searchinfo" style="display:none; position:fixed; width:230px; top:30px; z-index:9999; background:yellow; padding:5px; text-align:center;">
                  <span style="font-weight:bold;">
                     <spring:message code="Header.Menu.srchtrminredhliht" />
                  </span>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<header id="t3-header" class="contrast">
   <div class="container-fluid t3-header" style="padding:0px;">
      <div class="row">
         <div class="col-xs-12 col-sm-6 col-md-8 col-lg-8 logo" style="margin-top: 15px;">
            <div class="row">
               <div class="col-md-1 col-xs-12" style="text-align:center;"> <a href="index" title="Cepon"> <img class="logo-img" src="staticResources/images/PMRDALogo1.png" alt="PMRDA Logo" style="text-align:right; width:90px; "/> </a> </div>
               <div class="col-md-10 col-xs-12" style=" padding: 8px 5px;">
                  <h4 id="mainname" class="contrastText" style="margin:0px!important; font-size:19px;">
                     <spring:message code="Header.Menu.logoname1" />
                  </h4>
                  <h5 class="contrastText" style=" font-size:15px;">
                     <spring:message code="footer.li.18" />
                  </h5>
               </div>
            </div>
            <div class="logo-image"> <small class="site-slogan"></small> </div>
         </div>
         <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" id="draft_link_head" style="margin: 15px 0px;position: relative;text-align: center;"><a id="draft_link" data-toggle="modal" data-target="#exampleModal"style="white-space: nowrap;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"><span class="s1">Draft DP of PMR </span> <br><span class="s2"> (2021-2041)</span></a></div>
         <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2" style="text-align:center; display:flex; justify-content:center;"> <a href="https://www.maharashtra.gov.in/1125/Home" onClick="return confirm('<spring:message code="index.confirm.msg"/>')" target="_blank"><img src="staticResources/images/gov_of_Maharashtra.jpg" title="Government of Maharashtra" alt="Government of Maharashtra" height="70" width="70" style="margin-top:15px;" /></a> <a href="https://www.india.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>')" target="_blank"><img src="staticResources/images/satyamevajayate.jpg" title="Satyamevajayate" alt="Satyameva Jayate" height="80" width="80" style="margin-right: -10px; margin-top:10px;" /></a> </div>
      </div>
   </div>
</header>
<nav id="t3-mainnav" class="wrap navbar navbar-default t3-mainnav">
   <div class="container-fluid" style=" background: linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%);">
      <div class="topnav" id="myTopnav">
         <a href="index" class="white-menu" >
            <spring:message code="Header.Menu1.Home" />
         </a>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.AboutUs" />
            </button>
            <div class="dropdown-content" >
               <a href="pmrda_background">
                  <spring:message code="Header.Menu.AboutUs.background" />
               </a>
               <a href="vision_and_mission">
                  <spring:message code="Header.Menu.AboutUs.vision" />
               </a>
               <a href="leadership_and_core_team">
                  <spring:message code="Header.Menu.AboutUs.administrative.leader" />
               </a>
               <a href="objectives">
                  <spring:message code="Header.Menu.AboutUs.objectives" />
               </a>
               <a href="master_plan">
                  <spring:message code="Header.Menu.AboutUs.masterplan" />
               </a>
            </div>
         </div>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.Departments" />
            </button>
            <div class="dropdown-content">
               <c:forEach items="${departmentList}" var="departmentList">
                  <c:choose>
                     <c:when test="${departmentList.deptId==26}"> </c:when>
                     <c:otherwise>
                        <c:choose>
                           <c:when test="${localLang eq 'en_US'}"> <a href="javascript:getDepartment(${departmentList.deptId})">${ departmentList.departmentName}</a> </c:when>
                           <c:otherwise> <a href="javascript:getDepartment(${departmentList.deptId})">${ departmentList.departmentName_h}</a> </c:otherwise>
                        </c:choose>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
            </div>
         </div>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.Projects" />
            </button>
            <div class="dropdown-content" >
               <c:forEach items="${projectList}" var="projectList">
                  <c:choose>
                     <c:when test="${localLang eq 'en_US'}"> <a href="javascript:getProject(${projectList.id})">${ projectList.title}</a> </c:when>
                     <c:otherwise> <a href="javascript:getProject(${projectList.id})">${ projectList.title_h}</a> </c:otherwise>
                  </c:choose>
               </c:forEach>
            </div>
         </div>
         <a href="TpschemeList" class="white-menu" ><spring:message code="Header.Menu.TpScheme" /></a>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.Downloads" />
            </button>
            <div class="dropdown-content" >
               <a href="act">
                  <spring:message code="Header.Menu.AboutUs.actsnrules" />
               </a>
               <a href="govresolution">
                  <spring:message code="Header.Menu.AboutUs.govresol" />
               </a>
               <a href="pmrda_circulars">
                  <spring:message code="Header.Menu.AboutUs.notifications" />
               </a>
               <a href="policies">
                  <spring:message code="Header.Menu.AboutUs.policies" />
               </a>
               <a href="listofvillages">
                  <spring:message code="Header.Menu.AboutUs.listofvillages" />
               </a>
               <a href="Maps" >
                  <spring:message code="Header.Menu.AboutUs.maps" />
               </a>
               <a href="govpmay" >
                  <spring:message code="contact.div.h55.pmay" />
               </a>
            </div>
         </div>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.AboutUs.careers" />
            </button>
            <div class="dropdown-content" style="width:213%;" >
               <a href="currentOpen">
                  <spring:message code="Header.Menu.AboutUs.curropening" />
               </a>
            </div>
         </div>
         <div class="dropdown specialwidth">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.AboutUs.citizenservice" />
            </button>
            <div class="dropdown-content" style="width:191%;" >
               <a href="https://zonecertificate.pmrda.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                  ')" target="_blank">
                  <spring:message code="Header.Menu.AboutUs.zonecrt" />
               </a>
               <a class="no_click" href="https://www.pmrda-obpas.com/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                  ')" target="_blank">
                  <spring:message code="Header.Menu.AboutUs.obpas" />
               </a>
               <a href="https://pmaypmrda.in/" onclick="return confirm('Are you sure you want to go to an external link?')" target="_blank" >
                  <spring:message code="Header.Menu.AboutUspmay" />
               </a>
               <a href="feedback">
                  <spring:message code="footer.li8" />
               </a>
               <a href="enquiry">
                  <spring:message code="footer.li.28" />
               </a>
            </div>
         </div>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.AboutUs.mediacntr" />
            </button>
            <div class="dropdown-content" >
               <a href="press_notes">
                  <spring:message code="pressnotes.title" />
               </a>
               <a href="pmrda_news">
                  <spring:message code="pagetitle.whatnew" />
               </a>
               <a href="videos">
                  <spring:message code="index.module-ct.span1" />
               </a>
               <a href="gallery">
                  <spring:message code="index.module-ct.span2" />
               </a>
                <a href="mediacenter">
                  <spring:message code="Header.Menu.AboutUs.mediacntr" />
               </a>
            </div>
         </div>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="index.Tender" />
            </button>
            <div class="dropdown-content" >
               <a href="https://mahatenders.gov.in/nicgep/app" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                  ')" target="_blank">
                  <spring:message code="index.mtendrlik" />
               </a>
               <a href="pmrda_tenders">
                  <spring:message code="pagetitle.tender.notice" />
               </a>
               <a href="https://gem.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                  ')" target="_blank">
                  <spring:message code="index.portllik" />
               </a>
            </div>
         </div>
         <div class="dropdown">
            <button class="dropbtn dropdown-toggle white-menu" data-toggle="dropdown">
               <spring:message code="Header.Menu.Help1" />
            </button>
            <div class="dropdown-content" >
               <a href="pmrda_rti">
                  <spring:message code="index.prodis" />
               </a>
               <a href="https://rtionline.maharashtra.gov.in/index-e.php" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                  ')" target="_blank">
                  <spring:message code="index.onlinerti" />
               </a>
            </div>
         </div>
         <a href="contact" style=" border-right: none;">
            <spring:message code="Header.Menu.Contact" />
         </a>
         <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
      </div>
   </div>
</nav>
<a href="https://pmaypmrda.in/" id="pmay_float" onclick="return confirm('Are you sure you want to go to an external link?')" target="_blank"><img src="staticResources/images/icon/sarathi.png"></a> 
<form:form action="getDepartmentById" id="deptform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" > <input type="hidden" id="deptid" name="id" /> </form:form>
<form:form action="getProjectById" id="projectform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" > <input type="hidden" id="projectid" name="id" /> </form:form>
<form:form action="getLeader" id="leaderform" oncontextmenu="return false" onkeydown="return false;" onmousedown="return false;" > <input type="hidden" id="leaderid" name="id" /> </form:form>