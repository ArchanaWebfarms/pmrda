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
 * @author Akshay Khatu
 *
 */
@Entity
@Table(name="tbl_designation")
public class Designation extends BaseObject{
	private int designationId;
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	private String designation;
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	private String description;
	private String state;
	private int sequence;
	@Pattern(regexp = "^[a-zA-Z0-9_.\u00C0-\u1FFF\u2C00-\uD7FF ]+$", message = "*") @NotEmpty(message = "*")  @SafeHtml(message = "*")
	private String designation_h;
	
	@Column(name = "designation_h", nullable =false,unique=true,updatable = false)
	public String getDesignation_h() {
		return designation_h;
	}
	public void setDesignation_h(String designation_h) {
		this.designation_h = designation_h;
	}
	@Column(name = "sequence", nullable =false,unique=true,updatable = false)
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id",nullable =false,unique=true,updatable = false)
	public int getDesignationId() {
		return designationId;
	}
	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}
	
	@Column(name = "designation", nullable =false,unique=true,updatable = false)
	public String getDesignation() {
		return designation;
	}
	
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	@Column(name = "description",nullable =false,unique=true,updatable = false)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name = "state", nullable =false,unique=true,updatable = false)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Designation [designationId=" + designationId + ", designation="
				+ designation + ", description=" + description + ", state="
				+ state + ", getDesignationId()=" + getDesignationId()
				+ ", getDesignation()=" + getDesignation()
				+ ", getDescription()=" + getDescription() + ", getState()="
				+ getState() + ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	

}
