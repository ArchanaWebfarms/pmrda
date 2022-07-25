package com.cmsManagement.service;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.FeedBackDao;
import com.cmsManagement.model.Enquiry;
import com.cmsManagement.model.FeedBack;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;


@Transactional
@Service
public class FeedBackServiceImpl implements FeedBackService {

	@Autowired
	FeedBackDao feedBackDao;

	@Override
	public int saveComplaint(FeedBack feedBack) {
		//feedBack.setCreated_by(1);
		//feedBack.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		//feedBack.setState(Constants.ACTIVE_STATE);
		return feedBackDao.saveComplaint(feedBack);
	}

	@Override
	public List<FeedBack> getFeedbackReport(String reportType, String startDate, String endDate) {
		return feedBackDao.getFeedbackReport(reportType, startDate, endDate);
	}

	@Override
	public FeedBack viewFeedBackDetails(int feedBackID) {
		return feedBackDao.viewFeedBackDetails(feedBackID);
	}

	@Override
	public void saveEnquiry(Enquiry info) {
		feedBackDao.saveEnquiry(info);
	}

	@Override
	public List<Enquiry> getEnquirykReport(String reportType, String startDate,
			String endDate) {
		return feedBackDao.getEnquirykReport(reportType, startDate, endDate);
	}

	@Override
	public Enquiry viewEnquiry(int id) {
		return feedBackDao.viewEnquiry(id);
	}

}
