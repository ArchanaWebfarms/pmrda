package com.cmsManagement.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name="feedback")
public class FeedBack extends BaseObject {

	private int feedBackID;	
	
	private String title;
	@NotEmpty(message="** Requried")
	private String name;
	@Pattern(regexp="[0-9]{10}",message="** Invalid Phone number")
	private String phone;
	@Email(message="Invalid Email ID")
	private String email;
	@NotEmpty(message="** Requried")
	private String subject;
	@NotEmpty(message="** Requried")
	private String description;
	private String state;
	@Pattern(regexp="[0-9]{2,4}",message="** Invalid Country Code")
	private String code;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID", nullable =false)
	public int getFeedBackID() {
		return feedBackID;
	}
	public void setFeedBackID(int feedBackID) {
		this.feedBackID = feedBackID;
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
	
	@Column(name="code", nullable=false)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	
	
	
}
