package com.cmsManagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="tbl_rti_applications")
public class RTIApplications {	
	private int id;
	private int application_received;
	private int application_disposed;
	private int application_pending;
	private String application_received_h;
	private String application_disposed_h;
	private String application_pending_h;
	private String created_on;
	private int created_by;
	private String updated_on;
	private int updated_by;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@JoinColumn(name="application_received")
	public int getApplication_received() {
		return application_received;
	}
	public void setApplication_received(int application_received) {
		this.application_received = application_received;
	}
	
	@JoinColumn(name="application_disposed")
	public int getApplication_disposed() {
		return application_disposed;
	}
	public void setApplication_disposed(int application_disposed) {
		this.application_disposed = application_disposed;
	}
	
	@JoinColumn(name="application_pending")
	public int getApplication_pending() {
		return application_pending;
	}
	public void setApplication_pending(int application_pending) {
		this.application_pending = application_pending;
	}
	
	@JoinColumn(name="application_received_h")
	public String getApplication_received_h() {
		return application_received_h;
	}
	public void setApplication_received_h(String application_received_h) {
		this.application_received_h = application_received_h;
	}
	
	@JoinColumn(name="application_disposed_h")
	public String getApplication_disposed_h() {
		return application_disposed_h;
	}
	public void setApplication_disposed_h(String application_disposed_h) {
		this.application_disposed_h = application_disposed_h;
	}
	
	@JoinColumn(name="application_pending_h")
	public String getApplication_pending_h() {
		return application_pending_h;
	}
	public void setApplication_pending_h(String application_pending_h) {
		this.application_pending_h = application_pending_h;
	}
	
	@JoinColumn(name="created_on")
	public String getCreated_on() {
		return created_on;
	}
	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}
	
	@JoinColumn(name="created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@JoinColumn(name="updated_on")
	public String getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(String updated_on) {
		this.updated_on = updated_on;
	}
	
	@JoinColumn(name="updated_by")
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	
	
}
