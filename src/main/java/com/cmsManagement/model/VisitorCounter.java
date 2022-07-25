package com.cmsManagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_visitor_counter")
public class VisitorCounter {
	private int id;
	private String date;
	private int datewise_count;
	private int total_count;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", nullable =false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="date", nullable=false)
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@Column(name="datewise_count", nullable=false)
	public int getDatewise_count() {
		return datewise_count;
	}
	public void setDatewise_count(int datewise_count) {
		this.datewise_count = datewise_count;
	}
	
	@Column(name="total_count", nullable=false)
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	
	
	
}
