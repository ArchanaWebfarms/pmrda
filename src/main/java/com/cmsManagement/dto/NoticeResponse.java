package com.cmsManagement.dto;

import java.util.List;

import com.cmsManagement.model.Attachment;


public class NoticeResponse {

	private String title;
	private String title_h;
	private String type;
	private String department;	
	private String department_h;	
	private String publish_date;	
	private String  closingDate;
  private List<Attachment> attachmentList;
 

  
	public String getTitle_h() {
	return title_h;
}
public void setTitle_h(String title_h) {
	this.title_h = title_h;
}
	public List<Attachment> getAttachmentList() {
	return attachmentList;
}
public void setAttachmentList(List<Attachment> attachmentList) {
	this.attachmentList = attachmentList;
}
	public String getDepartment_h() {
		return department_h;
	}
	public void setDepartment_h(String department_h) {
		this.department_h = department_h;
	}

public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public String getPublishDate() {
	return publish_date;
}
public void setPublishDate(String publish_date) {
	this.publish_date = publish_date;
}
public String getClosingDate() {
	return closingDate;
}
public void setClosingDate(String closingDate) {
	this.closingDate = closingDate;
}

   
}//class
