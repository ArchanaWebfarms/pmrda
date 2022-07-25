package com.cmsManagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_demo_dept")
public class DemoDepatment {
private int id;
private String name;
private String function_title;
private int function_priority;
private String function_type;
private String function_content;

@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
@Column(name = "id")
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

@Column(name="name")
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

@Column(name="function_title")
public String getFunction_title() {
	return function_title;
}
public void setFunction_title(String function_title) {
	this.function_title = function_title;
}

@Column(name="function_priority")
public int getFunction_priority() {
	return function_priority;
}
public void setFunction_priority(int function_priority) {
	this.function_priority = function_priority;
}

@Column(name="function_type")
public String getFunction_type() {
	return function_type;
}
public void setFunction_type(String function_type) {
	this.function_type = function_type;
}

@Column(name="function_content")
public String getFunction_content() {
	return function_content;
}
public void setFunction_content(String function_content) {
	this.function_content = function_content;
}
@Override
public String toString() {
	return "DemoDepatment [id=" + id + ", name=" + name + ", function_title="
			+ function_title + ", function_priority=" + function_priority
			+ ", function_type=" + function_type + ", function_content="
			+ function_content + "]";
}



}
