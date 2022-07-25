package com.cmsManagement.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;


/**
 * @author ujwala_gawari
 *
 */
@Entity
@Table(name="tender_department")
public class TendorsDepartment extends BaseObject {

	private int dept_id;
	/* @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")*/  @NotEmpty(message = "**Required")  @SafeHtml(message = "*Invalid Input")
	private String departmentName;
	 
	 /*@Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")*/ /* @NotEmpty(message = "**Required")*/  @SafeHtml(message = "*Invalid Input")
	private String departmentType;
	 
	
	
	 /*@Pattern(regexp = "^[a-zA-Z0-9_.\u00C0-\u1FFF\u2C00-\uD7FF ]+$", message = "*")*/ @NotEmpty(message = "**Required")  @SafeHtml(message = "*Invalid Input")
	private String dept_name_h;
	 
	 private String state;
	 
	@Column(name="dept_name_h", nullable=false)
	public String getDept_name_h() {
		return dept_name_h;
	}
	public void setDept_name_h(String dept_name_h) {
		this.dept_name_h = dept_name_h;
	}
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}	
	
	@Column(name="dept_name", nullable=false)
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	@Column(name="description", nullable=false)
	public String getDepartmentType() {
		return departmentType;
	}
	public void setDepartmentType(String departmentType) {
		this.departmentType = departmentType;
	}
	
	
	
	@Column(name="STATE", nullable=false)
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "TendorsDepartment [dept_id=" + dept_id + ", departmentName="
				+ departmentName + ", departmentType=" + departmentType
				+ ", state=" + state + ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
}
