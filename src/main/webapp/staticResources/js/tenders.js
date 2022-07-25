
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

function validateSubTitle(){
    var value=document.getElementById("subTitle").value;
    if(value===""){
        document.getElementById("subTitleError").innerHTML="* Required";
        document.getElementById("subTitle").focus();
       return false;
    }
    else{
        document.getElementById("subTitleError").innerHTML="";
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

function validateOpeningDate(){
    var value=document.getElementById("inputOpeningDate").value;
    if(value===""){
        document.getElementById("openingDateError").innerHTML="* Required";
        //document.getElementById("openingDate").focus();
       return false;
    }
    else{
        document.getElementById("openingDateError").innerHTML="";
        return true
    }
}

function validateClosingDate(){
    var value=document.getElementById("inputClosingDate").value;
    if(value===""){
        document.getElementById("closingDateError").innerHTML="* Required";
        //document.getElementById("closingDate").focus();
        return false;
    }
    else{
        document.getElementById("closingDateError").innerHTML="";
        return true
    }
}

function validatePublish_date(){
    var value=document.getElementById("inputPublish_date").value;
    if(value===""){
        document.getElementById("publish_dateError").innerHTML="* Required";
        //document.getElementById("publish_date").focus();
       return false;
    }
    else{
        document.getElementById("publish_dateError").innerHTML="";
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
	if(validateTitle() & validateSubTitle() & validateDescription() & validateOpeningDate() & validateClosingDate() 
		& validatePublish_date()  & validateTags()	& validateDepartment() & validateFile() & validateHindiTitle()){		
		return true;
	}else{
		return false;
	}
}

function validateWithoutFile(){
		if(validateTitle() & validateSubTitle() & validateDescription() & validateOpeningDate() & validateClosingDate() 
			& validatePublish_date() & validateDepartment()  & validateHindiTitle()){			
			return true;
		}else{
			return false;
		}
}