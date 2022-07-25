package com.cmsManagement.service;
import java.util.List;

import com.cmsManagement.dto.Rights;
import com.cmsManagement.model.RightsDto;


public interface RightService {
	
	void saveRights(Rights rights);
	
	Rights updateRights(Rights rights);
	
	List<Rights> findAllRights();

	RightsDto findRightsById(int id);
	
	void deleteRight(int rightId);
}
