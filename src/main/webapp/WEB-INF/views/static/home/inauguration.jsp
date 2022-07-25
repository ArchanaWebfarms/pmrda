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
      
      <meta charset="utf-8" />
    <title>Inauguration Programme PMRDA</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />

    <link href="staticResources/temp_assets/assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="staticResources/temp_assets/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="staticResources/temp_assets/assets/plugins/font-awesome/css/all.min.css" rel="stylesheet" />
    <link href="staticResources/temp_assets/assets/plugins/animate/animate.min.css" rel="stylesheet" />
    <link href="staticResources/temp_assets/assets/css/default/style.min.css" rel="stylesheet" />
    <link href="staticResources/temp_assets/assets/css/default/style-responsive.min.css" rel="stylesheet" />
    <link href="staticResources/temp_assets/assets/css/default/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

  	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
      <link href="staticResources/temp_assets/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
      <link href="staticResources/temp_assets/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Roboto+Slab&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
	  
	<style>
      body{
            background: white;
            overflow: hidden;
        }
        body.scissor{
            cursor:url("staticResources/images/sample/scissor.png"), auto;
}
body.candle{
            cursor:url("staticResources/images/sample/candle.png"), auto;
}
#wrapper
{
 text-align:center;
 margin:0 auto;
 padding:0px;
 width:100%;
 position: absolute;
 z-index: 2;

}
#effect
{
 position:relative;	
 width:100%;
 height:100vh;
 box-shadow:0px 0px 10px 0px #610B0B;
 
}
#effect p
{
 margin-top:10px;
 font-size:30px;
 color:#F79F81;
}
#curtain1
{
 top:0px;
 position:absolute;
 left:0px;
 height:100vh;
}
#curtain2
{
 top:0px;
 position:absolute;
 height:100vh;
 right:0px;
}
#curtain_buttons input[type="button"]
{
 margin-top:20px;
 width:150px;
 height:45px;
 border-radius:2px;
 color:white;
 background-color:#B43104;
 border:none;
 border-bottom:6px solid #8A2908;
}
div#curtain_buttons {
    position: absolute;
    top: -100px;
    right: 15px;
}
#after_open_curt{
    text-align: center;
    padding-top: 30px;
    background-image: radial-gradient(white 30%, #ffd70087);
    height: 100vh;
   
    
}

.main_heading{
    font-family: 'Roboto Slab', serif;
    color: brown;
        font-size: 2.64vw;
}
.second_line{
    color: green;
        font-size: 1.75vw;
}
.third_line{
    color: blue;
        font-size: 1.32vw;
}
.guest{
    color: sienna;
        font-size: 1.8vw;
}
.ribbon_effect{
    display: flex;
    position: relative;
    left: -55px;
    z-index: 1;
     
}
#ribbon_effect img{
    position: relative;
}
.lamp_effect {
    position: absolute;
    bottom: 0px;
    left: 100px;
}
.lamp_effect img{
    width: 200px;
}
.lamp_effect .lamp_area{
    position: relative;
}
.lamp_effect .lamp_area .fl1{
    width: 40px;
    position: absolute;
    left: -10px;
    top: 75px;
}
.lamp_effect .lamp_area .fl2{
    width: 40px;
    position: absolute;
    top: 72px;
    left: 164px;
}
.lamp_effect .lamp_area .fl3{
    width: 31px;
    position: absolute;
    top: 45px;
    left: 25px;
}
.lamp_effect .lamp_area .fl4{
    width: 31px;
    position: absolute;
    top: 45px;
    left: 127px;
}
.lamp_effect .lamp_area .fl5{
    width: 41px;
    position: absolute;
    top: 100px;
    left: 78px;
}
.lamp_effect .lamp_area .lamp{
    opacity: 0;
}

