
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

function validateDescription(){
    var value=document.getElementById("description").value;
    if(value===""){
       
       return false;
    }
    else{
       
        return true
    }
}

function validateDate(){
    var value=document.getElementById("inputDate").value;
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
    if(value==="" ){
        
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
