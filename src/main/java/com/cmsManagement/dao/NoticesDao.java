package com.cmsManagement.dao;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Multipart;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.RTIApplications;
import com.mysql.cj.protocol.x.Notice;

/**
 * @author ujwala_gawari
 *
 */
public interface NoticesDao {

	List<Notices> getNoticesList();
	List<Notices> getApprovedNoticesList();

	int saveNotices(Notices notices);
//	int saveNotices(Notices notices,String Path);

	Notices findNoticesById(int noticeId);

	boolean deleteNotices(int noticeId);

	boolean updateNotices(Notices notices);
	
	List<Notices> getNoticesListByStatus(String noticesStatus, String type);

	boolean changeNoticesStaus(int noticeID, String comment, String status, String  approvalBy, String date);

	List<Notices> searchNoticesByDepartment(int deptID, String noticeType, String category,int year);

	List<Notices> searchNoticesByFinancialYear(int financialId, String noticeType, String category);
	
	List<EntryLogModel> GetData();
	
	Attachment findAttachmentById(Attachment attachment_id);
	
	List<Notices> getApprovedNoticesListBetweenDates(String date1,String date2,String type);
	List<Notices> getApprovedNoticesbyType(String type);
	ArrayList<Notices> SearchNoticesByKeyWord(String str);
	List<Notices> GetNoticesByDates(String date1, String date2, String type);
	List<Notices> getArchieveNoticesByDates(String date1,String date2, String type);
	void changeNoticeStatus1(int id, String string,String Date, String string2);
	
	List<Notices> getAllNotice();
    List<Notices> getNoticesByStatus(String status,String type);
	
	List<Notices> searchNoticeByDepartment(int deptId,String status);
	List<Notices> getActDocument();
	List<Notices> searchNoticesByDepartment(String noticeType, String category);
	List<Notices> searchNoticesByDepartment(int deptID, String noticeType,String category);
	List<Notices> getApprovedNoticesbyStatus(String status);
	List<Notices> getAllPendingDeactiveNotices(String status);
	EntryLogModel GetAllData();
	List<RTIApplications> getRTIApplications();
	void saveRtiApplications(RTIApplications rti);
	void deleteRTIApllication(int id);
	
}
