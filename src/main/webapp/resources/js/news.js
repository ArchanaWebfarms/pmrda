
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

function validateNewsPaper(){
    var value=document.getElementById("newspaper").value;
    if(value===""){
       
       return false;
    }
    else{
        
        return true
    }
}

function validateSubTitle(){
    var value=document.getElementById("subtitle").value;
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
       
        //document.getElementById("openingDate").focus();
       return false;
    }
    else{
        document.getElementById("openingDateError").innerHTML="";
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
	if(validateTitle() & validateSubTitle() &  validateNewsPaper() & validateDescription() & validateOpeningDate()  
		  & validateTags()	& validateFile()){		
		return true;
	}else{
		return false;
	}
}

function validateWithoutFile(){
		if(validateTitle() & validateSubTitle() &  validateNewsPaper() & validateDescription() & validateOpeningDate()  & validateTags()
			 ){			
			return true;
		}else{
			return false;
		}
}