package com.cmsManagement.dto;

import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;



public class UserRightsRoles {
	
	private User userData;
	private Roles userRole;
	private Rights userRights;
	
	public User getUserData() {
		return userData;
	}
	public void setUserData(User userData) {
		this.userData = userData;
	}
	public Roles getUserRole() {
		return userRole;
	}
	public void setUserRole(Roles userRole) {
		this.userRole = userRole;
	}
	public Rights getUserRights() {
		return userRights;
	}
	public void setUserRights(Rights userRights) {
		this.userRights = userRights;
	}
	
	

}
