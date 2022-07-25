package com.cmsManagement.model;

import java.io.Serializable;

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

import  com.cmsManagement.model.FinancialYear;


@Entity
@Table(name="tbl_project")
public class Project implements Serializable {

	private int id;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message="**Required")
	private String title;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message="**Required")
	private String title_h;
	@SafeHtml(message = "*Invalid Input")
	private String date;
	@SafeHtml(message = "*Invalid Input")
	private String specification ;
	@SafeHtml(message = "*Invalid Input")
	private String  projectCordinator ;
	@SafeHtml(message = "*Invalid Input")
	private String description  ;
	//private int created_by ;	
	private String created_date ;
	private String status ;
	@SafeHtml(message = "*Invalid Input")
	private String approvedStatus ;
	private String approved_by;
	private String approved_on;	
	private FinancialYear financialYear; 
	private int modified_by;	 
	private String modified_on;		
	@SafeHtml(message = "*Invalid Input")
	private String project_status;
	@SafeHtml(message = "*Invalid Input")
	private String specification_h;	
	@SafeHtml(message = "*Invalid Input")
	private String projectCordinator_h;
	@SafeHtml(message = "*Invalid Input")
	private String description_h;
	@SafeHtml(message = "*Invalid Input")
	private String project_status_h;
	private User user;
	//@Pattern(message="**Invalid Contact",regexp="^[0,7,8,9,+][0-9()]{9,14}")
	@SafeHtml(message = "*Invalid Input")
	private String contact;
	//@Pattern(message="**Invalid Contact",regexp="^[0,7,8,9,+][0-9()]{9,14}")
	@SafeHtml(message = "*Invalid Input")
	private String contact_h;
	//@Pattern(message="**Invalid Email ID",regexp="[a-zA-Z0-9]+[._a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]*[a-zA-Z]*@[a-zA-Z0-9-]{2,}.[a-zA-Z.]{2,6}")
	@SafeHtml(message = "*Invalid Input")
	private String email;
	@SafeHtml(message = "*Invalid Input")
	private String scope_of_work;
	@SafeHtml(message = "*Invalid Input")
	private String scope_of_work_h;
	@SafeHtml(message = "*Invalid Input")
	private String delete_approval_status;
	private int delete_approved_by;
	private String delete_approval_date;
	@SafeHtml(message = "*Invalid Input")
	private String delete_approval_comment;


	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name="date")
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	@Column(name="specification")
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}

	@Column(name="projectCordinator")
	public String getProjectCordinator() {
		return projectCordinator;
	}
	public void setProjectCordinator(String projectCordinator) {
		this.projectCordinator = projectCordinator;
	}

	@Column(name="description")
	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	/*@Column(name="created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}*/
	
	@JoinColumn(name="created_by", nullable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	@Column(name="created_date")
	public String getCreated_on() {
		return created_date;
	}
	public void setCreated_on(String created_on) {
		this.created_date = created_on;
	}

	@Column(name="status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="approvedStatus")
	public String getApprovedStatus() {
		return approvedStatus;
	}
	public void setApprovedStatus(String approvedStatus) {
		this.approvedStatus = approvedStatus;
	}

	@Column(name="approved_by")
	public String getApproved_by() {
		return approved_by;
	}
	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}

	@Column(name="approved_on")
	public String getApproved_on() {
		return approved_on;
	}
	public void setApproved_on(String approved_on) {
		this.approved_on = approved_on;
	}

	@JoinColumn(name="financial_year", nullable=false,updatable = false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)

	public FinancialYear getFinancialYear() {
		return financialYear;
	}

	public void setFinancialYear(	FinancialYear financialYear) {
		this.financialYear = financialYear;
	}


	@Column(name="modified_by")
	public int getModified_by() {
		return modified_by;
	}

	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}

	@Column(name="modified_on")
	public String getModified_on() {
		return modified_on;
	}
	public void setModified_on(String modified_on) {
		this.modified_on = modified_on;
	}

	@Column(name = "project_status")
	public String getProject_status() {
		return project_status;
	}
	public void setProject_status(String project_status) {
		this.project_status = project_status;
	}

	@Column(name = "title_h")
	public String getTitle_h() {
		return title_h;
	}
	public void setTitle_h(String title_h) {
		this.title_h = title_h;
	}

	@Column(name = "specification_h")
	public String getSpecification_h() {
		return specification_h;
	}
	public void setSpecification_h(String specification_h) {
		this.specification_h = specification_h;
	}

	@Column(name = "projectCordinator_h")
	public String getProjectCordinator_h() {
		return projectCordinator_h;
	}
	public void setProjectCordinator_h(String projectCordinator_h) {
		this.projectCordinator_h = projectCordinator_h;
	}

	@Column(name = "description_h")
	public String getDescription_h() {
		return description_h;
	}
	public void setDescription_h(String description_h) {
		this.description_h = description_h;
	}

	@Column(name = "project_status_h")
	public String getProject_status_h() {
		return project_status_h;
	}
	public void setProject_status_h(String project_status_h) {
		this.project_status_h = project_status_h;
	}

	@Column(name = "contact")
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Column(name = "contact_h")
	public String getContact_h() {
		return contact_h;
	}
	public void setContact_h(String contact_h) {
		this.contact_h = contact_h;
	}
	
	@Column(name = "email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "scope_of_work")
	public String getScope_of_work() {
		return scope_of_work;
	}
	public void setScope_of_work(String scope_of_work) {
		this.scope_of_work = scope_of_work;
	}
	
	@Column(name = "scope_of_work_h")
	public String getScope_of_work_h() {
		return scope_of_work_h;
	}
	public void setScope_of_work_h(String scope_of_work_h) {
		this.scope_of_work_h = scope_of_work_h;
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
	


}//class
