package com.cmsManagement.dao;
import java.util.List;

import com.cmsManagement.model.DemoDepatment;
import com.cmsManagement.model.DepartmantOffice;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.DepartmentOfficeContact;
import com.cmsManagement.model.Taluka;
import com.cmsManagement.model.WorkStatus;


public interface DepartmentDao {

	List<Department> getDepartment();

	boolean updateDepartment(Department department);

	Department getDepartmentById(int deptId);

	int saveDepartmentRegistration(Department department);

	Department checkDepartment(String departmentName);

	List<Taluka> getAllVillages();

	void saveTaluka(Taluka taluka);

	Taluka getTalukaById(int id);

	void updateTaluka(Taluka info);

	void deleteTaluka(int id);

	List<Taluka> getAllVillageList();

	List<Department> getActiveDepartment();

	List<DepartmantOffice> getActiveOffice();

	void saveDepartmentContact(DepartmentOfficeContact contact);

	List<DepartmentOfficeContact> getOfficeContactList(int deptId);

	List<Department> getAllDepartment();

	List<Department> getDepartmentByDeletionStatus(String status);

	List<Department> getDepartmentByCreationStatus(String status);

	DepartmentOfficeContact getDeptOfficeContactById(int id);

	void updateDepartmentOfficeContact(DepartmentOfficeContact officeContact);

	void deleteDepartmentOfficeContact(int id);

	void saveDemoDepartment(DemoDepatment departments);

	List<DemoDepatment> getDemoDepartment();

	DemoDepatment getDemoDepartment(int deptId);

	void saveWorkStatus(WorkStatus work);

	List<WorkStatus> getWorkList();

	WorkStatus getLastRecord();

}
