package com.cmsManagement.dto;

import java.util.List;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.Notices;

public class NoticeAttachmentsDto {

	private List<Notices> notice;
	private List<Attachment> attachment;
	
	
	public List<Notices> getNotice() {
		return notice;
	}
	public void setNotice(List<Notices> notice) {
		this.notice = notice;
	}
	public List<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	
}
