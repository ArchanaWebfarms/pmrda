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

/**
 * @author ujwala_gawari
 *
 */
@Entity
@Table(name = "user_permissions")
public class UserPermissions extends BaseObject{

	private int userPerID;
	private String status;
	
	private User userID;
	private Permissions permissionID;
	
	@JoinColumn(name="USER_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public User getUserID() {
		return userID;
	}
	public void setUserID(User userID) {
		this.userID = userID;
	}
	
	@JoinColumn(name="PERMISSION_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public Permissions getPermissionID() {
		return permissionID;
	}
	public void setPermissionID(Permissions permissionID) {
		this.permissionID = permissionID;
	}
	
	
	/*private int userID;
	private int permissionID;
	
	@Column(name="PERMISSION_ID", nullable=false)
	public int getPermissionID() {
		return permissionID;
	}
	public void setPermissionID(int permissionID) {
		this.permissionID = permissionID;
	}
	
	@Column(name="USER_ID", nullable=false)
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}*/
	
	
	
	
	
	
	
	
	
	
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID")
	public int getUserPerID() {
		return userPerID;
	}
	public void setUserPerID(int userPerID) {
		this.userPerID = userPerID;
	}
	
	
	@Column(name="STATUS", nullable=false)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "UserPermissions [userPerID=" + userPerID + ", userID=" + userID
				+ ", permissionID=" + permissionID + ", status=" + status
				+ ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
}
