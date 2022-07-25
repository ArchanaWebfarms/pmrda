
function validateStatus(){
    var value = document.getElementById("status").value;
    if(value==="" || value==0){
        document.getElementById("statusError").innerHTML="* Required";
        document.getElementById("status").focus();
       return false;
    }
    else{
        document.getElementById("statusError").innerHTML="";
        return true
    }
}

function validateComment(){
    var value=document.getElementById("comment").value;
    if(value===""){
        document.getElementById("commentError").innerHTML="* Required";
        document.getElementById("comment").focus();
       return false;
    }
    else{
        document.getElementById("commentError").innerHTML="";
        return true
    }
}

function validateChangeStatus(){
	if(validateStatus() & validateComment()){		
			return true;
		}else{
			return false;
	}
}