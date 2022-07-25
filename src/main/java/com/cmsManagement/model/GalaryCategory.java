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
@Entity
@Table(name="tbl_galarycategory")
public class GalaryCategory extends BaseObject{
	
	
	private int id;
	private String galary_cate_name;
	private String Type;
	private FinancialYear financialYear;
	
	
	
	
	@Column(name = "galary_cate_name", nullable =false,unique=true,updatable = false)
	public String getGalary_cate_name() {
		return galary_cate_name;
	}
	public void setGalary_cate_name(String galary_cate_name) {
		this.galary_cate_name = galary_cate_name;
	}
	@Column(name = "type", nullable =false,unique=true,updatable = false)
	public String getType() {
		return Type;
	}
	public void setType(String Type) {
		this.Type = Type;
	}
	
	@JoinColumn(name="FinancialYear", nullable=false,updatable = false)
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	public FinancialYear getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(FinancialYear financialYear) {
		this.financialYear = financialYear;
	}
	
	@Override
	public String toString() {
		return "GalaryCategory [id=" + id + ", galary_cate_name="
				+ galary_cate_name + ", Type=" + Type + ", financialYear="
				+ financialYear + ", getGalary_cate_name()="
				+ getGalary_cate_name() + ", getType()=" + getType()
				+ ", getFinancialYear()=" + getFinancialYear() + ", getId()="
				+ getId() + ", getCreated_by()=" + getCreated_by()
				+ ", getCreated_date()=" + getCreated_date()
				+ ", getUpdated_by()=" + getUpdated_by()
				+ ", getUpdated_date()=" + getUpdated_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID" ,nullable =false,unique=true,updatable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	

}
