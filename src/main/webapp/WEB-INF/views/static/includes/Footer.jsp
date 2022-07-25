<%@page import="java.util.GregorianCalendar"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%><%@ page contentType="text/html;charset=UTF-8"%><%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %><% response.setHeader("Cache-Control","no-cache"); response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setDateHeader ("Expires", 0); %> 
<div class="footer-full contrast">
   <div class="container-fluid">
      <div class="t3-copyright">
         <div class="row">
            <div class="col-md-4 col-xs-4 poweredby" >
               <div class="row">
                  <div class="col-md-3 col-xs-12 poweredby " style="text-align: center"> <img src="staticResources/images/PMRDALogo1.png" alt="PMRDA Logo" title="PMRDA" style="width:80px; border-radius: 8px;"> </div>
                  <div class="col-md-9 col-xs-12 poweredby" >
                     <h3 class="fotHedCon" style="font-size:18px ;margin-top:15px; color:#d71a21;">
                        <spring:message code="index.PuneMetropolitanRegionDevelopmentAuthority" />
                     </h3>
                  </div>
               </div>
               <div class="row justify-content-center ">
                  <div class="col-md-3 col-xs-4 powerdby"> </div>
                  <div class="col-md-6 col-xs-12 powerdby">
                     <h4 style="color:#1f88cf!important; margin-top: 15px;">
                        <spring:message code="footer.li13" />
                     </h4>
                     <div class="footersocial">
                        <a class="fb" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                           ')" target="_blank" href="https://www.facebook.com/OfficialPMRDA/">
                           <span>
                              <em class="fab fa-facebook-f"></em>
                              <strong>
                                 <spring:message code="footer.facebook" />
                              </strong>
                           </span>
                        </a>
                        <a class="tweet" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                           ')" target="_blank" href="https://twitter.com/OfficialPMRDA">
                           <span>
                              <em class="fab fa-twitter"></em>
                              <strong>
                                 <spring:message code="footer.twitter" />
                              </strong>
                           </span>
                        </a>
                        <a class="youtube" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                           ')" target="_blank" href="https://www.youtube.com/channel/UCm8PL_I9BHZxnBEptRdaq0g">
                           <span>
                              <em class="fab fa-youtube"></em>
                              <strong>
                                 <spring:message code="footer.youtube" />
                              </strong>
                           </span>
                        </a>
                     </div>
                  </div>
               </div>
               <div class="row justify-content-center ">
                  <div class="col-md-3 col-xs-4 powerdby">
                     <div class="w3c"> <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2F188.95.36.73%2FPMRDA%2Findex" onClick="return confirm('<spring:message code="index.confirm.msg"/>')" target="_blank" title="w3c iamge" > <img src="staticResources/images/w3c-icon..png" alt="w3c iamge" height="32" width="88"></a></div>
                  </div>
                  <div class="col-md-6 col-xs-12 powerdby">
                     <div class="w3c"> <a href="https://achecker.ca/checker/index.php?uri=referer&gid=WCAG2-AAA" onClick="return confirm('<spring:message code="index.confirm.msg"/>')" target="_blank" title="Explanation of WCAG 2 Level AAA conformance"> <img height="32" width="88" src="https://www.w3.org/WAI/wcag2AAA" alt="Level AAA conformance, W3C WAI Web Content Accessibility Guidelines 2.0"></a> </div>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-xs-3 link_list poweredby" style="margin-top:20px;">
               <h4 class="fotHedCon" style="width:100%; color: #d71a21" >
                  <spring:message code="footer.h4.3" />
               </h4>
               <ul class="nav menu">
                  <li class="item-238 active parent">
                     <a href="https://zonecertificate.pmrda.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="http://zonecertificate.pmrda.gov.in/">
                        <span>
                           <spring:message code="footer.li.16" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="https://www.pmrda-obpas.com/" class="no_click" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://www.pmrda-obpas.com/">
                        <span>
                           <spring:message code="footer.li.33" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="https://pmaypmrda.in/" onclick="return confirm('Are you sure you want to go to an external link?')" target="_blank" >
                        <span>
                           <spring:message code="footer.li.29" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent" id="apleenglishf">
                     <a href="https://aaplesarkar.maharashtra.gov.in/en/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://aaplesarkar.maharashtra.gov.in/en/">
                        <span>
                           <spring:message code="footer.li.17" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent" id="aplemarathif">
                     <a href="https://aaplesarkar.maharashtra.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://aaplesarkar.maharashtra.gov.in/">
                        <span>
                           <spring:message code="footer.li.17" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent" id="RTSenglishf">
                     <a href="https://aaplesarkar.mahaonline.gov.in/en" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://aaplesarkar.mahaonline.gov.in/en">
                        <span>
                           <spring:message code="footer.li.36" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent" id="RTSmarathif">
                     <a href="https://aaplesarkar.mahaonline.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://aaplesarkar.mahaonline.gov.in/">
                        <span>
                           <spring:message code="footer.li.36" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="https://pgportal.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://pgportal.gov.in/">
                        <span>
                           <spring:message code="footer.li.30" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="https://www.maharashtra.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://www.maharashtra.gov.in/">
                        <span>
                           <spring:message code="footer.li.18" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="https://pune.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://pune.gov.in/">
                        <span>
                           <spring:message code="footer.li.19" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="https://pmc.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://pmc.gov.in/">
                        <span>
                           <spring:message code="footer.li.31" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="https://www.pcmcindia.gov.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="https://www.pcmcindia.gov.in/">
                        <span>
                           <spring:message code="footer.li.32" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="http://pmrda.lfms.in/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="http://pmrda.lfms.in/">
                        <span>
                           <spring:message code="footer.li.34" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="http://innomise.com/pmrda-iwms/" onClick="return confirm('<spring:message code="index.confirm.msg"/>
                        ')" target="_blank" title="http://innomise.com/pmrda-iwms/">
                        <span>
                           <spring:message code="footer.li.35" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent"><a id="draft_link1" data-toggle="modal" data-target="#exampleModal"><span>Draft DP of PMR (2021-2041)</span></a></li>
               </ul>
            </div>
            <div class="draft_div" id="draft_div">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Draft DP of PMR Website</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                     </div>
                     <div class="modal-body">
                        <iframe src="http://118.185.3.252/DP-PMRDA" width="100%" style="height: calc(100vh - 120px);">
                           <p>Your browser does not support iframes.</p>
                        </iframe>
                     </div>
                  </div>
               </div>
            </div>
            <div class="draft_div" id="draft_div1">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Draft DP of PMR Website</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                     </div>
                     <div class="modal-body">
                        <iframe src="http://192.168.10.7/PMRDADOCs" width="100%" style="height: calc(100vh - 120px);">
                           <p>Your browser does not support iframes.</p>
                        </iframe>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-xs-3 link_list poweredby" style="margin-top:20px;">
               <h4 class="fotHedCon" style="width:100%; color: #d71a21">
                  <spring:message code="footer.h4.2" />
               </h4>
               <ul class="nav menu">
                  <li class="item-238 active parent">
                     <a href="copyrightPolicy" >
                        <span>
                           <spring:message code="copyRightPolicy.title" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="cmap" >
                        <span>
                           <spring:message code="footer.li11" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="cap" >
                        <span>
                           <spring:message code="footer.li.21" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="crp" >
                        <span>
                           <spring:message code="footer.li.22" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="hyperlinkpolicy" >
                        <span>
                           <spring:message code="footer.li4" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="privacypolicy" >
                        <span>
                           <spring:message code="footer.li2" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="termsconditions" >
                        <span>
                           <spring:message code="footer.li6" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="websiteMonitoringPolicies" >
                        <span>
                           <spring:message code="footer.li.23" />
                        </span>
                     </a>
                  </li>
                  <li class="item-238 active parent">
                     <a href="disclaimer" >
                        <span>
                           <spring:message code="footer.li3" />
                        </span>
                     </a>
                  </li>
               </ul>
            </div>
            <div class="col-md-2 col-xs-2 link_list poweredby" style="margin-top:20px;">
               <div class="row">
                  <div class="col-md-12 col-xs-12 poweredby">
                     <h4 class="fotHedCon" style="width:100%; color: #d71a21;">
                        <spring:message code="footer.h4.1" />
                     </h4>
                     <ul class="nav menu">
                        <li class="item-238 active parent">
                           <a href="sitemap" >
                              <span>
                                 <spring:message code="footer.li12" />
                              </span>
                           </a>
                        </li>
                        <li class="item-238 active parent">
                           <a href="accessibility" >
                              <span>
                                 <spring:message code="footer.li.25" />
                              </span>
                           </a>
                        </li>
                        <li class="item-238 active parent">
                           <a href="help" >
                              <span>
                                 <spring:message code="Header.Menu.Help" />
                              </span>
                           </a>
                        </li>
                     </ul>
                  </div>
                  <div class="col-md-12 col-xs-12 powerdby" style="margin-top:20px;">
                     <h4 class="fotHedCon" style="width:100%; color: #d71a21;">
                        <spring:message code="footer.h4.4" />
                     </h4>
                     <ul class="nav menu">
                        <li class="item-238 active parent">
                           <a href="contact" >
                              <span>
                                 <spring:message code="footer.li.26" />
                              </span>
                           </a>
                        </li>
                        <li class="item-238 active parent">
                           <a href="feedback" >
                              <span>
                                 <spring:message code="footer.li8" />
                              </span>
                           </a>
                        </li>
                        <li class="item-238 active parent">
                           <a href="enquiry" >
                              <span>
                                 <spring:message code="footer.li.28" />
                              </span>
                           </a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <hr style="border-top: 1px solid #b3b3b3;">
         <div class="row">
            <div class="col-md-12" style="text-align:center;">
               <span class="copyright">
                  <strong>
                     <spring:message code="footer.note" />
                     :
                  </strong>
                  <spring:message code="footer.note.msg" />
               </span>
            </div>
         </div>
         <hr style="border-top: 1px solid #b3b3b3;">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-6 col-xs-12 copyright ">
                  <spring:message code="footer.p1" />
                  <br> 
                  <hr class="mobilehr" style="margin:5px 0px;">
                  <span>
                     <spring:message code="footer.li15" />
                  </span>
               </div>
               <div class="col-md-6 col-xs-12 copyright ">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="ltupdate " id="engUpdateDiv">
                           <span class="">
                              <spring:message code="footer.li14" />
                              : <%=session.getAttribute("LAST_UPDATE") %> <%=session.getAttribute("last_update_time") %>
                           </span>
                           <br> 
                        </div>
                        <div class="ltupdate " id="marathiUpdateDiv" style="display: none;">
                           <span class="">
                              <spring:message code="footer.li14" />
                              : <%=session.getAttribute("LAST_UPDATE_mr") %> <%=session.getAttribute("last_update_time_mr") %>
                           </span>
                           <br> 
                        </div>
                     </div>
                  </div>
                  <div class="row ">
                     <div class="col-md-5"> </div>
                     <div class="col-md-7 visitCount">
                        <div id="engVisitorDiv">
                           <div class="col-md-6 col-xs-6" style=" border-right: solid 3px white!important; padding:0px 5px;">
                              <label >
                                 <spring:message code="footer.totlvisits" />
                                 :
                              </label>
                              <span><%=session.getAttribute("totalVisit") %></span> 
                           </div>
                           <div class="col-md-6 col-xs-6" style=" padding:0px 5px;">
                              <label >
                                 <spring:message code="footer.todayvisit" />
                                 :
                              </label>
                              <span><%=session.getAttribute("dailyVisit") %></span> 
                           </div>
                        </div>
                        <div id="marathiVisitorDiv" style="display: none;">
                           <div class="col-md-6" style=" border: solid 2px white!important; padding:0px 5px;">
                              <label >
                                 <spring:message code="footer.totlvisits" />
                                 :
                              </label>
                              <span><%=session.getAttribute("totalVisit_mr") %></span> 
                           </div>
                           <div class="col-md-6" style=" border: solid 2px white!important; padding:0px 5px;">
                              <label >
                                 <spring:message code="footer.todayvisit" />
                                 :
                              </label>
                              <span><%=session.getAttribute("dailyVisit_mr") %></span> 
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<link rel="stylesheet" href="staticResources/t3-assets/css/font-awesome/css/all.css" />
<link href="staticResources/t3-assets/css/footerStyle.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script></script><script src="staticResources/t3-assets/js/dark_mode.js" ></script><script src="staticResources/t3-assets/js/font_size.js" ></script><script>$(function() { var lang=$("#lang").val(); if(lang=="marathi"){ $("#engVisitorDiv").hide(); $("#marathiVisitorDiv").show(); $("#engUpdateDiv").hide(); $("#marathiUpdateDiv").show(); $("#apleenglish").hide(); $("#aplemarathi").show(); $("#apleenglishf").hide(); $("#aplemarathif").show(); $("#RTSenglishf").hide(); $("#RTSmarathif").show(); }else{ $("#engVisitorDiv").show(); $("#marathiVisitorDiv").hide(); $("#engUpdateDiv").show(); $("#marathiUpdateDiv").hide(); $("#apleenglish").show(); $("#aplemarathi").hide(); $("#apleenglishf").show(); $("#aplemarathif").hide(); $("#RTSenglishf").show(); $("#RTSmarathif").hide(); } });</script> <script> function scrollToNav() { $('html, body').animate({ scrollTop: $('#t3-footer').offset().top }, 'slow'); return false; } function scrollToMain() { $('html, body').animate({ scrollTop: $('#maincontent').offset().top }, 'slow'); return false; } function scrollToAcc() { $('html, body').animate({ scrollTop: $('#t3-topbars').offset().top }, 'slow'); return false; } </script> <script>$(document).ready(function() {$(window).resize(function(){if ($(window).width() >= 980){ $(".navbar .dropdown-toggle").hover(function () { $(this).parent().toggleClass("show"); $(this).parent().find(".dropdown-menu").toggleClass("show"); }); $( ".navbar .dropdown-menu" ).mouseleave(function() { $(this).removeClass("show"); });}}); });</script> <script>function myFunction() { var x = document.getElementById("myTopnav"); if (x.className === "topnav") { x.className += " responsive"; } else { x.className = "topnav"; }}</script> <script>jQuery(document).ready(function($) {$(".on-page-search").on("keyup", function () {if( $(this).val().length) { $(this).css("position", "fixed"); $(".display-searchinfo").css("display", "block"); }else{ $(this).css("position", "relative"); $(".display-searchinfo").css("display", "none");}var v = $(this).val();$(".results").removeClass("results");$("p,h1,h2,h3,h4,h5,h6,span,a,td,th").each(function () {if (v != "" && $(this).text().search(new RegExp(v,'gi')) != -1) {$(this).addClass("results");}});});}); </script><script>function mouseDownD() { document.getElementById("myD").style = "background:white";}function mouseUpD() { document.getElementById("myD").style = "background:#c93638";}function mouseDownN() { document.getElementById("myN").style = "background:white";}function mouseUpN() { document.getElementById("myN").style = "background:#0072bb";}function mouseDownI() { document.getElementById("myI").style = "background:white";}function mouseUpI() { document.getElementById("myI").style = "background:#c93638";}</script><script>function getDepartment(id){$("#deptid").val(id);$("#deptform").submit();}function getProject(id){$("#projectid").val(id);$("#projectform").submit();}function getLeader(id){$("#leaderid").val(id);$("#leaderform").submit();}</script>
<script>$(document).ready(function(){$("#draft_link").click(function(){$("#draft_div1").show();});$("#draft_div1 .close").click(function(){$("#draft_div1").hide();});});</script>
<script>$(document).ready(function(){$("#draft_link1").click(function(){$("#draft_div").show();});$("#draft_div .close").click(function(){$("#draft_div").hide();});});</script>