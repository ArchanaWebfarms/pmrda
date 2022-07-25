package com.cmsManagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tbl_department_office")
public class DepartmantOffice {

	private int id;
	private String name;
	private String state;
	private String name_h;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="name", nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="state", nullable=false)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="name_h", nullable=false)
	public String getName_h() {
		return name_h;
	}
	public void setName_h(String name_h) {
		this.name_h = name_h;
	}
	
	
	
}
