package com.cmsManagement.service;
import java.util.List;

import com.cmsManagement.model.Complaint;

/**
 * @author ujwala_gawari
 *
 */
public interface ComplaintService {

	/**
	 * Adds a new Complaint and return inserted ID
	 * @param complaint
	 */
	int saveComplaint(Complaint complaint);

	/**
	 * returns list of the Complaint available on the basis of type of report, Complaint Status (eg. Pending),
	 * For Date - All, Todays, Date wise and Between Dates
	 * @param 
	 */
	List<Complaint> getComplaintReport(String reportType, String startDate, String endDate, String status);

	/**
	 * returns the Complaint with a specific id.
	 * @param complaintID
	 * @return
	 */
	Complaint viewComplaintDetails(int complaintID);

	/**
	 * Adds a Complaint comment at admin side and return Complaint
	 * @param complaintID
	 * @param comment
	 * @param status
	 */
	Complaint addComplaintDptComments(int complaintID, String comment, String status);
	
	

}
