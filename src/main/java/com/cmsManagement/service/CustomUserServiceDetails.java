package com.cmsManagement.service;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.util.CaptchaVerifierFilter;

/**
 * @author ujwala_gawari
 *
 */
@Service("customUserDetailsService")	
public class CustomUserServiceDetails implements UserDetailsService {

	@Autowired
	private UserService userService;	

	@Transactional(readOnly=true)
	public CustomUserDetail loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {	
		System.err.println("username@@"+username);
		CustomUserDetail customUserDetail=new CustomUserDetail();	
				User users = userService.findByUsername(username);	       
				
				List<Permissions> list= userService.getListOfUserPermissions(users.getUser_id());

				List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				
				for(Object object : list) {
					Permissions p=new Permissions();
					Map row = (Map)object;
					String type= (String) row.get("NAME");					
					authorities.add(new SimpleGrantedAuthority(type));
				}
				authorities.add(new SimpleGrantedAuthority(users.getRoleID().getRole_category()));				
				customUserDetail.setUser(users);
				customUserDetail.setAuthorities(authorities);
			
		return customUserDetail;
	}




}

