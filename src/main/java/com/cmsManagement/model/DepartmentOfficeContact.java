package com.cmsManagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.SafeHtml;


@Entity
@Table(name="tbl_department_contact")
public class DepartmentOfficeContact{

	private int id;
	private DepartmantOffice deptOffice;
	
	@NotBlank(message="**Required") @SafeHtml(message = "*Invalid Input")
	private String name;
	
	@Pattern(message="**Invalid Contact Number",regexp="[0-9]+") @SafeHtml(message = "*Invalid Input")
	private String contact_no;
	
	@NotBlank(message="**Required") @SafeHtml(message = "*Invalid Input")
	private String email;
	private String state;
	
	@NotBlank(message="**Required") @SafeHtml(message = "*Invalid Input")
	private String name_h;
	
	private String contact_no_h;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	@JoinColumn(name="dept_office_id")
	@OneToOne(fetch = FetchType.EAGER)
	public DepartmantOffice getDeptOffice() {
		return deptOffice;
	}
	public void setDeptOffice(DepartmantOffice deptOffice) {
		this.deptOffice = deptOffice;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="contact_no")
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="state")
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="name_h")
	public String getName_h() {
		return name_h;
	}
	public void setName_h(String name_h) {
		this.name_h = name_h;
	}
	
	private Department department;
	
	@ManyToOne( fetch = FetchType.EAGER )
	@JoinColumn(name = "department_id")
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@Column(name="contact_no_h")
	public String getContact_no_h() {
		return contact_no_h;
	}
	public void setContact_no_h(String contact_no_h) {
		this.contact_no_h = contact_no_h;
	}	
	
	
}
