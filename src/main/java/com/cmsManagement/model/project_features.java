package com.cmsManagement.model;

import javax.persistence.CascadeType;
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

@Entity
@Table(name="tbl_project_features")
public class project_features {
	
	private int id;
	private int  project_id;	
	private String feature;
	private String feature_h;
	private String created_by;
	private String created_on;
	private String modified_by;
	private String modified_on;
	private String status;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="project_id")
      public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	
	@Column(name="feature")
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	
	@Column(name="feature_h")		
	public String getFeature_h() {
		return feature_h;
	}
	public void setFeature_h(String feature_h) {
		this.feature_h = feature_h;
	}
	
	
	@Column(name="created_by")
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	
	@Column(name=" created_on")
	public String getCreated_on() {
		return created_on;
	}
	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}
	
	@Column(name="modified_on")
	public String getModified_on() {
		return modified_on;
	}
	public void setModified_on(String modified_on) {
		this.modified_on = modified_on;
	}
	
	@Column(name=" status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name=" modified_by")
	public String getModified_by() {
		return modified_by;
	}
	public void setModified_by(String modified_by) {
		this.modified_by = modified_by;
	}
	

}//class
