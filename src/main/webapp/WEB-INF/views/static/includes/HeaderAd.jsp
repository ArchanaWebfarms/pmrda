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
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>   
         
        <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
         
          <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>   
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<body>


 
<base href="" />
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />
      <meta name="generator" content="Joomla! - Open Source Content Management" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="staticResources/css/night-mode.css">
	  <script src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>

      <script src="staticResources/js/jquery.night.mode.js"></script>
	  
<link href="http://www.joomla.themesonic.com/cepon/index.php/2011-08-09-02-47-49/article-category-list?format=feed&amp;type=rss" rel="alternate" type="application/rss+xml" title="RSS 2.0" />
<link href="http://www.joomla.themesonic.com/cepon/index.php/2011-08-09-02-47-49/article-category-list?format=feed&amp;type=atom" rel="alternate" type="application/atom+xml" title="Atom 1.0" />
<link href="staticResources/templates/cepon/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon" />
<link href="http://www.joomla.themesonic.com/cepon/index.php/component/search/?Itemid=501&amp;format=opensearch" rel="search" title="Search Cepon" type="application/opensearchdescription+xml" />
<link href="staticResources/t3-assets/css/css-53bde-52498.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
<link href="staticResources/t3-assets/css/tabs.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="staticResources/t3-assets/css/css-efa6c-52499.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
<link href="staticResources/t3-assets/css/css-1f6cf-09948.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
<link rel="stylesheet" href="staticResources/t3-assets/css/font-awesome/css/all.css"/>
 <link href="staticResources/t3-assets/css/headerStyle.css" rel="stylesheet" type="text/css" media="all" />


<script type="application/json" class="joomla-script-options new">{"csrf.token":"f0db3ae70813c549dc275db4d0281183","system.paths":{"root":"\/cepon","base":"\/cepon"},"system.keepalive":{"interval":840000,"uri":"\/cepon\/index.php\/component\/ajax\/?format=json"}}</script>
<script src="staticResources/t3-assets/js/js-e56c0-09948.js" type="text/javascript"></script>
<script src="staticResources/media/k2/assets/js/k2.frontend.js" type="text/javascript"></script>
<script src="http://www.joomla.themesonic.com/t3-assets/js/js-c0af5-09948.js" type="text/javascript"></script>
<script type='text/javascript' src='jquery-1.9.1.js'></script>
<script type="text/javascript" src="jquerysession.js"></script>

<script type="text/javascript">
jQuery(window).on('load',  function() {
				new JCaption('img.caption');
			});
