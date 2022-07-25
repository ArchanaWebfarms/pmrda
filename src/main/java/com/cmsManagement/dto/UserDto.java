package com.cmsManagement.dto;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

import com.cmsManagement.CostomeValiator.FieldMatch;
import com.cmsManagement.CostomeValiator.Phone;
import com.cmsManagement.CostomeValiator.ValidPassword;
import com.cmsManagement.model.Roles;

/**
 * @author ujwala_gawari
 *
 */
@FieldMatch(first = "password", second = "confirmPassword", message = "The password fields must match")
public class UserDto {
	
	private int user_id;
	
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$",message = "*")    @SafeHtml(message = "*")
	 private String username;
	 
	 @Pattern(regexp = "^[a-zA-Z ]+$", message = "*")    @SafeHtml(message = "*")
	 private String firstName;
	 
	 @Pattern(regexp = "^[a-zA-Z ]+$", message = "*")    @SafeHtml(message = "*")
	 private String lastName;
	 
	 @ValidPassword(message = "*") @SafeHtml(message = "*")
		private String password;
		@NotEmpty(message = "*")
		@SafeHtml(message = "*")
		private String confirmPassword;	
	 
	 @Email(message = "*") @SafeHtml(message = "*") @NotEmpty(message = "*")
	 private String email;		
	 
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")   @SafeHtml(message = "*")
	 private String address;
	 
	 @Phone(message = "*") @SafeHtml(message = "*")
	 private String mobileNumber;
	 
	 @Phone(message = "*") @SafeHtml(message = "*")
	 private String contactNummber;	
	 
	 
  	private int created_by;
	private String created_date;
	
	/*private int roleID;
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}*/
	@NotNull(message = "*")	
	private Roles roleID;
	public Roles getRoleID() {
		return roleID;
	}
	public void setRoleID(Roles roleID) {
		this.roleID = roleID;
	}
	
	
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
	
	
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getContactNummber() {
		return contactNummber;
	}
	public void setContactNummber(String contactNummber) {
		this.contactNummber = contactNummber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
}
