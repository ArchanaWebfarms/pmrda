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

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.SafeHtml;

@Entity
@Table(name="tbl_leadership_coreteam")
public class LeadershipCoreTeam {

	private int id;
	@SafeHtml(message = "*Invalid Input")
	@NotBlank(message="**Required")
	private String name;	
	@SafeHtml(message = "*Invalid Input")
	@NotBlank(message="**Required")
	private String positon;
	private Department department;
	@SafeHtml(message = "*Invalid Input")
	@NotBlank(message="**Required")
	private String description;
	private List<Attachment> attachment;
	private String state;
	private int created_by;
	private String created_date;
	private int update_by;
	private String updated_date;
	private String initial;
	private String initial_h;
	@SafeHtml(message = "*Invalid Input")
	@NotBlank(message="**Required")
	private String name_h;	
	@SafeHtml(message = "*Invalid Input")
	@NotBlank(message="**Required")
	private String positon_h;
	@SafeHtml(message = "*Invalid Input")
	@NotBlank(message="**Required")
	private String description_h;
	private String role;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "position")
	public String getPositon() {
		return positon;
	}
	public void setPositon(String positon) {
		this.positon = positon;
	}
		
	@JoinColumn(name="dept_id")
	@OneToOne(fetch = FetchType.EAGER)
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@Column(name = "description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name="leader_id")
	public List<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	@Column(name = "state")
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name = "craeted_date")
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	@Column(name = "update_by")
	public int getUpdate_by() {
		return update_by;
	}
	public void setUpdate_by(int update_by) {
		this.update_by = update_by;
	}
	
	@Column(name = "updated_date")
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	
	@Column(name = "initial")
	public String getInitial() {
		return initial;
	}
	public void setInitial(String initial) {
		this.initial = initial;
	}
	
	@Column(name = "initial_h")
	public String getInitial_h() {
		return initial_h;
	}
	public void setInitial_h(String initial_h) {
		this.initial_h = initial_h;
	}
	
	@Column(name = "name_h")
	public String getName_h() {
		return name_h;
	}
	public void setName_h(String name_h) {
		this.name_h = name_h;
	}
	
	@Column(name = "position_h")
	public String getPositon_h() {
		return positon_h;
	}
	public void setPositon_h(String positon_h) {
		this.positon_h = positon_h;
	}
	
	@Column(name = "description_h")
	public String getDescription_h() {
		return description_h;
	}
	public void setDescription_h(String description_h) {
		this.description_h = description_h;
	}
	
	@Column(name = "role")
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	
}
