package com.cmsManagement.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.ProjectDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Project;
import com.cmsManagement.model.User;
import com.cmsManagement.model.project_features;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;

@Service
public class ProjectServiceImpl implements projectService {

	@Autowired
	ProjectDao projectDao;
	
	@Autowired
	FinancialYearDao financialYearDao;
	
	@Autowired
	UserService userService;
	
	@Override
	public List<Project> getAllProjectList() {
		return projectDao.getAllProjectList();
	}

	@Override
	public Project getProjectById(int id) {
		
		return projectDao.getProjectById(id);
	}

	@Override
	public boolean deleteProjectById(int id) {
		return projectDao.deleteProjectById(id);
	}

	@Override
	public int saveProject(Project project) {
		System.out.println("idddddd :"+LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		User user=userService.findUserById(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		System.out.println("user :"+user.toString());
		//project.setCreated_by((LoginController.getCurrentLoggedInUser().getUser().getUser_id()));
		project.setUser(user);
		project.setCreated_on(MethodsHelper.getCurrentDate());
		project.setStatus(Constants.ACTIVE_STATE);
		project.setApprovedStatus(Constants.PENDING_STATUS);	
		project.setFinancialYear(financialYearDao.getCurrentActiveFinancialYear());
		project.setDelete_approval_status("Active");
		return projectDao.saveProject(project);
		
	}

	@Override
	public boolean projectUpdate(Project project) {
		Project info=projectDao.getProjectById(project.getId());
		 
			project.setCreated_on(info.getCreated_on());
			project.setUser(info.getUser());
			project.setDate(MethodsHelper.getCurrentDate());
			project.setModified_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			project.setModified_on(MethodsHelper.getCurrentDate());
			project.setStatus("A");
			project.setApprovedStatus(Constants.PENDING_STATUS);
			project.setDelete_approval_status("Active");
		return projectDao.projectUpdate(project);
	
	}

	@Override
	public int saveProject_Feature(project_features features) {
	
		return projectDao.saveProject_Feature(features);
	}

	@Override
	public List<Project> getProjectListByStatus(String status) {
		return projectDao.getProjectListByStatus(status);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void updateStatus(Project project) {	
		project.setApproved_by(StringEscapeUtils.escapeHtml4(LoginController.getCurrentLoggedInUser().getUser().getFirstName()+" "+LoginController.getCurrentLoggedInUser().getUser().getLastName()));
		project.setApproved_on(MethodsHelper.getCurrentDate());		
		project.setApprovedStatus(StringEscapeUtils.escapeHtml4(project.getApprovedStatus()));
		
		/*Prevent project from xss attack*/
		project=PreventionFromXSSAttack.preventProject(project);
		projectDao.updateStatus(project);

	}

	@Override
	public List<Project> getActiveProject() {
		
		return projectDao.getActiveProject();
	}

	@Override
	public List<Project> getProjectListByApprovedStatus() {
		// TODO Auto-generated method stub
		return projectDao.getProjectListByApprovedStatus();
	}

	@Override
	public List<project_features> getProjectFeaturesById(int id) {
		// TODO Auto-generated method stub
		return projectDao.getProjectFeaturesById(id);
	}

	@Override
	public void deleteProjectScope(int id) {
		projectDao.deleteProjectScope(id);
	}

	@Override
	public void deleteApprovedProject(int id) {
		Project project=projectDao.getProjectById(id);		
		project.setDelete_approval_status("Pending");
		projectDao.projectUpdate(project);
	}

	@Override
	public List<Project> getAllPendingProject(String status) {
		return projectDao.getAllPendingProject(status);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void deleteProjectStatus(String approvedStatus, String comment,	int id) {
		Project project=projectDao.getProjectById(id);		
		project.setDelete_approval_status(StringEscapeUtils.escapeHtml4(approvedStatus));
		project.setDelete_approved_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		project.setDelete_approval_date(MethodsHelper.getCurrentDate());
		project.setDelete_approval_comment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(comment)));
		
		if(approvedStatus.equals("Deactivate")){
			project.setStatus("D");
		}
		projectDao.projectUpdate(project);
	}

	@Override
	public List<Project> getAllAdminActiveProject() {
		return projectDao.getAllAdminActiveProject();
	}
	
	

	
}//class
