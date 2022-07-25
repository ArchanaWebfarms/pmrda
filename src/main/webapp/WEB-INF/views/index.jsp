<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
   <style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.button2 {background-color: #008CBA;} /* Blue */
.button3 {background-color: #f44336;} /* Red */ 
.button4 {background-color: #e7e7e7; color: black;} /* Gray */ 
.button5 {background-color: #555555;} /* Black */
</style>
   <style>
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;

  text-align: center;
  
  display: inline-block;
  font-size: 16px;
  
  cursor: pointer;
}
</style>
      <base href="" />
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />
      <meta name="generator" content="Joomla! - Open Source Content Management" />
      <title>.:: PMRDA ::.</title>
      <link href="http://www.joomla.themesonic.com/cepon/index.php/features/layouts-option/homepage-two?format=feed&amp;type=rss" rel="alternate" type="application/rss+xml" title="RSS 2.0" />
      <link href="http://www.joomla.themesonic.com/cepon/index.php/features/layouts-option/homepage-two?format=feed&amp;type=atom" rel="alternate" type="application/atom+xml" title="Atom 1.0" />
      <link href="templates/cepon/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon" />
      <link href="http://www.joomla.themesonic.com/cepon/index.php/component/search/?Itemid=550&amp;format=opensearch" rel="search" title="Search Cepon" type="application/opensearchdescription+xml" />
      <link href="staticResources/t3-assets/css/css-53bde-52498.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="staticResources/t3-assets/css/css-efa6c-52499.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
      <link href="staticResources/t3-assets/css/css-ae08a-09948.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
      <link rel="stylesheet" href="staticResources/t3-assets/css/font-awesome/css/all.css"/>
      <style type="text/css">
         #gk-tabs-235 .gkTabsContainer0, #gk-tabs-235 .gkTabsContainer1, #gk-tabs-235 .gkTabsContainer2 { height: 200px; }
         #playlistck_wrap_260 .playlistck_thumbs_cont .playlistck_thumbs_li img {width:100% !important;}
         #playlistck_wrap_260 .playlistck_thumbs_caption {width:100%;}
         #playlistck_wrap_260 .playlistck_thumbs_image {width:100%;height:100%;}
         #playlistck_wrap_260 .playlistck_caption {
         display: block;
         position: absolute;
         }
         #playlistck_wrap_260 .playlistck_caption > div {
         }
         #playlistck_wrap_260 .playlistck_caption > div * {
         }
         #playlistck_wrap_260 .playlistck_caption > div div.playlistck_caption_desc, #playlistck_wrap_260 .playlistck_caption > div div.playlistck_caption_desc * {
         }
         #gkHighlighterGK5-0 .gkHighlighterInterface span.text { color: #ffffff; } #gkHighlighterGK5-0 .gkHighlighterInterface { background-color: #819510; border-radius: 0px; -moz-border-radius: 0px; -webkit-border-radius: 0px; }
      </style>
      <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
      <script type="text/javascript">
		
		$(function(){
			$('#myCarousel-2 .carousel-inner > .item > img').click(function(){
				imageUrl = $(this).attr('src');
	            //$('.carousel-img > img').attr('src', imageUrl);
	            $('.carousel-img-overlay').fadeIn('fast');
	            $('.carousel-img.projects').fadeIn('slow');
	            $('#myCarousel-4 .carousel-inner > .item').each(function(){
	               var iterativeImageUrl = $(this).find('img').attr('src');
	               if(imageUrl==iterativeImageUrl){
	                  $(this).addClass('active');
	                  $('#myCarousel-4 .carousel-inner > .item').not(this).removeClass('active');
	               }
	            });
			});
			$('.carousel-img-overlay').click(function(){
				$(this).fadeOut('slow');
				$('.carousel-img').fadeOut('fast');
			});

         $('body').click(function(e){

            $('#mod-search-searchword').css({'background-position': 'left', 'margin-left': '10px'});
            var container = $('#mod-search-searchword');
            if(e.target.id != container.attr('id')){
               $('#mod-search-searchword').css({'background-position': 'center', 'margin-left': '0px'});
            }

         });

		});

	</script>

      <script type="application/json" class="joomla-script-options new">{"csrf.token":"f0db3ae70813c549dc275db4d0281183","system.paths":{"root":"\/cepon","base":"\/cepon"},"system.keepalive":{"interval":840000,"uri":"\/cepon\/index.php\/component\/ajax\/?format=json"}}</script>
      <script src="staticResources/t3-assets/js/js-e56c0-09948.js" type="text/javascript"></script>
      <script src="staticResources/media/k2/assets/js/k2.frontend.js" type="text/javascript"></script>
      <script src="staticResources/t3-assets/js/js-ab6e9-09948.js" type="text/javascript"></script>
      <script src="staticResources/media/system/js/core.js" type="text/javascript"></script>
      <script src="staticResources/media/com_acymailing/js/acymailing_module.js" type="text/javascript" async="async"></script>
      <script src="staticResources/t3-assets/js/js-2aeb9-09948.js" type="text/javascript"></script>
      <script type="text/javascript">
         jQuery(window).on('load',  function() {
         				new JCaption('img.caption');
         			});
         	if(typeof acymailing == 'undefined'){
         					var acymailing = Array();
         				}
         				acymailing['NAMECAPTION'] = 'Name';
         				acymailing['NAME_MISSING'] = 'Please enter your name';
         				acymailing['EMAILCAPTION'] = 'Enter Your Email ID';
         				acymailing['VALID_EMAIL'] = 'Please enter a valid e-mail address';
         				acymailing['ACCEPT_TERMS'] = 'Please check the Terms and Conditions';
         				acymailing['CAPTCHA_MISSING'] = 'The captcha is invalid, please try again';
         				acymailing['NO_LIST_SELECTED'] = 'Please select the lists you want to subscribe to';
         		
         		jQuery(function($) {
         			SqueezeBox.initialize({});
         			SqueezeBox.assign($('a.modal').get(), {
         				parse: 'rel'
         			});
         		});
         
         		window.jModalClose = function () {
         			SqueezeBox.close();
         		};
         		
         		// Add extra modal close functionality for tinyMCE-based editors
         		document.onreadystatechange = function () {
         			if (document.readyState == 'interactive' && typeof tinyMCE != 'undefined' && tinyMCE)
         			{
         				if (typeof window.jModalClose_no_tinyMCE === 'undefined')
         				{	
         					window.jModalClose_no_tinyMCE = typeof(jModalClose) == 'function'  ?  jModalClose  :  false;
         					
         					jModalClose = function () {
         						if (window.jModalClose_no_tinyMCE) window.jModalClose_no_tinyMCE.apply(this, arguments);
         						tinyMCE.activeEditor.windowManager.close();
         					};
         				}
         		
         				if (typeof window.SqueezeBoxClose_no_tinyMCE === 'undefined')
         				{
         					if (typeof(SqueezeBox) == 'undefined')  SqueezeBox = {};
         					window.SqueezeBoxClose_no_tinyMCE = typeof(SqueezeBox.close) == 'function'  ?  SqueezeBox.close  :  false;
         		
         					SqueezeBox.close = function () {
         						if (window.SqueezeBoxClose_no_tinyMCE)  window.SqueezeBoxClose_no_tinyMCE.apply(this, arguments);
         						tinyMCE.activeEditor.windowManager.close();
         					};
         				}
         			}
         		};
         		
         jQuery(function($){ initTooltips(); $("body").on("subform-row-add", initTooltips); function initTooltips (event, container) { container = container || document;$(container).find(".hasTooltip").tooltip({"html": true,"container": "body"});} });
         	
      </script>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
      <style type="text/stylesheet">
         @-webkit-viewport   { width: device-width; }
         @-moz-viewport      { width: device-width; }
         @-ms-viewport       { width: device-width; }
         @-o-viewport        { width: device-width; }
         @viewport           { width: device-width; }
      </style>
      <script type="text/javascript">
         //<![CDATA[
         if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
         	var msViewportStyle = document.createElement("style");
         	msViewportStyle.appendChild(
         		document.createTextNode("@-ms-viewport{width:auto!important}")
         	);
         	document.getElementsByTagName("head")[0].appendChild(msViewportStyle);
         }
         //]]>
      </script>
      <meta name="HandheldFriendly" content="true" />
      <meta name="apple-mobile-web-app-capable" content="YES" />
      <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <script type="text/javascript" src="/cepon/plugins/system/t3/base-bs3/js/respond.min.js"></script>
      <![endif]-->
   </head>
   <body id="body">
   
     <input type="hidden" name="lang" id="lang" value="<%=LocaleContextHolder.getLocale()%>">
			<c:set var="localLang" value="<%=LocaleContextHolder.getLocale()%>"/>
			<c:set var="engLang" value="en_US"/>
      <div class="t3-wrapper t3-homepage-2">
          <div id="t3-topbars" class="t3-topbars">
            <div class="container">
               <div class="row">
                  <div class="t3-date col-xs-3 col-sm-5 col-md-6 col-lg-7">
                     <span class="day-date"><%= (new java.util.Date()).toLocaleString()%></span> <span class="update-date">
                  Last Updated : ${LAST_UPDATE}
                     </span>
                  </div>
                  <div class="topmenu col-xs-8 col-md-3 col-lg-3">
                     <ul class="nav menu">
                       <li class="item-207" style="color: black; font-size: 11px;font: bold">
                       <b> <a href="gallery" class=""><spring:message code="Header.Menu.Gallery" /></a></b>
                           </li>
                           
                           
                           
                        <li class="item-444" style="color: black; font-size: 11px;font: bold">
                           <a href="?lang=en_US" class=""><b><spring:message code="label.english" /> </b></a>
                        </li>
                        <li class="item-207" style="color: black; font-size: 11px;font: bold">
                           <a href="?lang=marathi" class=""><b><spring:message code="label.marathi" /> </b></a>
                        </li>
                        
                         <li class="item-207" style="color: black; font-size: 11px;font: bold">
                           <a href="screen_reader" class=""><b><spring:message code="label.screenReader" /></b> </a>
                        </li>
                        
                         <li class="item-207">
                       <span id= "Contrast"   style="color:red;background-color:yellow;align:center"><b>A</b></span>
                           </li>
                           
                       
                     </ul>
                     
   
                  </div> 
                 <!--   <button>Conrtast</button>  -->
                  <div class="social social-container col-xs-6 col-md-3 col-lg-2">
                     <div class="custom">
                        <ul class="social">
                           <li><a class="fb" target="_blank" href="https://www.facebook.com/OfficialPMRDA/"><i class="fab fa-facebook"></i></a></li>
                           <li><a class="tweet" target="_blank" href="https://twitter.com/OfficialPMRDA"><i class="fab fa-twitter-square"></i></a></li>
                           <!-- <li><a class="gplus" href="homepage-two.htm#"><i class="fab fa-google-plus-square"></i></a></li>
                           <li><a class="pinterest" href="homepage-two.htm#"><i class="fab fa-pinterest-square"></i></a></li> -->
                           <li><a class="youtube" target="_blank" href="https://www.youtube.com/channel/UCm8PL_I9BHZxnBEptRdaq0g"><i class="fab fa-youtube-square"></i></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
          <header id="t3-header">
            <div class="container t3-header">
               <div class="row">
               <!-- <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 logo">
                     <div class="logo-image">
                        <a href="index" title="Cepon">
                        	<img class="logo-img-sj pull-left" src="staticResources/images/satyamevajayate.jpg" alt="Satyameva Jayate" height="80px" width="80px" style="margin-right: -10px" />
                        <span>Cepon</span>
                        </a>
                        <small class="site-slogan"></small>
                     </div>
      
                  </div> -->
                   
                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 logo">
                     <div class="logo-image">
                        <a href="index" title="Cepon">
                        <img class="logo-img" src="staticResources/images/logo1.png" alt="Cepon" />
                        <span>Cepon</span>
                        </a>
                        <small class="site-slogan"></small>
                     </div>
                  </div>
                   
                  <div class="col-xs-12 col-sm-6 col-md-5 col-lg-4">
                  	<img class="logo-img-sj pull-right" src="staticResources/images/satyamevajayate.jpg" alt="Satyameva Jayate" height="80px" width="80px" style="margin-right: -10px" />
                  </div> 
               </div>
            </div>
         </header>
         <nav id="t3-mainnav" class="wrap navbar navbar-default t3-mainnav">
            <div class="container">
               <div class="navbar-header">
                  <button type="button" text="Login" class="navbar-toggle" data-toggle="collapse" data-target=".t3-navbar-collapse">
                  </button>
                  <div class="head-search">
                     <form class="form-search" action="doSearch">
                        <div class="search">
                           <label for="mod-search-searchword"><spring:message code="label.Search" /></label>
                           <input name="searchword" id="mod-search-searchword" maxlength="200" class="form-control " type="text" size="20" /> 
                           <input type="hidden" name="task" value="search" />
                           <input type="hidden" name="option" value="com_search" />
                           <input type="hidden" name="Itemid" value="550" />
                        </div>
                       
                     </form>
                     
                  </div>
               </div>
               <div class="t3-navbar-collapse navbar-collapse collapse"></div>
             <div class="t3-navbar navbar-collapse collapse">
                  <div class="t3-megamenu animate elastic" data-duration="400" data-responsive="true">
                     <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="nav navbar-nav level0">
                        <li itemprop='name' class="current active" data-id="435" data-level="1">
                           <a itemprop='url' class="" href="index.htm" data-target="#"><spring:message code="Header.Menu1.Home" /></a>
                        </li>
                        <li itemprop='name' class="dropdown mega mega-align-justify" data-id="233" data-level="1" data-alignsub="justify">
                           <a itemprop='url' class=" dropdown-toggle" href="#" data-target="#" data-toggle="dropdown"><spring:message code="Header.Menu.AboutUs" /> <em class="caret"></em></a>
                           <div class="nav-child dropdown-menu mega-dropdown-menu col-xs-6">
                              <div class="mega-dropdown-inner">
                                 <div class="row">
                                    <div class="col-xs-4 mega-col-nav" data-width="6" >
                                       <div class="mega-inner">
                                          <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level1">
                                             <li itemprop='name' class="mega mega-group" data-id="520" data-level="2" data-group="1">
                                                <a itemprop='url' class=" dropdown-header mega-group-title" href="#" data-target="#"><spring:message code="Header.Menu.AboutUs" /> </a>
                                                <div class="nav-child mega-group-ct">
                                                   <div class="mega-dropdown-inner">
                                                      <div class="row">
                                                         <div class="col-xs-12 mega-col-nav" data-width="12">
                                                            <div class="mega-inner">
                                                               <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level2">
                                                                  <li itemprop='name' data-id="559" data-level="3">
                                                                     <a itemprop='url' class="" href="pmrda_background" data-target="#"><spring:message code="Header.Menu.AboutUs.background" /> </a>
                                                                  </li>
                                                                  <li itemprop='name' data-id="560" data-level="3">
                                                                     <a itemprop='url' class="" href="vision_and_mission" data-target="#"><spring:message code="Header.Menu.AboutUs.vision" /> </a>
                                                                  </li>
                                                                  <li itemprop='name' data-id="561" data-level="3">
                                                                     <a itemprop='url' class="" href="objectives" data-target="#"><spring:message code="Header.Menu.AboutUs.objectives" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="561" data-level="3">
                                                                     <a itemprop='url' class="" href="pmrda_establishment" data-target="#"><spring:message code="Header.Menu.AboutUs.establishment" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="561" data-level="3">
                                                                     <a itemprop='url' class="" href="master_plan" data-target="#"><spring:message code="Header.Menu.AboutUs.masterplan" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="561" data-level="3">
                                                                     <a itemprop='url' class="" href="digital_policy" data-target="#"><spring:message code="Header.Menu.AboutUs.policy" /> </a>
                                                                  </li>
                                                               </ul>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </li>
                                          </ul>
                                       </div>
                                    </div>
                                    <div class="col-xs-4 mega-col-nav" data-width="6">
                                       <div class="mega-inner">
                                          <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level1">
                                             <li itemprop='name' class="mega mega-group" data-id="641" data-level="2" data-group="1">
                                                <a itemprop='url' class=" dropdown-header mega-group-title" href="#" data-target="#"><spring:message code="Header.Menu.AboutUs.administrative" /></a>
                                                <div class="nav-child mega-group-ct">
                                                   <div class="mega-dropdown-inner">
                                                      <div class="row">
                                                         <div class="col-xs-12 mega-col-nav" data-width="12">
                                                            <div class="mega-inner">
                                                               <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level2">
                                                                  <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.AboutUs.administrative.leader" /> </a>
                                                                  </li>
                                                                  <li itemprop='name' data-id="522" data-level="3">
                                                                     <a itemprop='url' class="" href="administrative_structure" data-target="#"><spring:message code="Header.Menu.AboutUs.administrative.structure" /> </a>
                                                                  </li>
                                                               </ul>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </li>
                                          </ul>
                                       </div>
                                    </div>
                                    <%-- <div class="col-xs-4 mega-col-nav" data-width="6">
                                       <div class="mega-inner">
                                          <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level1">
                                             <li itemprop='name' class="mega mega-group" data-id="641" data-level="2" data-group="1">
                                                <a itemprop='url' class=" dropdown-header mega-group-title" href="#" data-target="#"><spring:message code="Header.Menu.Departments" /></a>
                                                <div class="nav-child mega-group-ct">
                                                   <div class="mega-dropdown-inner">
                                                      <div class="row">
                                                         <div class="col-xs-12 mega-col-nav" data-width="12">
                                                            <div class="mega-inner">
                                                               <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level2">
                                                                  <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments1" /> </a>
                                                                  </li>
                                                                  <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments2" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments3" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments4" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments5" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments6" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments7" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments8" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments9" /> </a>
                                                                  </li>
                                                                   <li itemprop='name' data-id="521" data-level="3">
                                                                     <a itemprop='url' class="" href="leadership_and_core_team" data-target="#"><spring:message code="Header.Menu.Departments10" /> </a>
                                                                  </li>
                                                               </ul>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </li>
                                          </ul>
                                       </div>
                                    </div>
                                     --%>
                                    
                                 </div>
                              </div>
                           </div>
                        </li>
                        <li itemprop='name' class=" dropdown mega" data-id="499" data-level="1">
                           <a itemprop='url' class=" dropdown-toggle" href="#" data-target="#" data-toggle="dropdown"><spring:message code="Header.Menu.Departments" /> <em class="caret"></em></a>
                           <div class="nav-child dropdown-menu mega-dropdown-menu">
                              <div class="mega-dropdown-inner">
                                 <div class="row">
                                    <div class="col-xs-12 mega-col-nav" data-width="12">
                                       <div class="mega-inner">
                                          <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level1">
                                              <li itemprop='name' data-id="503" data-level="2">
                                                <a itemprop='url' class="" href="engineering" data-target="#"><spring:message code="Header.Menu.Departments1" /> </a>
                                             </li>
                                              <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="permission" data-target="#"><spring:message code="Header.Menu.Departments2" /> </a>
                                             </li>
                                              <li itemprop='name' data-id="504" data-level="2">
                                                <a itemprop='url' class="" href="planning" data-target="#"><spring:message code="Header.Menu.Departments3" /> </a>
                                             </li>
                                             <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="illegal_construction" data-target="#"><spring:message code="Header.Menu.Departments4" /> </a>
                                             </li>
                                              <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="landandestate" data-target="#"><spring:message code="Header.Menu.Departments5" /> </a>
                                             </li>
                                              <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="account" data-target="#"><spring:message code="Header.Menu.Departments6" /> </a>
                                             </li>
                                             <li itemprop='name' data-id="502" data-level="2">
                                             
                                                <a itemprop='url' class="" href="administration" data-target="#"><spring:message code="Header.Menu.Departments7" /> </a>
                                             </li>
                                             <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="center_of_excellence" data-target="#"><spring:message code="Header.Menu.Departments8" /> </a>
                                             </li>
                                            
                                             
                                            
                                            
                                              <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="Investment" data-target="#"><spring:message code="Header.Menu.Departments9" /> </a>
                                             </li>
                                              <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="fire" data-target="#"> <spring:message code="Header.Menu.Departments10" /></a>
                                             </li>
                                             
                                             
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </li>
                        <li itemprop='name' class=" dropdown mega" data-id="499" data-level="1">
                           <a itemprop='url' class=" dropdown-toggle" href="#" data-target="#" data-toggle="dropdown"><spring:message code="Header.Menu.Downloads" /> <em class="caret"></em></a>
                           <div class="nav-child dropdown-menu mega-dropdown-menu">
                              <div class="mega-dropdown-inner">
                                 <div class="row">
                                    <div class="col-xs-12 mega-col-nav" data-width="12">
                                       <div class="mega-inner">
                                          <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level1">
                                             <li itemprop='name' data-id="502" data-level="2">
                                                <a  href="pmrda_notice" data-target="#"><spring:message code="Header.Menu.Downloads1" />  </a>
                                             </li>
                                               <li itemprop='name' data-id="502" data-level="2">
                                                <a itemprop='url' class="" href="pmrda_circulars" data-target="#"><spring:message code="Header.Menu.Downloads2" /> </a>
                                             </li>
                                               <li itemprop='name' data-id="502" data-level="2">
                                                <a itemprop='url' class="" href="pmrda_downloads" data-target="#"><spring:message code="Header.Menu.Downloads3" /> </a>
                                             </li>
                                              
                                            
                                             <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="pmrda_quotations" data-target="#"><spring:message code="Header.Menu.Downloads4" /> </a>
                                             </li>
                                             
                                            
                                             
                                             <li itemprop='name' class="dropdown-submenu mega" data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="article-category-list.htm" data-target="#"><spring:message code="Header.Menu.Downloads5" /> </a>
                                                <div class="nav-child dropdown-menu mega-dropdown-menu">
                                                   <div class="mega-dropdown-inner">
                                                      <div class="row">
                                                         <div class="col-xs-12 mega-col-nav" data-width="12">
                                                            <div class="mega-inner">
                                                               <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level2">
                                                                  <li itemprop='name' data-id="510" data-level="3">
                                                                     <a itemprop='url' class="" href="central_gov" data-target="#"><spring:message code="Header.Menu.Downloads6" /> </a>
                                                                  </li>
                                                                  <li itemprop='name' data-id="510" data-level="3">
                                                                     <a itemprop='url' class="" href="state_gov" data-target="#"><spring:message code="Header.Menu.Downloads9" /> </a>
                                                                  </li>
                                                                  
                                                                 
                                                               </ul>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </li>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </li>
                        
                          
                        <li itemprop='name' data-id="489" data-level="1" class="dropdown mega">
                           <a itemprop='url' class=" dropdown-toggle" href="#" data-target="#" data-toggle="dropdown"><spring:message code="Header.Menu.Projects" /><em class="caret"></em></a>
                           <div class="nav-child dropdown-menu mega-dropdown-menu">
                              <div class="mega-dropdown-inner">
                                 <div class="row">
                                    <div class="col-xs-12 mega-col-nav" data-width="12">
                                       <div class="mega-inner">
                                          <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level1">
                                             <li itemprop='name' data-id="502" data-level="2">
                                                <a itemprop='url' class="" href="ringroad_project" data-target="#"><spring:message code="Header.Menu.Projects1" /> </a>
                                             </li>
                                             <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="tpschme_project" data-target="#"><spring:message code="Header.Menu.Projects2" /> </a>
                                             </li>
                                           
											 <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="firestation_project" data-target="#"><spring:message code="Header.Menu.Projects4" /> </a>
                                             </li>
                                             <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="yerwadabuilding_project" data-target="#"><spring:message code="Header.Menu.Projects5" /></a>
                                             </li>
											  <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="pune_metro_line3" data-target="#"><spring:message code="Header.Menu.Projects6" /></a>
                                             </li>
                                             <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="hyperloop_project" data-target="#"><spring:message code="Header.Menu.Projects7" /></a>
                                             </li>
                                              <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="mahalunge-maan-hi-tech-city" data-target="#"><spring:message code="Header.Menu.Projects8" /> </a>
                                             </li>
                                             
                                              <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="obps_system" data-target="#"><spring:message code="Header.Menu.Projects10" /></a>
                                             </li>
                                              <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="mobility_plan" data-target="#"><spring:message code="Header.Menu.Projects11" /></a>
                                             </li>
                                             
                                              <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="water_work" data-target="#"><spring:message code="Header.Menu.Projects13" /></a>
                                             </li>
                                             <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="prdhamnantri_yogana" data-target="#"><spring:message code="Header.Menu.Projects15" /></a>
                                             </li>
                                             <li itemprop='name' data-id="501" data-level="2">
                                                <a itemprop='url' class="" href="land_management" data-target="#"><spring:message code="Header.Menu.Projects17" /></a>
                                             </li>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </li>
                         <li itemprop='name' data-id="665" data-level="1">
                           <a itemprop='url' class="" href="press_notes" data-target="#"><spring:message code="Header.Menu.Downloads9" /></a>
                        </li>
                         <li itemprop='name' data-id="665" data-level="1">
                           <a itemprop='url' class="" href="pmrda_news" data-target="#"><spring:message code="index.News" /></a>
                        </li>
                         <li itemprop='name' data-id="665" data-level="1">
                           <a itemprop='url' class="" href="pmrda_tenders" data-target="#"><spring:message code="index.Tender" /></a>
                        </li>
                        <!--<li itemprop='name' data-id="489" data-level="1">
                           <a itemprop='url' class="" href="http://www.joomla.themesonic.com/cepon/index.php/portfolio" data-target="#">Events </a>
                        </li>-->
                         <li itemprop='name' data-id="665" data-level="1">
                           <a itemprop='url' class="" href="contact" data-target="#"><spring:message code="Header.Menu.Contact" /></a>
                        </li> 
                        <%--  <li itemprop='name' data-id="665" data-level="1">
                           <a itemprop='url' class="" href="gallery" data-target="#"><spring:message code="Header.Menu.Gallery" /></a>
                        </li> --%>
                        
                         <li itemprop='name' data-id="502" data-level="2">
                                                <a itemprop='url' class="" href="pmrda_rti" data-target="#"><spring:message code="Header.Menu.Help1" /> </a>
                                             </li> 
                       <%--  <li itemprop='name' data-id="489" data-level="1" class="dropdown mega">
                           <a itemprop='url' class=" dropdown-toggle" href="#" data-target="#" data-toggle="dropdown"><spring:message code="Header.Menu.Help" /><em class="caret"></em></a>
                           <div class="nav-child dropdown-menu mega-dropdown-menu">
                              <div class="mega-dropdown-inner">
                                 <div class="row">
                                    <div class="col-xs-12 mega-col-nav" data-width="12">
                                       <div class="mega-inner">
                                          <ul itemscope itemtype="http://www.schema.org/SiteNavigationElement" class="mega-nav level1">
                                             
                                             <li itemprop='name' data-id="505" data-level="2">
                                                <a itemprop='url' class="" href="https://pgportal.gov.in/" target="_blank" data-target="#"><spring:message code="Header.Menu.Help2" /> </a>
                                             </li>
                                            </ul>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </li> --%>
                     </ul>
                  </div>
               </div>
               
            </div>

         </nav>
         <section class="wrap t3-featured-news">
            <div class="container">
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
                       <!--  <div data-thumb="staticResources/images/slider/2.jpg" data-src="staticResources/images/slider/2.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 PMRDA Pune Metro 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Pune Metro rail project awarded to Tata Siemens joint venture 
                              </div>
                           </div>
                        </div> -->
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
                       <!--  <div data-thumb="staticResources/images/slider/5.jpg" data-src="staticResources/images/slider/5.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 Nice landscape 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Imagine that you are on holidays 
                              </div>
                           </div>
                        </div> -->
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
                        <!-- <div data-thumb="staticResources/images/slider/7.jpg" data-src="staticResources/images/slider/7.jpg">
                           <div class="playlistck_caption fadeIn">
                              <div class="playlistck_caption_title">
                                 Nice landscape 
                              </div>
                              <div class="playlistck_caption_desc">
                                 Imagine that you are on holidays 
                              </div>
                           </div>
                        </div> -->
                     </div>
                  </div>
                  <div style="clear:both;"></div>
               </div>
            </div>
           <div class="container" style="padding-left:20px; background-color:#E1DEDE">
               <div class="t3-breaking hidden-xs">
                  <div class="row">
                     <div class="col-xs-12 col-md-11">
                        <div class="gkHighlighterGK5" id="gkHighlighterGK5-0" data-config="{'animationType':'slides','animationSpeed':'350','animationInterval':'5000','animationFun':'Fx.Transitions.linear','mouseover':'false'}" style="height: 25px;">
                           <div class="gkHighlighterInterface" data-pos="left">
                              <span id="murqee" class="text" style="color:red"><spring:message code="index.murqee" /></span>
                           </div>
                           <div class="gkHighlighterWrapper">
                              <div class="gkHighlighterWrapperSub">
                                 <!--<div class="gkHighlighterItem"><span><a href="../81-x-men-days-of-future-past-official-trailer.htm"><span>X-Men: Days of Future Pas</span>: The ultimate X-Men ensemble fights a war for the s</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../82-the-raid-2-berandal-official-trailer-1-2014-crime-thriller-hd.htm"><span>The Raid 2: Berandal Offi</span>: The plot is unknown, however, the story begins two</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../83-the-bourne-supremacy-official-trailer-1-brian-cox-movie-2004-hd.htm"><span>The Bourne Supremacy Offi</span>: The Bourne Supremacy Trailer - Directed by Paul Gr</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../80-elegant-and-clean-inspired-website-design.htm"><span>Elegant and Clean-Inspire</span>: For science, music, sport, etc, Europe uses the sa</a></span></div>
                                 <div class="gkHighlighterItem"><span><a href="../79-glenon-is-joomla-template-sing-paling-joss.htm"><span>Glenon is Joomla Template</span>: The European languages are members of the same fam</a></span></div>-->
                                 <marquee id="marquee" direction="left" style="height: 75px;">
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
          <div id="t3-mainbody" class="container t3-mainbody">
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
                                                                  ${approvedNotice.publish_date}
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
                                                                  ${approvedNotice.publish_date}
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
                                                                  ${approvedNotice.publish_date}
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
                                          <div class="nspArt nspCol1" style="padding:15px 0px;">
                                             <div class="gkArtContentWrap">
                                                <h4 class="nspHeader tleft fnull has-image">
                                                   <a href="https://pgportal.gov.in/" target="_blank" title="Glenon is Joomla Template Sing Paling Joss" target="_self"><i class="fas fa-caret-right"></i> <spring:message code="index.ImportantLinks.5"/></a>
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
					<h4 style="padding-left: 25px; margin: 0px;"><span style="color: #d21e1b;"><spring:message code="index.container.h4.span3"/></span> <%-- <spring:message code="index.container.h4.span4"/> --%></h3>
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
							      <img class="gkIsHelperImage" src="staticResources/images/Projects/pmrda.jpg" alt="" />
                              <figure class="gkItem video">
                                 <span class="gkImageWrap">
                                 <img src="staticResources/images/Projects/pmrda.jpg" alt="#" data-url="https://www.youtube.com/embed/M3OpPbALIL8" data-x="640" data-y="480" /></span>
                                 <figcaption>
                                    <strong><spring:message code="index.module-ct.carousel-inner.strong"/></strong>
                                    <h3><a href="#"><spring:message code="index.module-ct.carousel-inner.h1"/></a></h3>
                                    <p><spring:message code="index.module-ct.carousel-inner.p1"/></p>
                                    <small>347</small>
                                 </figcaption>
                              </figure>
							    </div>
							    <div class="item">
							      <img class="gkIsHelperImage" src="staticResources/images/Projects/tp.jpg" alt="" />
                              <figure class="gkItem video">
                                 <span class="gkImageWrap">
                                 <img src="staticResources/images/Projects/tp.jpg" alt="#" data-url="https://www.youtube.com/embed/pDHFlQ0mZmM" data-x="640" data-y="480" /></span>
                                 <figcaption>
                                    <strong><spring:message code="index.module-ct.carousel-inner.strong"/></strong>
                                    <h3><a href="#"><spring:message code="index.module-ct.carousel-inner.h1"/></a></h3>
                                    <p><spring:message code="index.module-ct.carousel-inner.p1"/></p>
                                    <small>347</small>
                                 </figcaption>
                              </figure>
							    </div>












							  <!--   <div class="item">
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
							    </div> -->
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
						   <h3 class="module-title"> <!-- <span>  <a href="gallery" style="color: red;float:right;margin-bottom: 100px;margin-right: 50px" >View All</a>   </span> -->
                  
                       <span><spring:message code="index.module-ct.span2"/>   <a  href="gallery" ><span style="color: red; font-size: 12px"> (<spring:message code="viewAll"/>) </span></a>
                     </h3>
                     <div class="heading-underline" style="width: 200px;">
                        <div class="left"></div><div class="right"></div>
                     </div>
                           	  <div class="carousel-img-overlay">
                           	  	<script>
                           	 $( document ).ready(function() {
                           		document.getElementById("akshay").style.display = "";
                           	});
                           	  	</script>
							  </div>
							  <div class="carousel-img projects" style="height: auto;">
                          <div id="myCarousel-4" class="carousel slide" data-ride="carousel">
                      

                       <!-- Wrapper for slides -->
                       <div class="carousel-inner">
                         <div class="item">
                           <img src="images/projects/tp.jpg" alt="Los Angeles" height="100%" width="100%">
                         </div>

                         <div class="item">
                           <img src="images/projects/hyperloop.jpg" alt="Chicago" height="100%" width="100%">
                         </div>

                         <div class="item">
                           <img src="images/projects/tp.jpg" alt="New York" height="100%" width="100%">
                         </div>
                       </div>

                       <!-- Left and right controls -->
                       <a class="left carousel-control" href="#myCarousel-4" data-slide="prev">
                         <!--<span class="glyphicon glyphicon-chevron-left"></span>
                         <span class="sr-only">Previous</span>-->
                       </a>
                       <a class="right carousel-control" href="#myCarousel-4" data-slide="next">
                         <!--<span class="glyphicon glyphicon-chevron-right"></span>
                         <span class="sr-only">Next</span>-->
                       </a>
                     </div>
                       </div>
                              <div id="myCarousel-2" class="carousel slide" data-ride="carousel">
							  <!-- Indicators 
							  <ol class="carousel-indicators">
							    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							    <li data-target="#myCarousel" data-slide-to="1"></li>
							    <li data-target="#myCarousel" data-slide-to="2"></li>
							  </ol>-->

							  <!-- Wrapper for slides -->
							  <div class="carousel-inner">
							  
							    <div class="item active">
                     <img src="staticResources/images/Projects/hyperloop.jpg" alt="Chicago">							    </div>

  	   <c:forEach items="${getGalaryCategoryList}" var="getGalaryCategoryList">
                          <c:if test="${ getGalaryCategoryList.id > '0'}">
               <c:forEach items="${attachment}" var="attachment"> 
							    <div class="item">
							      <img src="staticResources/galary/${getGalaryCategoryList.galary_cate_name}/${attachment.attachmnt_name}" alt="Chicago">
							    </div>
