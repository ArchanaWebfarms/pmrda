package com.cmsManagement.dto;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class PasswordValidation {

	//@NotEmpty(message="**Required")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}",message="Invalid Password")
	private String newPass;
	
	@NotEmpty(message="**Required")
	private String confPass;

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public String getConfPass() {
		return confPass;
	}

	public void setConfPass(String confPass) {
		this.confPass = confPass;
	}
	
	
}
