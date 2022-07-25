package com.cmsManagement.service;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.ComplaintDao;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.model.Complaint;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

/**
 * @author ujwala_gawari
 *
 */
@Service()
@Transactional
public class ComplaintServiceImpl implements ComplaintService {
	
	@Autowired
	ComplaintDao complaintDao;	
	@Autowired
	FinancialYearDao financialYearDao;
	@Override
	public int saveComplaint(Complaint complaint) {
		complaint.setCreated_by(1);//LoginController.getCurrentLoggedInUser().getUser().getUser_id()
		complaint.setCreated_date(MethodsHelper.getCurrentDate());
		complaint.setState(Constants.ACTIVE_STATE);
		complaint.setComplaintStatus(Constants.PENDING_STATUS);
		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		complaint.setFinancialYear(financialYear);
		return complaintDao.saveComplaint(complaint);
	}

	@Override
	public List<Complaint> getComplaintReport(String reportType,
			String startDate, String endDate, String status) {
		return complaintDao.getComplaintReport(reportType, startDate, endDate, status);
	}

	@Override
	public Complaint viewComplaintDetails(int complaintID) {
		return complaintDao.viewComplaintDetails(complaintID);
	}

	@Override
	public Complaint addComplaintDptComments(int complaintID, String comment, String status) {
		Complaint complaint=complaintDao.viewComplaintDetails(complaintID);
		complaint.setUpdated_by(1);//LoginController.getCurrentLoggedInUser().getUser().getUser_id()
		complaint.setUpdated_date(MethodsHelper.getCurrentDate());
		complaint.setComments(comment);
		complaint.setComplaintStatus(status);
		return complaintDao.addComplaintDptComments(complaintID, complaint);
	}

	
	

}
