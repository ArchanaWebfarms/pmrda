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
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

import com.cmsManagement.CostomeValiator.Phone;

/**
 * @author ujwala_gawari
 *
 */
@Entity
@Table(name="complaint")
public class Complaint extends BaseObject {

	private int complaintID;
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$",message = "*")
	 @NotEmpty(message = "*")
	 @SafeHtml(message = "*")
	 private String title;
	  
	  
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$",message = "*")
	 @NotEmpty(message = "*")
	 @SafeHtml(message = "*")
	 private String name;
	 @Phone(message = "*")
	 @SafeHtml(message = "*")
	 private String phone;
	 @NotEmpty(message = "*")
	 @Email(message = "*")@SafeHtml(message = "*")
	 private String email;
	 @NotEmpty(message = "*") @SafeHtml(message = "*")
	 private String subject;
	 
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$",message = "*")
	 @NotEmpty(message = "*")
	 @SafeHtml(message = "*")
	private String description;
	private String state;
	private String comments;
	private String complaintStatus;
	private FinancialYear financialYear;
	@Column(name="complaintstatus", nullable=false)
	public String getComplaintStatus() {
		return complaintStatus;
	}
	public void setComplaintStatus(String complaintStatus) {
		this.complaintStatus = complaintStatus;
	}
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID", nullable =false)
	public int getComplaintID() {
		return complaintID;
	}
	public void setComplaintID(int complaintID) {
		this.complaintID = complaintID;
	}
	
	@Column(name="title", nullable=false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="name", nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="phone", nullable=false)
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
	
	@Column(name="state", nullable=false)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="comments", nullable=false)
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@JoinColumn(name="FinancialYear", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public FinancialYear getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(FinancialYear financialYear) {
		this.financialYear = financialYear;
	}
	
	@Override
	public String toString() {
		return "Complaint [complaintID=" + complaintID + ", title=" + title
				+ ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", subject=" + subject + ", description=" + description
				+ ", state=" + state + ", comments=" + comments
				+ ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	

	
	
	
	
}
