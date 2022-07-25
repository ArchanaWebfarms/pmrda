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
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="department")
public class Department{

	private int deptId;
	 @NotEmpty(message = "**Required") @SafeHtml(message = "*Invalid Input")
	private String departmentName;
	 @SafeHtml(message = "*Invalid Input")
	private String description;
	
	private String state;	
	@NotEmpty(message = "**Required") @SafeHtml(message = "*Invalid Input")
	private String departmentName_h;
	@SafeHtml(message = "*Invalid Input") 
	private String description_h;
	@SafeHtml(message = "*Invalid Input")
	private String objectives;
	@SafeHtml(message = "*Invalid Input")
	private String objectives_h;
	@SafeHtml(message = "*Invalid Input")
	private String functions;
	@SafeHtml(message = "*Invalid Input")
	private String functions_h;
	@SafeHtml(message = "*Invalid Input")
	private String projects;
	@SafeHtml(message = "*Invalid Input")
	private String projects_h;
	@SafeHtml(message = "*Invalid Input")
	private String roles_and_responsibility;
	@SafeHtml(message = "*Invalid Input")
	private String roles_and_responsibility_h;
	@SafeHtml(message = "*Invalid Input")
	private String achievements;
	@SafeHtml(message = "*Invalid Input")
	private String achievements_h;
	@SafeHtml(message = "*Invalid Input")
	private String salient_features;
	@SafeHtml(message = "*Invalid Input")
	private String salient_features_h;
	@SafeHtml(message = "*Invalid Input")
	private String other_title;
	@SafeHtml(message = "*Invalid Input")
	private String other_title_h;
	@SafeHtml(message = "*Invalid Input")
	private String other_content;
	@SafeHtml(message = "*Invalid Input")
	private String other_content_h;
	private String delete_approval_status;
	private int delete_approved_by;
	private String delete_approval_date;
	@SafeHtml(message = "*Invalid Input")
	private String delete_approval_comment;
	private String create_approval_status;
	private String create_approved_by;
	private String create_approval_date;
	@SafeHtml(message = "*Invalid Input")
	private String create_approval_comment;
	private List<Attachment> attachment;
	private List<DepartmentOfficeContact> officeContact;
	private String created_date;
	private int updated_by;
	private String updated_date;
	private User user;
	
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	
	@Column(name="dept_name", nullable=false)
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="STATE", nullable=false)
	public String getState() {
		return state;
	}	
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="dept_name_h", nullable=false)
	public String getDepartmentName_h() {
		return departmentName_h;
	}
	public void setDepartmentName_h(String departmentName_h) {
		this.departmentName_h = departmentName_h;
	}
	
	@Column(name="objectives")
	public String getObjectives() {
		return objectives;
	}
	public void setObjectives(String objectives) {
		this.objectives = objectives;
	}
	
	@Column(name="objectives_h")
	public String getObjectives_h() {
		return objectives_h;
	}
	public void setObjectives_h(String objectives_h) {
		this.objectives_h = objectives_h;
	}
	
	@Column(name="functions")
	public String getFunctions() {
		return functions;
	}
	public void setFunctions(String functions) {
		this.functions = functions;
	}
	
	@Column(name="functions_h")
	public String getFunctions_h() {
		return functions_h;
	}
	public void setFunctions_h(String functions_h) {
		this.functions_h = functions_h;
	}
	
	@Column(name="projects")
	public String getProjects() {
		return projects;
	}
	public void setProjects(String projects) {
		this.projects = projects;
	}
	
	@Column(name="projects_h")
	public String getProjects_h() {
		return projects_h;
	}
	public void setProjects_h(String projects_h) {
		this.projects_h = projects_h;
	}
	
	@Column(name="roles_and_responsibility")
	public String getRoles_and_responsibility() {
		return roles_and_responsibility;
	}
	public void setRoles_and_responsibility(String roles_and_responsibility) {
		this.roles_and_responsibility = roles_and_responsibility;
	}
	
	@Column(name="roles_and_responsibility_h")
	public String getRoles_and_responsibility_h() {
		return roles_and_responsibility_h;
	}
	public void setRoles_and_responsibility_h(String roles_and_responsibility_h) {
		this.roles_and_responsibility_h = roles_and_responsibility_h;
	}
	
	@Column(name="achievements")
	public String getAchievements() {
		return achievements;
	}
	public void setAchievements(String achievements) {
		this.achievements = achievements;
	}
	
	@Column(name="achievements_h")
	public String getAchievements_h() {
		return achievements_h;
	}
	public void setAchievements_h(String achievements_h) {
		this.achievements_h = achievements_h;
	}
	
	@Column(name="salient_features")
	public String getSalient_features() {
		return salient_features;
	}
	public void setSalient_features(String salient_features) {
		this.salient_features = salient_features;
	}
	
	@Column(name="salient_features_h")
	public String getSalient_features_h() {
		return salient_features_h;
	}
	public void setSalient_features_h(String salient_features_h) {
		this.salient_features_h = salient_features_h;
	}
	
	@Column(name="other_title")
	public String getOther_title() {
		return other_title;
	}
	public void setOther_title(String other_title) {
		this.other_title = other_title;
	}
	
	@Column(name="other_title_h")
	public String getOther_title_h() {
		return other_title_h;
	}
	public void setOther_title_h(String other_title_h) {
		this.other_title_h = other_title_h;
	}
	
	@Column(name="other_content")
	public String getOther_content() {
		return other_content;
	}
	public void setOther_content(String other_content) {
		this.other_content = other_content;
	}
	
	@Column(name="other_content_h")
	public String getOther_content_h() {
		return other_content_h;
	}
	public void setOther_content_h(String other_content_h) {
		this.other_content_h = other_content_h;
	}
	
	@Column(name="delete_approval_status")
	public String getDelete_approval_status() {
		return delete_approval_status;
	}
	public void setDelete_approval_status(String delete_approval_status) {
		this.delete_approval_status = delete_approval_status;
	}
	
	@Column(name="delete_approved_by")
	public int getDelete_approved_by() {
		return delete_approved_by;
	}
	public void setDelete_approved_by(int delete_approved_by) {
		this.delete_approved_by = delete_approved_by;
	}
	
	@Column(name="delete_approval_date")
	public String getDelete_approval_date() {
		return delete_approval_date;
	}
	public void setDelete_approval_date(String delete_approval_date) {
		this.delete_approval_date = delete_approval_date;
	}
	
	@Column(name="delete_approval_comment")
	public String getDelete_approval_comment() {
		return delete_approval_comment;
	}
	public void setDelete_approval_comment(String delete_approval_comment) {
		this.delete_approval_comment = delete_approval_comment;
	}
	
	@Column(name="create_approval_status")
	public String getCreate_approval_status() {
		return create_approval_status;
	}
	public void setCreate_approval_status(String create_approval_status) {
		this.create_approval_status = create_approval_status;
	}
	
	@Column(name="create_approved_by")
	public String getCreate_approved_by() {
		return create_approved_by;
	}
	public void setCreate_approved_by(String create_approved_by) {
		this.create_approved_by = create_approved_by;
	}
	
	@Column(name="create_approval_date")
	public String getCreate_approval_date() {
		return create_approval_date;
	}
	public void setCreate_approval_date(String create_approval_date) {
		this.create_approval_date = create_approval_date;
	}
	
	@Column(name="create_approval_comment")
	public String getCreate_approval_comment() {
		return create_approval_comment;
	}
	public void setCreate_approval_comment(String create_approval_comment) {
		this.create_approval_comment = create_approval_comment;
	}
	
	@Column(name="description_h")
	public String getDescription_h() {
		return description_h;
	}
	public void setDescription_h(String description_h) {
		this.description_h = description_h;
	}
	
	@JsonIgnore
	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name="department_id")
	public List<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	
	@JsonIgnore
	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
    @JoinColumn(name="department_id")
	public List<DepartmentOfficeContact> getOfficeContact() {
		return officeContact;
	}
	public void setOfficeContact(List<DepartmentOfficeContact> officeContact) {
		this.officeContact = officeContact;
	}
	
	@Column(name="CREATED_ON", nullable=false,updatable = false)
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	@Column(name="MODIFIED_BY", nullable=false,updatable = false)
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	
	@Column(name="MODIFIED_ON", nullable=false,updatable = false)
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	
	@JoinColumn(name="CREATED_BY", nullable=false)
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
