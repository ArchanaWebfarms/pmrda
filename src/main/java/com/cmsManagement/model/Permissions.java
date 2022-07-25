package com.cmsManagement.model;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * @author ujwala_gawari
 *
 */
@Entity
@Table(name = "permission")
public class Permissions extends BaseObject{

	private int permissionID;
	private String permissiontype;
	
	/*private int moduleID;
	@NotEmpty
	@Column(name="MODULE_ID", nullable=false)
	public int getModuleID() {
		return moduleID;
	}
	public void setModuleID(int moduleID) {
		this.moduleID = moduleID;
	}*/
	
	private Modules moduleID;
	
	@JoinColumn(name="MODULE_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public Modules getModuleID() {
		return moduleID;
	}
	public void setModuleID(Modules moduleID) {
		this.moduleID = moduleID;
	}

	
	
	@Transient
	private String status;
	@Transient
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID")
	public int getPermissionID() {
		return permissionID;
	}
	public void setPermissionID(int permissionID) {
		this.permissionID = permissionID;
	}
	
	
	/*public UserPermissions getPermissionID() {
		return permissionID;
	}
	public void setPermissionID(UserPermissions permissionID) {
		this.permissionID = permissionID;
	}*/
	
	
	@Column(name="NAME", unique=true, nullable=false)
	public String getPermissiontype() {
		return permissiontype;
	}
	public void setPermissiontype(String permissiontype) {
		this.permissiontype = permissiontype;
	}
	
	@Override
	public String toString() {
		return "Permissions [permissionID=" + permissionID + ", moduleID="
				+ moduleID + ", permissiontype=" + permissiontype + ", status="
				+ status + ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	

}