.animate__animated.fadeOutLeft, .animate__animated.fadeOutRight{
    animation-duration: 3s;
}
.animate__animated.fadeIn{
    animation-duration: 3s;
}
@media (min-width: 2000px){
	#after_open_curt .container{
		max-width: 100% !important;
	}
	.ribbon_effect{
		    justify-content: center !important;
		        left: 0px !important;
	}
	.ribbon_effect img{
		width: 50% !important;
	}
}
@media (min-width: 2000px) and (max-width: 2500px){
	.main_lamp{
		width: 300px !important;
	}
	.rope_image{
		width: 150px;
	}
	.main_logo{
		width: 200px !important;
	}
	.lamp_effect .lamp_area .fl1 {
    width: 55px;
    position: absolute;
    left: -10px;
    top: 120px;
}
.lamp_effect .lamp_area .fl2 {
    width: 55px;
    position: absolute;
    top: 115px;
    left: 250px;
}
.lamp_effect .lamp_area .fl3 {
    width: 45px;
    position: absolute;
    top: 75px;
    left: 45px;
}
.lamp_effect .lamp_area .fl4 {
    width: 45px;
    position: absolute;
    top: 72px;
    left: 190px;
}
.lamp_effect .lamp_area .fl5 {
    width: 60px;
    position: absolute;
    top: 155px;
    left: 115px;
}
}
@media (min-width: 2500px) and (max-width: 3000px){
	.main_lamp{
		width: 400px !important;
	}
	.rope_image{
		width: 200px;
	}
		.main_logo{
		width: 250px !important;
	}
	.lamp_effect .lamp_area .fl1 {
    width: 70px;
    position: absolute;
    left: -10px;
    top: 165px;
}
.lamp_effect .lamp_area .fl2 {
    width: 70px;
    position: absolute;
    top: 160px;
    left: 325px;
}
.lamp_effect .lamp_area .fl3 {
    width: 60px;
    position: absolute;
    top: 100px;
    left: 59px;
}
.lamp_effect .lamp_area .fl4 {
    width: 60px;
    position: absolute;
    top: 100px;
    left: 250px;
}
.lamp_effect .lamp_area .fl5 {
    width: 80px;
    position: absolute;
    top: 205px;
    left: 155px;
}
}
@media (min-width: 3000px){
	.main_lamp{
		width: 500px !important;
	}
	.rope_image{
		width: 250px;
	}
		.main_logo{
		width: 300px !important;
	}
	.lamp_effect .lamp_area .fl1 {
    width: 90px;
    position: absolute;
    left: -10px;
    top: 205px;
}
.lamp_effect .lamp_area .fl2 {
    width: 90px;
    position: absolute;
    top: 205px;
    left: 410px;
}
.lamp_effect .lamp_area .fl3 {
    width: 80px;
    position: absolute;
    top: 110px;
    left: 60px;
}
.lamp_effect .lamp_area .fl4 {
    width: 80px;
    position: absolute;
    top: 110px;
    left: 305px;
}
	.lamp_effect .lamp_area .fl5 {
    width: 100px;
    position: absolute;
    top: 255px;
    left: 195px;
}
}
    </style>
   </head>
   <body>
    <div id="wrapper">

        <div id="effect">
         <img src="staticResources/images/sample/4.jpg" id="curtain1">
         <img src="staticResources/images/sample/4.jpg" id="curtain2">

        </div>
        
        <div id="curtain_buttons">
         <span type="button" value="OPEN CURTAIN" onclick="open_curtain();">
            <img class="rope_image" src="staticResources/images/sample/rope.png">
        </span>
        </div>
        
        </div>
        <div id="after_open_curt">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <img class="main_logo" src="staticResources/images/sample/PMRDALogo1.png" width="150">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="main_heading m-b-20">Inauguration Programme</h1>
                        <h3 class="second_line">Launch of new Website of the</h3>
                        <h3 class="second_line">Pune Metropolitan Region Development Authority (PMRDA)</h3>
                        <h4 style="font-size: 1.32vw;" class="second_line">Government of Maharashtra</h4>
                        <h4 class="third_line">at "Address of Inauguration Programme" on 26 January 2021</h4>
                        <h5 style="font-size: 1vw;">By</h5>
                        <h3 class="guest">Name of Guest</h3>
                        <h4 style="font-size: 1.3vw;">Postion</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-right">
                        <h5 style="font-size: 1.1vw;">Website Developed By</h5>
                        <h5 style="font-size: 1.1vw;">- Vidya Online Services Pune Pvt Ltd</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="ribbon_effect">
                            <img id="ribb1" class="animate__animated" src="staticResources/images/sample/ribbon1.png">
                            <img id="ribb2" class="animate__animated" src="staticResources/images/sample/ribbon2.png">
                        </div>
                    </div>
                </div>
                <div class="lamp_effect">
                    <div class="lamp_area">
                        <img class="main_lamp" src="staticResources/images/sample/lamp.png">
                        <img class="animate__animated lamp fl1" src="staticResources/images/sample/flame.gif">
                        <img class="animate__animated lamp fl2" src="staticResources/images/sample/flame.gif">
                        <img class="animate__animated lamp fl3" src="staticResources/images/sample/flame.gif">
                        <img class="animate__animated lamp fl4" src="staticResources/images/sample/flame.gif">
                        <img class="animate__animated lamp fl5" src="staticResources/images/sample/flame.gif">
                       
                    </div>

                </div>
            </div>
         

        </div>



	
	

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="staticResources/temp_assets/assets/plugins/jquery/jquery-3.6.0.min.js"></script>
    <script src="staticResources/temp_assets/assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
    <script src="staticResources/temp_assets/assets/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="staticResources/temp_assets/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!--[if lt IE 9]>
		<script src="assets/crossbrowserjs/html5shiv.js"></script>
		<script src="assets/crossbrowserjs/respond.min.js"></script>
		<script src="assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
    <script src="staticResources/temp_assets/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="staticResources/temp_assets/assets/plugins/js-cookie/js.cookie.js"></script>
    <script src="staticResources/temp_assets/assets/js/theme/default.min.js"></script>
    <script src="staticResources/temp_assets/assets/js/apps.min.js"></script>
    <!-- ================== END BASE JS ================== -->

 <!-- ================== BEGIN PAGE LEVEL JS ================== -->
 
 
 
 <script src="staticResources/temp_assets/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	
	<script src="staticResources/temp_assets/assets/plugins/clipboard/clipboard.min.js"></script>
    <script src="staticResources/temp_assets/assets/js/demo/form-plugins.demo.min.js"></script>
    <script src="staticResources/temp_assets/assets/plugins/highlight/highlight.common.js"></script>
 <script src="staticResources/temp_assets/assets/js/demo/render.highlight.js"></script>
 
 <!-- ================== END PAGE LEVEL JS ================== -->


