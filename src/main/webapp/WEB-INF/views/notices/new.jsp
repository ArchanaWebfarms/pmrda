<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">  
  
<head>  
    <title>Localization JQuery UI Datepicker </title>  
    <meta charset="utf-8">  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>  
    <link href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />  
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/i18n/jquery-ui-i18n.min.js"></script>  
    <script type="text/javascript">  
        $(document).ready(function() {  
  
            var userLang = navigator.language || navigator.userLanguage;  
  
            var options = $.extend(      
            	    {},  // empty object      
            	    $.datepicker.regional["hi"],  // Dynamically      
            	    { dateFormat: "mm/dd/yy"} // your custom options      
            	); 
  
            $("#calendar").datepicker(options);  
        });  
    </script>  
</head>  
  
<body>  
    <div class="container">  
        <h3>JQuery UI Datepicker Localization</h3>  
        <div id="calendar"> </div>  
    </div>  
</body>  
  
</html> 