package com.cmsManagement.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.dto.AttachmentDto;
import com.cmsManagement.model.News;




public interface NewsDao {
	//userside
	List<News> GetActiveNews();
	public int AddNews(News News);
	
	public int GetLastInsertedID();
	void deleteNews(int id);
	public News ViewNews(int id);
	public void NewsUpdate(News News);
	public boolean UpdateNews(News News);
	void DeleteAttachmentById(int attachmentID);
	//adminside
	public void UpdateStatus(News News);
	List<News> GetNewsListByStatus(String status);
	//frontside
	List<News> GetApprovedNews();
	List<News> GetdNewsByDates(String date1,String date2);
	ArrayList<News> SearchByKeyWord(String str);
	
	//Native Query to get News and Attachment Info
	
	ArrayList<AttachmentDto> attachmentList();
	List<AttachmentDto> GetAttachmentDto();
	
	//Store Procedure
	public int AddNewsStoreProcedure(News News);
	public void UpdateNewsStoreProcedure(News News);
	List<AttachmentDto> getNewsAttachmentList();
	
	void changeNewsStaus1(int id, String string,String date, String string2);
	List<News> getAllPendingDeactiveNews(String status);
	List<News> GetApprovedActiveNews();
}
