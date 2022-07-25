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

@Entity
@Table(name="tbl_metadata")
public class MetaData {
	
	private int id;
	 @Column(name = "title", nullable =true,unique=true,updatable = false)
	private String title;
	 @Column(name = "description", nullable =true,unique=true,updatable = false)
	private String description;
	 @Column(name = "url", nullable =true,unique=true,updatable = false)
	private String url;
	 @Column(name = "type", nullable =true,unique=true,updatable = false)
	private String type;
	 private String state;
	 @Column(name = "state", nullable =true,unique=true,updatable = false)
	 private String  publish_date;
	 @Column(name = "publish_date")
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$",message = "*")
	 @NotEmpty(message = "*")
	 @SafeHtml(message = "*")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	  @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}  
     @NotEmpty(message = "*")  @SafeHtml(message = "*")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "MetaData [id=" + id + ", title=" + title + ", description="
				+ description + ", url=" + url + ", getId()=" + getId()
				+ ", getTitle()=" + getTitle() + ", getDescription()="
				+ getDescription() + ", getUrl()=" + getUrl() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	

}
