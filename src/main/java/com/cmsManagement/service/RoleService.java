package com.cmsManagement.service;
import java.util.List;

import com.cmsManagement.model.Roles;

/**
 * @author ujwala_gawari
 *
 */
public interface RoleService {

	/**
	 * Adds a new Roles and return inserted ID
	 * @param role
	 */
	int saveRole(Roles role);
	
	/**
	 * update Roles and return boolean value 
	 * @param role
	 */
	boolean updateRole(Roles role);
	
	/**
	 * returns list of all the Roles available.
	 * @return
	 */
	List<Roles> findAllRole();
	
	/**
	 * returns the Roles with a specific id.
	 * @param id
	 * @return
	 */
	Roles findRollById(int id);
	
	/**
	 * Deactivate Roles with a specific id.
	 * @param roleId
	 */
	boolean deleteRole(int roleId);

	/**
	 * returns the FinancialYear if entered role at UI matches with existing role name.
	 * @param roleType
	 * @return
	 */
	Roles checkRole(String roleType);
}