<script type="text/javascript">
    function open_curtain()
    {
     $("#curtain1").animate({width:20},2000);
     $("#curtain2").animate({width:20},2000);
     $("#curtain_buttons").animate({top:0},1000);
     $("#curtain_buttons").hide(1000);
     

     setTimeout(function() {
        $("#wrapper").css('z-index', '-1');
        $("body").addClass("scissor");
    }, 2000);

     
    }
    
    </script>
    <script>
        $(".ribbon_effect").click(function(){
            $("body").removeClass("scissor");
            $("#ribb1").addClass("fadeOutLeft");
            $("#ribb2").addClass("fadeOutRight");
            

            setTimeout(function() {
            $("body").addClass("candle");
    }, 2000);
            
            $(".lamp").hover(function(){
                $(this).addClass("fadeIn");

                if($(".fl1").hasClass("fadeIn")){
                    if($(".fl2").hasClass("fadeIn")){
                        if($(".fl3").hasClass("fadeIn")){
                            if($(".fl4").hasClass("fadeIn")){
                                if($(".fl5").hasClass("fadeIn")){
                                    window.setTimeout(function(){
                                    window.location.href = "http://www.pmrda.gov.in/";
                }, 2000);
    }
    }
    }
    }
    }

            });

        });
    </script>
   
</body>
</html>