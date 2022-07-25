package com.cmsManagement.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.GalaryCategory;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Video;
import com.cmsManagement.model.VisitorCounter;

public interface AttachmentDao {
	List<Attachment> getAttachmentList();
	
	int SaveGalaryCategory(GalaryCategory galarycategory);
	
	List<GalaryCategory> getGalaryCategoryList();
	
	List<GalaryCategory> getGalaryCategoryListByFinancialID(int financialYear);
	
	
	void SaveAttachment(Attachment attachment);
	void SaveAttachmentNew(List<MultipartFile> file,int galary_cate_id,String path);
	
	List<Attachment> getAttachmentListByGalaryCateID(int galary_cate_id);
	GalaryCategory viewImages(int id);
	void deleteAttachmentByGalaryCateID(int galary_cate_id);
	void deleteGalaryCateID(int galary_cate_id);
	GalaryCategory getGalaryCateByID(int galary_cate_id);
	List<Attachment> getAttachmentByModuleID(int module_id, String category);
	Attachment getAttachmentByModule_ID(int module_id, String category);
	List<Attachment> getAttachmentByModuleIDCheckForSize(int module_id);
	int SaveAttachment( List<Attachment> list);

	void saveattachment(String path, MultipartFile attachment);
	boolean deleteAttachmentByID(int id);
	void UpdateAttachmentByID(Attachment attachmentobj,int id);
	
	
	int SaveAttachment1(Attachment attachment);

	EntryLogModel getEntryLogById(int id);

	void deleteAttachment(int id);

	List<Attachment> getAttachmentByModuleType(String type);

	VisitorCounter getCurrentDate(String date);

	List<VisitorCounter> getVisiorList();

	void saveVisitorCount(VisitorCounter counter);

	void updateVisitorCount(VisitorCounter visitor);

	void saveVideo(Video video);

	void deleteVideo(int id);

	List<Video> getAllVideo();

	Video getVideoById(int id);

	void editVideo(Video video);

	void deleteAttachmentByCategory(String category);

	Attachment getAttachmentById(int id);

	void deleteTodayEntry(int id);

	VisitorCounter getLastCounter(String today);

	
	
	
}
