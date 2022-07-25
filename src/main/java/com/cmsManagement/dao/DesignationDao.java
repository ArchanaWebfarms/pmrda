package com.cmsManagement.dao;

import java.util.List;



import com.cmsManagement.model.Designation;
import com.cmsManagement.model.Notices;


public interface DesignationDao {
	
	int saveDesignation(Designation designation);
	List<Designation> getDesignationList();
	boolean updateDesignation(Designation designation);
	Designation findDesignationById(int designationId);
	void deleteDesignationById(int id);
}
