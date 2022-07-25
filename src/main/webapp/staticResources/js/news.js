
function validateTitle(){
    var value = document.getElementById("title").value;
    if(value===""){
        document.getElementById("titleError").innerHTML="*";
        document.getElementById("title").focus();
       return false;
    }
    else{
        document.getElementById("titleError").innerHTML="";
        return true
    }
}

function validateSubTitle(){
    var value=document.getElementById("subtitle").value;
    if(value===""){
        document.getElementById("subtitleError").innerHTML="*";
        document.getElementById("subtitle").focus();
       return false;
    }
    else{
        document.getElementById("subtitleError").innerHTML="";
        return true
    }
}

function validateDescription(){
    var value=document.getElementById("description").value;
    if(value===""){
        document.getElementById("descriptionError").innerHTML="*";
        document.getElementById("description").focus();
       return false;
    }
    else{
        document.getElementById("descriptionError").innerHTML="";
        return true
    }
}



function validatePublish_date(){
    var value=document.getElementById("date-fld1").value;
    if(value===""){
        document.getElementById("publishdateError").innerHTML="*";
        //document.getElementById("publish_date").focus();
       return false;
    }
    else{
        document.getElementById("publishdateError").innerHTML="";
        return true
    }
}

function validateTags(){
    var value=document.getElementById("tag").value;
    if(value===""){
        document.getElementById("tagsError").innerHTML="*";
        document.getElementById("tag").focus();
       return false;
    }
    else{
        document.getElementById("tagsError").innerHTML="";
        return true
    }
}



function validateFile(){
    var value=document.getElementById("File").value;
    if(value===""){
        document.getElementById("fileError").innerHTML="*";
        document.getElementById("File").focus();
       return false;
    }
    else{
        document.getElementById("fileError").innerHTML="";
        return true
    }
}
function validateNewsPaper(){
    var value=document.getElementById("newspaper").value;
    if(value===""){
        document.getElementById("paperError").innerHTML="*";
        document.getElementById("newspaper").focus();
       return false;
    }
    else{
        document.getElementById("paperError").innerHTML="";
        return true
    }
}


function validateWithFile(){
	if(validateTitle() & validateSubTitle() & validateDescription() 
			& validatePublish_date()  & validateTags()	& validateFile() ){		
		return true;
	}else{
		return false;
	}
}

function validateWithoutFile(){
		if(validateTitle() & validateSubTitle() & validateDescription()  
			& validatePublish_date()  & validateTags()	){			
			return true;
		}else{
			return false;
		}
}