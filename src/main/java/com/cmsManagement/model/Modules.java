package com.cmsManagement.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * @author ujwala_gawari
 *
 */
@Entity
@Table(name="modules")
public class Modules extends BaseObject{
	
	private int module_id;
	private String module_type;
	private String module_category;
	

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID")
	public int getModule_id() {
		return module_id;
	}
	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}
	
	
	@NotEmpty
	@Column(name="module_type", unique=true, nullable=false)
	public String getModule_type() {
		return module_type;
	}
	public void setModule_type(String module_type) {
		this.module_type = module_type;
	}
	
	
	@Column(name="module_category", unique=true, nullable=false)
	public String getModule_category() {
		return module_category;
	}
	public void setModule_category(String module_category) {
		this.module_category = module_category;
	}
	
	
	@Override
	public String toString() {
		return "Modules [module_id=" + module_id + ", module_type="
				+ module_type + ", module_category=" + module_category
				+ ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
