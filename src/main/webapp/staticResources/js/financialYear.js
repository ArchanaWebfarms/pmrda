function validateDescription(){
	var value=document.getElementById("description").value;
	if(value===""){
		document.getElementById("descriptionError").innerHTML="*";
        document.getElementById("description").focus();
        return false;
    }else{
   	 document.getElementById("descriptionError").innerHTML="";
     return true;       
    }
}


function validateFYear(){
	var value=document.getElementById("fYear").value;
	if(value==="" ){
		document.getElementById("financialYearError").innerHTML="*";
        document.getElementById("fYear").focus();
        return false;
    }else if(!/^\d{4}-\d{4}$/.test(value)){
    	document.getElementById("financialYearError").innerHTML="* Financial Year must be in yyyy-yyyy format ";
        document.getElementById("fYear").focus();
        return false;
    }else{
    	var res = value.split("-");
		if(res[0] != res[1]-1){
			document.getElementById("financialYearError").innerHTML="* Financial Year must be in Proper format ";
	        document.getElementById("fYear").focus();
	        return false;
		}else{
    	 document.getElementById("financialYearError").innerHTML="";
         return true;
		}
    }
}

function validateFinancialYear(){
	if(validateDescription() & validateFYear()){			
		return true;
	}else{
		return false;
	}
}