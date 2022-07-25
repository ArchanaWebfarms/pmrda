package com.cmsManagement.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

/**
 * @author ujwala_gawari
 *
 */
@Entity
@Table(name="roles")
public class Roles extends BaseObject{
	
	private int role_id;
	 @Pattern(regexp = "^[a-zA-Z ]+$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	private String role_type;
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	private String description;
	private String status;
	
	//@Transient
	private String role_category;
	//@Transient
	@Column(name="ROLE_CATEGORY", insertable=false, updatable=false)
	public String getRole_category() {
		return role_category;
	}
	public void setRole_category(String role_category) {
		this.role_category = role_category;
	}
	
	
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID")
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	
	@Column(name="ROLE_TYPE",  unique=true, nullable=false)
	public String getRole_type() {
		return role_type;
	}
	public void setRole_type(String role_type) {
		this.role_type = role_type;
	}

	@Column(name="ROLE_DESCRIPTION", nullable=false)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name="STATUS", nullable=false)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + role_id;
		result = prime * result + ((role_type == null) ? 0 : role_type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Roles))
			return false;
		Roles other = (Roles) obj;
		if (role_id != other.role_id)
			return false;
		if (role_type == null) {
			if (other.role_type != null)
				return false;
		} else if (!role_type.equals(other.role_type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Roles [role_id=" + role_id + ", role_type=" + role_type
				+ ", description=" + description + ", status=" + status
				+ ", role_category=" + role_category + ", getCreated_by()="
				+ getCreated_by() + ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", toString()=" + super.toString() + "]";
	}
	

}
