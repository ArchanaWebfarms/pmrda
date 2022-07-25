package com.cmsManagement.util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.cmsManagement.model.Roles;
import com.cmsManagement.service.RoleService;


@Component
public class RoleToUserProfileConverter implements Converter<Object, Roles>{

	@Autowired
	RoleService roleService;

	/*
	 * Gets UserProfile by Id
	 * @see org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
	 */
	public Roles convert(Object element) {
		Integer id = Integer.parseInt((String)element);
		Roles profile= roleService.findRollById(id);
		System.out.println("Convert : "+profile);
		return profile;
	}
	
	/*
	 * Gets UserProfile by type
	 * @see org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
	 */
	/*
	public UserProfile convert(Object element) {
		String type = (String)element;
		UserProfile profile= userProfileService.findByType(type);
		System.out.println("Profile ... : "+profile);
		return profile;
	}
	*/

}