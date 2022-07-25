package com.cmsManagement.service;
import java.util.List;

import com.cmsManagement.model.Complaint;
import com.cmsManagement.model.Enquiry;
import com.cmsManagement.model.FeedBack;

/**
 * @author ujwala_gawari
 *
 */
public interface FeedBackService {

	int saveComplaint(FeedBack feedBack);

	List<FeedBack> getFeedbackReport(String reportType, String startDate,
			String endDate);

	FeedBack viewFeedBackDetails(int feedBackID);

	void saveEnquiry(Enquiry info);

	List<Enquiry> getEnquirykReport(String reportType, String startDate,
			String endDate);

	Enquiry viewEnquiry(int id);

}
