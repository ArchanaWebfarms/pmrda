package com.cmsManagement.service;
import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.TenderDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;


@Service()
@Transactional
public class TenderServiceImpl implements TenderService {

	Attachment attachment;	

	@Autowired
	FinancialYearDao financialYearDao;

	@Autowired
	TenderDao tenderDao;

	@Override
	public List<Tendors> getAllTendors() {
		return tenderDao.getAllTendors();
	}

	@Override
	public int saveTendors(Tendors tendors, MultipartFile file, HttpSession session) {
		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		try {

			attachment=new Attachment();
			attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			attachment.setCreated_date(MethodsHelper.getCurrentDate());
			attachment.setModule_type(Constants.TENDER_MODULE);
			attachment.setState(Constants.ACTIVE_STATE);
			attachment.setFinancialYear(financialYear);
			String path=session.getServletContext().getRealPath("/staticResources/Tenders/"); 
			File f = new File(path);
			if(!f.exists())
			{
				f.mkdirs();
			}
			String a =  file.getOriginalFilename();
			String totalPath = path+a;
			totalPath=totalPath.replace("\\", "/");
			file.transferTo(new File(totalPath));
			attachment.setAttachmnt_name(a);
			attachment.setPath(totalPath);
			//   tendors.setAttachment(attachment);
			//	FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
			tendors.setFinancialYear(financialYear);
			tendors.setState(Constants.ACTIVE_STATE); 
			tendors.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			tendors.setPublishStatus(Constants.PENDING_STATUS);
			tendors.setCreated_date(MethodsHelper.getCurrentDate());
			tendors.setUrl("pmrda_tenders");
			tendors.setType("TENDERS");
			tendors.setPublish_date(MethodsHelper.convertDate(tendors.getPublish_date()));
			tendors.setDelete_approval_status("Active");
		} catch (Exception e) {e.printStackTrace();}  
		/*Preventing tender from xss attack*/
		tendors=PreventionFromXSSAttack.preventTender(tendors);

		return tenderDao.saveTendors(tendors);
	}


	@Override
	public boolean updateTendors(Tendors tendors, MultipartFile file, HttpSession session) {
		/*Tendors tendor=tenderDao.findTenderById(tendors.getId());
	     try {
	    	 if(tendors.getAttachment().getAttachmentID()==0){
	      		attachment=new Attachment();
				attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
				attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
				attachment.setModule_type(Constants.TENDER_MODULE);
				attachment.setState(Constants.ACTIVE_STATE);
				attachment.setAttachmentID(tendors.getAttachment().getAttachmentID());

		      	 String path=session.getServletContext().getRealPath("/Tenders/"); 
		   		 String a =  file.getOriginalFilename();
		         	String totalPath = path+a;
		         	totalPath=totalPath.replace("\\", "/");
		        	file.transferTo(new File(totalPath));
					attachment.setAttachmnt_name(a);
			      attachment.setPath(totalPath);
			      FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		    		attachment.setFinancialYear(financialYear);
			      tendor.setAttachment(attachment);
				}
	    	 tendor.setTitle(tendors.getTitle());
	    	 tendor.setSubTitle(tendors.getSubTitle());
	    	 tendor.setDescription(tendors.getDescription());
	    	 tendor.setOpeningDate(tendors.getOpeningDate());
	    	 tendor.setClosingDate(tendors.getClosingDate());
	    	 tendor.setPublish_date(tendors.getPublish_date());
	    	 tendor.setTags(tendors.getTags());
	    	 tendor.setTendorsDepartment(tendors.getTendorsDepartment());
			 tendor.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			 tendor.setUpdated_date(MethodsHelper.getCurrentDate());
	      } catch (Exception e) {e.printStackTrace();}  */
		tendors.setDelete_approval_status("Active");
		/*Preventing tender from xss attack*/
		tendors=PreventionFromXSSAttack.preventTender(tendors);

		return tenderDao.updateTendors(tendors);
	}

	@Override
	public Tendors findTenderById(int tenderId) {
		return tenderDao.findTenderById(tenderId);
	}

	@Override
	public TendorsDepartment findTenderDepartmentId(int department) {
		return tenderDao.findTenderDepartmentId(department);
	}


	@Override
	public boolean deleteTender(int tenderId) {
		return tenderDao.deleteTender(tenderId);
	}

	@Override
	public List<TendorsDepartment> getTenderDepartment() {		
		return tenderDao.getTenderDepartment();
	}

	@Override
	public boolean deleteAttachmentById(int attachmentID) {
		return tenderDao.deleteAttachmentById(attachmentID);
	}

	@Override
	public List<Tendors> adminTenderList() {
		return tenderDao.adminTenderList();
	}

	@Override
	public void changeTendorStaus(int tenderId, String comment, String tendorStatus) {
		String date=MethodsHelper.getCurrentDateAndTime();		
		tenderDao.changeTendorStaus(tenderId, comment, date, (LoginController.getCurrentLoggedInUser().getUser().getFirstName()+LoginController.getCurrentLoggedInUser().getUser().getLastName()), tendorStatus);
	}

	@Override
	public List<Tendors> getTendorListByStatus(String tendorStatus) {
		return tenderDao.getTendorListByStatus(tendorStatus);
	}

	@Override
	public List<Tendors> getAllPendingTendors() {
		return tenderDao.getAllPendingTendors();
	}

