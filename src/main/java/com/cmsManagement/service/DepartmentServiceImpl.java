package com.cmsManagement.service;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.DepartmentDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.DemoDepatment;
import com.cmsManagement.model.DepartmantOffice;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.DepartmentOfficeContact;
import com.cmsManagement.model.Taluka;
import com.cmsManagement.model.User;
import com.cmsManagement.model.WorkStatus;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.NumbersEnglishToMarathi;
import com.cmsManagement.util.ValidateInput;



@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	DepartmentDao departmentDao;
	
	@Autowired
	private UserService userService;

	@Override
	public List<Department> getDepartment() {
		return departmentDao.getDepartment();
	}

	@Override
	public boolean deleteDepartment(int deptId) {
		Department department=departmentDao.getDepartmentById(deptId);
		department.setState("D");
		department.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		department.setUpdated_date(MethodsHelper.getCurrentDate());
		return departmentDao.updateDepartment(department);
	}

	@Override
	public Department getDepartmentById(int deptId) {
		return departmentDao.getDepartmentById(deptId);
	}

	@Override
	public int saveDepartmentRegistration(Department department,String path,MultipartFile english,MultipartFile marathi) {
		User user=userService.findUserById(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		department.setState("A");
		department.setUser(user);
		//department.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		department.setCreated_date(MethodsHelper.getCurrentDate());
		department.setCreate_approval_status("Pending");
		department.setDelete_approval_status("Active");

		List<Attachment> attachlist=new ArrayList<Attachment>();

		try {
			if(!english.isEmpty()){
				Attachment attachment = new Attachment();
				String filename=english.getOriginalFilename();
				String fullpath= path+filename;				
				english.transferTo(new File(fullpath));			
				attachment.setPath(fullpath);
				attachment.setAttachmnt_name(filename);
				attachment.setModule_type("English Attachment");
				attachment.setCategory("DEPARTMENT");
				attachment.setExtension(FilenameUtils.getExtension(filename));
				attachment.setState("A");			
				attachment.setDepartment(department);
				attachlist.add(attachment);
				department.setAttachment(attachlist);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		try {
			if(!marathi.isEmpty()){
				Attachment hattachment = new Attachment();
				String filename=marathi.getOriginalFilename();
				String fullpath= path+filename;				
				marathi.transferTo(new File(fullpath));			
				hattachment.setPath(fullpath);
				hattachment.setAttachmnt_name(filename);
				hattachment.setModule_type("Marathi Attachment");
				hattachment.setCategory("DEPARTMENT");
				hattachment.setExtension(FilenameUtils.getExtension(filename));			
				hattachment.setDepartment(department); 	
				hattachment.setState("A");		   	
				attachlist.add(hattachment);
				department.setAttachment(attachlist);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		return departmentDao.saveDepartmentRegistration(department);
	}

	@Override
	public boolean updateDepartmentRegistration(Department department,String path,MultipartFile english,MultipartFile marathi) {
		Department info=departmentDao.getDepartmentById(department.getDeptId());
		department.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		department.setUpdated_date(MethodsHelper.getCurrentDate());
		//department.setCreated_by(info.getCreate_approved_by());
		department.setUser(info.getUser());
		department.setCreated_date(info.getCreated_date());
		department.setDelete_approval_status(info.getDelete_approval_status());
		department.setCreate_approval_comment(info.getCreate_approval_comment());
		department.setCreate_approval_date(info.getCreate_approval_date());
		department.setCreate_approved_by(info.getCreate_approved_by());
		department.setCreate_approval_status("Pending");
		department.setState("A");
		department.setAttachment(info.getAttachment());
		department.setOfficeContact(info.getOfficeContact());

		List<Attachment> attachlist=new ArrayList<Attachment>();

		try {
			if(!english.isEmpty()){
				Attachment attachment = new Attachment();
				String filename=english.getOriginalFilename();
				String fullpath= path+filename;				
				english.transferTo(new File(fullpath));			
				attachment.setPath(fullpath);
				attachment.setAttachmnt_name(filename);
				attachment.setModule_type("English Attachment");
				attachment.setCategory("DEPARTMENT");
				attachment.setExtension(FilenameUtils.getExtension(filename));
				attachment.setState("A");			
				attachment.setDepartment(department);
				attachlist.add(attachment);
				department.setAttachment(attachlist);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		try {
			if(!marathi.isEmpty()){
				Attachment hattachment = new Attachment();
				String filename=marathi.getOriginalFilename();
				String fullpath= path+filename;				
				marathi.transferTo(new File(fullpath));			
				hattachment.setPath(fullpath);
				hattachment.setAttachmnt_name(filename);
				hattachment.setModule_type("Marathi Attachment");
				hattachment.setCategory("DEPARTMENT");
				hattachment.setExtension(FilenameUtils.getExtension(filename));			
				hattachment.setDepartment(department); 	
				hattachment.setState("A");		   	
				attachlist.add(hattachment);
				department.setAttachment(attachlist);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}



		return departmentDao.updateDepartment(department);
	}

	@Override
	public Department checkDepartment(String departmentName) {
		return departmentDao.checkDepartment(departmentName);
	}

	@Override
	public List<Taluka> getAllVillages() {
		return departmentDao.getAllVillages();
	}

	@Override
	public void saveTaluka(Taluka taluka,String path,MultipartFile english,MultipartFile marathi) {	
		Set<Attachment> attchmentset = new HashSet<Attachment>();

		try {
			Attachment attachment = new Attachment();
			String filename=english.getOriginalFilename();
			String fullpath= path+filename;				
			english.transferTo(new File(fullpath));			
			attachment.setPath(fullpath);
			attachment.setAttachmnt_name(filename);
			attachment.setModule_type("English Attachment");
			attachment.setCategory("TALUKA");
			attachment.setExtension(FilenameUtils.getExtension(filename));
			attachment.setTaluka(taluka);
			attachment.setState("A");		   	
			attchmentset.add(attachment);
			taluka.setAttachment(attchmentset);
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		try {
			Attachment hattachment = new Attachment();
			String filename=marathi.getOriginalFilename();
			String fullpath= path+filename;				
			marathi.transferTo(new File(fullpath));			
			hattachment.setPath(fullpath);
			hattachment.setAttachmnt_name(filename);
			hattachment.setModule_type("Marathi Attachment");
			hattachment.setCategory("TALUKA");
			hattachment.setExtension(FilenameUtils.getExtension(filename));
			hattachment.setTaluka(taluka);
			hattachment.setState("A");		   	
			attchmentset.add(hattachment);
			taluka.setAttachment(attchmentset);
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		taluka.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		taluka.setCreated_on(MethodsHelper.getCurrentDate());
		taluka.setStatus("A");
		taluka.setTotal_villages_h(NumbersEnglishToMarathi.convertInMarathi(String.valueOf(taluka.getTotal_villages())));
		departmentDao.saveTaluka(taluka);
	}

	@Override
	public Taluka getTalukaById(int id) {		
		return departmentDao.getTalukaById(id);
	}

	@Override
	public void updateTaluka(Taluka taluka, String path, MultipartFile english,	MultipartFile marathi) {
		Taluka info=departmentDao.getTalukaById(taluka.getId());

		Set<Attachment> attchmentset = new HashSet<Attachment>();    	
		try {			
			if(!english.isEmpty()){
				Attachment attachment = new Attachment();
				String filename=english.getOriginalFilename();
				String fullpath= path+filename;				
				english.transferTo(new File(fullpath));			
				attachment.setPath(fullpath);
				attachment.setAttachmnt_name(filename);
				attachment.setModule_type("English Attachment");
				attachment.setCategory("TALUKA");
				attachment.setExtension(FilenameUtils.getExtension(filename));
				attachment.setTaluka(taluka);
				attachment.setState("A");		   	
				attchmentset.add(attachment);
				info.setAttachment(attchmentset);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		try {
			if(!marathi.isEmpty()){
				Attachment hattachment = new Attachment();
				String filename=marathi.getOriginalFilename();
				String fullpath= path+filename;				
				marathi.transferTo(new File(fullpath));			
				hattachment.setPath(fullpath);
				hattachment.setAttachmnt_name(filename);
				hattachment.setModule_type("Marathi Attachment");
				hattachment.setCategory("TALUKA");
				hattachment.setExtension(FilenameUtils.getExtension(filename));
				hattachment.setTaluka(taluka);
				hattachment.setState("A");		   	
				attchmentset.add(hattachment);
				info.setAttachment(attchmentset);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		info.setModified_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		info.setModified_on(MethodsHelper.getCurrentDate());
		info.setTaluka(taluka.getTaluka());
		info.setTaluka_h(taluka.getTaluka_h());
		info.setTotal_villages(taluka.getTotal_villages());
		info.setRemark(taluka.getRemark());
		info.setTotal_villages_h(NumbersEnglishToMarathi.convertInMarathi(String.valueOf(info.getTotal_villages())));
		departmentDao.updateTaluka(info);

	}

	@Override
	public void deleteTaluka(int id) {
		departmentDao.deleteTaluka(id);
	}

	@Override
	public List<Taluka> getAllVillageList() {		
		return departmentDao.getAllVillageList();
	}

	@Override
	public List<Department> getActiveDepartment() {		
		return departmentDao.getActiveDepartment();
	}

	@Override
	public List<DepartmantOffice> getActiveOffice() {
		return departmentDao.getActiveOffice();
	}

	@Override
	public void saveDepartmentContact(DepartmentOfficeContact contact) {
		contact.setState(Constants.ACTIVE_STATE);
		contact.setContact_no_h(NumbersEnglishToMarathi.convertInMarathi(contact.getContact_no()));
		
		departmentDao.saveDepartmentContact(contact);

	}

	@Override
	public List<DepartmentOfficeContact> getOfficeContactList(int deptId) {
		return departmentDao.getOfficeContactList(deptId);
	}

	@Override
	public List<Department> getAllDepartment() {
		return departmentDao.getAllDepartment();
	}

	@SuppressWarnings("deprecation")
	@Override
	public void changeAdminStatus(int id, String status, String comment) {
		Department department=departmentDao.getDepartmentById(id);
		
		department.setCreate_approval_comment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(comment)));
		department.setCreate_approval_status(StringEscapeUtils.escapeHtml4(status));
		department.setCreate_approved_by(StringEscapeUtils.escapeHtml4(LoginController.getCurrentLoggedInUser().getUser().getFirstName()+" "+LoginController.getCurrentLoggedInUser().getUser().getLastName()));
		department.setCreate_approval_date(MethodsHelper.getCurrentDate());
		
		departmentDao.updateDepartment(department);
	}

	@Override
	public List<Department> getDepartmentByDeletionStatus(String status) {
		return departmentDao.getDepartmentByDeletionStatus(status);
	}

	@Override
	public void changeAdminDeletionStatus(int id, String status, String comment) {
		Department department=departmentDao.getDepartmentById(id);
		
		department.setDelete_approval_comment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(comment)));
		department.setDelete_approval_status(StringEscapeUtils.escapeHtml4(status));
		department.setDelete_approved_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		department.setDelete_approval_date(MethodsHelper.getCurrentDate());
		
		if(status.equals("Deactivate")){
			department.setState("D");
		}
		
		departmentDao.updateDepartment(department);
	}

	@Override
	public void deleteAdminDepartment(int id) {
		Department department=departmentDao.getDepartmentById(id);		
		department.setDelete_approval_status("Pending");
		departmentDao.updateDepartment(department);
	}

	@Override
	public List<Department> getDepartmentByCreationStatus(String status) {
		if(status.equals("All")){
			return departmentDao.getAllDepartment();
		}else{
			return departmentDao.getDepartmentByCreationStatus(status);
		}
	}

	@Override
	public void deleteDepartmentOfficeContact(int id) {
		departmentDao.deleteDepartmentOfficeContact(id);
	}

	@Override
	public DepartmentOfficeContact getDepartmentOfficeContactById(int id) {		
		return departmentDao.getDeptOfficeContactById(id);
	}

	@Override
	public void updateDeptOfficeContact(DepartmentOfficeContact contact) {
		contact.setState("A");
		contact.setContact_no_h(NumbersEnglishToMarathi.convertInMarathi(contact.getContact_no()));
		
		departmentDao.updateDepartmentOfficeContact(contact);
		
	}

	@Override
	public void saveDemoDepartment(DemoDepatment departments) {
		departmentDao.saveDemoDepartment(departments);
	}

	@Override
	public List<DemoDepatment> getDemoDepartment() {
		return departmentDao.getDemoDepartment();
	}

	@Override
	public DemoDepatment getDepartment(int deptId) {
		
		return departmentDao.getDemoDepartment(deptId);
	}

	@Override
	public void saveWorkStatus(WorkStatus work) {
		departmentDao.saveWorkStatus(work);
	}

	@Override
	public List<WorkStatus> getWorkList() {		
		return departmentDao.getWorkList();
	}

	@Override
	public WorkStatus getLastRecord() {
		return departmentDao.getLastRecord();
	}
}