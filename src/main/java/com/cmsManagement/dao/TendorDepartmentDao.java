package com.cmsManagement.dao;
import java.util.List;

import com.cmsManagement.model.TendorsDepartment;

/**
 * @author ujwala_gawari
 *
 */
public interface TendorDepartmentDao {

	TendorsDepartment getTendorsDepartmentById(int deptId);

	boolean updateTenderDepartment(TendorsDepartment tendorsDepartment);

	int saveTenderDepartmentRegistration(TendorsDepartment tendorsDepartment);

	List<TendorsDepartment> tendorDepartmentList();

	TendorsDepartment checkTenderDepartment(String departmentName);

}
