<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
   <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %><meta name="viewport" content="width=device-width" />
       <title>.:: <spring:message code="index.h2.PMRDA"/>    ::.</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
         <!-- Night Mode Files -->
	 <!--  <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="staticResources/css/night-mode.css">
	  <script src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>

      <script src="staticResources/js/jquery.night.mode.js"></script> -->
	  
	  <!-- Night Mode Files -->
<style>
.mySlides {display:none;}
</style>
   </head>
   <body>
   <input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>
			<c:set var="engLang" value="en_US"/>
      <div class="t3-wrapper t3-homepage-2">
        <jsp:include page="../includes/Header.jsp" />
         <section class="wrap t3-featured-news">
            <div class="container-fluid">
               <div class="col-md-12 featured-slider">
                  <!--[if lte IE 7]>
                  <link href="/cepon/modules/mod_playlistck/themes/elegant/css/playlistck_ie.css" rel="stylesheet" type="text/css" />
                  <![endif]-->
                  <!--[if IE 8]>
                  <link href="/cepon/modules/mod_playlistck/themes/elegant/css/playlistck_ie8.css" rel="stylesheet" type="text/css" />
                  <![endif]--><script type="text/javascript"> <!--
                     jQuery(function(){
                      jQuery('#playlistck_wrap_260').playlistck({
                              height: '40%',
                              minHeight: '150',
                              pauseOnClick: false,
                              hover: 1,
                              fx: 'random',
                              loader: 'pie',
                              pagination: 0,
                              thumbnails: 1,
                              time: 6000,
                              transPeriod: 1000,
                              alignment: 'center',
                              autoAdvance: 1,
                              mobileAutoAdvance: 1,
                              barDirection: 'leftToRight',
                              imagePath: '/cepon/modules/mod_playlistck/images/',
                              lightbox: 'mediaboxck',
                     thumbscontwidth: '25%',
                     thumbsposition: 'right',
                     showthumbcaption: 1,
                     thumbcaptiontitle: 1,
                     thumbcaptiondesc: 1,
                     thumbnailtextdesclength: '50',
                     navigationHover: true,
                              navigation: true,
                              playPause: true,
                              barPosition: 'bottom'
                      });
                     }); //--> 
                  </script>
                  <div id="playlistck_wrap_cont_260" class="playlistck_wrap_cont">
                     <div class="playlistck playlistck_wrap playlistck_white_skin" id="playlistck_wrap_260">
                        <div data-thumb="staticResources/images/slider/1.jpg" data-src="staticResources/images/slider/1.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 PMRDA Hyperloop
                              </div>
                              <div class="playlistck_caption_desc">
                                 Hyperloop between Pune to Mumbai
                              </div>
                           </div>
                        </div>
                        <div data-thumb="staticResources/images/slider/2.jpg" data-src="staticResources/images/slider/2.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 PMRDA Pune Metro 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Pune Metro rail project awarded to Tata Siemens joint venture 
                              </div>
                           </div>
                        </div>
                        <div data-thumb="staticResources/images/slider/3.jpg" data-src="staticResources/images/slider/3.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 Video example 
                              </div>
                              <div class="playlistck_caption_desc">
                                 This is a Video slide linked to Vimeo 
                              </div>
                           </div>
                        </div>
                        <div data-thumb="staticResources/images/slider/4.jpg" data-src="staticResources/images/slider/4.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 Nice landscape 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Imagine that you are on holidays 
                              </div>
                           </div>
                        </div>
                        <div data-thumb="staticResources/images/slider/5.jpg" data-src="staticResources/images/slider/5.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 Nice landscape 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Imagine that you are on holidays 
                              </div>
                           </div>
                        </div>
                        <div data-thumb="staticResources/images/slider/6.jpg" data-src="staticResources/images/slider/6.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 Nice landscape 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Imagine that you are on holidays 
                              </div>
                           </div>
                        </div>
                        <div data-thumb="staticResources/images/slider/7.jpg" data-src="staticResources/images/slider/7.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 Nice landscape 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Imagine that you are on holidays 
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div style="clear:both;"></div>
               </div>
            </div>
            <div class="container-fluid" style="padding-left:20px; background-color:#E1DEDE">
               <div class="t3-breaking hidden-xs">
                  <div class="row">
                     <div class="col-xs-12 col-md-11">
                        <div class="gkHighlighterGK5" id="gkHighlighterGK5-0" data-config="{'animationType':'slides','animationSpeed':'350','animationInterval':'5000','animationFun':'Fx.Transitions.linear','mouseover':'false'}" style="height: 25px;">
                           <div class="gkHighlighterInterface" data-pos="left">
                              <span class="text" style="color:red"><spring:message code="index.murqee" /></span>
                           </div>
                           <div class="gkHighlighterWrapper">
                              <div class="gkHighlighterWrapperSub">
                                 <!--<div class="gkHighlighterItem"><span><a href="../81-x-men-days-of-future-past-official-trailer.htm"><span>X-Men: Days of Future Pas</span>: The ultimate X-Men ensemble fights a war for the s</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../82-the-raid-2-berandal-official-trailer-1-2014-crime-thriller-hd.htm"><span>The Raid 2: Berandal Offi</span>: The plot is unknown, however, the story begins two</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../83-the-bourne-supremacy-official-trailer-1-brian-cox-movie-2004-hd.htm"><span>The Bourne Supremacy Offi</span>: The Bourne Supremacy Trailer - Directed by Paul Gr</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../80-elegant-and-clean-inspired-website-design.htm"><span>Elegant and Clean-Inspire</span>: For science, music, sport, etc, Europe uses the sa</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../79-glenon-is-joomla-template-sing-paling-joss.htm"><span>Glenon is Joomla Template</span>: The European languages are members of the same fam</a></span></div>-->
                                 <marquee direction="left" style="height: 75px;">
                                 	<p>
								<span style="color:#00FFFF">&nbsp; </span>
							 <c:forEach var="entryLogModellist" items="${entryLogModellist}" varStatus="status">
							  
									<c:if test=""></c:if>
									<%-- <a href="attachmentDownload?path=${entryLogModellist.attachment_id.path}"> --%>
										<span style="color:#FF0000">
										     <c:choose>
										 	 <c:when test="${localLang eq engLang}">
												 ${entryLogModellist.type} :  ${entryLogModellist.title}  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
											 </c:when>
								 	         <c:otherwise>
								 	       	 ${entryLogModellist.type}  :  ${entryLogModellist.title_h}
								 	         </c:otherwise>
											 </c:choose>
											 
										</span>
									<!-- </a> -->&nbsp; &nbsp; 
								</c:forEach>
								<%--  <c:forEach var="entryLogModellist" items="${entryLogModellist}" varStatus="status">
							  <c:forEach var="entryLogModellistattachment" items="${entryLogModellistattachment}" >
							  <c:choose>
							  <c:when test="${entryLogModellist.title_id eq entryLogModellistattachment.moduleID}">
							  <a href="attachmentDownload?path=${entryLogModellistattachment.path}">
										<span style="color:#FF0000">
										     <c:choose>
										 	 <c:when test="${localLang eq engLang}">
												 ${entryLogModellist.type} :  ${entryLogModellist.title}  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
											 </c:when>
								 	         <c:otherwise>
								 	         
								 	       	 ${entryLogModellist.type}  :  ${entryLogModellist.title_h}
								 	         </c:otherwise>
											 </c:choose>
											 
										</span>
									</a>
							  </c:when>
							  
							  </c:choose>
									
									
									&nbsp; &nbsp; 
								</c:forEach>
								</c:forEach> --%>
							</p></marquee>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <div id="t3-mainbody" class="container-fluid t3-mainbody">
            <div class="row">
               <div id="t3-content" class="t3-content col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
                  <div class="t3-module module no-padding bigtitle " id="Mod235">
                     <div class="module-inner">
                        <h3 class="module-title imp-updates"><span><spring:message code="label.ImportantUpdates"  /></span></h3>
                        <div class="module-ct">
                           <div id="gk-tabs-235" class="gkTabsGK5" data-config="{'activator':'click','animation':'0','animation_interval':'5000','animation_type':'slide_horizontal','active_tab':'1','cookie_save':'0','auto_height':'1','module_height':'200','rtl':0}" data-swipe="1">
                              <div class="tabs-section gkTabsWrap vertical">
                                 <ol class="tabs-item-container gkTabsNav" data-amount="5">
                                    <li class="gkTab gkTabs-1 active" data-animation="opacity">
                                      <spring:message code="index.News"  />
                                    </li>
                                    <li class="gkTab gkTabs-2" data-animation="default">
                                      <spring:message code="index.Tender"  />
                                    </li>
                                    <li class="gkTab gkTabs-3" data-animation="default">
                                     <spring:message code="index.Downloads"  />
                                    </li>
                                    <li class="gkTab gkTabs-4" data-animation="opacity">
                                      <spring:message code="index.Circulars"  />
                                    </li>
                                    <li class="gkTab gkTabs-5" data-animation="default">
                                      <spring:message code="index.Notices"  />
                                    </li>
                                 </ol>
                                 <div class="gkTabsContainer">
                                    <div class="gkTabsItem gk-opacity gk-active">
                                       <div class="nspMain home-news responsive" id="nsp-nsp-225" data-config="{
                                          'animation_speed': 400,
                                          'animation_interval': 5000,
                                          'animation_function': 'Fx.Transitions.Expo.easeIn',
                                          'news_column': 3,
                                          'news_rows': 2,
                                          'links_columns_amount': 2,
                                          'links_amount': 2
                                          }">
                                          <div class="nspArts bottom" style="width:100%;">
                                             <div class="nspArtScroll1">
                                                <div class="nspArtScroll2 nspPages1 table-section" style="padding-left:20px">
                                                   <div class="table-data" style="padding:15px;height: 430px; overflow: auto;">
                                                      <table class="category table table-striped table-bordered table-hover">
                                                         <caption class="hide">List of articles in category Joomla!</caption>
                                                         <thead>
                                                            <tr>
                                                               <th scope="col" id="categorylist_header_title">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.title','asc','', document.getElementById('adminForm'));return false;" class="hasPopover" title="Title" data-content="Select to sort by this column" data-placement="top"> <spring:message code="index.TabHeading1"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_author">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('author','asc','');return false;" class="hasPopover" title="Author" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading2"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_hits">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.hits','asc','');return false;" class="hasPopover" title="Hits" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading3"  /></a> 
                                                               </th>
                                                            </tr>
                                                         </thead>
                                                         <tbody>
                                                          <c:forEach var="approvedNews" items="${approvedNews}" varStatus="status">
                                                           <tr class="cat-list-row0">
                                                               <td headers="categorylist_header_title" class="list-title">
                                                                     <c:choose>
								 	                                 <c:when test="${localLang eq engLang}">
								 	                                    ${approvedNews.title}
								 	                                    </c:when>
								                                	  <c:otherwise>
								 	  	                            ${approvedNews.title_h}
								 	                               </c:otherwise>
							                                 	 </c:choose>
                                                 
                                                           </td>
                                                               <td headers="categorylist_header_author" class="list-author">
                                                                 ${approvedNews.publish_date}
                                                               </td>
                                                               <td headers="categorylist_header_hits" class="list-hits">
                                                                   <c:choose>
                                                                   <c:when test="${localLang eq engLang}">
								 	                             ${approvedNews.newspaper}
								                             	  </c:when>
								 	                           <c:otherwise>
								 	  	                          ${approvedNews.newspaper_h}
								 	                           </c:otherwise>
                                                                    </c:choose>
                                                                
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
                                    </div>
                                    <div class="gkTabsItem gk-slide_horizontal gk-hide">
                                       <div class="nspMain home-news responsive" id="nsp-nsp-254" data-config="{
                                          'animation_speed': 400,
                                          'animation_interval': 5000,
                                          'animation_function': 'Fx.Transitions.Expo.easeIn',
                                          'news_column': 3,
                                          'news_rows': 2,
                                          'links_columns_amount': 2,
                                          'links_amount': 2
                                          }">
                                          <div class="nspArts bottom" style="width:100%;">
                                             <div class="nspArtScroll1">
                                                <div class="nspArtScroll2 nspPages1 table-section">
                                                   <div class="nspArtPage active nspCol1 table-data">
                                                   	<div style="padding:15px;height: 430px; overflow: auto;">
                                                   			<table class="category table table-striped table-bordered table-hover">
                                                   
                                                         <thead>
                                                            <tr>
                                                               <th scope="col" id="categorylist_header_title">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.title','asc','', document.getElementById('adminForm'));return false;" class="hasPopover" title="Title" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading1"  /></a> 
                                                               </th>
                                                                <th scope="col" id="categorylist_header_author">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('author','asc','');return false;" class="hasPopover" title="Author" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TenderTabHeading5"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_author">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('author','asc','');return false;" class="hasPopover" title="Author" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading2"  /></a> 
                                                               </th>
                                                                <th scope="col" id="categorylist_header_author">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('author','asc','');return false;" class="hasPopover" title="Author" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TenderTabHeading4"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_hits">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.hits','asc','');return false;" class="hasPopover" title="Hits" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TenderTabHeading3"  /></a> 
                                                               </th>
                                                            </tr>
                                                         </thead>
                                                         <tbody>
                                                         <c:forEach var="approvedTendors" items="${approvedTendors}" varStatus="status">
                                                         
                                                            <tr class="cat-list-row0">
                                                               <td headers="categorylist_header_title" class="list-title">
                                                                 <%--  <a href="attachmentDownload?path=${approvedTendors.attachment.path}"> --%>
                                                                <c:choose>
								 	                                   <c:when test="${localLang eq engLang}">
								 	 ${approvedTendors.title}
								 	  </c:when>
								 	  <c:otherwise>
								 	  	   ${approvedTendors.title_h}
								 	  </c:otherwise>
							 	 </c:choose>
                                                                 <!--  </a> -->
                                                               </td>
                                                                <td headers="categorylist_header_author" class="list-author">
                                                               
                                                                  ${approvedTendors.subTitle}
                                                               </td>
                                                               <td headers="categorylist_header_author" class="list-author">
                                                               
                                                                  ${approvedTendors.publish_date}
                                                               </td>
                                                               
                                                                <td headers="categorylist_header_author" class="list-author">
                                                               
                                                                  ${approvedTendors.openingDate}
                                                               </td> 
                                                               <td headers="categorylist_header_hits" class="list-hits">
                                                                  
                                                                   ${approvedTendors.closingDate} 
                                                               </td>
                                                            </tr>
                                                           
                                                           </c:forEach>  
                                                         </tbody>
                                                      </table></div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="gkTabsItem gk-slide_horizontal gk-hide">
                                       <div class="nspMain home-news responsive" id="nsp-nsp-255" data-config="{
                                          'animation_speed': 400,
                                          'animation_interval': 5000,
                                          'animation_function': 'Fx.Transitions.Expo.easeIn',
                                          'news_column': 3,
                                          'news_rows': 2,
                                          'links_columns_amount': 2,
                                          'links_amount': 2
                                          }">
                                          <div class="nspArts bottom" style="width:100%;">
                                             <div class="nspArtScroll1">
                                                <div class="nspArtScroll2 nspPages1 table-section">
                                                   <div class="nspArtPage active nspCol1 table-data">
                                                   	<div style="padding:15px;height: 430px; overflow: auto;">
                                                   			<table class="category table table-striped table-bordered table-hover">
                                                        
                                                         <thead>
                                                            <tr>
                                                               <th scope="col" id="categorylist_header_title">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.title','asc','', document.getElementById('adminForm'));return false;" class="hasPopover" title="Title" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading1"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_author">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('author','asc','');return false;" class="hasPopover" title="Author" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading2"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_hits">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.hits','asc','');return false;" class="hasPopover" title="Hits" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading4"  /></a> 
                                                               </th>
                                                            </tr>
                                                         </thead>
                                                        <tbody>
                                                         <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
                                                          <c:if test="${approvedNotice.type == 'DOWNLOADS' }">
                                                            <tr class="cat-list-row0">
                                                               <td headers="categorylist_header_title" class="list-title">
                                                                <%--   <a href="attachmentDownload?path=${approvedNotice.attachment.path}"> --%>
                                                                   <c:choose>
								 	                                   <c:when test="${localLang eq engLang}">
								 	   ${approvedNotice.title}
								 	  </c:when>
								 	  <c:otherwise>
								 	  	    ${approvedNotice.title_h}
								 	  </c:otherwise>
							 	 </c:choose>
                                                                 <!-- </a> -->
                                                               </td>
                                                               <td headers="categorylist_header_author" class="list-author">
                                                                  ${approvedNotice.created_date}
                                                               </td>
                                                               <td headers="categorylist_header_hits" class="list-hits">
                                                                 
                                                                  <c:choose>
								 	                                   <c:when test="${localLang eq engLang}">
								 	  ${approvedNotice.department.departmentName}
								 	  </c:when>
								 	  <c:otherwise>
								 	  	     ${approvedNotice.department.departmentName_h}
								 	  </c:otherwise>
							 	 </c:choose>
                                                                  
                                                               </td>
                                                            </tr>
                                                            </c:if>
                                                           </c:forEach>    --%>
                                                         </tbody>
                                                      </table></div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="gkTabsItem gk-slide_horizontal gk-hide">
                                       <div class="nspMain home-news responsive" id="nsp-nsp-255" data-config="{
                                          'animation_speed': 400,
                                          'animation_interval': 5000,
                                          'animation_function': 'Fx.Transitions.Expo.easeIn',
                                          'news_column': 3,
                                          'news_rows': 2,
                                          'links_columns_amount': 2,
                                          'links_amount': 2
                                          }">
                                          <div class="nspArts bottom" style="width:100%;">
                                             <div class="nspArtScroll1">
                                                <div class="nspArtScroll2 nspPages1 table-section">
                                                   <div class="nspArtPage active nspCol1 table-data">
                                                   	<div style="padding:15px;height: 430px; overflow: auto;">
                                                   			<table class="category table table-striped table-bordered table-hover">
                                                       
                                                         <thead>
                                                            <tr>
                                                               <th scope="col" id="categorylist_header_title">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.title','asc','', document.getElementById('adminForm'));return false;" class="hasPopover" title="Title" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading1"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_author">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('author','asc','');return false;" class="hasPopover" title="Author" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading2"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_hits">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.hits','asc','');return false;" class="hasPopover" title="Hits" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading4"  /></a> 
                                                               </th>
                                                            </tr>
                                                         </thead>
                                                        <tbody>
                                                          <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
                                                          <c:if test="${approvedNotice.type == 'CIRCULERS' }">
                                                            <tr class="cat-list-row0">
                                                               <td headers="categorylist_header_title" class="list-title">
                                                                 <%--  <a href="attachmentDownload?path=${approvedNotice.attachment.path}"> --%>
                                                                  <c:choose>
								 	                                   <c:when test="${localLang eq engLang}">
								 	   ${approvedNotice.title}
								 	  </c:when>
								 	  <c:otherwise>
								 	  	      ${approvedNotice.title_h}
								 	  </c:otherwise>
							 	 </c:choose>
                                                               <!--   </a> -->
                                                               </td>
                                                               <td headers="categorylist_header_author" class="list-author">
                                                                  ${approvedNotice.created_date}
                                                               </td>
                                                               <td headers="categorylist_header_hits" class="list-hits">
                                                                  
                                                                <c:choose>
								 	                                   <c:when test="${localLang eq engLang}">
								 	  ${approvedNotice.department.departmentName}
								 	  </c:when>
								 	  <c:otherwise>
								 	  	     ${approvedNotice.department.departmentName_h}
								 	  </c:otherwise>
							 	 </c:choose> 
                                                               </td>
                                                            </tr>
                                                            </c:if>
                                                           </c:forEach>  
                                                         </tbody>
                                                      </table></div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="gkTabsItem gk-slide_horizontal gk-hide">
                                       <div class="nspMain home-news responsive" id="nsp-nsp-255" data-config="{
                                          'animation_speed': 400,
                                          'animation_interval': 5000,
                                          'animation_function': 'Fx.Transitions.Expo.easeIn',
                                          'news_column': 3,
                                          'news_rows': 2,
                                          'links_columns_amount': 2,
                                          'links_amount': 2
                                          }">
                                          <div class="nspArts bottom" style="width:100%;">
                                             <div class="nspArtScroll1">
                                                <div class="nspArtScroll2 nspPages1 table-section">
                                                   <div class="nspArtPage active nspCol1 table-data">
                                                   	<div style="padding:15px;height: 430px; overflow: auto;">
                                                   			<table class="category table table-striped table-bordered table-hover">
                                                        
                                                         <thead>
                                                            <tr>
                                                               <th scope="col" id="categorylist_header_title">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.title','asc','', document.getElementById('adminForm'));return false;" class="hasPopover" title="Title" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading1"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_author">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('author','asc','');return false;" class="hasPopover" title="Author" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading2"  /></a> 
                                                               </th>
                                                               <th scope="col" id="categorylist_header_hits">
                                                                  <a href="article-category-list.htm#" onclick="Joomla.tableOrdering('a.hits','asc','');return false;" class="hasPopover" title="Hits" data-content="Select to sort by this column" data-placement="top"><spring:message code="index.TabHeading4"  /></a> 
                                                               </th>
                                                            </tr>
                                                         </thead>
                                                          <tbody>
                                                          <c:forEach var="approvedNotice" items="${approvedNotice}" varStatus="status">
                                                          <c:if test="${approvedNotice.type == 'NOTICE' }">
                                                            <tr class="cat-list-row0">
                                                               <td headers="categorylist_header_title" class="list-title">
                                                                  <%-- <a href="attachmentDownload?path=${approvedNotice.attachment.path}"> --%>
                                                                 <c:choose>
								 	                                   <c:when test="${localLang eq engLang}">
								 	   ${approvedNotice.title}
								 	  </c:when>
								 	  <c:otherwise>
								 	  	      ${approvedNotice.title_h}
								 	  </c:otherwise>
							 	 </c:choose><!-- </a> -->
                                                               </td>
                                                               <td headers="categorylist_header_author" class="list-author">
                                                                  ${approvedNotice.created_date}
                                                               </td>
                                                               <td headers="categorylist_header_hits" class="list-hits">
                                                                  
                                                                <c:choose>
								 	                                   <c:when test="${localLang eq engLang}">
								 	  ${approvedNotice.department.departmentName}
								 	  </c:when>
								 	  <c:otherwise>
								 	  	     ${approvedNotice.department.departmentName_h}
								 	  </c:otherwise>
							 	 </c:choose> 
                                                               </td>
                                                            </tr>
                                                            </c:if>
                                                           </c:forEach>  
                                                         </tbody>
                                                      </table></div>
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
                     </div>
                  </div>
                  <div class="t3-component">
                     <div class="blog-featured"></div>
                  </div>
               </div>
               <div class="t3-sidebar t3-sidebar-left col-xs-12 col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9 ">
                  <div class="t3-module module colored backfaced no-padding " id="Mod234">
                     <div class="module-inner">
                        <h2 class="module-title "><span><spring:message code="index.h2.PMRDA"/></span></h2>
                        <div class="module-ct">
                           <div class="nspMain  colored backfaced no-padding" id="nsp-nsp-234" data-config="{
                              'animation_speed': 400,
                              'animation_interval': 5000,
                              'animation_function': 'Fx.Transitions.Expo.easeIn',
                              'news_column': 1,
                              'news_rows': 1,
                              'links_columns_amount': 1,
                              'links_amount': 0
                              }">
                              <div class="nspArts bottom" style="width:100%;">
                                 <div class="nspArtScroll1">
                                    <div class="nspArtScroll2 nspPages1">
                                       <div class="nspArtPage active nspCol1">
                                          <div class="nspArt nspCol1" style="padding:0;">
                                             <h4 class="nspHeader tleft fnull has-image">
                                                <a href="#" title="PMRDA" target="_self"><spring:message code="index.PuneMetropolitanRegionDevelopmentAuthority"/></a>
                                             </h4>
                                             <a class="readon fleft" href="#" target="_self"><spring:message code="index.h2.ReadmoreCommon"/></a> 
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="t3-module module listed-news hidden-thumb " id="Mod215">
                     <div class="module-inner">
                        <h3 class="module-title "><span><spring:message code="index.ImportantLinks"/></span></h3>
                        <div class="module-ct">
                           <div class="nspMain  listed-news hidden-thumb" id="nsp-nsp-215" data-config="{
                              'animation_speed': 400,
                              'animation_interval': 5000,
                              'animation_function': 'Fx.Transitions.Expo.easeIn',
                              'news_column': 1,
                              'news_rows': 3,
                              'links_columns_amount': 1,
                              'links_amount': 0
                              }">
                              <div class="nspArts bottom" style="width:100%;">
                                 <div class="nspArtScroll1">
                                    <div class="nspArtScroll2 nspPages1">
                                       <div class="nspArtPage active nspCol1">
                                          <div class="nspArt nspCol1" style="padding:15px 0px;">
                                             <div class="gkArtContentWrap">
                                                <h4 class="nspHeader tleft fnull has-image">
                                                   <a href="https://www.pmrda-obpas.com/" target="_blank" title="Glenon is Joomla Template Sing Paling Joss" target="_self"><i class="fas fa-caret-right"></i> <spring:message code="index.ImportantLinks.1"/></a>
                                                </h4>
                                             </div>
                                          </div>
                                          <div class="nspArt nspCol1" style="padding:15px 0px;">
                                             <div class="gkArtContentWrap">
                                                <h4 class="nspHeader tleft fnull has-image">
                                                   <a href="79-glenon-is-joomla-template-sing-paling-joss.htm" title="Glenon is Joomla Template Sing Paling Joss" target="_self"><i class="fas fa-caret-right"></i> <spring:message code="index.ImportantLinks.2"/></a>
                                                </h4>
                                             </div>
                                          </div>
                                          <div class="nspArt nspCol1" style="padding:15px 0px;">
                                             <div class="gkArtContentWrap">
                                                <h4 class="nspHeader tleft fnull has-image">
                                                   <a href="79-glenon-is-joomla-template-sing-paling-joss.htm" title="Glenon is Joomla Template Sing Paling Joss" target="_self"><i class="fas fa-caret-right"></i> <spring:message code="index.ImportantLinks.3"/></a>
                                                </h4>
                                             </div>
                                          </div>
                                           <div class="nspArt nspCol1" style="padding:15px 0px;">
                                             <div class="gkArtContentWrap">
                                                <h4 class="nspHeader tleft fnull has-image">
                                                   <a href="https://aaplesarkar.mahaonline.gov.in/en" target="_blank" title="Glenon is Joomla Template Sing Paling Joss" target="_self"><i class="fas fa-caret-right"></i> <spring:message code="index.ImportantLinks.4"/></a>
                                                </h4>
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
               </div>
            </div>
         </div>
        <div class="container user-information" style="height: 365px;"> 
         	<div class="row" style="height: 250px;">
         		
         		<div class="col-sx-12 col-sm-6 col-md-6 right" style="height: 100%; padding: 25px 0px;">
					<h4 style="padding-left: 25px; margin: 0px;"><span style="color: #d21e1b;"><spring:message code="index.container.h4.span3"/></span> <spring:message code="index.container.h4.span4"/></h3>
					<div class="heading-underline" style="padding-left: 25px; width: 390px;">
                  <div class="left"></div><div class="right"></div>
               </div>
         			<div style="height: 95px; float: left; width: 30%; padding-left: 25px;"> 
         				<img src="staticResources/t3-assets/images/Shri Vikram Kumar.png" height="190px" width="196px">
					</div>
					<div style="height: 100px; float: left; width: 70%;">
						<p class="text-left" style="padding-left: 25px; margin: 0px;"><strong><spring:message code="index.container.p3"/></strong></p>
						<p class="text-left" style="padding-left: 25px; margin: 0px;"><spring:message code="index.container.p4"/></p>
						<a class="text-left" style="padding-left: 25px; margin: 0px;" href="ceo_msg"><spring:message code="index.container.a1"/></a>
					</div>
         		</div>
         		<div class="clear-fix"></div>
         	</div>
         </div>
         <section class="wrap t3-video video-section">
            <div class="container">
               <div class="t3-module module no-padding " id="Mod189">
                  <div class="module-inner">
                 
                     <div class="module-ct">
                        <div class="gkNspPM gkNspPM-VideoGallery" data-autoanim="10000">
                           <div class="gkBigBlock left-side active">
							   <h3 class="module-title">
							<span><spring:message code="index.module-ct.span1"/></span>
						 </h3>
                   <div class="heading-underline" style="width: 200px;">
                     <div class="left"></div><div class="right"></div>
                  </div>
							<div id="myCarousel-1" class="carousel slide" data-ride="carousel">
							  <!-- Indicators 
							  <ol class="carousel-indicators">
							    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							    <li data-target="#myCarousel" data-slide-to="1"></li>
							    <li data-target="#myCarousel" data-slide-to="2"></li>
							  </ol>-->

							  <!-- Wrapper for slides -->
							  <div class="carousel-inner">
							    <div class="item active">
							     <img class="gkIsHelperImage" src="staticResources/images/Projects/hyperloop.jpg" alt="" />
                              <figure class="gkItem video">
                                 <span class="gkImageWrap">
                                 <img src="staticResources/images/Projects/hyperloop.jpg" alt="" data-url="https://www.youtube.com/embed/_ntsko4X55Q" data-x="640" data-y="480" /></span>
                                 <figcaption>
                                    <strong><spring:message code="index.module-ct.carousel-inner.strong"/></strong>
                                    <h3><a href="#" title="#"><spring:message code="index.module-ct.carousel-inner.h1"/></a></h3>
                                    <p><spring:message code="index.module-ct.carousel-inner.p1"/></p>
                                    <small>347</small>
                                 </figcaption>
                              </figure>
							    </div>

							    <div class="item">
							      <img class="gkIsHelperImage" src="staticResources/images/Projects/hyperloop.jpg" alt="" />
                              <figure class="gkItem video">
                                 <span class="gkImageWrap">
                                 <img src="staticResources/images/Projects/hyperloop.jpg" alt="#" data-url="https://www.youtube.com/embed/_ntsko4X55Q" data-x="640" data-y="480" /></span>
                                 <figcaption>
                                    <strong><spring:message code="index.module-ct.carousel-inner.strong"/></strong>
                                    <h3><a href="#"><spring:message code="index.module-ct.carousel-inner.h1"/></a></h3>
                                    <p><spring:message code="index.module-ct.carousel-inner.p1"/></p>
                                    <small>347</small>
                                 </figcaption>
                              </figure>
							    </div>

							    <div class="item">
							      <img class="gkIsHelperImage" src="staticResources/images/Projects/hyperloop.jpg" alt="" />
                              <figure class="gkItem video">
                                 <span class="gkImageWrap">
                                 <img src="staticResources/images/Projects/hyperloop.jpg" alt="X-Men: Days of Future Past | Official Trailer" data-url="https://www.youtube.com/embed/_ntsko4X55Q" data-x="640" data-y="480" /></span>
                                 <figcaption>
                                    <strong>Video</strong>
                                    <h3><a href="#">PMRDA Hyperloop</a></h3>
                                    <p>PMRDA, in collaboration with Virgin Hyperloop One, is all set to start a proposed Hyperloop.</p>
                                    <small>347</small>
                                 </figcaption>
                              </figure>
							    </div>
							  </div>

							  <!-- Left and right controls -->
							  <a class="left carousel-control" href="#myCarousel-1" data-slide="prev">
							    <!--<span class="glyphicon glyphicon-chevron-left"></span>
							    <span class="sr-only">Previous</span>-->
							  </a>
							  <a class="right carousel-control" href="#myCarousel-1" data-slide="next">
							    <!--<span class="glyphicon glyphicon-chevron-right"></span>
							    <span class="sr-only">Next</span>-->
							  </a>
							</div>
                           </div>
                           <div class="gkBigBlock right-side" style="margin-left: 55px;">
						   <h3 class="module-title">
                        <span><spring:message code="index.module-ct.span2"/></span>
                     </h3>
                     <div class="heading-underline" style="width: 200px;">
                        <div class="left"></div><div class="right"></div>
                     </div>
                           	  <div class="carousel-img-overlay">
                           	  	
							  </div>
							  
                       
                       
                               <div id="myCarousel-2" class="carousel slide" data-ride="carousel">
							 

							  <!-- Wrapper for slides -->
							  <div class="carousel-inner">
							    <div class="item active">
							    
							     <div class="w3-content w3-display-container">
  <%-- 	<c:forEach items="${attachment}" var="attachment">
  	 <div class="item">
  	 <img class="mySlides" src="staticResources/galary/${getGalaryCategoryList.galary_cate_name}/${attachment.attachmnt_name}" style="height:403px">
  	 </div>
  	</c:forEach> --%>

  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
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
         </section>

         <footer id="t3-footer" class="wrap t3-footer footer-section">
             <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>

	<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}

</script>


   </body>
</html>