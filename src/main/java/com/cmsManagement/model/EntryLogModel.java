package com.cmsManagement.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="entry_log")
public class EntryLogModel {
	private int id;
	private int title_id;
	private String title; 
	//private int  Attachment_id;
	//private Attachment attachment_id;
	String  Type;
	String table_name;
	String MODIFIED_ON;
	private String title_h;
	private String status;

	@Column(name = "title_h", nullable =false,updatable = false)
	public String getTitle_h() {
		return title_h;
	}
	public void setTitle_h(String title_h) {
		this.title_h = title_h;
	}
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "title_id", nullable =false,updatable = false)
	public int getTitle_id() {
		return title_id;
	}
	public void setTitle_id(int title_id) {
		this.title_id = title_id;
	}
	@Column(name = "title", nullable =false,updatable = false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	/*@JoinColumn(name="Attachment_id", nullable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	//@Column(name = "Attachment_id", nullable =false,updatable = false)
	public Attachment getAttachment_id() {
		return attachment_id;
	}
	public void setAttachment_id(Attachment attachment_id) {
		this.attachment_id = attachment_id;
	}*/
	@Column(name = "Type", nullable =false,updatable = false)
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	@Column(name = "table_name", nullable =false,updatable = false)
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	@Column(name = "MODIFIED_ON", nullable =false,updatable = false)
	public String getMODIFIED_ON() {
		return MODIFIED_ON;
	}
	public void setMODIFIED_ON(String mODIFIED_ON) {
		MODIFIED_ON = mODIFIED_ON;
	}
	@Column(name = "status", nullable =false,updatable = false)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

	
}
