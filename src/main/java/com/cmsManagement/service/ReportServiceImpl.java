package com.cmsManagement.service;

import java.text.ParseException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmsManagement.dao.ReportsDao;
import com.cmsManagement.model.CmsReports;
@Service()
@Transactional
public class ReportServiceImpl implements ReportService {
	@Autowired
	ReportsDao reportsdao;
	
	@Override
	public List<CmsReports> GetCmsReports(String Module, String Today,String startDate, String endDate, String user) throws ParseException{
		
		if(Module.equals("PROJECT")){
			return reportsdao.GetCmsReportsOfProject(Module, Today, startDate, endDate, user);
		}else if(Module.equals("OPENINGS")){
			return reportsdao.GetCmsReportsOfOpening(Module, Today, startDate, endDate, user);
		}else if(Module.equals("DEPARTMENTS")){
			return reportsdao.GetCmsReportsOfDepartment(Module, Today, startDate, endDate, user);
		}else{
			return reportsdao.GetCmsReports(Module, Today, startDate, endDate, user);
		}
		
	}
	/*@Override
	public List<News> GetNewsReport(String Module, String reportType,String startDate, String endDate, String user) {
		
		
		//return reportsdao.GetNewsReport(Module, reportType, startDate, endDate, user);
	}
	@Override
	public List<Tendors> GetTendorsReport(String Module, String Today,String startDate, String endDate, String user) {
		// TODO Auto-generated method stub
		//return reportsdao.GetTendorsReport(Module, Today, startDate, endDate, user);
	}*/

	@Override
	public List<CmsReports> GetUsersReportByRoleID(int roleID) {

		return reportsdao.GetUsersReportByRoleID(roleID);
	}

	@Override
	public List<CmsReports> GetUsersRportsByuserID(int userID) {

		return reportsdao.GetUsersRportsByuserID(userID);
	}

	

}