	@Override
	public List<Tendors> searchTendersByDepartment(int deptID) {
		return tenderDao.searchTendersByDepartment(deptID);
	}

	@Override
	public List<Tendors> searchTendersByFinancialYear(int financialId) {
		return tenderDao.searchTendersByFinancialYear(financialId);
	}

	@Override
	public List<Tendors> getAllApprovedTendors() {
		// TODO Auto-generated method stub
		return tenderDao.getAllApprovedTendors();
	}

	@Override
	public List<Tendors> GetdTendorsByDates(String date1, String date2) {
		// TODO Auto-generated method stub
		return tenderDao.GetdTendorsByDates(date1, date2);
	}

	@Override
	public ArrayList<Tendors> SearchTenderByKeyWord(String str) {
		// TODO Auto-generated method stub
		return tenderDao.SearchTenderByKeyWord(str);
	}

	@Override
	public List<Tendors> searchTendersByDepartment(int deptID,
			String publishStatus) {
		// TODO Auto-generated method stub
		return tenderDao.searchTendersByDepartment(deptID, publishStatus);
	}

	@Override
	public int saveTendors(Tendors tendors) throws ParseException {
		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		tendors.setFinancialYear(financialYear);
		tendors.setState(Constants.ACTIVE_STATE); 
		tendors.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		tendors.setPublishStatus(Constants.PENDING_STATUS);
		tendors.setCreated_date(MethodsHelper.getCurrentDate());
		tendors.setUrl("pmrda_tenders");
		tendors.setType("TENDERS");
		tendors.setDelete_approval_status("Active");
		tendors.setPublish_time(tendors.getPublish_time().trim());
		tendors.setClosing_time(tendors.getClosing_time().trim());
		tendors.setOpening_time(tendors.getOpening_time().trim());
		tendors.setPublish_date(MethodsHelper.convertDate(tendors.getPublish_date()));
		tendors.setPublish_date_h(MethodsHelper.convertDateInMarathi(tendors.getPublish_date()));
		tendors.setClosingDate_h(MethodsHelper.convertDateInMarathi(MethodsHelper.convertDate(tendors.getClosingDate())));
		tendors.setOpeningDate_h(MethodsHelper.convertDateInMarathi(MethodsHelper.convertDate(tendors.getOpeningDate())));
		tendors.setPublish_time_h(MethodsHelper.convertTimeInMarathi(tendors.getPublish_time()));
		tendors.setClosing_time_h(MethodsHelper.convertTimeInMarathi(tendors.getClosing_time()));
		tendors.setOpening_time_h(MethodsHelper.convertTimeInMarathi(tendors.getOpening_time()));
		
		/*Preventing tender from xss attack*/
		tendors=PreventionFromXSSAttack.preventTender(tendors);

		return tenderDao.saveTendors(tendors);
	}

	@Override
	public boolean updateTendors(Tendors tendors) throws ParseException {
		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		tendors.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		tendors.setUpdated_date(MethodsHelper.getCurrentDate());
		tendors.setPublishStatus(Constants.PENDING_STATUS);
		tendors.setFinancialYear(financialYear);
		tendors.setState(Constants.ACTIVE_STATE); 
		tendors.setDelete_approval_status("Active");
		tendors.setPublish_date_h(MethodsHelper.convertDateInMarathi(tendors.getPublish_date()));
		tendors.setClosingDate_h(MethodsHelper.convertDateInMarathi(MethodsHelper.convertDate(tendors.getClosingDate())));
		tendors.setOpeningDate_h(MethodsHelper.convertDateInMarathi(MethodsHelper.convertDate(tendors.getOpeningDate())));
		tendors.setPublish_time_h(MethodsHelper.convertTimeInMarathi(tendors.getPublish_time()));
		tendors.setClosing_time_h(MethodsHelper.convertTimeInMarathi(tendors.getClosing_time()));
		tendors.setOpening_time_h(MethodsHelper.convertTimeInMarathi(tendors.getOpening_time()));
		
		/*Preventing tender from xss attack*/
		tendors=PreventionFromXSSAttack.preventTender(tendors);

		return tenderDao.updateTendors(tendors);
	}

	@Override
	public void changeTendorStaus1(int id, String string, String string2) {
		String date=MethodsHelper.getCurrentDateAndTime();
		tenderDao.changeTendorStaus1(id, string, date, string2);
	}

	@Override
	public void deleteApprovedTender(int id) {
		Tendors tender=tenderDao.findTenderById(id);
		tender.setDelete_approval_status("Pending");
		tenderDao.updateTendors(tender);
	}

	@Override
	public List<Tendors> getAllPendingDeactiveTender(String status) {
		return tenderDao.getAllPendingDeactiveTender(status);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void deleteTenderStatus(String approvedStatus, String comment, int id) {
		Tendors tender=tenderDao.findTenderById(id);
		tender.setDelete_approval_status(StringEscapeUtils.escapeHtml4(approvedStatus));
		tender.setDelete_approval_comment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(comment)));
		tender.setDelete_approved_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		tender.setDelete_approval_date(MethodsHelper.getCurrentDate());
		if(approvedStatus.equals("Deactivate")){
			tender.setState("D");
		}
		
		tenderDao.updateTendors(tender);
	}





}
