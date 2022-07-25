
function validateTitle(){
    var value = document.getElementById("title").value;
    if(value===""){
       
       return false;
    }
    else{
        
        return true
    }
}
function validateHindiTitle(){
    var value = document.getElementById("title_h").value;
    if(value===""){
        
       return false;
    }
    else{
        
        return true
    }
}

function validateSubTitle(){
    var value=document.getElementById("subTitle").value;
    if(value===""){
       
       return false;
    }
    else{
        
        return true
    }
}

function validateDescription(){
    var value=document.getElementById("description").value;
    if(value===""){
       
       return false;
    }
    else{
       
        return true
    }
}

function validateOpeningDate(){
    var value=document.getElementById("inputOpeningDate").value;
    if(value===""){
       
       return false;
    }
    else{
       
        return true
    }
}

function validateClosingDate(){
    var value=document.getElementById("inputClosingDate").value;
    if(value===""){
       
        return false;
    }
    else{
        
        return true
    }
}

function validatePublish_date(){
    var value=document.getElementById("inputPublish_date").value;
    if(value===""){
       
       return false;
    }
    else{
        
        return true
    }
}

function validateTags(){
    var value=document.getElementById("tags").value;
    if(value===""){
       
       return false;
    }
    else{
      
        return true
    }
}

function validateDepartment(){
    var value=document.getElementById("department").value;
    if(value==="" || value == 0){
       
       return false;
    }
    else{
        
        return true
    }
}

function validateFile(){
    var value=document.getElementById("file").value;
    if(value===""){
      
       return false;
    }
    else{
       
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