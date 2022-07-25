package com.cmsManagement.dao;

import java.text.ParseException;
import java.util.List;

import com.cmsManagement.model.CmsReports;
import com.cmsManagement.model.Modules;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Tendors;

public interface ReportsDao {
	
	
	
	public List<CmsReports> GetCmsReports(String Module,String Today, String startDate, String endDate,String user) throws ParseException; 
	
	public List<CmsReports> GetUsersReportByRoleID(int roleID);
	
	public  List<CmsReports> GetUsersRportsByuserID(int userID);
	

	public List<CmsReports> getUserReportsByRole(int userID);

	public List<CmsReports> GetCmsReportsOfProject(String module, String today,
			String startDate, String endDate, String user) throws ParseException;

	public List<CmsReports> GetCmsReportsOfOpening(String module, String today,
			String startDate, String endDate, String user) throws ParseException;

	public List<CmsReports> GetCmsReportsOfDepartment(String module,
			String today, String startDate, String endDate, String user) throws ParseException;
	
	
	
	
	
	
//

	
	
	
	
}
