package com.cmsManagement.service;


import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.NewsDao;
import com.cmsManagement.dto.AttachmentDto;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.News;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;
@Service()
@Transactional
public class NewsServiceImpl implements NewsService {
	@Autowired
	FinancialYearDao financialYearDao;
		@Autowired
		NewsDao newsdao;
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");
		LocalDateTime now = LocalDateTime.now();
		String date =   dtf.format(now).toString();
		int idd=0;
		
	
		@Override
		public List<News>  GetActiveNews() {
		
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		return newsdao.GetActiveNews();
		}

	    @Override
	    public void AddNews(News news,MultipartFile File,String path) {
		Attachment attachment = new Attachment();
	    String filename=File.getOriginalFilename();
		String fullpath= path+filename;
		try {
		File.transferTo(new File(fullpath));
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}
        attachment.setPath(fullpath);
    	attachment.setAttachmnt_name(filename);
    	news.setCreatedby(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
    	news.setCreated_date(date);
    	news.setUrl("pmrda_news");
    	news.setType("NEWS");
    	FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
    	news.setFinancialYear(financialYear);
    	attachment.setFinancialYear(financialYear);
		news.setStatus("pendding");
		news.setActivestatus("A");
		attachment.setState("A");
		attachment.setModule_type("NEWS");
		attachment.setCreated_date(date);
    	//news.setAttachment(attachment);
	    newsdao.AddNews(news);
			
	    }

		@Override
		public void deleteNews(int id) {
		newsdao.deleteNews(id);
		}
	
		@Override
		public News ViewNews(int id) {
		return newsdao.ViewNews(id);
		}

	    @Override
	    public void NewsUpdate(News news,MultipartFile File,String path,int AttachmentID) throws java.io.IOException {

	    	try {
	    		Attachment attachment=new Attachment();
		    	 if(AttachmentID==0){
		      		attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
					attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
					attachment.setModule_type("NEWS");
					attachment.setState("A");
					news.setStatus("pendding");
					FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		      		attachment.setFinancialYear(financialYear);
					//attachment.setAttachmentID(news.getAttachment().getAttachmentID());
					String filename=File.getOriginalFilename();
					String fullpath= path+filename;
					 attachment.setPath(fullpath);
					 attachment.setAttachmnt_name(filename);
					 File.transferTo(new File(fullpath));
					 attachment.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
					 attachment.setUpdated_date(date);
					// news.setAttachment(attachment);
					}
		    	 attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
					attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
					attachment.setModule_type("NEWS");
					attachment.setState("A");
				//	attachment.setAttachmentID(news.getAttachment().getAttachmentID());
					
					 attachment.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
					 attachment.setUpdated_date(date);
					// news.setAttachment(attachment);
					
		    	 news.setTitle(news.getTitle());
		    	 news.setNewspaper(news.getNewspaper());
		    	 news.setSubtitle(news.getSubtitle());
		    	 news.setDescription(news.getDescription());
		    	 news.setPublish_date(news.getPublish_date());
		    	 news.setTag(news.getTag());
		    	 news.setStatus("pendding");
		    	 news.setUpdationdate(date);
		    		news.setUrl("pmrda_news");
		        	news.setType("NEWS");
		    	 int x = LoginController.getCurrentLoggedInUser().getUser().getUser_id();
		     	Long updatedBy = new Long(x);
		     	news.setUpdatedby(updatedBy);
		     
		      } catch (Exception e ) {e.printStackTrace();} 
	    	
	    	  newsdao.NewsUpdate(news);
	    	/*Attachment	attachment=new Attachment();
	    	try {
	    		
				attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
				attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
				attachment.setModule_type("NEWS");
				attachment.setState("A");
				attachment.setAttachmentID(news.getAttachment().getAttachmentID());
				if(news.getAttachment().getAttachmentID()==0){
				
	      	 String filename=File.getOriginalFilename();
	     

	         	String totalPath = path+filename;
	         	totalPath=totalPath.replace("\\", "/");
				attachment.setAttachmnt_name(filename);
		      attachment.setPath(totalPath);
				}
		      news.setAttachment(attachment);
			} catch (Exception e) {e.printStackTrace();} 		
			news.setAttachment(attachment);
			int x = LoginController.getCurrentLoggedInUser().getUser().getUser_id();
	    	Long updatedBy = new Long(x);
	    	news.setUpdatedby(updatedBy);
	    	news.setUpdationdate(date);
	    	newsdao.NewsUpdate(news);*/
		/*Attachment attachment = new Attachment();
	    String filename=File.getOriginalFilename();
	    String fullpath= path+filename;


		
        try {
		File.transferTo(new File(fullpath));
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}
        attachment.setPath(fullpath);
    	attachment.setAttachmnt_name(filename);
    	int x = LoginController.getCurrentLoggedInUser().getUser().getUser_id();
    	Long updatedBy = new Long(x);
    	news.setUpdatedby(updatedBy);
    	news.setUpdationdate(date);
		news.setStatus("pendding");
		news.setActivestatus("A");
		attachment.setState("A");
		attachment.setModule_type("NEWS");
		attachment.setUpdated_date(date);
    	news.setAttachment(attachment);
	    newsdao.NewsUpdate(news);*/
	    }

		@Override
		public void DeleteAttachmentById(int attachmentID) {
		newsdao.DeleteAttachmentById(attachmentID);
		}
	
		@SuppressWarnings("deprecation")
		@Override
		public void UpdateStatus(News News) {
	    
	    News.setApprovalBy(LoginController.getCurrentLoggedInUser().getUser().getFirstName()+" "+LoginController.getCurrentLoggedInUser().getUser().getLastName());	  
		News.setApproveddate(date);
		
		/*Prevent News From XSS attack*/
		News.setComment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(News.getComment())));
		News.setApprovalBy(StringEscapeUtils.escapeHtml4(News.getApprovalBy()));		
		News=PreventionFromXSSAttack.preventNews(News);
		