jQuery(function($){ initPopovers(); $("body").on("subform-row-add", initPopovers); function initPopovers (event, container) { $(container || document).find(".hasPopover").popover({"html": true,"trigger": "hover focus","container": "body"});} });
jQuery(function($){ initTooltips(); $("body").on("subform-row-add", initTooltips); function initTooltips (event, container) { container = container || document;$(container).find(".hasTooltip").tooltip({"html": true,"container": "body"});} });
	</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />


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

	  
	  
	  
	 
	  
      <link href="http://www.joomla.themesonic.com/cepon/index.php/features/layouts-option/homepage-two?format=feed&amp;type=rss" rel="alternate" type="application/rss+xml" title="RSS 2.0" />
      <link href="http://www.joomla.themesonic.com/cepon/index.php/features/layouts-option/homepage-two?format=feed&amp;type=atom" rel="alternate" type="application/atom+xml" title="Atom 1.0" />
      <link href="staticResources/templates/cepon/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon" />
      <link href="http://www.joomla.themesonic.com/cepon/index.php/component/search/?Itemid=550&amp;format=opensearch" rel="search" title="Search Cepon" type="application/opensearchdescription+xml" />
      <link href="staticResources/t3-assets/css/css-53bde-52498.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="staticResources/t3-assets/css/css-efa6c-52499.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
      <link href="staticResources/t3-assets/css/css-ae08a-09948.css" rel="stylesheet" type="text/css" media="all" attribs="[]" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/mark.js/7.0.0/jquery.mark.min.js"></script>
      
     
      <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    

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
                  			 <li class="item-444" style="color: black; font-size: 11px;font: bold">
                        	
                        		<a href="?lang=en_US" class=""><b>English<%-- <spring:message code="label.english" /> --%></b></a>
                       
                        </li>
                       <li class="item-207" style="color: black; font-size: 11px;font: bold">
                           <a href="?lang=marathi" class=""><b>मराठी<%-- <spring:message code="label.marathi" /> --%> </b></a>
                        </li> 
                        
                         
                        
                      <!--   <li><button type="button" id="Normal">🌛</button></li>  -->
                  			</ul>
                  		</div>
                  		<div class="col-md-5 hide-small">
                  		<ul class="nav menu" style="padding:0px;  text-align:center;">
                <!--   	<li><button type="button" id="normal" style="height:30px; border: 1px solid #00000061;"><i class="fas fa-adjust"></i></button></li>  -->
                  		<li class="item-207" style="color: black; font-size: 11px;font: bold;">
                           <a href="screen_reader" style="position:relative; top:5px;"><b><spring:message code="label.screenReader" /></b> </a>
                        </li>
                  		<li class="item-207">
                       <span class="textresize"><button type="button" id="normal" style="height:30px; border: 1px solid #00000061;"><i class="fas fa-sun"></i></button><button type="button" id="Contrast" style="height:30px; border: 1px solid #00000061;"><i class="fas fa-moon"></i></button><button id="myD" onmousedown="mouseDownD()" onmouseup="mouseUpD()" onclick="decreaseFontSize();"><spring:message code="ID.font" /><sup>-</sup></button><button id="myN" onmousedown="mouseDownN()" onmouseup="mouseUpN()" onclick="normalFontSize()" style="background: #0072bb;"><spring:message code="ID.font" /></button><button id="myI" onmousedown="mouseDownI()" onmouseup="mouseUpI()" onclick="increaseFontSize()"><spring:message code="ID.font" /><sup>+</sup></button></span>
                           </li>
                           
                
                  			</ul>
                  		</div>
                  		<div class="col-md-5 hide-small">
                  		<ul class="nav menu" style="padding:5px; text-align:center;">
                  		    <li><a href="javascript:scrollToMain()"><b><spring:message code="Header.Menu.skipcontent" /></b></a></li>
                            <li><a href="javascript:scrollToNav()"><b><spring:message code="Header.Menu.skipnavigation" /></b></a></li>
                       
                  			</ul>
                  		</div>
                  	</div>
                  </div>
                  <div class="col-md-1 col-xs-4" style="padding:5px;">
                  	<a href="login" target="_blank"><spring:message code="Admin.Login" /></a>
                  </div> 
                  <div class="t3-date col-xs-12 col-sm-12 col-md-3 col-lg-3 animatesearch hide-small"  style="padding:0px;">
                  		<form>
 							 <input type="text" class="on-page-search" name="search" placeholder="Search..">
 							 <div class="display-searchinfo" style="display:none; position:fixed; width:230px; top:30px; z-index:9999; background:yellow; padding:5px; text-align:center;">
 							 	<span style="font-weight:bold;">searched term is in RED Highlight</span>
 							 </div>
						</form>
                  </div>
                  
                 
               </div>
            </div>
         </div>
          <header id="t3-header" class="contrast">
            <div class="container-fluid t3-header" style="padding:0px;">
               <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-7 col-lg-7 logo" style="margin-top: 15px;">
                  <div class="row">
                  	<div class="col-md-2 col-xs-12"	style="text-align:center;">
                  	<a href="index" title="Cepon">
                        <img class="logo-img" src="staticResources/images/PMRDALogo1.png" alt="PMRDA Logo" style="text-align:right; width:90px; "/>
                        
                        </a>
                  	</div>
                  	<div class="col-md-10  col-xs-12">
                  	<h4 id="mainname" style="margin:0px;" class="contrastText"> <spring:message code="Header.Menu.logoname1" /></h4>
                  	<h5 class="contrastText"><spring:message code="footer.li.18" /></h5>
                  	<%-- <h4 id="mainname1"><spring:message code="Header.Menu.logoname2" /></h4> --%>
                  	</div>
                  </div>
                     <div class="logo-image">
                        <!-- <a href="index" title="Cepon">
                        <img class="logo-img" src="staticResources/images/logo1.png" alt="Cepon" />
                        <span>Cepon</span>
                        </a> -->
                        <small class="site-slogan"></small>
                     </div>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                  <div class="row">
                  	<div class="col-md-7" style="    text-align: center;    padding: 20px 0px 0px 0px;">
                  <a href="http://zonecertificate.pmrda.gov.in" class="incsiz" target="_blank" style="margin-right:3px; width:50px"><spring:message code="index.zonecertificate" /> </a>
                  <img src= "staticResources/images/icon/new-gif-blinking.gif" height="30" alt="Pune Metropolitan Region Development Authority - PMRDA">
                  </div>
                  <div class="col-md-5" style="text-align:center; display:flex; justify-content:center;">
                  <a href="https://www.maharashtra.gov.in/1125/Home" onClick="return confirm('This is external link, Are you sure you want to continue?')" target="_blank"><img src="staticResources/images/gov_of_Maharashtra.png" title="Government of Maharashtra" alt="Government of Maharashtra" height="70px" width="70px" style="margin-top:15px;" /></a>
                  <img  src="staticResources/images/satyamevajayate.jpg" title="Satyamevajayate" alt="Satyameva Jayate" height="80px" width="80px" style="margin-right: -10px; margin-top:10px;" />
                  </div>
                  </div>
                  
                  
                  
                  	
                  </div> 
               </div>
            </div>
         </header>
         
      
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
         
         
       <%-- <input type="text" id = "ContrastMode" name="MODE"  value="OFF"/>
       <input type="text"  id="userName"  value="<%=session.getAttribute("userName") %>"  name="userName"/>   
          --%>
      
