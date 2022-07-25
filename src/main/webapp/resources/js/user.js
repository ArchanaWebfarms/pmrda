
function validateFirstName(){
    var value = document.getElementById("firstName").value;
    if(value===""){
        
       return false;
    }
    else{
        
        return true
    }
}

function validateLastName(){
    var value=document.getElementById("lastName").value;
    if(value===""){
      
       return false;
    }
    else{
        
        return true
    }
}

function validateUsername(){
    var value=document.getElementById("username").value;
    if(value===""){
      
       return false;
    }
    else{
       
        return true
    }
}

function validatePassword(){
    var value=document.getElementById("password").value;
    if(value===""){
       
       return false;
    }
    else{
       
        return true
    }
}

function validateConPassword(){
    var value=document.getElementById("conPassword").value;
    if(value===""){
        
       
        return false;
    }
    else{
      
        return true
    }
}


function validateEmail(){
	
    var value=document.getElementById("email").value;
    if(value===""){
        
       return false;
    }
    else{
       
        return true
    }
}

function validateAddress(){
    var value=document.getElementById("address").value;
    if(value===""){
        
       return false;
    }
    else{
       
        return true
    }
}

function validateMobileNumber(){
    var value=document.getElementById("mobileNumber").value;
    if(value===""){
       
       return false;
    }
    else{
       
        return true
    }
}

function validateContactNummber(){
    var value=document.getElementById("contactNummber").value;
    if(value==="" || value.length != 10){
     
       return false;
    }
    else{
        
        return true
    }
}

function validateRoleID(){
    var value=document.getElementById("roleID").value;
    if(value==="" ){
       
       return false;
    }
    else{
        document.getElementById("roleIDError").innerHTML="";
        return true
    }
}

function validatePasswordConPassword(){
    var password = document.getElementById("password").value;
	var conPassword = document.getElementById("conPassword").value;
	if(conPassword != password){
		alert("Password and Confirmed password does not matched");
		return false;
	}
    else{
        return true
    }
}

function validateUname(){
	var username=document.getElementById("username").value;
	 if(username){
		 $.ajax({
				url:"checkUsername?username="+username,
				success:function(response){	
					alert("u "+response.username);
					if(response.username != null){
						alert(response.username);
						$("#uname").val(response.username);
						return false;
					}else{
						return true;
					}
				}
			});
	  }
	  
}



function validateNewUser(){
	if(validateFirstName() & validateLastName() & validateUsername() & validatePassword() & validateConPassword() 
		& validateEmail()  & validateAddress()	& validateMobileNumber() & validateContactNummber() & validateRoleID()
		& validatePasswordConPassword()  ){		
		return true;
	}else{
		return false;
	}
}

function validateEditUser(){
	if(validateFirstName() & validateLastName() & validateUsername()  & validateEmail()  & validateAddress()
			& validateMobileNumber() & validateContactNummber() & validateRoleID()){		
			return true;
		}else{
			return false;
	}
}










