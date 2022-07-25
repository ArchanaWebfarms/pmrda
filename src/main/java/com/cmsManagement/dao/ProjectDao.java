package com.cmsManagement.dao;

import java.util.List;

import com.cmsManagement.model.Project;
import com.cmsManagement.model.project_features;

public interface ProjectDao {
	public List<Project> getAllProjectList();
	public List<Project> getActiveProject();
	public List<Project> getProjectListByApprovedStatus();
	public List<Project> getProjectListByStatus(String status);
	
	public int  saveProject(Project project) ;
	
	public Project getProjectById(int id);
	
	public boolean deleteProjectById(int id);
    public boolean   projectUpdate(Project project);
   
    public  void updateStatus(Project project);
	
    public int  saveProject_Feature(project_features features);
    
	public List<project_features> getProjectFeaturesById(int id);
	public void deleteProjectScope(int id);
	public List<Project> getAllPendingProject(String status);
	public List<Project> getAllAdminActiveProject();
	
}
