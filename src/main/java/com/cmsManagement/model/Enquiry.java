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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="tbl_enquiry")
public class Enquiry {

	private int id;	
	@NotEmpty(message="** Required")
	private String name;
	@Pattern(regexp="[0-9]{10}",message="Invalid Phone Number")
	private String phone;
	@Email(message="Invalid Email ID")
	private String email;
	@NotEmpty(message="** Required")
	private String subject;
	@NotEmpty(message="** Required")
	private String description;
	
	private Department department;
	private String created_date;
	private int replay_by;	
	private String replay_date;
	private String state;
	@Pattern(regexp="[0-9]{2,4}",message="Invalid Phone Number")
	private String code;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="name", nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="contact", nullable=false)
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Column(name="email", nullable=false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="subject", nullable=false)
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	@Column(name="description", nullable=false)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@JoinColumn(name="department_id", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@Column(name="created_date", nullable=false)
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	@Column(name="replay_by", nullable=false)
	public int getReplay_by() {
		return replay_by;
	}
	public void setReplay_by(int replay_by) {
		this.replay_by = replay_by;
	}
	
	@Column(name="replay_date", nullable=false)
	public String getReplay_date() {
		return replay_date;
	}
	public void setReplay_date(String replay_date) {
		this.replay_date = replay_date;
	}
	
	@Column(name="state", nullable=false)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="code", nullable=false)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}
