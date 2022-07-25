package com.cmsManagement.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.dto.AttachmentDto;
import com.cmsManagement.model.News;

public interface NewsService {
	
	List<News>  GetActiveNews();
	public void AddNews(News News,MultipartFile F,String path);
	void deleteNews(int id);
	public News ViewNews(int id);
	public void NewsUpdate(News News,MultipartFile F,String path,int AttachmentID) throws IOException;
	void DeleteAttachmentById(int attachmentID);
	
	
	//adminside
	public void UpdateStatus(News News);
	List<News> GetNewsListByStatus(String status);
	//frontside
	List<News> GetApprovedNews();
	List<News> GetdNewsByDates(String date1,String date2);
	ArrayList SearchByKeyWord(String str);
	
	public int saveNews(News News,MultipartFile english,MultipartFile marathi,String path);
	public void updateNews(News News,MultipartFile english,MultipartFile marathi,String path);
	
	public void UpdateNews(News News);
	
	//Native Query to get News and Attachment Info
	
		ArrayList<AttachmentDto> attachmentList();
		List<AttachmentDto> GetAttachmentDto();
		//no hibernate mapping
		public int AddNews(News News) throws ParseException;
		public boolean NewsUpdate(News News) throws ParseException;
		
		void changeNewsStaus1(int id, String string, String string2);
		void deleteApprovedNews(int id);
		List<News> getAllPendingDeactiveNews(String status);
		void deleteNewsStatus(String approvedStatus, String comment, int id);
		List<News> GetApprovedActiveNews();
	
}
