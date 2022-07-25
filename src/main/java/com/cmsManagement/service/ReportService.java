package com.cmsManagement.service;

import java.text.ParseException;
import java.util.List;

import com.cmsManagement.model.CmsReports;

public interface ReportService {
	/*public List<News> GetNewsReport(String Module,String Today, String startDate, String endDate,String user);
	public List<Tendors> GetTendorsReport(String Module,String Today, String startDate, String endDate,String user);*/
	public List<CmsReports> GetCmsReports(String Module,String Today, String startDate, String endDate,String user) throws ParseException;
	public List<CmsReports> GetUsersReportByRoleID(int roleID);
	public List<CmsReports> GetUsersRportsByuserID(int userID);
	
	
	
	
	
	
}
