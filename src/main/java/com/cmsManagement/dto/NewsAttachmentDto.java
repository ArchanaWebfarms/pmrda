package com.cmsManagement.dto;

import java.util.List;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.News;

public class NewsAttachmentDto {

	private List<News> news;
	private List<Attachment> attachment;
	
	public List<News> getNews() {
		return news;
	}
	public void setNews(List<News> news) {
		this.news = news;
	}
	public List<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	
}
