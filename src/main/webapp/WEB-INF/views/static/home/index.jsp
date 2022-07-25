<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
      <%
         response.setHeader("Cache-Control","no-cache");
         response.setHeader("Cache-Control","no-store");
         response.setHeader("Pragma","no-cache");
         response.setDateHeader ("Expires", 0);  
         %>
      <base href="" />
      <meta name="viewport" content="width=device-width" />
      <meta name="keywords" content="pmrda ,about pmrda ">
      <meta name="description" content="PMRDA is the Planning and Development Authority for the Pune Metro Region with an outlook towards channelizing growth in a strategic and orderly manner "/>
      <meta name="og:title"  content=" Pune Metropolitan Region Development Authority " />
      <meta name="og:url" content="pmrda.gov.in"/>
      <meta name="og:email" content="comm@pmrda.gov.in"/>
      <meta name="twitter:title" content=" Pune Metropolitan Region Development Authority ">
      <meta name="twitter:description" content=" The Pune Metropolitan Region Development Authority (PMRDA) is the planning and development authority of the region formed">
      <title>.:: PMRDA ::.</title>
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
   </head>
   <body id="body" class="contrast">
      <input type="hidden" name="lang" id="lang1" value="<%=LocaleContextHolder.getLocale()%>">
      <c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>
      <c:set var="engLang" value="en_US"/>
      <div class="t3-wrapper t3-homepage-2">
         <jsp:include page="../includes/Header.jsp" />
         <section class="wrap t3-featured-news">
            <h3 style="margin:0px; position:absolute; visibility: hidden;">updates</h3>
            <div class="container-fluid" id="maincontent" style=" background-color:white;">
               <div class="t3-breaking ">
                  <div class="row">
                     <div class=" blinking">
                        <label style=" padding-bottom: 2px; font-size: 12px; margin:0px!important; padding-right:0px!important;">
                           <strong>
                              <spring:message code="label.ImportantUpdates"/>
                              :
                           </strong>
                        </label>
                     </div>
                     <div class="col-xs-12 col-md-12">
                        <div style="height: 25px;">
                           <div id="marquee" class="H_marquee contrast" style="left:15px; height:30px; width:93%;">
                              <marquee id="aboveBM" class="marquee_inner" onmouseover="this.stop()" onmouseout="this.start()">
                                 <p style="font-weight:500; font-size:12px; margin:0px; line-height:30px;">
                                    <span style="color:#00FFFF">&nbsp; </span> 
                                 	<a href="staticResources/content/GazetteSearch.pdf" target="_blank">Gazette Information of Publication of Draft Development Plan of PMR</a>
                                    <c:forEach var="entryLogModellist" items="${entryLogModellist}" varStatus="status">
                                       <c:if test=""></c:if>
                                       <span class="marqueeText1">
                                          <c:if test="${entryLogModellist.type eq 'NEWS'}">
                                             <c:choose>
                                                <c:when test="${localLang eq engLang}"> <a href="pmrda_news">What's New</a> : ${entryLogModellist.title}</c:when>
                                                <c:otherwise> <a href="pmrda_news"> नवीन काय आहे</a> : ${entryLogModellist.title_h}</c:otherwise>
                                             </c:choose>
                                          </c:if>
                                          <c:if test="${entryLogModellist.type eq 'TENDER'}">
                                             <c:choose>
                                                <c:when test="${localLang eq engLang}"><a href="pmrda_tenders">Tender Notice</a> : ${entryLogModellist.title}</c:when>
                                                <c:otherwise> <a href="pmrda_tenders"> निविदा सूचना</a> : ${entryLogModellist.title_h}</c:otherwise>
                                             </c:choose>
                                          </c:if>
                                          <c:if test="${entryLogModellist.type eq 'CIRCULERS'}">
                                             <c:choose>
                                                <c:when test="${localLang eq engLang}"> <a href="pmrda_circulars">Notifications</a> : ${entryLogModellist.title}</c:when>
                                                <c:otherwise> <a href="pmrda_circulars"> अधिसूचना</a> : ${entryLogModellist.title_h}</c:otherwise>
                                             </c:choose>
                                          </c:if>
                                       </span>
                                    </c:forEach>
                                 </p>
                              </marquee>
                           </div>
                           <div class="above_banner"><em onclick="document.getElementById('aboveBM').start();" class="fa fa-play-circle" aria-hidden="true"></em><em onclick="document.getElementById('aboveBM').stop();" class="fa fa-pause-circle" aria-hidden="true"></em></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <section class="main-part container-fluid">
            <h3 style="margin:0px; position:absolute; visibility: hidden;">banner</h3>
            <div class="row">
               <div class="col-lg-9 col-md-9 left-main-part contrast">
                  <div class="row main-slider">
                     <ul id="slides">
                        <li class="slide showing"><img src="staticResources/images/slider/5.jpg" alt="banner-image"></li>
                        <li class="slide"><img src="staticResources/images/slider/6.jpg" alt="banner-image"></li>
                        <li class="slide"><img src="staticResources/images/slider/7.jpg" alt="banner-image"></li>
                        <li class="slide"><img src="staticResources/images/slider/8.jpg" alt="banner-image"></li>
                        <li class="slide"><img src="staticResources/images/slider/9.jpg" alt="banner-image"></li>
                     </ul>
                     <div class="banner_control"><button class="controls" id="play"><em class="fa fa-play-circle" aria-hidden="true"></em></button><button class="controls" id="pause"><em class="fa fa-pause-circle" aria-hidden="true"></em></button></div>
                  </div>
                  <div class="row">
                     <div class="secMarquee">
                        <div id="marquee2" class="H_marquee2">
                           <marquee id="belowBM" class="marquee_inner" onmouseover="this.stop()" onmouseout="this.start()">
                              <p class="marqueeText2">
                              Smaple line of sentecnce text Smaple line of sentecnce textSmaple line of sentecnce text
                                 <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
                                    <c:choose>
                                       <c:when test="${localLang eq engLang}"> <a href="pmrda_circulars"> ${approvedNotice.title} </a></c:when>
                                       <c:otherwise> <a href="pmrda_circulars"> ${approvedNotice.title_h} </a></c:otherwise>
                                    </c:choose>
                                 </c:forEach>
                              </p>
                           </marquee>
                        </div>
                        <div class="below_banner"><em onclick="document.getElementById('belowBM').start();" class="fa fa-play-circle" aria-hidden="true"></em><em onclick="document.getElementById('belowBM').stop();" class="fa fa-pause-circle" aria-hidden="true"></em></div>
                     </div>
                  </div>
                  <div class="row sidepadMob content_heading_h">
                     <div class="content_heading">
                        <div class="heading">
                           <h4 class="marqueeText2">
                              <spring:message code="index.intro.heading"/>
                           </h4>
                        </div>
                     </div>
                     <p class="text">
                        <spring:message code="index.intro.subheading"/>
                     </p>
                     <p class="main_para" id="search_para">
                        <spring:message code="index.intro.p1"/>
                     </p>
                     <p class="main_para">
                        <spring:message code="index.intro.p2"/>
                     </p>
                     <p class="main_para">
                        <spring:message code="index.intro.p3"/>
                     </p>
                     <span style="text-align:end; width:100%; float:right">
                        <a style="color:red;" href="welcomeToPMRDA">
                           <spring:message code="index.h2.ReadmoreCommon"/>
                        </a>
                     </span>
                  </div>
               </div>
               <div class="col-lg-3 col-md-3 right-main-part">
                  <div class="row">
                     <div class="col-md-12 col-sm-6">
                        <div class="userinfotab contrast sidepadMob" style="height:368px;">
                           <h5>
                              <spring:message code="cm.body.h2"/>
                           </h5>
                           <c:choose>
                              <c:when test="${localLang eq 'en_US'}">
                                 <c:forEach items="${cm_info.attachment}" var="leaderAttachList"><img alt="${cm_info.name}" title="${cm_info.name}" src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}"></c:forEach>
                                 <h4 class="contrastText">${cm_info.name}</h4>
                                 <span class="incsiz">${cm_info.positon}</span> 
                                 <p>
                                    ${cm_info.description} 
                                    <a href="javascript:getLeader(1)">
                                       <spring:message code="index.container.a1"/>
                                    </a>
                                 </p>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach items="${cm_info.attachment}" var="leaderAttachList"><img alt="${cm_info.name_h}" title="${cm_info.name_h}" src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}"></c:forEach>
                                 <h4 class="contrastText">${cm_info.name_h}</h4>
                                 <span class="incsiz">${cm_info.positon_h}</span> 
                                 <p>
                                    ${cm_info.description_h} 
                                    <a href="javascript:getLeader(1)" style="color:red; float:right; width:100%; text-align: end;">
                                       <spring:message code="index.container.a1"/>
                                    </a>
                                 </p>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <div class="col-md-12 col-sm-6">
                        <div class="userinfotab userinfotab_second contrast sidepadMob" style="margin-top:13px;">
                           <h5>
                              <spring:message code="ceo.body.h2"/>
                           </h5>
                           <c:choose>
                              <c:when test="${localLang eq 'en_US'}">
                                 <c:forEach items="${ceo_info.attachment}" var="leaderAttachList"><img alt="${ceo_info.name}" title="${ceo_info.name}" src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}"></c:forEach>
                                 <h4 class="contrastText">${ceo_info.name}</h4>
                                 <span class="incsiz">${ceo_info.positon}</span> 
                                 <p>
                                    ${ceo_info.description} 
                                    <a href="javascript:getLeader(3)">
                                       <spring:message code="index.container.a1"/>
                                    </a>
                                 </p>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach items="${ceo_info.attachment}" var="leaderAttachList"><img alt="${ceo_info.name_h}" title="${ceo_info.name_h}" src="staticResources/LeadershipCoreTeam/${leaderAttachList.attachmnt_name}"></c:forEach>
                                 <h4 class="contrastText">${ceo_info.name_h}</h4>
                                 <span class="incsiz">${ceo_info.positon_h}</span> 
                                 <p>
                                    ${ceo_info.description_h} 
                                    <a href="javascript:getLeader(3)">
                                       <spring:message code="index.container.a1"/>
                                    </a>
                                 </p>
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-9 col-md-9 left-main-part contrast">
                  <div class="row">
                     <div class="col-sm-6 sidepadMob nete1">
                        <div style="height: 350px; box-shadow: 0px 5px 10px 2px lightgrey;">
                           <h5>
                              <a href="pmrda_news">
                                 <spring:message code="pagetitle.whatnew"/>
                              </a>
                           </h5>
                           <div class="marq-tab" >
                              <div class="V_marquee" id="newsmarquee" style="height: 260px; padding:10px;">
                                 <div class="marquee_inner">
                                    <c:forEach var="approvedNews" items="${approvedNews}" varStatus="status">
                                       <c:choose>
                                          <c:when test="${localLang eq engLang}">
                                             <p>
                                                <strong>
                                                   <spring:message code="search.th2"/>
                                                   :
                                                </strong>
                                                ${approvedNews.title}
                                             </p>
                                             <p>
                                                <strong>
                                                   <spring:message code="table.heading.Date"/>
                                                   :
                                                </strong>
                                                ${approvedNews.publish_date}
                                             </p>
                                          </c:when>
                                          <c:otherwise>
                                             <p>
                                                <strong>
                                                   <spring:message code="search.th2"/>
                                                   :
                                                </strong>
                                                ${approvedNews.title_h} 
                                             </p>
                                             <p>
                                                <strong>
                                                   <spring:message code="table.heading.Date"/>
                                                   :
                                                </strong>
                                                ${approvedNews.publish_date_h}
                                             </p>
                                          </c:otherwise>
                                       </c:choose>
                                       <hr>
                                    </c:forEach>
                                 </div>
                              </div>
                           </div>
                           <div class="marq-tab-view">
                              <em onclick="start_t_marquee();" class="fa fa-play-circle" aria-hidden="true"></em><em onclick="stop_t_marquee();" class="fa fa-pause-circle" aria-hidden="true"></em> 
                              <span>
                                 <a href="pmrda_news">
                                    <spring:message code="marquee.viewmore"/>
                                 </a>
                              </span>
                           </div>
                        </div>
                     </div>
                     <div class="col-sm-6 sidepadMob nete2">
                        <div style="height: 350px; box-shadow: 0px 5px 10px 2px lightgrey;">
                           <h5>
                              <a href="pmrda_tenders">
                                 <spring:message code="pagetitle.tender.notice"/>
                              </a>
                           </h5>
                           <div class="marq-tab">
                              <div class="V_marquee" id="tendermarquee" style="height: 260px; padding:10px;">
                                 <div class="marquee_inner">
                                    <c:forEach var="approvedTendors" items="${approvedTendors}" varStatus="status">
                                       <c:choose>
                                          <c:when test="${localLang eq engLang}">
                                             <p>
                                                <strong>
                                                   <spring:message code="search.th2"/>
                                                   :
                                                </strong>
                                                ${approvedTendors.title} 
                                             </p>
                                             <p>
                                                <strong>
                                                   <spring:message code="index.TenderTabHeading3"/>
                                                   :
                                                </strong>
                                                ${approvedTendors.closingDate}&nbsp;${approvedTendors.closing_time} 
                                             </p>
                                          </c:when>
                                          <c:otherwise>
                                             <p>
                                                <strong>
                                                   <spring:message code="search.th2"/>
                                                   :
                                                </strong>
                                                ${approvedTendors.title_h} 
                                             </p>
                                             <p>
                                                <strong>
                                                   <spring:message code="index.TenderTabHeading3"/>
                                                   :
                                                </strong>
                                                ${approvedTendors.closingDate_h}&nbsp;${approvedTendors.closing_time_h} 
                                             </p>
                                          </c:otherwise>
                                       </c:choose>
                                       <hr>
                                    </c:forEach>
                                 </div>
                              </div>
                           </div>
                           <div class="marq-tab-view">
                              <em onclick="start_fr_marquee();" class="fa fa-play-circle" aria-hidden="true"></em><em onclick="stop_fr_marquee();" class="fa fa-pause-circle" aria-hidden="true"></em> 
                              <span>
                                 <a href="pmrda_tenders">
                                    <spring:message code="marquee.viewmore"/>
                                 </a>
                              </span>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3 col-md-3 right-main-part">
                  <div class="row">
                     <div class="about_pmrda_tab sidepadMob">
                        <h5 style="text-align:center; padding:10px; background: linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%); color:white;">
                           <spring:message code="index.abtpmrda"/>
                        </h5>
                        <div class=" about-slider">
                           <div class="w3-content w3-section" style="width:100%; height:297px; overflow:hidden;"> <img class="mySlides" src="staticResources/images/PMRDARegion1.jpg" data-toggle="modal" data-target="#PMRDAmap" title="PMRDA Region" alt="banner Image" style="width:100%"> <img class="mySlides" src="staticResources/images/PuneRingRoadMap1.jpg" data-toggle="modal" data-target="#RingRoad" title="Ring Road" alt="banner Image" style="width:100%"></div>
                        </div>
                        <div class="modal fade" id="PMRDAmap" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                           <div class="modal-dialog">
                              <div class="modal-content" style="border-radius:0px!important;">
                                 <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">
                                       <spring:message code="index.regionmap"/>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> 
                                 </div>
                                 <div class="modal-body"> <img src="staticResources/images/PMRDARegion1.jpg" title="PMRDA Region Map" alt="PMRDA Region Map" style="width:100%"> </div>
                              </div>
                           </div>
                        </div>
                        <div class="modal fade" id="RingRoad" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                           <div class="modal-dialog">
                              <div class="modal-content" style="border-radius:0px!important;">
                                 <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel1">
                                       <spring:message code="index.ringroadmap"/>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> 
                                 </div>
                                 <div class="modal-body"> <img src="staticResources/images/PuneRingRoadMap1.jpg" title="Ring Road Map" alt="Ring Road Map" style="width:100%"> </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <section class="Importantlinks contrast">
            <h3 style="margin:0px; position:absolute; visibility: hidden;">impLInks</h3>
            <div id="Importantlinks">
               <div class="row" style="text-align: center; padding:25px 0px;">
                  <h3 style="width:100%; margin:0px; color:#c93638;">
                     <spring:message code="index.ImportantLinks"/>
                  </h3>
                  <div style="width:100%;">
                     <div class="heading-underline" style="width: 190px;">
                        <div class="left"></div>
                        <div class="right"></div>
                     </div>
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                     <a href="https://eoffice.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank"> 
                        <div class="imgdiv" style="background:black;"> <img alt="eOffice" title="eOffice" src="staticResources/images/inplink/logo1.png" > </div>
                     </a>
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" id="apleenglish">
                     <a href="https://aaplesarkar.maharashtra.gov.in/en/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank"> 
                        <div class="imgdiv"> <img alt="aaplesarkar" title="aaplesarkar" src="staticResources/images/inplink/logo2.jpg"> </div>
                     </a>
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                     <a href="https://www.epostoffice.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank"> 
                        <div class="imgdiv"> <img alt="epostoffice" title="epostoffice" src="staticResources/images/inplink/logo3.png"> </div>
                     </a>
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                     <a href="https://pgportal.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank"> 
                        <div class="imgdiv"> <img alt="CPGRAMS" title="Centralized Public Grievance Redress And Monitoring System" src="staticResources/images/inplink/logo4.png"> </div>
                     </a>
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                     <a href="https://www.pmrda-obpas.com/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank"> 
                        <div class="imgdiv"> <img alt="OBPAS" title="Online Building Plan Approval System" src="staticResources/images/inplink/logo5.jpg"> </div>
                     </a>
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                     <a href="https://www.india.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank"> 
                        <div class="imgdiv"> <img alt="national portal of India" title="national portal of India" src="staticResources/images/inplink/logo6.png"> </div>
                     </a>
                  </div>
               </div>
            </div>
         </section>
         <footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>
      <script src="staticResources/t3-assets/js/main_slider.js" ></script> <script src="staticResources/t3-assets/js/map_slide.js" ></script> <script src="staticResources/t3-assets/js/marquee_animation.js" ></script> 
   </body>
</html>