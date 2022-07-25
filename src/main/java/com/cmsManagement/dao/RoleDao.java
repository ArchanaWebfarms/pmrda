package com.cmsManagement.dao;
import java.util.List;

import com.cmsManagement.model.Roles;

/**
 * @author ujwala_gawari
 *
 */
public interface RoleDao {
	
	int saveRole(Roles role);
	
	public boolean updateRole(Roles role);
	
	List<Roles> findAllRole();
	
	Roles findRollById(int id);
	
	//boolean deleteRole(int roleId, int updatedBy, String updatedDate);

	Roles checkRole(String roleType);
	boolean deleteRole(int roleId);
}
