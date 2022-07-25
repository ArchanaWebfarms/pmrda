package com.cmsManagement.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.TendorDepartmentDao;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.util.MethodsHelper;

/**
 * @author ujwala_gawari
 *
 */
@Service
public class TendorDepartmentServiceImpl implements TendorDepartmentService {

	@Autowired
	TendorDepartmentDao tendorDepartmentDao;
	
	@Override
	public TendorsDepartment getTendorsDepartmentById(int deptId) {
		return tendorDepartmentDao.getTendorsDepartmentById(deptId);
	}

	@Override
	public boolean deleteTenderDepartment(int deptId) {

		TendorsDepartment tendorsDepartment=tendorDepartmentDao.getTendorsDepartmentById(deptId);

		tendorsDepartment.setState("D");
		tendorsDepartment.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		tendorsDepartment.setUpdated_date(MethodsHelper.getCurrentDate());
		return tendorDepartmentDao.updateTenderDepartment(tendorsDepartment);
	}

	@Override
	public int saveTenderDepartmentRegistration( TendorsDepartment tendorsDepartment) {
		tendorsDepartment.setState("A");
		tendorsDepartment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		tendorsDepartment.setCreated_date(MethodsHelper.getCurrentDate());
		return tendorDepartmentDao.saveTenderDepartmentRegistration(tendorsDepartment);
	}

	@Override
	public boolean updateTenderDepartmentRegistration( TendorsDepartment tendorsDepartment) {
		TendorsDepartment tendorsDepartments=tendorDepartmentDao.getTendorsDepartmentById(tendorsDepartment.getDept_id());
		tendorsDepartments.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		tendorsDepartments.setUpdated_date(MethodsHelper.getCurrentDate());
		tendorsDepartments.setDepartmentName(tendorsDepartment.getDepartmentName());
		tendorsDepartments.setDepartmentType(tendorsDepartment.getDepartmentType());
		tendorsDepartments.setDept_name_h(tendorsDepartment.getDept_name_h());
		return tendorDepartmentDao.updateTenderDepartment(tendorsDepartments);
	}

	@Override
	public List<TendorsDepartment> tendorDepartmentList() {
		return tendorDepartmentDao.tendorDepartmentList();
	}

	@Override
	public TendorsDepartment checkTenderDepartment(String departmentName) {
		return tendorDepartmentDao.checkTenderDepartment(departmentName);
	}

}
