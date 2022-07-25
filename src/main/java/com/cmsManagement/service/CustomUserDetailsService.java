package com.cmsManagement.service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.User;

/**
 * @author ujwala_gawari
 *
 */
//@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private UserService userService;
	
	@Transactional(readOnly=true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.err.println("username### :"+username);
		User user = userService.findByUsername(username);

		if(user==null){
				
			throw new UsernameNotFoundException("Username not found"); 
		}
			return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), 
				 user.getState().equals("A"), true, true, true, getGrantedAuthorities(user));
	
	}

	
	private List<GrantedAuthority> getGrantedAuthorities(User user){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		List<Permissions> list= userService.getListOfUserPermissions(user.getUser_id());

		 for(Object object : list) {
			 Permissions p=new Permissions();
	            Map row = (Map)object;
	            String type= (String) row.get("NAME");
	           //System.out.println("type "+type);
	           authorities.add(new SimpleGrantedAuthority(type));
	         }
		/*Roles roleTypes=userService.getRoleByRoleID(user.getRoleID().getRole_id());
		authorities.add(new SimpleGrantedAuthority(roleTypes.getRole_type()));*/

		return authorities;
	}
	
	
	/*private List<GrantedAuthority> getGrantedAuthorities(User user){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(Role userProfile : user.getUserProfiles()){
			System.out.println("UserProfile : "+userProfile);
			authorities.add(new SimpleGrantedAuthority("ROLE_"+userProfile.getRole_type()));
		}for(Rights UserRights : user.getUserRights()){
			System.out.println("UserRights : "+UserRights);
			authorities.add(new SimpleGrantedAuthority("RIGHT_"+UserRights.getRight_type()));
		}
		System.out.print("authorities :"+authorities);
		return authorities;
	}*/
	
}
