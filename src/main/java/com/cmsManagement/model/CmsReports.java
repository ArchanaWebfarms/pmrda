package com.cmsManagement.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;


public class CmsReports {
	
	private String category;
	private String tittle;
	private String date;
	private String username;
	private String approvedby;
	private String approveddate;
	private String path;
	private String	ApprovedDate;
	
	private int approvalBy;
	
	@Column(name="ApprovalBy", unique=true, nullable=false)
	public int getApprovalBy() {
		return approvalBy;
	}
	public void setApprovalBy(int approvalBy) {
		this.approvalBy = approvalBy;
	}
	private News news;
	@JoinColumn(name="CREATED_BY", nullable=false,updatable=false,insertable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	
	public String getApprovedDate() {
		return ApprovedDate;
	}
	public void setApprovedDate(String approvedDate) {
		ApprovedDate = approvedDate;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getApprovedby() {
		return approvedby;
	}
	public void setApprovedby(String approvedby) {
		this.approvedby = approvedby;
	}
	public String getApproveddate() {
		return approveddate;
	}
	public void setApproveddate(String approveddate) {
		this.approveddate = approveddate;
	}
	
	
}
