
function validateFirstName(){
    var value = document.getElementById("firstName").value;
    if(value===""){
        document.getElementById("firstNameError").innerHTML="* Required";
        document.getElementById("firstName").focus();
       return false;
    }
    else{
        document.getElementById("firstNameError").innerHTML="";
        return true
    }
}

function validateLastName(){
    var value=document.getElementById("lastName").value;
    if(value===""){
        document.getElementById("lastNameError").innerHTML="* Required";
        document.getElementById("lastName").focus();
       return false;
    }
    else{
        document.getElementById("lastNameError").innerHTML="";
        return true
    }
}

function validateUsername(){
    var value=document.getElementById("username").value;
    if(value===""){
        document.getElementById("usernameError").innerHTML="* Required";
        document.getElementById("username").focus();
       return false;
    }
    else{
        document.getElementById("usernameError").innerHTML="";
        return true
    }
}

function validatePassword(){
    var value=document.getElementById("password").value;
    if(value===""){
        document.getElementById("passwordError").innerHTML="* Required";
        document.getElementById("password").focus();
       return false;
    }
    else{
        document.getElementById("passwordError").innerHTML="";
        return true
    }
}

function validateConPassword(){
    var value=document.getElementById("conPassword").value;
    if(value===""){
        document.getElementById("conPasswordError").innerHTML="* Required";
        document.getElementById("conPassword").focus();
        return false;
    }
    else{
        document.getElementById("conPasswordError").innerHTML="";
        return true
    }
}


function validateEmail(){
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    var value=document.getElementById("email").value;
    if(reg.test(value)==false){
        document.getElementById("emailError").innerHTML="* Required";
        document.getElementById("email").focus();
       return false;
    }
    else{
        document.getElementById("emailError").innerHTML="";
        return true
    }
}

function validateAddress(){
    var value=document.getElementById("address").value;
    if(value===""){
        document.getElementById("addressError").innerHTML="* Required";
        document.getElementById("address").focus();
       return false;
    }
    else{
        document.getElementById("addressError").innerHTML="";
        return true
    }
}

function validateMobileNumber(){
    var value=document.getElementById("mobileNumber").value;
    if(value==="" || value.length != 10){
        document.getElementById("mobileNumberError").innerHTML="* Required";
        document.getElementById("mobileNumber").focus();
       return false;
    }
    else{
        document.getElementById("mobileNumberError").innerHTML="";
        return true
    }
}

function validateContactNummber(){
    var value=document.getElementById("contactNummber").value;
    if(value==="" || value.length != 10){
        document.getElementById("contactNummberError").innerHTML="* Required";
        document.getElementById("contactNummber").focus();
       return false;
    }
    else{
        document.getElementById("contactNummberError").innerHTML="";
        return true
    }
}

function validateRoleID(){
    var value=document.getElementById("roleID").value;
    if(value==="" || value==0){
        document.getElementById("roleIDError").innerHTML="* Required";
        document.getElementById("roleID").focus();
       return false;
    }
    else{
        document.getElementById("roleIDError").innerHTML="";
        return true
    }
}

function validatePasswordConPassword(){
    var password = document.getElementById("password").value;
	var conPassword = document.getElementById("conPassword").value;
	if(conPassword != password){
		alert("Password and Confirmed password does not matched");
		return false;
	}
    else{
        return true
    }
}

function validateUname(){
    var value=document.getElementById("username").value;
    var username=$("#username").val();
	  $.ajax({
			url:"checkUsername?username="+username,
			success:function(response){	
				alert("u "+response.username);
				if(response.username != null){
					alert(response.username);
					$("#uname").val(response.username);
				}
			},
			error:function(){
	        	alert("Error");
	        }
		});
	  
	     if($("#uname").val()==""){
			 alert("empty "+$("#uname").val());
			 return true;
		 }else{
			 alert("full "+$("#uname").val());
			 return false;
		 }
}








function validateNewUser(){
	if(validateFirstName() & validateLastName() & validateUsername() & validatePassword() & validateConPassword() 
		& validateEmail()  & validateAddress()	& validateMobileNumber() & validateContactNummber() & validateRoleID()
		& validatePasswordConPassword() ){		
		return true;
	}else{
		return false;
	}
}

function validateEditUser(){
	if(validateFirstName() & validateLastName() & validateUsername()  & validateEmail()  & validateAddress()
			& validateMobileNumber() & validateContactNummber() & validateRoleID()){		
			return true;
		}else{
			return false;
	}
}