</c:forEach>
  	 </c:if>
  	 </c:forEach>
							   <!--  <div class="item">
							      <img src="staticResources/images/Projects/tp.jpg" alt="New York">
							    </div> -->
							  </div>

							  <!-- Left and right controls -->
							  <a class="left carousel-control" href="#myCarousel-2" data-slide="prev">
							    <!--<span class="glyphicon glyphicon-chevron-left"></span>
							    <span class="sr-only">Previous</span>-->
							  </a>
							  <a class="right carousel-control" href="#myCarousel-2" data-slide="next">
							    <!--<span class="glyphicon glyphicon-chevron-right"></span>
							    <span class="sr-only">Next</span>-->
							  </a>
							</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>

          <footer id="t3-footer" class="wrap t3-footer footer-section">
            <%--   <jsp:include page="/includes/Footer.jsp" /> --%>
         </footer>
      </div>


	<script>
	$(document).ready(function(){
		
		 var s = $('#o').val();
		//  alert(s);
		  $("#Contrast").click(function(){
			
			 $('#t').val(s);
			 
			  
			  $('html *:not(script, style, noscript)').each(function() {
				 //   $(this).css("background", "none");
				    $(this).css("background-color", "black");
				    $(this).css("color", "blue");
				    $(this).css("box-shadow", "none");
				    $(this).css("text-shadow", "none");
				    $("ul").css("color", "#e2d009");
				    $("li").css("color", "#e2d009");
				    $("a").css("color", "blue");
				    $("p").css("color", "blue");
				    $("span").css("color", "red");
				    $("h2").css("color", "blue");
				    $("b").css("color", "blue");
				    $("td").css("color", "blue");
				    $("tr").css("color", "blue");
				    $("input").css("color", "blue");
				    $("#body").css("color", "black");
				    $("#body").css("background-color", "black");
				    $(".nav navbar-nav level0").css("background-color", "blue");
				    $("#marquee").css("color", "#e2d009");
				   
				 
				    
				    
				 
		
			  });
			  
		  });
		});
	</script>
   </body>
</html>