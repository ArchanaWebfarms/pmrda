function validateOldPassword(){
    var oldPassword=document.getElementById("oldPassword").value;
    if(oldPassword===""){
        document.getElementById("oldPasswordError").innerHTML="* Required";
        document.getElementById("oldPassword").focus();
       return false;
    }
    else{
        document.getElementById("oldPasswordError").innerHTML="";
        return true
    }
}

function validateNewPassword(){
    var value = document.getElementById("newPassword").value;
    if(value===""){
        document.getElementById("newPasswordError").innerHTML="* Required";
        document.getElementById("newPassword").focus();
       return false;
    }
    else{
        document.getElementById("newPasswordError").innerHTML="";
        return true
    }
}

function validateConPassword(){
    var value = document.getElementById("conPassword").value;
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

function validatePassword(){
	if(validateOldPassword() & validateNewPassword() & validateConPassword() ){		
		return true;
	}else{
		return false;
	}
}