<script>
	$(document).ready(function(){
		
		 var s = $('#o').val();
		//  alert(s);
		  $("#Contrast").click(function(){
			$('#t').val(s);
			 $('html *:not(script, style, noscript)').each(function() {
				 
				$("body").css("background-color", "#353535");
				$(".contrast").css("background-color", "#353535");
				$(".dl-container").css("background-color", "#353535");
				$(".administration-container").css("background-color", "#353535");
				$(".team").css("background-color", "#353535");
				$(".au-container").css("background-color", "#353535");
				$(".b-l-m-container").css("background-color", "#353535");
				$(".projects-container").css("background-color", "#353535");
				$(".filter-container").css("background-color", "#616161");
				$(".contbackground").css("background-color", "#353535");
				$(".contrastText").css("color", "yellow");
				$("h5").css("color", "yellow");
				$(".b-l-m-container ul li a").css("color", "yellow");
				$(".fotHedCon").css("color", "yellow");
				$(".t3-copyright .nav li a").css("color", "#d4d4d4");
				$(".copyright").css("color", "#d4d4d4");
				$(".footersocial span b").css("color", "#d4d4d4");
				$(".blog_detail p").css("color", "#d4d4d4");
				$(".col-md-9 p").css("color", "#d4d4d4");
				$(".col-md-9 li").css("color", "#d4d4d4");
				$(".contbackground li").css("color", "#d4d4d4");
				$(".col-md-9 td").css("color", "#d4d4d4");
				
			 });
			 
		  });
		});
	 </script>

	<script>
	$(document).ready(function(){
		
		 var s = $('#o').val();
		//  alert(s);
		  $("#normal").click(function(){
			$('#t').val(s);
			  $('html *:not(script, style, noscript)').each(function() {
				
				  $("body").css("background-color", "white");
				  $(".contrast").css("background-color", "white");
				  $(".dl-container").css("background-color", "white");
				  $(".administration-container").css("background-color", "white");
				  $(".team").css("background-color", "white");
					$(".au-container").css("background-color", "white");
					$(".b-l-m-container").css("background-color", "white");
					$(".projects-container").css("background-color", "white");
					$(".filter-container").css("background-color", "white");
					$(".contbackground").css("background-color", "white");
					$(".contrastText").css("color", "343434");
					$("h5").css("color", "black");
					$(".b-l-m-container ul li a").css("color", "343434");
					$(".fotHedCon").css("color", "#d71a21");
					$(".t3-copyright .nav li a").css("color", "#575757");
					$(".copyright").css("color", "#575757");
					$(".footersocial span b").css("color", "#575757");
					$(".blog_detail p").css("color", "343434");
					$(".col-md-9 p").css("color", "343434");
					$(".col-md-9 li").css("color", "343434");
					$(".contbackground li").css("color", "343434");
					$(".col-md-9 td").css("color", "343434");
					
			 });
			});
		});
	</script>


 <script type="text/javascript">
        function scrollToNav() {
            $('html, body').animate({ scrollTop: $('#t3-footer').offset().top }, 'slow');
            return false;
        }
        function scrollToMain() {
            $('html, body').animate({ scrollTop: $('#maincontent').offset().top }, 'slow');
            return false;
        }

        
        function scrollToAcc() {
            $('html, body').animate({ scrollTop: $('#t3-topbars').offset().top }, 'slow');
            return false;
        }
   
    </script>

	<script>

    var min=10;
    var max=20;
    function increaseFontSize() {
       var p = document.querySelectorAll('p, .incsiz, .t3-copyright .nav li a, .b-l-m-container ul  li  a, table, .articleInnerAside, .articleInnerAside span, .topnav a, .dropdown .dropbtn');
       for(i=0;i<p.length;i++) {
          if(p[i].style.fontSize) {
             var s = parseInt(p[i].style.fontSize.replace("px",""));
          } else {
             var s = 14;
          }
          if(s!=max) {
             s += 1;
          }
          p[i].style.fontSize = s+"px"
       }
    }
    function decreaseFontSize() {
       var p = document.querySelectorAll('p, .incsiz, .t3-copyright .nav li a, .b-l-m-container ul  li  a, table, .articleInnerAside, .articleInnerAside span, .topnav a, .dropdown .dropbtn');
       for(i=0;i<p.length;i++) {
          if(p[i].style.fontSize) {
             var s = parseInt(p[i].style.fontSize.replace("px",""));
          } else {
             var s = 14;
          }
          if(s!=min) {
             s -= 1;
          }
          p[i].style.fontSize = s+"px"
       }   

    }
    function normalFontSize() {
    	var p = document.querySelectorAll('p, .incsiz, .t3-copyright .nav li a, .b-l-m-container ul  li  a, table, .articleInnerAside, .articleInnerAside span, .topnav a, .dropdown .dropbtn');
        for(i=0;i<p.length;i++) {
           if(p[i].style.fontSize) {
              var s = parseInt(p[i].style.fontSize.replace("px",""));
           } else {
              var s = 14;
           }
           if(s!=14) {
              s = 14;
           }
           p[i].style.fontSize = s+"px"
        }   

          
        }   

   
    
    </script>
    
    
    <script type='text/javascript'>
