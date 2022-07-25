package com.cmsManagement.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.GalaryCategory;
import com.cmsManagement.model.Video;
import com.cmsManagement.model.VisitorCounter;

public interface AttachmentService {
	List<Attachment> getAttachmentList();
	int SaveGalaryCategory(GalaryCategory galarycategory);
	List<GalaryCategory> getGalaryCategoryList();
	void SaveAttachment(List<MultipartFile> attachment,int galary_cate_id,String path);
	List<Attachment> getAttachmentListByGalaryCateID(int galary_cate_id);
	GalaryCategory viewImages(int id);
	void deleteAttachmentByGalaryCateID(int galary_cate_id);
	void deleteGalaryCateID(int galary_cate_id);
	GalaryCategory getGalaryCateByID(int galary_cate_id);
	List<GalaryCategory> getGalaryCategoryListByFinancialID(int financialYear);
	int SaveAttachment( List<Attachment> list);
	void SaveAttachment(Attachment attachment);
	void saveattachment(String path,MultipartFile english,String checkFile,int noiceID, String string, String title);
	List<Attachment> getAttachmentByModuleID(int module_id, String string);
	Attachment getAttachmentBy_ModuleID(int module_id, String string);
	boolean deleteAttachmentByID(int id);
	void UpdateAttachmentByID(String path,MultipartFile english,String checkFile,int moduleID);
	
	int saveattachment1(String path,MultipartFile english,String checkFile,int noiceID, String string, String title);
	EntryLogModel getEntryLogById(int parseInt);
	void deleteAttachment(int id);
	List<Attachment> getAttachmentByModuleType(String type);
	VisitorCounter getCurrentDate(String today);
	List<VisitorCounter> getVisiorList();
	void saveVisitorCount(String today, int i, int j);
	
	void updateVisitorCount(VisitorCounter visitor);
	void SaveAttachment(MultipartFile attachment, String path, String title,String titleh, String type);
	void saveVideo(String path, String title, String titleh);
	void deleteVideo(int id);
	List<Video> getAllVideo();
	Video getVideoById(int id);
	void editVideo(String path, String title, String titleh, int id);
	void uploadUserMannual(MultipartFile attachment,String category, String path, String title);
	
	Attachment getAttachmentById(int id);
	void deleteTodayEntry(int i);
	VisitorCounter getLastCounter(String trim);
	
}
