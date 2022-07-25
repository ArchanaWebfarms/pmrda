
function validateDepartmentName(){
    var value = document.getElementById("departmentName").value;
    if(value==="" || value==0){
        document.getElementById("departmentNameError").innerHTML="* Required";
        document.getElementById("departmentName").focus();
       return false;
    }
    else{
        document.getElementById("departmentNameError").innerHTML="";
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

function validateDepartment(){
	if(validateDepartmentName() & validateDescription()){		
			return true;
		}else{
			return false;
	}
}