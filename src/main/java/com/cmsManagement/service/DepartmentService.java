package com.cmsManagement.service;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.DemoDepatment;
import com.cmsManagement.model.DepartmantOffice;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.DepartmentOfficeContact;
import com.cmsManagement.model.Taluka;
import com.cmsManagement.model.WorkStatus;

/**
 * @author ujwala_gawari
 *
 */
public interface DepartmentService {

	/**
	 * returns list of all the Complaint available.
	 * @return
	 */
	List<Department> getDepartment();

	/**
	 * Deactivate complaint
	 * @param deptId
	 */
	boolean deleteDepartment(int deptId);

	/**
	 * returns the Department with a specific id.
	 * @param deptId
	 * @return
	 */
	Department getDepartmentById(int deptId);

	/**
	 * Adds a new Department and return inserted ID
	 * @param department
	 * @param marathi 
	 * @param english 
	 * @param path 
	 */
	int saveDepartmentRegistration(Department department, String path, MultipartFile english, MultipartFile marathi);

	/**
	 * update Department 
	 * @param department
	 * @param marathi 
	 * @param english 
	 * @param path 
	 */
	boolean updateDepartmentRegistration(Department department, String path, MultipartFile english, MultipartFile marathi);

	/**
	 * Returns an Department with entered department name at UI.
	 *
	 * @param departmentName
	 * @return
	 */
	Department checkDepartment(String departmentName);

	List<Taluka> getAllVillages();

	void saveTaluka(Taluka taluka, String path, MultipartFile english, MultipartFile marathi);

	Taluka getTalukaById(int id);

	void updateTaluka(Taluka taluka, String path, MultipartFile english,
			MultipartFile marathi);

	void deleteTaluka(int id);

	List<Taluka> getAllVillageList();

	List<Department> getActiveDepartment();

	List<DepartmantOffice> getActiveOffice();

	void saveDepartmentContact(DepartmentOfficeContact contact);

	List<DepartmentOfficeContact> getOfficeContactList(int deptId);

	List<Department> getAllDepartment();

	void changeAdminStatus(int id, String status, String comment);

	List<Department> getDepartmentByDeletionStatus(String status);

	void changeAdminDeletionStatus(int id, String status, String comment);

	void deleteAdminDepartment(int id);

	List<Department> getDepartmentByCreationStatus(String string);

	void deleteDepartmentOfficeContact(int id);

	DepartmentOfficeContact getDepartmentOfficeContactById(int id);

	void updateDeptOfficeContact(DepartmentOfficeContact contact);

	void saveDemoDepartment(DemoDepatment departments);

	List<DemoDepatment> getDemoDepartment();

	DemoDepatment getDepartment(int deptId);

	void saveWorkStatus(WorkStatus work);

	List<WorkStatus> getWorkList();

	WorkStatus getLastRecord();

}
