package com.cmsManagement.service;
import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.NewsDao;
import com.cmsManagement.dao.NoticesDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.RTIApplications;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.NumbersEnglishToMarathi;
import com.cmsManagement.util.ValidateInput;
import com.mysql.cj.protocol.x.Notice;


@Service()
@Transactional
public class NoticesServiceImpl implements NoticesService {

	@Autowired
	NoticesDao noticesDao;
	
	@Autowired
	FinancialYearDao financialYearDao;
	Attachment attachment;
	

	/*@Override
	public int saveNotices(Notices notices, MultipartFile file, HttpSession session) {
		try {
			notices.setState(Constants.ACTIVE_STATE);
			attachment=new Attachment();
			attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			attachment.setCreated_date(MethodsHelper.getCurrentDate());
			attachment.setModule_type(Constants.NOTICE_MODULE);
			attachment.setState(Constants.ACTIVE_STATE);
      	
      		String path=session.getServletContext().getRealPath("/Notice/"); 
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
	      FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
    		attachment.setFinancialYear(financialYear);
      		notices.setAttachment(attachment);

      		if(notices.getType().equals("CIRCULERS"))
      		{
      			notices.setUrl("pmrda_circulars");
      		}
      		else if(notices.getType().equals("PRESS NOTES")){
      			notices.setUrl("press_notes");
      		}
      		else if(notices.getType().equals("QUOTATIONS")){
      			notices.setUrl("pmrda_quotations");
      		}
      		else if(notices.getType().equals("CENTRAL GOV GR")){
      			notices.setUrl("central_gov");
      		}
      		else if(notices.getType().equals("STATE GOV GR")){
      			notices.setUrl("state_gov");
      		}
      		else if(notices.getType().equals("NOTICE")){
      			notices.setUrl("pmrda_notice");
      		}
      		else if(notices.getType().equals("DOWNLOADS")){
      			notices.setUrl("pmrda_downloads");
      		}
      		else
      		{
      			notices.setUrl("pmrda_rti");
      		}
	      	notices.setFinancialYear(financialYear);
	      	notices.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
	      	notices.setPublishStatus(Constants.PENDING_STATUS);
	      	notices.setCreated_date(MethodsHelper.getCurrentDate());
	      	notices.setCategory(Constants.NOTICE_CATEGORY);
      	} 
		
		catch (Exception e) {e.printStackTrace();}
		return noticesDao.saveNotices(notices);
	}*/

	@Override
	public Notices findNoticesById(int noticeId) {
		return noticesDao.findNoticesById(noticeId);
	}

	@Override
	public boolean deleteNotices(int noticeId) {
		return noticesDao.deleteNotices(noticeId);
	}

	@Override
	public boolean updateNotices(Notices notices, MultipartFile file, HttpSession session) {
		Notices notice=noticesDao.findNoticesById(notices.getNoticeID());
		/*try {
		  if(notices.getAttachment().getAttachmentID()==0){	
				attachment=new Attachment();
				attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
				attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
				attachment.setModule_type(Constants.NOTICE_MODULE);
				attachment.setState(Constants.ACTIVE_STATE);
				attachment.setAttachmentID(notices.getAttachment().getAttachmentID());
      	
	      		String path=session.getServletContext().getRealPath("/Notice/"); 
	      		String a =  file.getOriginalFilename();
	         	String totalPath = path+a;
	         	totalPath=totalPath.replace("\\", "/");
				attachment.setAttachmnt_name(a);
				file.transferTo(new File(totalPath));
			      attachment.setPath(totalPath);
			      FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		    		attachment.setFinancialYear(financialYear);
			      notice.setAttachment(attachment);
		  }     
			  notice.setTitle(notices.getTitle());
			  notice.setDescription(notices.getDescription());
			  notice.setPublish_date(notice.getPublish_date());
			  notice.setType(notices.getType());
			  notice.setTags(notices.getTags());
			  notice.setDepartment(notices.getDepartment());
			  notice.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			  notice.setUpdated_date(MethodsHelper.getCurrentDateDDMMYYYY());
		  } catch (Exception e) {e.printStackTrace();} */
	    return noticesDao.updateNotices(notice);
	}
	
	@Override
	public List<Notices> getNoticesListByStatus(String noticesStatus, String type) {

		return noticesDao.getNoticesListByStatus(noticesStatus, type);
	}

