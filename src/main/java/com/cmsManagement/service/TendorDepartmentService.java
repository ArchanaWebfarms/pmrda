package com.cmsManagement.service;
import java.util.List;

import com.cmsManagement.model.TendorsDepartment;

/**
 * @author ujwala_gawari
 *
 */
public interface TendorDepartmentService {

	/**
	 * returns the Tendors Department with a specific id.
	 * @param deptId
	 * @return
	 */
	TendorsDepartment getTendorsDepartmentById(int deptId);

	/**
	 * Deactivate TendorsDepartment with a specific id.
	 * @param deptId
	 */
	boolean deleteTenderDepartment(int deptId);

	/**
	 * Adds a new Tenders Department and return inserted ID
	 * @param tendorsDepartment
	 */
	int saveTenderDepartmentRegistration(TendorsDepartment tendorsDepartment);

	/**
	 * update TendorsDepartment and return boolean value 
	 * @param tendorsDepartment
	 */
	boolean updateTenderDepartmentRegistration(TendorsDepartment tendorsDepartment);

	/**
	 * returns list of all the TendorsDepartment available.
	 * @return
	 */
	List<TendorsDepartment> tendorDepartmentList();

	/**
	 * returns the TendorsDepartment if entered department Name at UI matches with existing departmentName.
	 * @param departmentName
	 * @return
	 */
	TendorsDepartment checkTenderDepartment(String departmentName);

}
