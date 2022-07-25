package com.cmsManagement.dto;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="rights_table")
public class Rights {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int right_id;	
	
	
	@Column(name="right_type", length=15, unique=true, nullable=false)
	private String right_type;

	@Column(name="description", nullable=false)
	private String description;
	
	@Column(name="created_by", nullable=false)
	private int created_by;
	
	@Column(name="created_date", nullable=false)
	private String created_date;
	
	@Column(name="updated_by", nullable=false)
	private int updated_by;
	
	@Column(name="updated_date", nullable=false)
	private String updated_date;
	

	public int getCreated_by() {
		return created_by;
	}

	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public int getUpdated_by() {
		return updated_by;
	}

	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}

	public String getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}

	public int getRight_id() {
		return right_id;
	}

	public void setRight_id(int right_id) {
		this.right_id = right_id;
	}

	public String getRight_type() {
		return right_type;
	}

	public void setRight_type(String right_type) {
		this.right_type = right_type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + right_id;
		result = prime * result + ((right_type == null) ? 0 : right_type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Rights))
			return false;
		Rights other = (Rights) obj;
		if (right_id != other.right_id)
			return false;
		if (right_type == null) {
			if (other.right_type != null)
				return false;
		} else if (!right_type.equals(other.right_type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [right_id=" + right_id + ", right_type=" + right_type + ", description=" + description  +"]";
	}
	
}
