package com.cmsManagement.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

@Entity
@Table(name="tbl_current_opening")
public class CurrentOpening {

	private int id;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message="**Required") 
	private String post;
	
	@NotNull(message="**Required")
	private Integer total_vacancy;
	@SafeHtml
	private String total_vacancy_h;
	private String state;
	private String opening_status;
	//private int created_by;
	private String created_date;
	private int updated_by;
	private String updated_date;	
	private List<Attachment> attachment;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message="**Required")
	private String post_h;
	@SafeHtml
	private String opening_status_h;	
	private Department department;
	@SafeHtml
	private String approval_status;
	private String approved_by;
	private String approved_date;
	@SafeHtml
	private String comment;
	@SafeHtml
	private String delete_approval_status;
	private int delete_approved_by;
	private String delete_approval_date;
	@SafeHtml
	private String delete_approval_comment;
	private User user;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "post")
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	
	@Column(name = "total_vacancy")
	public Integer getTotal_vacancy() {
		return total_vacancy;
	}
	public void setTotal_vacancy(Integer total_vacancy) {
		this.total_vacancy = total_vacancy;
	}
	
	@Column(name = "total_vacancy_h")
	public String getTotal_vacancy_h() {
		return total_vacancy_h;
	}
	public void setTotal_vacancy_h(String total_vacancy_h) {
		this.total_vacancy_h = total_vacancy_h;
	}
	
	@Column(name = "state")
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "opening_status")
	public String getOpening_status() {
		return opening_status;
	}
	public void setOpening_status(String opening_status) {
		this.opening_status = opening_status;
	}
	
	/*@Column(name = "created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}*/
	
	@Column(name = "created_date")
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	@JoinColumn(name="created_by", nullable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "updated_by")
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	
	@Column(name = "updated_date")
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	
	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name="opening_id")
	public List<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	@Column(name = "post_h")
	public String getPost_h() {
		return post_h;
	}
	public void setPost_h(String post_h) {
		this.post_h = post_h;
	}
	
	@Column(name = "opening_status_h")
	public String getOpening_status_h() {
		return opening_status_h;
	}
	public void setOpening_status_h(String opening_status_h) {
		this.opening_status_h = opening_status_h;
	}
	
	@JoinColumn(name="department_id")
	@OneToOne(fetch = FetchType.EAGER)
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@Column(name = "approval_status")
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	
	@Column(name = "approved_by")
	public String getApproved_by() {
		return approved_by;
	}
	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}
	
	@Column(name = "approved_date")
	public String getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(String approved_date) {
		this.approved_date = approved_date;
	}
	
	@Column(name = "comment")
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
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
	
	
}
