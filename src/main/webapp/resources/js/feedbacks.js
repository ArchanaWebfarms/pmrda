function validateTitle(){
	var value=document.getElementById("title").value;
	if(value===""){
		document.getElementById("titleError").innerHTML="Title should not be empty";
        document.getElementById("title").focus();
        return false;
    }else{
   	 document.getElementById("titleError").innerHTML="";
     return true;       
    }
}

function validatePhone(){
	var value=document.getElementById("phone").value;
	if(value===""){
		document.getElementById("phoneError").innerHTML="Mobile No must be 10 digit and not emty";
        document.getElementById("phone").focus();
        return false;
    }else{
   	 document.getElementById("phoneError").innerHTML="";
     return true;       
    }
}

function validateName(){
	var value=document.getElementById("name").value;
	if(value===""){
		document.getElementById("nameError").innerHTML="Name should not be empty";
        document.getElementById("name").focus();
        return false;
    }else{
   	 document.getElementById("nameError").innerHTML="";
     return true;       
    }
}

function validateEmail(){
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    var value=document.getElementById("email").value;
    if(reg.test(value)==false){
        document.getElementById("emailError").innerHTML="Email should not be empty";
        document.getElementById("email").focus();
       return false;
    }
    else{
        document.getElementById("emailError").innerHTML="";
        return true
    }
}

function validateSubject(){
	var value=document.getElementById("subject").value;
	if(value===""){
		document.getElementById("subjectError").innerHTML="Subject should not be empty.";
        document.getElementById("subject").focus();
        return false;
    }else{
   	 document.getElementById("subjectError").innerHTML="";
     return true;       
    }
}

function validateDescription(){
	var value=document.getElementById("description").value;
	if(value===""){
		document.getElementById("descriptionError").innerHTML="Description should not be empty.";
        document.getElementById("description").focus();
        return false;
    }else{
   	 document.getElementById("descriptionError").innerHTML="";
     return true;       
    }
}




function validateFeedback(){
	if(validateTitle() & validatePhone() & validateName() & validateEmail() & validateSubject() & validateDescription()){			
		return true;
	}else{
		return false;
	}
}