	@Override
	public boolean changeNoticesStaus(int noticeID, String comment, String status) {
		String date=MethodsHelper.getCurrentDateAndTime();		
		return noticesDao.changeNoticesStaus(noticeID, comment, status, (LoginController.getCurrentLoggedInUser().getUser().getFirstName()+" "+LoginController.getCurrentLoggedInUser().getUser().getLastName()), date);
	}
	
	

	@Override
	public List<Notices> searchNoticesByDepartment(int deptID, String noticeType, String category,int year) {
		// return noticesDao.searchNoticesByDepartment(deptID, noticeType, category,year);
		if(deptID==0 || deptID==26){
			return noticesDao.searchNoticesByDepartment(noticeType, category);
		}else{
			return noticesDao.searchNoticesByDepartment(deptID, noticeType, category);
		}
	}

	@Override
	public List<Notices> searchNoticesByFinancialYear(int financialId, String noticeType,String category) {
		return noticesDao.searchNoticesByFinancialYear(financialId, noticeType, category);
	}

	
	

	@Override
	public List<Notices> getApprovedNoticesList() {
		
		return noticesDao.getApprovedNoticesList();
	}

	@Override
	public List<Notices> getApprovedNoticesListBetweenDates(String date1,String date2,String type) {
		return noticesDao.getApprovedNoticesListBetweenDates(date1, date2,type);
	}

	@Override
	public List<Notices> getApprovedNoticesbyType(String type) {
		// TODO Auto-generated method stub
		return noticesDao.getApprovedNoticesbyType(type);
	}

	
	@Override
	public ArrayList<Notices> SearchNoticesByKeyWord(String str) {
		// TODO Auto-generated method stub
		return noticesDao.SearchNoticesByKeyWord(str);
	}

	@Override
	public List<Notices> getNoticesList() {
		// TODO Auto-generated method stub
		return noticesDao.getNoticesList();
	}

	@Override
	public int saveNotices(Notices notices) throws ParseException {
		if(notices.getType().equals("CIRCULERS"))
  		{
  			notices.setUrl("pmrda_circulars");
  		}
  		else if(notices.getType().equals("PRESS NOTES")){
  			notices.setUrl("press_notes");
  		}
  		else if(notices.getType().equals("QUOTATIONS")){
  			notices.setUrl("pmrda_quotations");
  		}
  		else if(notices.getType().equals("CENTRAL GOV GR")){
  			notices.setUrl("central_gov");
  		}
  		else if(notices.getType().equals("STATE GOV GR")){
  			notices.setUrl("state_gov");
  		}
  		else if(notices.getType().equals("NOTICE")){
  			notices.setUrl("pmrda_notice");
  		}
  		else if(notices.getType().equals("DOWNLOADS")){
  			notices.setUrl("pmrda_downloads");
  		}
  		else
  		{
  			notices.setUrl("pmrda_rti");
  		}
		 FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
      	notices.setFinancialYear(financialYear);
      	notices.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
      	notices.setPublishStatus(Constants.PENDING_STATUS);
      	notices.setCreated_date(MethodsHelper.getCurrentDate());
      	notices.setCategory(Constants.NOTICE_CATEGORY);
      	notices.setCategory("NOTICE");
      	notices.setState("A");
      	notices.setDelete_approval_status("Active");
      	 if(notices.getType().equals("CENTRAL GOV GR") || notices.getType().equals("STATE GOV GR")){
      		notices.setDate_h(MethodsHelper.convertYearInMarathi(notices.getPublish_date()));
   		}else{
   			notices.setDate_h(MethodsHelper.convertDateInMarathi(notices.getPublish_date()));
   		}
      	if(notices.getType().equals("STATE GOV GR")){      		
      		if(notices.getSubtype().equals("Acts")){
      			notices.setSubtype_h("कायदे");
      		}else if(notices.getSubtype().equals("Rules")){
      			notices.setSubtype_h("नियम");
      		}
   		}else{
   			notices.setSubtype(null);
   		}
		return noticesDao.saveNotices(notices);
	}

