package com.cmsManagement.util;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;

public class UserGrantedAuthority{
	

	private List<GrantedAuthority> authorities;

	public List<GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}	
}
