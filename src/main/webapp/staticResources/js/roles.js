
function validateRole_type(){
    var value = document.getElementById("role_type").value;
    if(value==="" || value==0){
        document.getElementById("role_typeError").innerHTML="* Required";
        document.getElementById("role_type").focus();
       return false;
    }
    else{
        document.getElementById("role_typeError").innerHTML="";
        return true
    }
}

function validateDescription(){
    var value=document.getElementById("description").value;
    if(value===""){
        document.getElementById("descriptionError").innerHTML="* Required";
        document.getElementById("description").focus();
       return false;
    }
    else{
        document.getElementById("descriptionError").innerHTML="";
        return true
    }
}

function validateRole(){
	if(validateRole_type() & validateDescription()){		
			return true;
		}else{
			return false;
	}
}