package com.cmsManagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_work_status")
public class WorkStatus {

	private int id;
	private String project_name_heading;
	private int project_name_priority;
	private String project_name_content;
	private String district_heading;
	private int district_priority;
	private String district_content;
	private String lac_heading;
	private int lac_priority;
	private String lac_content;
	private String no_of_schools_heading;
	private int no_of_schools_priority;
	private int no_of_schools_content;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="project_name_heading")
	public String getProject_name_heading() {
		return project_name_heading;
	}
	public void setProject_name_heading(String project_name_heading) {
		this.project_name_heading = project_name_heading;
	}
	
	@Column(name="project_name_priority")
	public int getProject_name_priority() {
		return project_name_priority;
	}
	public void setProject_name_priority(int project_name_priority) {
		this.project_name_priority = project_name_priority;
	}
	
	@Column(name="project_name_content")
	public String getProject_name_content() {
		return project_name_content;
	}
	public void setProject_name_content(String project_name_content) {
		this.project_name_content = project_name_content;
	}
	
	@Column(name="district_heading")
	public String getDistrict_heading() {
		return district_heading;
	}
	public void setDistrict_heading(String district_heading) {
		this.district_heading = district_heading;
	}
	
	@Column(name="district_priority")
	public int getDistrict_priority() {
		return district_priority;
	}
	public void setDistrict_priority(int district_priority) {
		this.district_priority = district_priority;
	}
	
	@Column(name="district_content")
	public String getDistrict_content() {
		return district_content;
	}
	public void setDistrict_content(String district_content) {
		this.district_content = district_content;
	}
	
	@Column(name="lac_heading")
	public String getLac_heading() {
		return lac_heading;
	}
	public void setLac_heading(String lac_heading) {
		this.lac_heading = lac_heading;
	}
	
	@Column(name="lac_priority")
	public int getLac_priority() {
		return lac_priority;
	}
	public void setLac_priority(int lac_priority) {
		this.lac_priority = lac_priority;
	}
	
	@Column(name="lac_content")
	public String getLac_content() {
		return lac_content;
	}
	public void setLac_content(String lac_content) {
		this.lac_content = lac_content;
	}
	
	@Column(name="no_of_schools_heading")
	public String getNo_of_schools_heading() {
		return no_of_schools_heading;
	}
	public void setNo_of_schools_heading(String no_of_schools_heading) {
		this.no_of_schools_heading = no_of_schools_heading;
	}
	
	@Column(name="no_of_schools_priority")
	public int getNo_of_schools_priority() {
		return no_of_schools_priority;
	}
	public void setNo_of_schools_priority(int no_of_schools_priority) {
		this.no_of_schools_priority = no_of_schools_priority;
	}
	
	@Column(name="no_of_schools_content")
	public int getNo_of_schools_content() {
		return no_of_schools_content;
	}
	public void setNo_of_schools_content(int no_of_schools_content) {
		this.no_of_schools_content = no_of_schools_content;
	}
	
	@Override
	public String toString() {
		return "WorkStatus [id=" + id + ", project_name_heading="
				+ project_name_heading + ", project_name_priority="
				+ project_name_priority + ", project_name_content="
				+ project_name_content + ", district_heading="
				+ district_heading + ", district_priority=" + district_priority
				+ ", district_content=" + district_content + ", lac_heading="
				+ lac_heading + ", lac_priority=" + lac_priority
				+ ", lac_content=" + lac_content + ", no_of_schools_heading="
				+ no_of_schools_heading + ", no_of_schools_priority="
				+ no_of_schools_priority + ", no_of_schools_content="
				+ no_of_schools_content + "]";
	}
	
	
	
}
