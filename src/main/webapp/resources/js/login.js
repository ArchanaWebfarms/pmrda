function validateCaptcha(){
	var answer=document.getElementById("answer").value;
	var returnAnswer=document.getElementById("returnAnswer").value;
	if(answer){
			 $.ajax({
					url:"captchasubmit?answer="+answer,
					async: false,
					success:function(response){	
						$("#returnAnswer").val("");
						if(response=="success"){
							$("#returnAnswer").val(response);
						}
					},error:function(response){
						$("#returnAnswer").val("");
		   			}
				});
		return true;
	}			 
}