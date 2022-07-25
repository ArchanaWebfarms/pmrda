package com.cmsManagement.model;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/**
 * @author ujwala_gawari
 *
 */
@MappedSuperclass
public abstract class BaseObject {

	private int created_by;
	private String created_date;
	private int updated_by;
	private String updated_date;	
	
	@Column(name="CREATED_BY", nullable=false,updatable = false)
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name="CREATED_ON", nullable=false,updatable = false)
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	@Column(name="MODIFIED_BY", nullable=false,updatable = false)
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	
	@Column(name="MODIFIED_ON", nullable=false,updatable = false)
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	
}
