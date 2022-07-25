package com.cmsManagement.service;
import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.RTIApplications;
import com.mysql.cj.protocol.x.Notice;

/**
 * @author ujwala_gawari
 *
 */
public interface NoticesService {
	int saveNotices(Notices notices, MultipartFile file, HttpSession session);
	//int saveNotices(Notices notices);

	/**
	 * returns list of all the Notices available.
	 * @return
	 */
	
	List<Notices> getNoticesList();

	/**
	 * Adds a new FinancialYear and return inserted ID
	 * @param financialYear
	 */
	

	/**
	 * returns the Notices with a specific id.
	 * @param noticeId
	 * @return
	 */
	Notices findNoticesById(int noticeId);

	/**
	 * Deactivate Notices a specific id.
	 * @param noticeId
	 */
	boolean deleteNotices(int noticeId);

	/**
	 * update Notices and attachment if required return boolean value 
	 * @param notices
	 * @param file
	 */
	boolean updateNotices(Notices notices, MultipartFile file, HttpSession session);

	/**
	 * returns list of all the Notices for given notice type and notice status.
	 * @return
	 */
	List<Notices> getNoticesListByStatus(String noticesStatus, String type);

	/**
	 * returns boolean value and update status from Pending to Approved or Canceled with Comments for specific id.
	 * @return
	 */
	boolean changeNoticesStaus(int noticeID, String comment, String tendorStatus);

	/**
	 * returns list of all the Notices/Orders available for selected department
	 * @return
	 */
	List<Notices> searchNoticesByDepartment(int deptID, String noticeType, String category,int year);

	/**
	 * returns list of all the Notices/Orders with selected financial year.
	 * @param financialId
	 * @return
	 */
	List<Notices> searchNoticesByFinancialYear(int financialId, String noticeType, String category);
	/**
	 * returns list of all the Notices/Orders/news/tenders data from log table
	*/
	List<EntryLogModel> GetData();
	
	//Attachment findAttachmentById(int Attachment_id);
	List<Notices> getApprovedNoticesList();
	List<Notices> getApprovedNoticesListBetweenDates(String date1,String date2,String type);
	List<Notices> getApprovedNoticesbyType(String type);
	ArrayList<Notices> SearchNoticesByKeyWord(String str);
	
	
	/**
	 * Save Notice (no hibernate mapping)
	 * @throws ParseException 
	*/
	//int saveNotices(Notices notices,String Path);
	int saveNotices(Notices notices) throws ParseException;
	boolean updateNotices(Notices notices) throws ParseException;
	List<Notices> getArchieveNoticesByDates(String date1,String date2, String type);
	List<Notices> GetNoticesByDates(String date1, String date2, String type);
	void changeNoticeStatus1(int id, String string, String string2);
	
	List<Notices> getAllNotice();
	
	List<Notices> getNoticesByStatus(String status,String type);
	
	List<Notices> searchNoticeByDepartment(int deptId,String status);

	List<Notices> getActDocument();

	List<Notices> getApprovedNoticesbyStatus(String status);

	void deleteApprovedNotices(int id);

	List<Notices> getAllPendingDeactiveNotices(String status);

	void deleteNoticesStatus(String approvedStatus, String comment, int id);

	EntryLogModel GetAllData();

	List<RTIApplications> getRTIApplications();

	void saveRtiApplications(RTIApplications rti);

	void deleteRTIApllication(int id);
	
	
}