jQuery(document).ready(function($) {
$(".on-page-search").on("keyup", function () {
	
	if( $(this).val().length) {
        $(this).css("position", "fixed");
        $(".display-searchinfo").css("display", "block");
        
    }
	else{
		 $(this).css("position", "relative");
		 $(".display-searchinfo").css("display", "none");
	}
	
var v = $(this).val();
$(".results").removeClass("results");
$("p,h1,h2,h3,h4,h5,h6,span,a,td,th").each(function () {
if (v != "" && $(this).text().search(new RegExp(v,'gi')) != -1) {
$(this).addClass("results");
}
});
});
}); </script>
<script>
$(document).ready(function() {
	 // executes when HTML-Document is loaded and DOM is ready

	// breakpoint and up  
	$(window).resize(function(){
		if ($(window).width() >= 980){	

	      // when you hover a toggle show its dropdown menu
	      $(".navbar .dropdown-toggle").hover(function () {
	         $(this).parent().toggleClass("show");
	         $(this).parent().find(".dropdown-menu").toggleClass("show"); 
	       });

	        // hide the menu when the mouse leaves the dropdown
	      $( ".navbar .dropdown-menu" ).mouseleave(function() {
	        $(this).removeClass("show");  
	      });
	  
			// do something here
		}	
	});  
	  
	  

	// document ready  
	});
</script>
<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
	</body>