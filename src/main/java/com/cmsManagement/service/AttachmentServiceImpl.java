package com.cmsManagement.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.AttachmentDao;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.GalaryCategory;
import com.cmsManagement.model.Video;
import com.cmsManagement.model.VisitorCounter;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;

@Service()
@Transactional
public class AttachmentServiceImpl implements AttachmentService {
	@Autowired
	FinancialYearDao financialYearDao;
	@Autowired
	AttachmentDao attachmentdao;
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");
	LocalDateTime now = LocalDateTime.now();
	String date = dtf.format(now).toString();

	@Override
	public List<Attachment> getAttachmentList() {

		return attachmentdao.getAttachmentList();
	}

	@Override
	public int SaveGalaryCategory(GalaryCategory galarycategory) {
		galarycategory.setCreated_by(LoginController.getCurrentLoggedInUser()
				.getUser().getUser_id());
		galarycategory.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		FinancialYear financialYear = financialYearDao
				.getCurrentActiveFinancialYear();
		galarycategory.setFinancialYear(financialYear);

		return attachmentdao.SaveGalaryCategory(galarycategory);
	}

	@Override
	public List<GalaryCategory> getGalaryCategoryList() {

		return attachmentdao.getGalaryCategoryList();
	}

	@Override
	public void SaveAttachment(List<MultipartFile> file, int galary_cate_id,
			String path) {

		for (int i = 0; i < file.size(); i++) {

			Attachment attachment = new Attachment();

			attachment.setCreated_by(LoginController.getCurrentLoggedInUser()
					.getUser().getUser_id());
			attachment.setCreated_date(date);
			FinancialYear financialYear = financialYearDao
					.getCurrentActiveFinancialYear();
			attachment.setFinancialYear(financialYear);

			attachment.setAttachmnt_name(file.get(i).getOriginalFilename());
			String fullpath = path + file.get(i).getOriginalFilename();
			attachment.setPath(fullpath);
			try {
				file.get(i).transferTo(new File(fullpath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			attachment.setGalary_cateID(galary_cate_id);
			attachmentdao.SaveAttachment(attachment);

		}

	}

	@Override
	public List<Attachment> getAttachmentListByGalaryCateID(int galary_cate_id) {
		// TODO Auto-generated method stub
		return attachmentdao.getAttachmentListByGalaryCateID(galary_cate_id);
	}

	@Override
	public GalaryCategory viewImages(int id) {

		return attachmentdao.viewImages(id);
	}

	@Override
	public void deleteAttachmentByGalaryCateID(int galary_cate_id) {

		attachmentdao.deleteAttachmentByGalaryCateID(galary_cate_id);
	}

	@Override
	public void deleteGalaryCateID(int galary_cate_id) {
		attachmentdao.deleteGalaryCateID(galary_cate_id);

	}

	@Override
	public GalaryCategory getGalaryCateByID(int galary_cate_id) {

		return attachmentdao.getGalaryCateByID(galary_cate_id);
	}

	@Override
	public List<GalaryCategory> getGalaryCategoryListByFinancialID(
			int financialYear) {

		return attachmentdao.getGalaryCategoryListByFinancialID(financialYear);
	}

	@Override
	public int SaveAttachment(List<Attachment> list) {

		return attachmentdao.SaveAttachment(list);
	}

	@Override
	public void SaveAttachment(Attachment attachment) {
		attachmentdao.SaveAttachment(attachment);

	}

	@Override
	public List<Attachment> getAttachmentByModuleID(int module_id,String category) {
		// TODO Auto-generated method stub
		return attachmentdao.getAttachmentByModuleID(module_id,category);
	}

	@Override
	public void saveattachment(String path, MultipartFile attachment,
			String CheckFile, int noiceID,String category,String title) {
		Attachment attachmentobj = new Attachment();
		FinancialYear financialYear = financialYearDao
				.getCurrentActiveFinancialYear();
		if (!attachment.isEmpty()) {

			if (CheckFile.equals("english")) {
				String filename = attachment.getOriginalFilename();
				try {
					attachment.transferTo(new File(path + filename));

				} catch (IllegalStateException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
				attachmentobj.setModuleID(noiceID);
				attachmentobj.setPath(path + filename);
				attachmentobj.setAttachmnt_name(filename);
				attachmentobj.setFinancialYear(financialYear);
				attachmentobj.setState("A");
				attachmentobj.setModule_type("English Attachment");
				attachmentobj.setCreated_date(date);
				attachmentobj.setCategory(category);
				attachmentobj.setTitle(title);				
				File file = new File(path + filename);
				long fileSizeInMB = (file.length() / 1024);
				attachmentobj.setSize(String.valueOf(fileSizeInMB));
				String ext = FilenameUtils.getExtension(filename); 
				attachmentobj.setExtension(ext);

			} else {
				String filename = attachment.getOriginalFilename();
				try {
					attachment.transferTo(new File(path + filename));

				} catch (IllegalStateException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
				attachmentobj.setPath(path + filename);
				attachmentobj.setAttachmnt_name(filename);
				attachmentobj.setFinancialYear(financialYear);
				attachmentobj.setState("A");
				attachmentobj.setModule_type("Marathi Attachment");
				attachmentobj.setCreated_date(date);
				attachmentobj.setModuleID(noiceID);
				attachmentobj.setCategory(category);
				attachmentobj.setTitle(title);
				File file = new File(path + filename);	          
				long fileSizeInMB =  (file.length() /  1024);
				attachmentobj.setSize(String.valueOf(fileSizeInMB));	            
				String ext = FilenameUtils.getExtension(filename); 
				attachmentobj.setExtension(ext);
			}
		}

		attachmentdao.SaveAttachment(attachmentobj);
	}

	@Override
	public boolean deleteAttachmentByID(int id) {
		return attachmentdao.deleteAttachmentByID(id);

	}

	@Override
	public void UpdateAttachmentByID(String path, MultipartFile attachment,
			String checkFile, int moduleID) {
		List<Attachment> attachmentlist = attachmentdao
				.getAttachmentByModuleIDCheckForSize(moduleID);
		int size;
		String moduetype = null;
		for (int i = 0; i < attachmentlist.size(); i++) {
			moduetype = attachmentlist.get(i).getModule_type();

		}
		size = attachmentlist.size();

		if (size == 1 && moduetype.equals("Marathi Attachment")) {

			Attachment attachmentobj = new Attachment();
			FinancialYear financialYear = financialYearDao
					.getCurrentActiveFinancialYear();
			if (checkFile.equals("english")) {
				String filename = attachment.getOriginalFilename();
				try {
					attachment.transferTo(new File(path + filename));

				} catch (IllegalStateException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
				attachmentobj.setModuleID(moduleID);
				attachmentobj.setPath(path + filename);
				attachmentobj.setAttachmnt_name(filename);
				attachmentobj.setFinancialYear(financialYear);
				attachmentobj.setState("A");
				attachmentobj.setModule_type("English Attachment");
				attachmentobj.setCreated_date(date);
				attachmentdao.SaveAttachment(attachmentobj);
			}

		} else if (size == 1 && moduetype.equals("English Attachment")) {

			Attachment attachmentobj = new Attachment();
			FinancialYear financialYear = financialYearDao
					.getCurrentActiveFinancialYear();
			if (checkFile.equals("marathi")) {
				String filename = attachment.getOriginalFilename();
				try {
					attachment.transferTo(new File(path + filename));

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
				attachmentobj.setModuleID(moduleID);
				attachmentobj.setPath(path + filename);
				attachmentobj.setAttachmnt_name(filename);
				attachmentobj.setFinancialYear(financialYear);
				attachmentobj.setState("A");
				attachmentobj.setModule_type("Marathi Attachment");
				attachmentobj.setCreated_date(date);
				attachmentdao.SaveAttachment(attachmentobj);
			}
		} else {

			Attachment marathi = new Attachment();
			Attachment english = new Attachment();
			FinancialYear financialYear = financialYearDao
					.getCurrentActiveFinancialYear();
			if (checkFile.equals("marathi")) {
				if (!attachment.isEmpty()) {
					String filename = attachment.getOriginalFilename();
					try {
						attachment.transferTo(new File(path + filename));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}

					marathi.setModuleID(moduleID);
					marathi.setPath(path + filename);
					marathi.setAttachmnt_name(filename);
					marathi.setFinancialYear(financialYear);
					marathi.setState("A");
					marathi.setModule_type("Marathi Attachment");
					marathi.setCreated_date(date);
					attachmentdao.UpdateAttachmentByID(marathi, moduleID);
				}

			}
			if (checkFile.equals("english")) {
				if (!attachment.isEmpty()) {
					String filename = attachment.getOriginalFilename();
					try {
						attachment.transferTo(new File(path + filename));

					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					english.setModuleID(moduleID);
					english.setPath(path + filename);
					english.setAttachmnt_name(filename);
					english.setFinancialYear(financialYear);
					english.setState("A");
					english.setModule_type("English Attachment");
					english.setCreated_date(date);
					attachmentdao.UpdateAttachmentByID(english, moduleID);
				}

			}

		}

	}

	@Override
	public int saveattachment1(String path, MultipartFile english,
			String checkFile, int noiceID, String category, String title) {
		Attachment attachmentobj = new Attachment();
		FinancialYear financialYear = financialYearDao
				.getCurrentActiveFinancialYear();
		if (!english.isEmpty()) {

			if (checkFile.equals("english")) {
				String filename = english.getOriginalFilename();
				try {
					english.transferTo(new File(path + filename));

				} catch (IllegalStateException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
				attachmentobj.setModuleID(noiceID);
				attachmentobj.setPath(path + filename);
				attachmentobj.setAttachmnt_name(filename);
				attachmentobj.setFinancialYear(financialYear);
				attachmentobj.setState("A");
				attachmentobj.setModule_type("English Attachment");
				attachmentobj.setCreated_date(date);
				attachmentobj.setCategory(category);
				attachmentobj.setTitle(title);				
				File file = new File(path + filename);
				long fileSizeInMB = (file.length() / 1024);
				attachmentobj.setSize(String.valueOf(fileSizeInMB));
				String ext = FilenameUtils.getExtension(filename); 
				attachmentobj.setExtension(ext);

			} else {
				String filename = english.getOriginalFilename();
				try {
					english.transferTo(new File(path + filename));

				} catch (IllegalStateException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
				attachmentobj.setPath(path + filename);
				attachmentobj.setAttachmnt_name(filename);
				attachmentobj.setFinancialYear(financialYear);
				attachmentobj.setState("A");
				attachmentobj.setModule_type("Marathi Attachment");
				attachmentobj.setCreated_date(date);
				attachmentobj.setModuleID(noiceID);
				attachmentobj.setCategory(category);
				attachmentobj.setTitle(title);
				File file = new File(path + filename);	          
				long fileSizeInMB =  (file.length() /  1024);
				attachmentobj.setSize(String.valueOf(fileSizeInMB));	            
				String ext = FilenameUtils.getExtension(filename); 
				attachmentobj.setExtension(ext);
			}
		}

		int id=attachmentdao.SaveAttachment1(attachmentobj);
		return id;
	}//method

	@Override
	public Attachment getAttachmentBy_ModuleID(int module_id, String string) {

		return attachmentdao.getAttachmentByModule_ID(module_id, string);
	}

	@Override
	public EntryLogModel getEntryLogById(int id) {		
		return attachmentdao.getEntryLogById(id);
	}

	@Override
	public void deleteAttachment(int id) {
		attachmentdao.deleteAttachment(id);
	}

	@Override
	public List<Attachment> getAttachmentByModuleType(String type) {		
		return attachmentdao.getAttachmentByModuleType(type);
	}

	@Override
	public VisitorCounter getCurrentDate(String date) {		
		return attachmentdao.getCurrentDate(date);
	}

	@Override
	public List<VisitorCounter> getVisiorList() {		
		return attachmentdao.getVisiorList();
	}

	@Override
	public void saveVisitorCount(String today, int dailycount, int totalcount) {
		VisitorCounter counter=new VisitorCounter();
		counter.setDate(today);
		counter.setDatewise_count(dailycount);
		counter.setTotal_count(totalcount);

		attachmentdao.saveVisitorCount(counter);
	}

	@Override
	public void updateVisitorCount(VisitorCounter visitor) {
		attachmentdao.updateVisitorCount(visitor);
	}

	@Override
	public void SaveAttachment(MultipartFile file, String path,String title, String titleh,String type) {
		Attachment attachment = new Attachment();

		attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		attachment.setCreated_date(date);
		attachment.setTitle_h(titleh);
		attachment.setTitle(title);
		attachment.setCategory(type);
		attachment.setState("A");

		attachment.setAttachmnt_name(file.getOriginalFilename());
		String fullpath = path + file.getOriginalFilename();
		attachment.setPath(fullpath);
		try {
			file.transferTo(new File(fullpath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		attachmentdao.SaveAttachment(attachment);
	}

	@Override
	public void saveVideo(String path, String title, String titleh) {
		Video video=new Video();
		
		video.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		video.setCreated_date(date);
		video.setTitle_h(titleh);
		video.setTitle(title);		
		video.setState("A");
		video.setLink(path);
		
		/*Prevent Video from XSS attack*/
		video=PreventionFromXSSAttack.preventVideo(video);
		
		attachmentdao.saveVideo(video);
	}

	@Override
	public void deleteVideo(int id) {
		attachmentdao.deleteVideo(id);
	}

	@Override
	public List<Video> getAllVideo() {		
		return attachmentdao.getAllVideo();
	}

	@Override
	public Video getVideoById(int id) {		
		return attachmentdao.getVideoById(id);
	}

	@Override
	public void editVideo(String path, String title, String titleh,int id) {
		Video video=attachmentdao.getVideoById(id);
		video.setTitle(title);
		video.setTitle_h(titleh);
		video.setLink(path);
		
		/*Prevent Video from XSS attack*/
		video=PreventionFromXSSAttack.preventVideo(video);
		
		attachmentdao.editVideo(video);
	}

	@Override
	public void uploadUserMannual(MultipartFile attachment_eng,String path,String category,String title) {
		Attachment attachment = new Attachment();

		attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		attachment.setCreated_date(date);		
		attachment.setCategory(category);
		attachment.setState("A");
		attachment.setTitle(title);

		if(!attachment_eng.isEmpty()){
			attachment.setAttachmnt_name(attachment_eng.getOriginalFilename());
			String fullpath = path + attachment_eng.getOriginalFilename();
			attachment.setPath(fullpath);
			try {
				attachment_eng.transferTo(new File(fullpath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//attachmentdao.deleteAttachmentByCategory("USERMANNUAL");
		
		attachmentdao.SaveAttachment(attachment);
		
	}

	@Override
	public Attachment getAttachmentById(int id) {		
		return attachmentdao.getAttachmentById(id);
	}

	

	@Override
	public void deleteTodayEntry(int id) {
		attachmentdao.deleteTodayEntry(id);
	}

	@Override
	public VisitorCounter getLastCounter(String today) {
		return attachmentdao.getLastCounter(today);
	}

	

}//class
