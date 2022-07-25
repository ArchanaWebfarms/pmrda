package com.cmsManagement.service;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.DownloadDao;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.NoticesDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.Notices;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

@Service
@Transactional
public class DownloadServiceImpl implements DownloadService {

	@Autowired
	DownloadDao downloadDao;
	
	@Autowired
	NoticesDao noticesDao;
	
	@Autowired
	FinancialYearDao financialYearDao;
	Attachment attachment;
	
/*
	@Override
	public List<Notices> getDownloadList() {
		return downloadDao.getDownloadList();
	}

	@Override
	public int saveDownload(Notices downloads, MultipartFile file, HttpSession session) {
		try {
			downloads.setState(Constants.ACTIVE_STATE);
			attachment=new Attachment();
			attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
			attachment.setModule_type(Constants.DOWNLOAD_MODULE);
			attachment.setState(Constants.ACTIVE_STATE);
      	
      		String path=session.getServletContext().getRealPath("/"); 
   		 String a =  file.getOriginalFilename();
         	String totalPath = path+a;
         	totalPath=totalPath.replace("\\", "/");
			file.transferTo(new File(totalPath));
			attachment.setAttachmnt_name(a);
	      attachment.setPath(totalPath);
	     	
	      downloads.setAttachment(attachment);
      		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
      		attachment.setFinancialYear(financialYear);
      		downloads.setFinancialYear(financialYear);
	      	downloads.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
	      	downloads.setPublishStatus(Constants.PENDING_STATUS);
	      	downloads.setCreated_date(MethodsHelper.getCurrentDateAndTime());
	      	downloads.setCategory(Constants.DOWNLOAD_CATEGORY);
      	} catch (Exception e) {e.printStackTrace();} 
		return downloadDao.saveDownload(downloads);
	}

	@Override
	public boolean updateDownload(Notices downloads, MultipartFile file, HttpSession session) {
		Notices download=noticesDao.findNoticesById(downloads.getNoticeID());
		try {
		  if(downloads.getAttachment().getAttachmentID()==0){	
				attachment=new Attachment();
				attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
				attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
				attachment.setModule_type(Constants.NOTICE_MODULE);
				attachment.setState(Constants.ACTIVE_STATE);
				attachment.setAttachmentID(downloads.getAttachment().getAttachmentID());
      	
	      		String path=session.getServletContext().getRealPath("/"); 
	      		String a =  file.getOriginalFilename();
	         	String totalPath = path+a;
	         	totalPath=totalPath.replace("\\", "/");
				attachment.setAttachmnt_name(a);
			      attachment.setPath(totalPath);
			      download.setAttachment(attachment);
		  }     
			  download.setTitle(downloads.getTitle());
			  download.setDescription(downloads.getDescription());
			  download.setPublish_date(downloads.getPublish_date());
			  download.setType(downloads.getType());
			  download.setTags(downloads.getTags());
			  download.setDepartment(downloads.getDepartment());
			  download.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			  download.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		  } catch (Exception e) {e.printStackTrace();} 
		return downloadDao.updateDownload(downloads);
	}

	@Override
	public List<Notices> getDownloadListByStatus(String downloadStatus) {
		return downloadDao.getDownloadListByStatus(downloadStatus);
	}

	@Override
	public boolean changeDownloadStaus(int noticeID, String comment, String status) {
		Notices download=noticesDao.findNoticesById(noticeID);
		download.setComment(comment);
		download.setPublishStatus(status);
		//download.setApprovalBy();
		download.setApproveddate(MethodsHelper.getCurrentDateAndTime());
		return downloadDao.updateDownload(download);
	}
*/
}
