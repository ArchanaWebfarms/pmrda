package com.cmsManagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_video")
public class Video {

	
	private int id;
	private String title;
	private String title_h;
	private String link;
	private String state;
	private int created_by;
	private String created_date;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "title_h")
	public String getTitle_h() {
		return title_h;
	}
	public void setTitle_h(String title_h) {
		this.title_h = title_h;
	}
	
	@Column(name = "state")
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name = "created_date")
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	@Column(name = "link")
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	@Override
	public String toString() {
		return "Video [id=" + id + ", title=" + title + ", title_h=" + title_h
				+ ", link=" + link + ", state=" + state + ", created_by="
				+ created_by + ", created_date=" + created_date + "]";
	}
	
	
}
