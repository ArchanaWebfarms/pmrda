package com.cmsManagement.util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.cmsManagement.dto.Rights;
import com.cmsManagement.model.RightsDto;
import com.cmsManagement.service.RightService;


@Component
public class RightsToUserRightsConverter implements Converter<Object, RightsDto>{

	@Autowired
	RightService rightService;
	
	@Override
	public RightsDto convert(Object element) {
		
		Integer id = Integer.parseInt((String)element);
		RightsDto profile= rightService.findRightsById(id);
		System.out.println("Profile : "+profile);
		return profile;
	}

}
