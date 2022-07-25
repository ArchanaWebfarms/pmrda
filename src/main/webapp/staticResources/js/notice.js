title_h
function validateTitle(){
    var value = document.getElementById("title").value;
    if(value===""){
        document.getElementById("titleError").innerHTML="* Required";
        document.getElementById("title").focus();
       return false;
    }
    else{
        document.getElementById("titleError").innerHTML="";
        return true
    }
}
function validateHindiTitle(){
    var value = document.getElementById("title_h").value;
    if(value===""){
        document.getElementById("title_hError").innerHTML="* Required";
        document.getElementById("title_h").focus();
       return false;
    }
    else{
        document.getElementById("title_hError").innerHTML="";
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

function validateDate(){
    var value=document.getElementById("inputDate").value;
    if(value===""){
        document.getElementById("dateError").innerHTML="* Required";
       // document.getElementById("inputDate").focus();
       return false;
    }
    else{
        document.getElementById("dateError").innerHTML="";
        return true
    }
}

function validateTags(){
    var value=document.getElementById("tags").value;
    if(value===""){
        document.getElementById("tagsError").innerHTML="* Required";
        document.getElementById("tags").focus();
       return false;
    }
    else{
        document.getElementById("tagsError").innerHTML="";
        return true
    }
}

function validateDepartment(){
    var value=document.getElementById("department").value;
    if(value==="" || value == 0){
        document.getElementById("departmentError").innerHTML="* Required";
        document.getElementById("department").focus();
       return false;
    }
    else{
        document.getElementById("departmentError").innerHTML="";
        return true
    }
}

function validateFile(){
    var value=document.getElementById("file").value;
    if(value===""){
        document.getElementById("fileError").innerHTML="* Required";
        document.getElementById("file").focus();
       return false;
    }
    else{
        document.getElementById("fileError").innerHTML="";
        return true
    }
}


function validateWithFile(){
	if(validateTitle() & validateDescription() & validateDate() & 
			validateTags()	& validateDepartment() & validateFile() & validateHindiTitle()){		
		return true;
	}else{
		return false;
	}
}

function validateWithoutFile(){
		if(validateTitle() & validateDescription() & validateDate() & 
				 validateDepartment() & validateHindiTitle()){	
			return true;
		}else{
			return false;
		}
}
