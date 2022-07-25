package com.cmsManagement.model;
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
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;


@Entity
@Table(name="tbl_notices")
public class Notices extends BaseObject{
	
	private int noticeID;
	
	@NotEmpty(message = "** Required") @SafeHtml(message = "*Invalid Input")
	private String title;
	@SafeHtml(message = "*Invalid Input")
	private String description;
	@SafeHtml(message = "*Invalid Input")
	private String description_h;
	 
    @NotEmpty(message = "** Required") @SafeHtml(message = "*Invalid Input")  
	private String publish_date;
	@SafeHtml(message = "*Invalid Input")
	private String closingDate;
	
	@NotEmpty(message = "** Required") @SafeHtml(message = "*Invalid Input")
	private String type;
	
	private String tags;
	
	private String state;
	@SafeHtml(message = "*Invalid Input")
	private String publishStatus;
	
	private String approvalBy;
	@SafeHtml(message = "*Invalid Input")
	private String comment;	
	private String approveddate;	
	private String category;
	private String delete_approval_status;
	private int delete_approved_by;
	private String delete_approval_date;
	@SafeHtml(message = "*Invalid Input")
	private String delete_approval_comment;
	private String date_h;
	private String subtype;
	private String subtype_h;
	
	@NotEmpty(message = "** Required")@SafeHtml(message = "*Invalid Input")
	private String title_h;
	//private Long designationId;
	private Designation des;
	private FinancialYear financialYear;
	
	/* private Attachment attachment;*/
		private Department department;
		private User user;
		
		
	/*@Column(name="DesignationId",insertable=false)
	public Long getDesignationId() {
		return designationId;
	}

	public void setDesignationId(Long designationId) {
		this.designationId = designationId;
	}*/
			
		@JoinColumn(name="subtype_h")
		public String getSubtype_h() {
			return subtype_h;
		}
		
		public void setSubtype_h(String subtype_h) {
			this.subtype_h = subtype_h;
		}
		
		@JoinColumn(name="subtype")
		public String getSubtype() {
			return subtype;
		}
		public void setSubtype(String subtype) {
			this.subtype = subtype;
		}
		
	@JoinColumn(name="DesignationId", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public Designation getDes() {
		return des;
	}
	public void setDes(Designation des) {
		this.des = des;
	}
	


	@JoinColumn(name="CREATED_BY", nullable=false,updatable=false,insertable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@JoinColumn(name="FinancialYear", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public FinancialYear getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(FinancialYear financialYear) {
		this.financialYear = financialYear;
	}
	
	@JoinColumn(name="department_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.MERGE )
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	
	@Column(name="publishStatus", nullable=false)
	public String getPublishStatus() {
		return publishStatus;
	}
	public void setPublishStatus(String publishStatus) {
		this.publishStatus = publishStatus;
	}
	
	@Column(name="ApprovalBy", nullable=false)
	public String getApprovalBy() {
		return approvalBy;
	}
	public void setApprovalBy(String approvalBy) {
		this.approvalBy = approvalBy;
	}
	
	@Column(name="Comments", nullable=false)
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Column(name="ApprovedDate", nullable=false)
	public String getApproveddate() {
		return approveddate;
	}
	public void setApproveddate(String approveddate) {
		this.approveddate = approveddate;
	}
	
/*	@JoinColumn(name="attachment_ID")
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public Attachment getAttachment() {
		return attachment;
	}
	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}*/
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public int getNoticeID() {
		return noticeID;
	}
	public void setNoticeID(int noticeID) {
		this.noticeID = noticeID;
	}

	@Column(name="title", nullable=false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name="description", nullable=false)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name="description_h", nullable=false)
	public String getDescription_h() {
		return description_h;
	}
	public void setDescription_h(String description_h) {
		this.description_h = description_h;
	}	
	

	@Column(name="type", nullable=false)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Column(name="tags", nullable=false)
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
		
	@Column(name="STATE", nullable=false)
	public String getState() {
		return state;
	}	
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="category", nullable=false)
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	@Column(name = "title_h", nullable =true,unique=true)
	public String getTitle_h() {
		return title_h;
	}

	public void setTitle_h(String title_h) {
		this.title_h = title_h;
	}
	private String url;
	@Column(name = "url", nullable =true,unique=true,updatable = false)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Column(name="date", nullable=false)
	public String getPublish_date() {
		return publish_date;
	}

	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}

	@Column(name="closing_date", nullable=false)
	public String getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(String closingDate) {
		this.closingDate = closingDate;
	}
 
	@Column(name = "delete_approval_status")
	public String getDelete_approval_status() {
		return delete_approval_status;
	}
	public void setDelete_approval_status(String delete_approval_status) {
		this.delete_approval_status = delete_approval_status;
	}
	
	@Column(name = "delete_approved_by")
	public int getDelete_approved_by() {
		return delete_approved_by;
	}
	public void setDelete_approved_by(int delete_approved_by) {
		this.delete_approved_by = delete_approved_by;
	}
	
	@Column(name = "delete_approval_date")
	public String getDelete_approval_date() {
		return delete_approval_date;
	}
	public void setDelete_approval_date(String delete_approval_date) {
		this.delete_approval_date = delete_approval_date;
	}
	
	@Column(name = "delete_approval_comment")
	public String getDelete_approval_comment() {
		return delete_approval_comment;
	}
	public void setDelete_approval_comment(String delete_approval_comment) {
		this.delete_approval_comment = delete_approval_comment;
	}

	@Column(name = "date_h")
	public String getDate_h() {
		return date_h;
	}
	public void setDate_h(String date_h) {
		this.date_h = date_h;
	}
	

	
	
	
	
	
}
