
function validateDepartmentName(){
    var value = document.getElementById("departmentName").value;
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

function validateDepartment(){
	if(validateDepartmentName() & validateDescription()){		
			return true;
		}else{
			return false;
	}
}