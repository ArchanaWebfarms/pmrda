package com.cmsManagement.dto;

import java.util.List;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.Tendors;

public class TendorAttachmentDto {

	private List<Tendors> tendor;
	private List<Attachment> attachment;
	
	
	public List<Tendors> getTendor() {
		return tendor;
	}
	public void setTendor(List<Tendors> tendor) {
		this.tendor = tendor;
	}
	public List<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	
	
}
