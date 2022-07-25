<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<head>
		<!-- Meta Tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Title -->
		<title>CMS</title>
		<meta name="description" content="">
		<!-- Google Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Great+Vibes' rel='stylesheet' type='text/css'>
		<!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.html">
		<!-- Stylesheets -->
		<link href="staticResources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="staticResources/css/fontello.css" rel="stylesheet" type="text/css">
		<link href="staticResources/css/flexslider.css" rel="stylesheet" type="text/css">
		<link href="staticResources/js/revolution-slider/css/settings.css" rel="stylesheet" type="text/css" media="screen" />		
		<link href="staticResources/css/responsive-calendar.css" rel="stylesheet" type="text/css">
		<link href="staticResources/css/chosen.css" rel="stylesheet" type="text/css">
		<link href="staticResources/jackbox/css/jackbox.min.css" rel="stylesheet" type="text/css" />
		<link href="staticResources/css/cloud-zoom.css" rel="stylesheet" type="text/css" />
		<link href="staticResources/css/colorpicker.css" rel="stylesheet" type="text/css">
		<link href="staticResources/css/style.css" rel="stylesheet" type="text/css">       
         <link href="staticResources/assets/owl.carousel.css" rel="stylesheet">
		<link href="staticResources/assets/owl.theme.css" rel="stylesheet">        
		<style type="text/css">
			.no-fouc {display:none;}
	  	</style>
		
		
		<link rel="stylesheet" href="staticResources/css/news_scroll.css" type="text/css">
     
        
                    
    
 
	
</head>

<body class="sticky-header-on tablet-sticky-header">
		<!-- Container -->
		<div class="container">
<%-- <jsp:include page="../static/includes/adminHeader.jsp" /> --%>
<!--   <jsp:include page="../includes/adminHeader.jsp" />	 -->

<!-- /Section -->
    <section class="section full-width-bg gray-bg gray-bg1" style="background:url(img/texture1.jpg) repeat-x; border-top: 5px solid #73baf6">
            <div id="demo" >
     
            <div class="span12">

              <div id="owl-demo" class="owl-carousel">
                <div class="item"><img src="img/client-logo1.png" alt="Owl Image"></div>
                <div class="item"><img src="img/client-logo2.png" alt="Owl Image"></div>
                <div class="item"><img src="img/client-logo1.png" alt="Owl Image"></div>
                <div class="item"><img src="img/client-logo2.png" alt="Owl Image"></div>
                <div class="item"><img src="img/client-logo1.png" alt="Owl Image"></div>
                <div class="item"><img src="img/client-logo2.png" alt="Owl Image"></div>
                <div class="item"><img src="img/client-logo1.png" alt="Owl Image"></div>
                <div class="item"><img src="img/client-logo2.png" alt="Owl Image"></div>
              </div>
              
            </div>
     
    </div> 
            </section>


<script src="staticResources/assets/jquery-1.9.1.min.js"></script> 
                <script src="staticResources/assets/owl.carousel.js"></script>
<!-- jQuery -->
		<script src="staticResources/js/jquery-1.11.0.min.js"></script>
		<script src="staticResources/js/jquery-ui-1.10.4.min.js"></script>
		
		<script src="staticResources/js/jquery-1.js"></script>
		<script src="staticResources/js/jquery-ui-1.js"></script>
		<!-- Preloader -->
		<script src="staticResources/js/jquery.queryloader2.min.js"></script>

<%-- <jsp:include page="../static/includes/adminFooter.jsp" /> --%>



 <!-- Back To Top --> 
  <a href="#" id="button-to-top"><i class="icons icon-up-dir"></i></a> </div>
<!-- /Container --> 
<!-- JavaScript --> 
<!-- Bootstrap --> 
<script type="text/javascript" src="staticResources/js/bootstrap.min.js"></script> 
<!-- Modernizr --> 
<script type="text/javascript" src="staticResources/js/modernizr.js"></script> 
<!-- Sliders/Carousels --> 
<script type="text/javascript" src="staticResources/js/jquery.flexslider-min.js"></script> 
<script type="text/javascript" src="staticResources/js/owl.carousel.min.js"></script> 

<!-- Sliders/Carousels --> 
<script type="text/javascript" src="staticResources/js/jquery.js"></script> 
<script type="text/javascript" src="staticResources/js/owl.js"></script> 
<!-- Revolution Slider  --> 
<script type="text/javascript" src="staticResources/js/revolution-slider/js/jquery.themepunch.plugins.min.js"></script> 
<script type="text/javascript" src="staticResources/js/revolution-slider/js/jquery.themepunch.revolution.min.js"></script> 
<!-- Calendar --> 
<script type="text/javascript" src="staticResources/js/responsive-calendar.min.js"></script> 
<!-- Raty --> 
<script type="text/javascript" src="staticResources/js/jquery.raty.min.js"></script> 
<!-- Chosen --> 
<script type="text/javascript" src="staticResources/js/chosen.jquery.min.js"></script> 
<!-- MixItUp --> 
<script type="text/javascript" src="staticResources/js/jquery.mixitup.js"></script> 
<!-- JackBox --> 
<script type="text/javascript" src="staticResources/jackbox/js/jackbox-packed.min.js"></script> 
<!-- CloudZoom --> 
<script type="text/javascript" src="staticResources/js/zoomsl-3.0.min.js"></script> 
<!-- ColorPicker --> 
<script type="text/javascript" src="staticResources/js/colorpicker.js"></script> 
<!-- Main Script --> 
<script type="text/javascript" src="staticResources/js/script.js"></script> 
<script type="text/javascript" src="staticResources/js/contact.js"></script> 
<script type="text/javascript">
		$('html').addClass('no-fouc');
		
		$(document).ready(function(){
			
			$('html').show();
			
			var window_w = $(window).width();
			var window_h = $(window).height();
			var window_s = $(window).scrollTop();
			
			$("body").queryLoader2({
				backgroundColor: '#f2f4f9',
				barColor: '#63b2f5',
				barHeight: 4,
				percentage:false,
				deepSearch:true,
				minimumTime:1000,
				onComplete: function(){
					
					$('.animate-onscroll').filter(function(index){
					
						return this.offsetTop < (window_s + window_h);
						
					}).each(function(index, value){
						
						var el = $(this);
						var el_y = $(this).offset().top;
						
						if((window_s) > el_y){
							$(el).addClass('animated fadeInDown').removeClass('animate-onscroll');
							setTimeout(function(){
								$(el).css('opacity','1').removeClass('animated fadeInDown');
							},2000);
						}
						
					});
					
				}
			});
			
		});
		</script>
<script>
	$(document).ready(function() {
	  $("#owl-demo").owlCarousel({
	      autoPlay: 3000, //Set AutoPlay to 3 seconds
	 		nav : false,
	      items : 6,
		pagination: false,
	      itemsDesktop : [1199,3],
	      itemsDesktopSmall : [979,3],
	      navigation : true,
	      navigationText : ['<span class="fa-stack"><i class="fa fa-circle fa-stack-1x"></i><i class="fa fa-chevron-circle-left fa-stack-1x fa-inverse"></i></span>','<span class="fa-stack"><i class="fa fa-circle fa-stack-1x"></i><i class="fa fa-chevron-circle-right fa-stack-1x fa-inverse"></i></span>'],
	  });
	});
	</script>



</body>
</html>