package com.cmsManagement.util;

import java.util.Map;

public class ValidationResponse {

	
	 private String status = null;       
     private Map<String, String> errorMessages;
     private int id=0;
     private String type=null;
     private int roleId=0;
     private String value=null;
   
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Map<String, String> getErrorMessages() {
		return errorMessages;
	}
	public void setErrorMessages(Map<String, String> errorMessages) {
		this.errorMessages = errorMessages;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	   
}