	@Override
	public boolean updateNotices(Notices notices) throws ParseException {
		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
      	notices.setFinancialYear(financialYear);
		notices.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		notices.setUpdated_date(MethodsHelper.getCurrentDateDDMMYYYY());
		notices.setPublishStatus(Constants.PENDING_STATUS);
		notices.setCategory("NOTICE");
		notices.setState("A");
		notices.setDelete_approval_status("Active");
		 if(notices.getType().equals("CENTRAL GOV GR") || notices.getType().equals("STATE GOV GR")){
	      		notices.setDate_h(MethodsHelper.convertYearInMarathi(notices.getPublish_date()));
	   		}else{
	   			notices.setDate_h(MethodsHelper.convertDateInMarathi(notices.getPublish_date()));
	   		}
		 
			if(notices.getType().equals("STATE GOV GR")){      		
	      		if(notices.getSubtype().equals("Acts")){
	      			notices.setSubtype_h("कायदे");
	      		}else if(notices.getSubtype().equals("Rules")){
	      			notices.setSubtype_h("नियम");
	      		}
	   		}else{
	   			notices.setSubtype(null);
	   		}
	      	
	      
		return noticesDao.updateNotices(notices);
	}

	@Override
	public List<EntryLogModel> GetData() {
		// TODO Auto-generated method stub
		return noticesDao.GetData();
	}

	@Override
	public List<Notices> GetNoticesByDates(String date1, String date2,String type) {
		return noticesDao.GetNoticesByDates(date1,date2,type);
	}

	@Override
	public void changeNoticeStatus1(int id, String string, String string2) {
	String date=MethodsHelper.getCurrentDateAndTime();
	noticesDao.changeNoticeStatus1(id, string, date, string2);
		
	}

	@Override
	public List<Notices> getAllNotice() {
		// TODO Auto-generated method stub
		return noticesDao.getAllNotice();
	}

	@Override
	public List<Notices> getNoticesByStatus(String status,String type) {
		// TODO Auto-generated method stub
		return noticesDao.getNoticesByStatus(status,type);
	}



	@Override
	public List<Notices> searchNoticeByDepartment(int deptId, String status) {
		// TODO Auto-generated method stub
		return noticesDao.searchNoticeByDepartment(deptId, status);
	}

	@Override
	public List<Notices> getArchieveNoticesByDates(String date1, String date2,String type) {
		// TODO Auto-generated method stub
		return noticesDao.getArchieveNoticesByDates(date1, date2, type);
	}

	@Override
	public int saveNotices(Notices notices, MultipartFile file,
			HttpSession session) {
		
		return 0;
	}

	@Override
	public List<Notices> getActDocument() {
		return noticesDao.getActDocument();
	}

	@Override
	public List<Notices> getApprovedNoticesbyStatus(String status) {		
		return noticesDao.getApprovedNoticesbyStatus(status);
	}

	@Override
	public void deleteApprovedNotices(int id) {
		Notices notice=noticesDao.findNoticesById(id);
		notice.setDelete_approval_status("Pending");		
		noticesDao.updateNotices(notice);
	}

	@Override
	public List<Notices> getAllPendingDeactiveNotices(String status) {		
		return noticesDao.getAllPendingDeactiveNotices(status);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void deleteNoticesStatus(String approvedStatus, String comment,int id) {
		Notices notice=noticesDao.findNoticesById(id);
		notice.setDelete_approval_status(StringEscapeUtils.escapeHtml4(approvedStatus));	
		notice.setDelete_approval_comment(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(comment)));
		notice.setDelete_approved_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		notice.setDelete_approval_date(MethodsHelper.getCurrentDate());
		if(approvedStatus.equals("Deactivate")){
			notice.setState("D");
		}
		noticesDao.updateNotices(notice);
	}

	@Override
	public EntryLogModel GetAllData() {		
		return noticesDao.GetAllData();
	}

	@Override
	public List<RTIApplications> getRTIApplications() {
		return noticesDao.getRTIApplications();
	}

	@Override
	public void saveRtiApplications(RTIApplications rti) {
		rti.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		rti.setCreated_on(MethodsHelper.getCurrentDate());
		rti.setApplication_received_h(NumbersEnglishToMarathi.convertInMarathi(String.valueOf(rti.getApplication_received())));
		rti.setApplication_disposed_h(NumbersEnglishToMarathi.convertInMarathi(String.valueOf(rti.getApplication_disposed())));
		rti.setApplication_pending_h(NumbersEnglishToMarathi.convertInMarathi(String.valueOf(rti.getApplication_pending())));

		noticesDao.saveRtiApplications(rti);
	}

	@Override
	public void deleteRTIApllication(int id) {
		noticesDao.deleteRTIApllication(id);
	}

	
	
}
