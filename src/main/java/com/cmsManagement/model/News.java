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
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;


@Entity
@Table(name="tbl_news")
public class News {

	private int newsid;
	//private Long approvalBy;
	private String approvalBy;	
	private String tag;
	private String url;
	private String type;
	private String subtitle;
	 @SafeHtml(message = "*Invalid Input")
	private String description;
	 @SafeHtml(message = "*Invalid Input")
	private String description_h;
	private String delete_approval_status;
	private int delete_approved_by;
	private String delete_approval_date;
	 @SafeHtml(message = "*Invalid Input")
	private String delete_approval_comment;

	@NotEmpty(message = "**Required")  @SafeHtml(message = "*Invalid Input")
	private String title;

	@NotEmpty(message = "**Required") @SafeHtml(message = "*Invalid Input")
	private String title_h;	

	@NotEmpty(message = "**Required")  @SafeHtml(message = "*Invalid Input")
	private String publish_date;
	@SafeHtml(message = "*Invalid Input")
	private String publish_date_h;
	private int createdby;
	private String status;
	private String created_date;
	private String newspaper;	
	private String newspaper_h;
	@SafeHtml(message = "*Invalid Input")
	private String comment;
	private FinancialYear financialYear;
	private String updationdate;
	private String activestatus;	
	private String approveddate;
	private User user;
	private Long updatedby;	

	@Column(name = "newspaper_h")
	public String getNewspaper_h() {
		return newspaper_h;
	}
	public void setNewspaper_h(String newspaper_h) {
		this.newspaper_h = newspaper_h;
	}

	@JoinColumn(name="FinancialYear", nullable=false,updatable = false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public FinancialYear getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(FinancialYear financialYear) {
		this.financialYear = financialYear;
	}


	@Column(name = "CREATED_ON")
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	@Column(name = "ApprovedDate")
	public String getApproveddate() {
		return approveddate;
	}
	public void setApproveddate(String approveddate) {
		this.approveddate = approveddate;
	}

	@Column(name ="ApprovalBy")
	public String getApprovalBy() {
		return approvalBy;
	}
	public void setApprovalBy(String approvalBy) {
		this.approvalBy = approvalBy;
	}


	@JoinColumn(name="CREATED_BY", nullable=false,updatable=false,insertable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "NewsPaper")
	public String getNewspaper() {
		return newspaper;
	}
	public void setNewspaper(String newspaper) {
		this.newspaper = newspaper;
	}

	@Column(name = "comment")
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	@Column(name = "state")
	public String getActivestatus() {
		return activestatus;
	}
	public void setActivestatus(String activestatus) {
		this.activestatus = activestatus;
	}

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "NewsID", nullable = true,unique=true)
	public int getNewsid() {
		return newsid;
	}
	public void setNewsid(int newsid) {
		this.newsid = newsid;
	}

	@Column(name = "MODIFIED_ON")
	public String getUpdationdate() {
		return updationdate;
	}
	public void setUpdationdate(String updationdate) {
		this.updationdate = updationdate;
	}

	@Column(name = "Approved")
	public String getStatus() {
		return status;
	}	
	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "PublishDate")
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}

	@Column(name = "CREATED_BY")
	public int getCreatedby() {
		return createdby;
	}
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}

	@Column(name = "MODIFIED_BY")
	public Long getUpdatedby() {
		return updatedby;
	}
	public void setUpdatedby(Long updatedby) {
		this.updatedby = updatedby;
	}


	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}


	@Column(name = "type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	

	@Column(name = "Description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "Subtitle")
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	@Column(name = "Title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}


	@Column(name = "Tags")
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}


	@Column(name = "title_h")
	public String getTitle_h() {
		return title_h;
	}
	public void setTitle_h(String title_h) {
		this.title_h = title_h;
	}

	@Column(name = "description_h")
	public String getDescription_h() {
		return description_h;
	}
	public void setDescription_h(String description_h) {
		this.description_h = description_h;
	}








	/*private Attachment attachment;
	@JoinColumn(name="attachment_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public Attachment getAttachment() {
		return attachment;
	}
	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}*/


	/*private List<Attachment> attachment = new ArrayList<Attachment>();







	//fetch = FetchType.LAZY, cascade = { CascadeType.ALL,CascadeType.PERSIST,CascadeType.MERGE },
	 @OneToMany( mappedBy = "news",fetch = FetchType.EAGER, cascade = { CascadeType.ALL,CascadeType.PERSIST,CascadeType.MERGE })
	//@OneToMany( mappedBy = "news")
	public List<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<Attachment> attachment) {
		this.attachment = attachment;
	}*/




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
	
	@Column(name = "PublishDate_h")
	public String getPublish_date_h() {
		return publish_date_h;
	}
	public void setPublish_date_h(String publish_date_h) {
		this.publish_date_h = publish_date_h;
	}
	
	




}
