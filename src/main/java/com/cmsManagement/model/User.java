package com.cmsManagement.model;
import java.util.Arrays;
import java.util.Collection;

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
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



/**
 * @author ujwala_gawari
 *
 */
@Entity
@Table(name="users")
public class User extends BaseObject implements UserDetails {
	
	
	private static final long serialVersionUID = 1L;
	private int user_id;
	private String username;
	private String firstName;
	private String lastName;
	
	
	private String password;
	
	private String email;	
	private String address;
	private String mobileNumber;
	private String contactNummber;	
	private String pass_Status;
	
	private int failed_attempt;
	private boolean account_non_locked;
	private String lock_time;
	
	private byte[] pass_salt;
	
	private String state;
	
	private Roles roleID;
	
	
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	@Column(name="USER_NAME", unique=true, nullable=false)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	@Column(name="FIRST_NAME", nullable=false)
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	@Column(name="LAST_NAME", nullable=false)
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	@Column(name="PASSWORD", nullable=false)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

	@Column(name="EMAIL", nullable=false)
	public String getEmail() {
		return email;
	}	
	public void setEmail(String email) {
		this.email = email;
	}
	

	@Column(name="ADDRESS", nullable=false)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
		

	@Column(name="MOBILE_NO", nullable=false)
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
		
	@Column(name="CONTACT_NO", nullable=false)
	public String getContactNummber() {
		return contactNummber;
	}
	public void setContactNummber(String contactNummber) {
		this.contactNummber = contactNummber;
	}
	
	//@NotEmpty
	/*@Column(name="ROLE_ID", nullable=false)
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}*/
	@Column(name="pass_status", nullable=false)
	public String getPass_Status() {
		return pass_Status;
	}

	public void setPass_Status(String pass_Status) {
		this.pass_Status = pass_Status;
	}
	
	@JoinColumn(name="ROLE_ID", nullable=false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.MERGE )
	public Roles getRoleID() {
		return roleID;
	}

	public void setRoleID(Roles roleID) {
		this.roleID = roleID;
	}
	
	
	@Column(name="STATE", nullable=false)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="failed_attempt")
	public int getFailed_attempt() {
		return failed_attempt;
	}

	public void setFailed_attempt(int failed_attempt) {
		this.failed_attempt = failed_attempt;
	}
	
	@Column(name="account_non_locked")
	public boolean isAccount_non_locked() {
		return account_non_locked;
	}
	public void setAccount_non_locked(boolean account_non_locked) {
		this.account_non_locked = account_non_locked;
	}
	
	@Column(name="lock_time")
	public String getLock_time() {
		return lock_time;
	}

	public void setLock_time(String lock_time) {
		this.lock_time = lock_time;
	}
	
	@Column(name="pass_salt")
	public byte[] getPass_salt() {
		return pass_salt;
	}
	public void setPass_salt(byte[] salt) {
		this.pass_salt = salt;
	}
	
	
	
	public User() {
		
	}

public User(String username, String firstName, String lastName,
		String email, String contactNummber, String password,byte[] pass_salt) {
	super();
	this.username = username;
	this.firstName = firstName;
	this.lastName = lastName;
	this.email = email;
	this.contactNummber = contactNummber;
	this.password = password;
	this.pass_salt=pass_salt;
}

	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + user_id;
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof User))
			return false;
		User other = (User) obj;
		if (user_id != other.user_id)
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username
				+ ", firstName=" + firstName + ", lastName=" + lastName
				+ ", password=" + password + ", email=" + email + ", address="
				+ address + ", mobileNumber=" + mobileNumber
				+ ", contactNummber=" + contactNummber + ", pass_Status="
				+ pass_Status + ", failed_attempt=" + failed_attempt
				+ ", account_non_locked=" + account_non_locked + ", lock_time="
				+ lock_time + ", pass_salt=" + Arrays.toString(pass_salt)
				+ ", state=" + state + ", roleID=" + roleID + "]";
	}
	@Transient
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}
	@Transient
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Transient
	@Override
	public boolean isAccountNonLocked() {
		return isAccount_non_locked();
	}
	@Transient
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Transient
	@Override
	public boolean isEnabled() {
		return true;
	}

	
	
	
	

	
}
