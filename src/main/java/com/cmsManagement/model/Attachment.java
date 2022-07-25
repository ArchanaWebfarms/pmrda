package com.cmsManagement.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.SafeHtml;


@Entity
@Table(name="tbl_attachment")
public class Attachment extends BaseObject {
	private int attachmentID;
	private int moduleID;
	@SafeHtml
	private String module_type;
	@SafeHtml
	private String attachmnt_name;
	@SafeHtml
	private String path;
	private int galary_cateID;
	private String state;
	@SafeHtml
	private String category;
	@SafeHtml
	private String title;
	@SafeHtml
	private String size;
	@SafeHtml
	private String extension;
	@SafeHtml
	private String title_h;
	
	
	private FinancialYear financialYear;
	@JoinColumn(name="FinancialYear", nullable=false,updatable = false)
	@OneToOne(fetch = FetchType.EAGER)
	public FinancialYear getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(FinancialYear financialYear) {
		this.financialYear = financialYear;
	}
	
	@Column(name = "galary_cate_id", nullable =false,updatable = false)
	public int getGalary_cateID() {
		return galary_cateID;
	}
	public void setGalary_cateID(int galary_cateID) {
		this.galary_cateID = galary_cateID;
	}
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "Attachment_id", nullable =false)
	public int getAttachmentID() {
		return attachmentID;
	}
	public void setAttachmentID(int attachmentID) {
		this.attachmentID = attachmentID;
	}
	
	@Column(name = "module_id", nullable =false,updatable = false)
	public int getModuleID() {
		return moduleID;
	}
	public void setModuleID(int moduleID) {
		this.moduleID = moduleID;
	}
	
	
	
	@Column(name = "module_type", nullable =false,updatable = false)
	public String getModule_type() {
		return module_type;
	}
	public void setModule_type(String module_type) {
		this.module_type = module_type;
	}
	@Column(name = "attachment_name", nullable =false,updatable = false)
	public String getAttachmnt_name() {
		return attachmnt_name;
	}
	public void setAttachmnt_name(String attachmnt_name) {
		this.attachmnt_name = attachmnt_name;
	}
	
	@Column(name = "path", nullable =false,updatable = false)
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	@Column(name = "state", nullable =false,updatable = false)	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
		
	@Column(name = "category", nullable =false,updatable = false)
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Column(name = "title", nullable =false,updatable = false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "file_size", nullable =false,updatable = false)
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	@Column(name = "extension", nullable =false,updatable = false)
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}

	
    /*private News news;
    
   
    //@ManyToOne( fetch = FetchType.EAGER )
	//@JoinColumn(name = "module_id")
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}*/
	
	private Taluka taluka;
	
	@ManyToOne( fetch = FetchType.EAGER )
	@JoinColumn(name = "taluka_id")
	public Taluka getTaluka() {
		return taluka;
	}
	public void setTaluka(Taluka taluka) {
		this.taluka = taluka;
	}
	
	@Column(name = "title_h")
	public String getTitle_h() {
		return title_h;
	}
	public void setTitle_h(String title_h) {
		this.title_h = title_h;
	}
	
	private CurrentOpening opening;
	
	@ManyToOne( fetch = FetchType.EAGER )
	@JoinColumn(name = "opening_id")
	public CurrentOpening getOpening() {
		return opening;
	}
	public void setOpening(CurrentOpening opening) {
		this.opening = opening;
	}
	
	private LeadershipCoreTeam leader;
	
	@ManyToOne( fetch = FetchType.EAGER )
	@JoinColumn(name = "leader_id")
	public LeadershipCoreTeam getLeader() {
		return leader;
	}
	public void setLeader(LeadershipCoreTeam leader) {
		this.leader = leader;
	}
	
	private Department department;
	
	@ManyToOne( fetch = FetchType.EAGER )
	@JoinColumn(name = "department_id")
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}


	

}
