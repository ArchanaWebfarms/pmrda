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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;


@Entity
@Table(name="tbl_tender")
public class Tendors extends BaseObject {

	private int id;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String title;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String subTitle;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String subTitle_h;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String openingDate;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String closingDate;
	@SafeHtml(message = "*Invalid Input")
	private String description;
	@SafeHtml(message = "*Invalid Input")
	private String description_h;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required")  
	private String publish_date;
	
	private String publishStatus;
	private String tags;
	private String state;
	private String approvalBy;
	private String comment;
	private String approveddate;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required")  
	private String title_h;
	private String type;
	private String delete_approval_status;
	private int delete_approved_by;
	private String delete_approval_date;
	private String delete_approval_comment;	
	//private Attachment attachment;
	//@NotNull(message = "**Required") 
	private TendorsDepartment tendorsDepartment;
	private FinancialYear financialYear;
	private String url;
	private User user;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String publish_time;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String closing_time;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message = "**Required") 
	private String opening_time;
	
	private String openingDate_h;
	private String closingDate_h;
	private String publish_date_h;
	private String publish_time_h; 
	private String closing_time_h; 
	private String opening_time_h;
	
	@Column(name = "type", nullable =true,unique=true,updatable = false)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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


	@Transient
	private String closingStatus;
	@Transient
	public String getClosingStatus() {
		return closingStatus;
	}
	public void setClosingStatus(String closingStatus) {
		this.closingStatus = closingStatus;
	}


	@JoinColumn(name="department_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.MERGE )
	public TendorsDepartment getTendorsDepartment() {
		return tendorsDepartment;
	}
	public void setTendorsDepartment(TendorsDepartment tendorsDepartment) {
		this.tendorsDepartment = tendorsDepartment;
	}

	/*@JoinColumn(name="attachment_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public Attachment getAttachment() {
		return attachment;
	}
	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}*/

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



	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="title", nullable=false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name="subTitle", nullable=false)
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	
	@Column(name="subTitle_h", nullable=false)
	public String getSubTitle_h() {
		return subTitle_h;
	}
	public void setSubTitle_h(String subTitle_h) {
		this.subTitle_h = subTitle_h;
	}

	@Column(name="openingDate", nullable=false)
	public String getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}

	@Column(name="closingDate", nullable=false)
	public String getClosingDate() {
		return closingDate;
	}
	public void setClosingDate(String closingDate) {
		this.closingDate = closingDate;
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

	@Column(name="publish_Date", nullable=false)
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}

	@Column(name="publishStatus", nullable=false)
	public String getPublishStatus() {
		return publishStatus;
	}
	public void setPublishStatus(String publishStatus) {
		this.publishStatus = publishStatus;
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
	@Column(name = "title_h", nullable =true,unique=true)
	public String getTitle_h() {
		return title_h;
	}

	public void setTitle_h(String title_h) {
		this.title_h = title_h;
	}
	@Column(name = "url", nullable =true,unique=true,updatable = false)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	
	@Column(name = "publish_time")
	public String getPublish_time() {
		return publish_time;
	}
	public void setPublish_time(String publish_time) {
		this.publish_time = publish_time;
	}
	
	@Column(name = "closing_time")
	public String getClosing_time() {
		return closing_time;
	}
	public void setClosing_time(String closing_time) {
		this.closing_time = closing_time;
	}
	
	@Column(name = "opening_time")
	public String getOpening_time() {
		return opening_time;
	}
	public void setOpening_time(String opening_time) {
		this.opening_time = opening_time;
	}
	
	@Column(name = "openingDate_h")
	public String getOpeningDate_h() {
		return openingDate_h;
	}
	public void setOpeningDate_h(String openingDate_h) {
		this.openingDate_h = openingDate_h;
	}
	
	@Column(name = "closingDate_h")
	public String getClosingDate_h() {
		return closingDate_h;
	}
	public void setClosingDate_h(String closingDate_h) {
		this.closingDate_h = closingDate_h;
	}
	
	@Column(name = "publish_date_h")
	public String getPublish_date_h() {
		return publish_date_h;
	}
	public void setPublish_date_h(String publish_date_h) {
		this.publish_date_h = publish_date_h;
	}
	
	@Column(name = "publish_time_h")
	public String getPublish_time_h() {
		return publish_time_h;
	}
	public void setPublish_time_h(String publish_time_h) {
		this.publish_time_h = publish_time_h;
	}
	
	@Column(name = "closing_time_h")
	public String getClosing_time_h() {
		return closing_time_h;
	}
	public void setClosing_time_h(String closing_time_h) {
		this.closing_time_h = closing_time_h;
	}
	
	@Column(name = "opening_time_h")
	public String getOpening_time_h() {
		return opening_time_h;
	}
	public void setOpening_time_h(String opening_time_h) {
		this.opening_time_h = opening_time_h;
	}
	
	
	


}