		newsdao.UpdateStatus(News);
		}
	
		@Override
		public List<News> GetNewsListByStatus(String status) {
		return newsdao.GetNewsListByStatus(status);
		}
	
		@Override
		public List<News> GetApprovedNews() {

		return newsdao.GetApprovedNews();
	    }

		@Override
		public List<News> GetdNewsByDates(String date1, String date2) {
			// TODO Auto-generated method stub
			return newsdao.GetdNewsByDates(date1, date2);
		}

		@Override
		public ArrayList<News> SearchByKeyWord(String str) {
			// TODO Auto-generated method stub
			return newsdao.SearchByKeyWord(str);
		}

		
		@Override
		public int saveNews(News news, MultipartFile english,MultipartFile marathi, String path) {
			/*String path1=path;
			List<Attachment> attachmentlist = new ArrayList<Attachment>();
			Attachment Englishattachment = new Attachment();
			Attachment Marathiattachment = new Attachment();
			 String Englishfilename=english.getOriginalFilename();
			 String Marathiname=marathi.getOriginalFilename();
			 FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
			 try {
				english.transferTo(new File(path+Englishfilename));
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 try {
					
					marathi.transferTo(new File(path1+Marathiname));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 Englishattachment.setPath(path+Englishfilename);
			 Englishattachment.setAttachmnt_name(Englishfilename);
			 Englishattachment.setFinancialYear(financialYear);
			 Englishattachment.setState("A");
			 Englishattachment.setModule_type("English Attachment");
			 Englishattachment.setCreated_date(date);
			  Englishattachment.setNews(news);
			  attachmentlist.add(Englishattachment);
			  
			 news.getAttachment().add(Englishattachment);
			 Marathiattachment.setPath(path+Marathiname);
			 Marathiattachment.setAttachmnt_name(Marathiname);
			 Marathiattachment.setFinancialYear(financialYear);
			 Marathiattachment.setState("A");
			 Marathiattachment.setModule_type("Marathi Attachment");
			 Marathiattachment.setCreated_date(date);
			 Marathiattachment.setNews(news);
			 attachmentlist.add(Marathiattachment);
			 
			 news.setAttachment(attachmentlist);
			 
			 
			news.getAttachment().add(Marathiattachment);
			news.setCreatedby(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
	    	news.setCreated_date(date);
	    	news.setUrl("pmrda_news");
	    	news.setType("NEWS");
	    	
	    	news.setFinancialYear(financialYear);
	    	
			news.setStatus("pendding");
			news.setActivestatus("A");
			*/
			
			
			
			 
				
			
				
				
				
				
				
				
				
			/*try {
				Set<Attachment > attachmentset = new HashSet<Attachment>();
				Attachment Englishattachment = new Attachment();
				Attachment Marathiattachment = new Attachment();
				Englishattachment.setNews(news);
				Marathiattachment.setNews(news);
				 String Englishfilename=english.getOriginalFilename();
				    String marathifilename=marathi.getOriginalFilename();
				english.transferTo(new File(path+Englishfilename));
			
				Englishattachment.setPath(path+Englishfilename);
				Marathiattachment.setPath(path+marathifilename);
				Englishattachment.setAttachmnt_name(Englishfilename);
				Marathiattachment.setAttachmnt_name(marathifilename);
				Englishattachment.setFinancialYear(financialYear);
				Marathiattachment.setFinancialYear(financialYear);
				
				Englishattachment.setState("A");
				Marathiattachment.setState("A");
				Englishattachment.setModule_type("NEWS");
				Marathiattachment.setModule_type("NEWS");
				Englishattachment.setCreated_date(date);
				Marathiattachment.setCreated_date(date);
				attachmentset.add(Englishattachment);
				attachmentset.add(Marathiattachment);
				news.setAttachment(attachmentset);
			}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}*/
	      return newsdao.AddNews(news);
		}

		@Override
		public void UpdateNews(News news) {
			news.setStatus("pendding");
	    	 news.setUpdationdate(date);
	    		news.setUrl("pmrda_news");
	        	news.setType("NEWS");
	    	 int x = LoginController.getCurrentLoggedInUser().getUser().getUser_id();
	     	Long updatedBy = new Long(x);
	     	news.setUpdatedby(updatedBy);
			newsdao.UpdateNews(news);
			
		}

		@Override
		public ArrayList<AttachmentDto> attachmentList() {
			// TODO Auto-generated method stub
			return newsdao.attachmentList();
		}

		@Override
		public List<AttachmentDto> GetAttachmentDto() {
			// TODO Auto-generated method stub
			return newsdao.GetAttachmentDto();
		}

		@Override
		public void updateNews(News News, MultipartFile english,MultipartFile marathi, String path) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public int AddNews(News news) throws ParseException {
			news.setCreatedby(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
	    	news.setCreated_date(date);
	    	news.setUrl("pmrda_news");
	    	news.setType("NEWS");
	    	FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
	    	news.setFinancialYear(financialYear);
	    	news.setStatus("Pending");
			news.setActivestatus("A");
			news.setDelete_approval_status("Active");
			news.setPublish_date_h(MethodsHelper.convertDateInMarathi(news.getPublish_date()));
			
			return newsdao.AddNews(news);
		}

		@Override
		public boolean  NewsUpdate(News News) throws ParseException {
			News info=newsdao.ViewNews(News.getNewsid());
			    int x = LoginController.getCurrentLoggedInUser().getUser().getUser_id();			   
			    info.setApprovalBy(LoginController.getCurrentLoggedInUser().getUser().getUsername());
			    info.setApproveddate(date);				
			    info.setStatus("Pending");
			    info.setTitle(News.getTitle());
			    info.setTitle_h(News.getTitle_h());
			    info.setPublish_date(News.getPublish_date());
			    info.setDescription(News.getDescription());
			    info.setDescription_h(News.getDescription_h());
			    info.setDelete_approval_status("Active");
			    info.setPublish_date_h(MethodsHelper.convertDateInMarathi(News.getPublish_date()));
			    
			return newsdao.UpdateNews(News);			
		}

		@Override
		public void changeNewsStaus1(int id, String string, String string2) {
			String date=MethodsHelper.getCurrentDateAndTime();
			newsdao.changeNewsStaus1(id, string, date, string2);
			
		}

		@Override
		public void deleteApprovedNews(int id) {
			News news=newsdao.ViewNews(id);
			news.setDelete_approval_status("Pending");
			
			newsdao.UpdateNews(news);	
		}

		@Override
		public List<News> getAllPendingDeactiveNews(String status) {			
			return newsdao.getAllPendingDeactiveNews(status);
		}

		@SuppressWarnings("deprecation")
		@Override
		public void deleteNewsStatus(String approvedStatus, String comment,int id) {
			News news=newsdao.ViewNews(id);
			news.setDelete_approval_status(StringEscapeUtils.escapeHtml4(approvedStatus));
			news.setDelete_approved_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			news.setDelete_approval_date(MethodsHelper.getCurrentDate());
			news.setDelete_approval_comment(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(comment)));			
			
			if(approvedStatus.equals("Deactivate")){
				news.setActivestatus("D");
			}
			
			newsdao.UpdateNews(news);	
		}

		@Override
		public List<News> GetApprovedActiveNews() {
			return newsdao.GetApprovedActiveNews();
		}

	
        }
