function validate()
{
	if (document.forms["contactform"]["name"].value == "") {
        alert("Name must be filled out");
        document.getElementById("name").focus(); 
        return false;
    }
    
    if (document.forms["contactform"]["email"].value == "") {
        alert("Email must be filled out");
        document.getElementById("email").focus(); 
        return false;
    }
    
     if (document.forms["contactform"]["message"].value == "") {
        alert("Please provide your message");
        document.getElementById("message").focus(); 
        return false;
    }
    
     if (document.forms["contactform"]["captcha_code"].value == "") {
        alert("Please enter security code");
        document.getElementById("captcha_code").focus(); 
        return false;
    }
    
    return true;
    
    
}