package com.cmsManagement.dao;
import java.util.ArrayList;
import java.util.List;

import com.cmsManagement.model.News;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;


/**
 * @author ujwala_gawari
 *
 */
public interface TenderDao {

	List<Tendors> getAllTendors();
	
	List<Tendors> getAllApprovedTendors();

	int saveTendors(Tendors tendors);

	boolean updateTendors(Tendors tendors);

	Tendors findTenderById(int tenderId);

	boolean deleteTender(int tenderId);

	List<TendorsDepartment> getTenderDepartment();

	TendorsDepartment findTenderDepartmentId(int department);

	boolean deleteAttachmentById(int attachmentID);

	List<Tendors> adminTenderList();

	void changeTendorStaus(int tenderId, String comment, String date, String approvalBy, String tendorStatus);

	List<Tendors> getTendorListByStatus(String tendorStatus);

	List<Tendors> getAllPendingTendors();

	List<Tendors> searchTendersByDepartment(int deptID);
	List<Tendors> searchTendersByDepartment(int deptID,String publishStatus);

	List<Tendors> searchTendersByFinancialYear(int financialId);

	List<Tendors> GetdTendorsByDates(String date1,String date2);
	ArrayList<Tendors> SearchTenderByKeyWord(String str);
	//No hibernate mapping

	void changeTendorStaus1(int id, String string, String date, String string2);

	List<Tendors> getAllPendingDeactiveTender(String status);
	
	
}
