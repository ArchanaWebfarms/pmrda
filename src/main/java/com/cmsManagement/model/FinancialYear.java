package com.cmsManagement.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.SafeHtml;

/**
 * @author Ujwala_Gawari
 *
 */

@Entity
@Table(name="financial_year")
public class FinancialYear extends BaseObject {
	private int financialId;
	@Pattern(regexp="^[0-9_-]*$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	private String financialYear;
	private String currentStatus;
	 @Pattern(regexp = "^[a-zA-Z0-9 ]+$", message = "*")  @NotEmpty(message = "*")  @SafeHtml(message = "*")
	private String description;
	private String state;
	
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID", nullable =false)
	public int getFinancialId() {
		return financialId;
	}
	public void setFinancialId(int financialId) {
		this.financialId = financialId;
	}
	
	@Column(name="financialYear", nullable=false)
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	
	@Column(name="currentStatus", nullable=false)
	public String getCurrentStatus() {
		return currentStatus;
	}
	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}
	
	//@NotEmpty
	@Column(name="STATE", nullable=false)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	

	
	@Column(name="description", nullable=false)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "FinancialYear [financialId=" + financialId + ", financialYear="
				+ financialYear + ", currentStatus=" + currentStatus
				+ ", description=" + description + ", state=" + state
				+ ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
}
