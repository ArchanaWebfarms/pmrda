package com.cmsManagement.service;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Notices;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;

/**
 * @author ujwala_gawari
 *
 */
public interface TenderService {

	/**
	 * returns list of all the Tenders Year available.
	 * @return
	 */
	List<Tendors> getAllTendors();

	/**
	 * Adds a new Tenders and return inserted ID
	 * @param tendors
	 */
	int saveTendors(Tendors tendors, MultipartFile file, HttpSession session);

	/**
	 * update Tenders and attachment if required return boolean value 
	 * @param notices
	 * @param file
	 */
	boolean updateTendors(Tendors tendors, MultipartFile file, HttpSession session);

	/**
	 * returns the Tenders with a specific id.
	 * @param tenderId
	 * @return
	 */
	Tendors findTenderById(int tenderId);

	/**
	 * Deactivate Tenders with a specific id.
	 * @param noticeId
	 */
	boolean deleteTender(int tenderId);

	/**
	 * returns list of all the TendorsDepartment available.
	 * @return
	 */
	List<TendorsDepartment> getTenderDepartment();

	/**
	 * returns the TendorsDepartment with a specific id.
	 * @param department
	 * @return
	 */
	TendorsDepartment findTenderDepartmentId(int department);

	/**
	 * returns boolean = true - if attachment deleted permanently.
	 * @return
	 */
	boolean deleteAttachmentById(int attachmentID);

	List<Tendors> adminTenderList();

	/**
	 * returns boolean value and update status from Pending to Approved or Canceled with Comments for specific id.
	 * @return
	 */
	void changeTendorStaus(int tenderId, String comment, String tendorStatus);

	/**
	 * returns list of all the Tenders available for status.
	 * @return
	 */
	List<Tendors> getTendorListByStatus(String tendorStatus);

	/**
	 * returns list of all the Tenders available for status=pending.
	 * @return
	 */
	List<Tendors> getAllPendingTendors();

	/**
	 * returns list of all the Tenders available for selected department
	 * @return
	 */
	List<Tendors> searchTendersByDepartment(int deptID);

	/**
	 * returns list of all the Tenders with selected financial year.
	 * @param financialId
	 * @return
	 */
	List<Tendors> searchTendersByFinancialYear(int financialId);

	List<Tendors> getAllApprovedTendors();
	List<Tendors> GetdTendorsByDates(String date1,String date2);
	ArrayList<Tendors> SearchTenderByKeyWord(String str);
	List<Tendors> searchTendersByDepartment(int deptID,String publishStatus);
	//No hibernate mapping
	int saveTendors(Tendors tendors) throws ParseException;
	boolean updateTendors(Tendors tendors) throws ParseException;

	void changeTendorStaus1(int id, String string, String string2);

	void deleteApprovedTender(int parseInt);

	List<Tendors> getAllPendingDeactiveTender(String status);

	void deleteTenderStatus(String approvedStatus, String comment, int id);

}
