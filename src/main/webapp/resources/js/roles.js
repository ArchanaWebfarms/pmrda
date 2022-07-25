
function validateRole_type(){
    var value = document.getElementById("role_type").value;
    if(value==="" || value==0){
        
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

function validateRole(){
	if(validateRole_type() & validateDescription()){		
			return true;
		}else{
			return false;
	}
}