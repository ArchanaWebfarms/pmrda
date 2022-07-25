package com.cmsManagement.dao;
import java.util.List;

import com.cmsManagement.model.Complaint;

/**
 * @author ujwala_gawari
 *
 */
public interface ComplaintDao {

	int saveComplaint(Complaint complaint);

	List<Complaint> getComplaintReport(String reportType, String startDate,
			String endDate,String status);

	Complaint viewComplaintDetails(int complaintID);

	Complaint addComplaintDptComments(int complaintID, Complaint complaint);

}
