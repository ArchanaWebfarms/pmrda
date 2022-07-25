package com.cmsManagement.service;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.model.User;



/**
 * @author ujwala_gawari
 *
 */
public class CustomUserDetail implements UserDetails {

	
	 private static final long serialVersionUID = 1L;
	    private User user;
	    FinancialYearDao f;
	    
	    public FinancialYearDao getF() {
			return f;
		}

		public void setF(FinancialYearDao f) {
			this.f = f;
		}

		transient List<GrantedAuthority> authorities=null;

	    public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }

	    public Collection<? extends GrantedAuthority> getAuthorities() {
	        return authorities;
	    }

	    public void setAuthorities(List<GrantedAuthority> authorities)
	    {
	        this.authorities=authorities;
	    }

	    public String getPassword() {
	        return user.getPassword();
	    }

	    public String getUsername() {
	    	return user.getUsername();
	    }

	    public boolean isAccountNonExpired() {
	        return user.isAccountNonExpired();
	    }

	    public boolean isAccountNonLocked() {
	        return user.isAccountNonLocked();
	    }

	    public boolean isCredentialsNonExpired() {
	        return user.isCredentialsNonExpired();
	    }

	    public boolean isEnabled() {
	        return user.isEnabled();
	    }

		@Override
		public String toString() {
			return "CustomUserDetail [user=" + user + ", f=" + f
					+ ", authorities=" + authorities + ", getF()=" + getF()
					+ ", getUser()=" + getUser() + ", getAuthorities()="
					+ getAuthorities() + ", getPassword()=" + getPassword()
					+ ", getUsername()=" + getUsername()
					+ ", isAccountNonExpired()=" + isAccountNonExpired()
					+ ", isAccountNonLocked()=" + isAccountNonLocked()
					+ ", isCredentialsNonExpired()="
					+ isCredentialsNonExpired() + ", isEnabled()="
					+ isEnabled() + ", getClass()=" + getClass()
					+ ", hashCode()=" + hashCode() + ", toString()="
					+ super.toString() + "]";
		}

		
	    
	    

	}
	

	