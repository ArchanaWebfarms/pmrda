package com.cmsManagement.model;

import java.util.Set;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

@Entity
@Table(name="tbl_taluka")
public class Taluka {

	private int id;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message="*Required")
	private String taluka;
	
	@NotNull(message="*Required")
	private int total_villages;	
	
	
	private String total_villages_h;	
	@SafeHtml(message = "*Invalid Input")
	private String remark;
	private String status;
	private int created_by;
	private String created_on;
	private int modified_by;
	private String modified_on;
	@SafeHtml(message = "*Invalid Input")
	@NotEmpty(message="*Required")
	private String taluka_h;
	@SafeHtml(message = "*Invalid Input")
	private String remark_h;
	
	private Set<Attachment> attachment;	
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable = true,unique=true)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "taluka", nullable =false,unique=true)
	public String getTaluka() {
		return taluka;
	}
	public void setTaluka(String taluka) {
		this.taluka = taluka;
	}
	
	@Column(name = "total_villages", nullable =false)
	public int getTotal_villages() {
		return total_villages;
	}
	public void setTotal_villages(int total_villages) {
		this.total_villages = total_villages;
	}
	
	@Column(name = "remark", nullable =false)
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Column(name = "status", nullable =false)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name = "created_by", nullable =false)
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name = "created_on", nullable =false)
	public String getCreated_on() {
		return created_on;
	}
	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}
	
	@Column(name = "modified_by", nullable =false)
	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	
	@Column(name = "modified_on", nullable =false)
	public String getModified_on() {
		return modified_on;
	}
	public void setModified_on(String modified_on) {
		this.modified_on = modified_on;
	}
	
	@Column(name = "taluka_h", nullable =false)
	public String getTaluka_h() {
		return taluka_h;
	}
	public void setTaluka_h(String taluka_h) {
		this.taluka_h = taluka_h;
	}
	
	@Column(name = "remark_h", nullable =false)
	public String getRemark_h() {
		return remark_h;
	}
	public void setRemark_h(String remark_h) {
		this.remark_h = remark_h;
	}
	
	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name="taluka_id",updatable = false)
	public Set<Attachment> getAttachment() {
		return attachment;
	}
	public void setAttachment(Set<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	@Column(name = "total_villages_h", nullable =false)
	public String getTotal_villages_h() {
		return total_villages_h;
	}
	public void setTotal_villages_h(String total_villages_h) {
		this.total_villages_h = total_villages_h;
	}
}
