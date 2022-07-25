package com.cmsManagement.dto;

import java.util.List;



import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.News;

public class AttachmentDto {
	
	
   private int newsid;
   private int attachmentid;
   private String title;
   private String title_h;
   private String publishdate;
   private String newspaper;
   private String newspaper_h;
   private String state;
   private String approved;
   
   private int moduleid;
   private String moduletype;
   private String attachmentName;
   private String path;
@Override
public String toString() {
	return "AttachmentDto [newsid=" + newsid + ", title=" + title
			+ ", title_h=" + title_h + ", publishdate=" + publishdate
			+ ", newspaper=" + newspaper + ", newspaper_h=" + newspaper_h
			+ ", state=" + state + ", approved=" + approved + ", moduleid="
			+ moduleid + ", moduletype=" + moduletype + ", attachmentName="
			+ attachmentName + ", path=" + path + ", getClass()=" + getClass()
			+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
			+ "]";
}
public int getNewsid() {
	return newsid;
}
public void setNewsid(int newsid) {
	this.newsid = newsid;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getTitle_h() {
	return title_h;
}
public void setTitle_h(String title_h) {
	this.title_h = title_h;
}
public String getPublishdate() {
	return publishdate;
}
public void setPublishdate(String publishdate) {
	this.publishdate = publishdate;
}
public String getNewspaper() {
	return newspaper;
}
public void setNewspaper(String newspaper) {
	this.newspaper = newspaper;
}
public String getNewspaper_h() {
	return newspaper_h;
}
public void setNewspaper_h(String newspaper_h) {
	this.newspaper_h = newspaper_h;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getApproved() {
	return approved;
}
public void setApproved(String approved) {
	this.approved = approved;
}
public int getModuleid() {
	return moduleid;
}
public void setModuleid(int moduleid) {
	this.moduleid = moduleid;
}
public String getModuletype() {
	return moduletype;
}
public void setModuletype(String moduletype) {
	this.moduletype = moduletype;
}
public String getAttachmentName() {
	return attachmentName;
}
public void setAttachmentName(String attachmentName) {
	this.attachmentName = attachmentName;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public int getAttachmentid() {
	return attachmentid;
}
public void setAttachmentid(int attachmentid) {
	this.attachmentid = attachmentid;
}

  
    

}
