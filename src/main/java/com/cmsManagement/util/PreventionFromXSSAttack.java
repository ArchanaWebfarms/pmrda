package com.cmsManagement.util;

import org.apache.commons.lang3.StringEscapeUtils;

import com.cmsManagement.dto.UserDto;
import com.cmsManagement.model.CurrentOpening;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.DepartmentOfficeContact;
import com.cmsManagement.model.FeedBack;
import com.cmsManagement.model.LeadershipCoreTeam;
import com.cmsManagement.model.MetaData;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.Project;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.Taluka;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.model.Video;

@SuppressWarnings("deprecation")
public class PreventionFromXSSAttack {
	public static News preventNews(News news){
		news.setTitle(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(news.getTitle())));
		news.setTitle_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(news.getTitle_h())));
		news.setDescription(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(news.getDescription())));
		news.setDescription_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(news.getDescription_h())));
		
		return news;
	}
	
	public static Notices preventNotice(Notices notices){
		notices.setTitle(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(notices.getTitle())));
		notices.setTitle_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(notices.getTitle_h())));
		notices.setType(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(notices.getType())));
		notices.setDescription(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(notices.getDescription())));
		notices.setDescription_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(notices.getDescription_h())));				
		
		return notices;		
	}
	
	public static Project preventProject(Project project){
		project.setTitle(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(project.getTitle())));
		project.setTitle_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(project.getTitle_h())));
		project.setDescription(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getDescription())));
		project.setDescription_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getDescription_h())));
		project.setProjectCordinator(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(project.getProjectCordinator())));
		project.setProjectCordinator_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(project.getProjectCordinator_h())));
		project.setContact(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(project.getContact())));
		project.setContact_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(project.getContact_h())));
		project.setEmail(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(project.getEmail())));
		project.setProject_status(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getProject_status())));
		project.setProject_status_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getProject_status_h())));
		project.setSpecification(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getSpecification())));
		project.setSpecification_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getSpecification_h())));
		project.setScope_of_work(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getScope_of_work())));
		project.setScope_of_work_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(project.getScope_of_work_h())));		
		
		return project;		
	}
	
	public static CurrentOpening preventCurrentOpening(CurrentOpening opening){
		opening.setPost(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(opening.getPost())));
		opening.setPost_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(opening.getPost_h())));
		
		return opening;		
	}
	
	public static Department preventDepartment(Department departments){
		//departments.setDepartmentName(Jsoup.clean(departments.getDepartmentName(), Whitelist.basic()));				
		departments.setDepartmentName(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(departments.getDepartmentName())));				
		departments.setDepartmentName_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(departments.getDepartmentName_h())));
		departments.setDescription(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getDescription())));
		departments.setDescription_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getDescription_h())));
		departments.setObjectives(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getObjectives())));
		departments.setObjectives_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getObjectives_h())));
		departments.setFunctions(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getFunctions())));
		departments.setFunctions_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getFunctions_h())));
		departments.setRoles_and_responsibility(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getRoles_and_responsibility())));
		departments.setRoles_and_responsibility_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getRoles_and_responsibility_h())));
		departments.setProjects(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getProjects())));
		departments.setProjects_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getProjects_h())));
		departments.setAchievements(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getAchievements())));
		departments.setAchievements_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getAchievements_h())));
		departments.setSalient_features(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getSalient_features())));
		departments.setSalient_features_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getSalient_features_h())));
		departments.setOther_title(StringEscapeUtils.escapeHtml4(departments.getOther_title()));
		departments.setOther_title_h(StringEscapeUtils.escapeHtml4(departments.getOther_title_h()));
		departments.setOther_content(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getOther_content())));
		departments.setOther_content_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(departments.getOther_content_h())));
		
		return departments;
	}
	
	public static DepartmentOfficeContact preventDeptOfficeContact(DepartmentOfficeContact contact){
		contact.setName(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(contact.getName())));
		contact.setName_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(contact.getName_h())));
		contact.setContact_no(StringEscapeUtils.escapeHtml4(contact.getContact_no()));
		contact.setContact_no_h(StringEscapeUtils.escapeHtml4(contact.getContact_no_h()));
		contact.setEmail(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(contact.getEmail())));			
		
		return contact;
	}

	public static Tendors preventTender(Tendors tender){

		tender.setTitle(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getTitle())));
		tender.setTitle_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getTitle_h())));
		tender.setSubTitle(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getSubTitle())));
		tender.setSubTitle_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getSubTitle_h())));
		tender.setPublish_date(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getPublish_date())));
		tender.setPublish_date_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getPublish_date_h())));
		tender.setPublish_time(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getPublish_time())));
		tender.setClosingDate(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getClosingDate())));
		tender.setClosingDate_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getClosingDate())));
		tender.setClosing_time(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getClosing_time())));
		tender.setClosing_time_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getClosing_time_h())));
		tender.setOpeningDate(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getOpeningDate())));
		tender.setOpeningDate_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getOpeningDate_h())));
		tender.setOpening_time(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getOpening_time())));
		tender.setOpening_time_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(tender.getOpening_time_h())));
		tender.setDescription(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(tender.getDescription())));
		tender.setDescription_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(tender.getDescription_h())));
		tender.setComment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(tender.getComment())));
		tender.setDelete_approval_comment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(tender.getDelete_approval_comment())));

		return tender;			
	}

	public static Roles preventRoles(Roles roles){
		roles.setRole_type(StringEscapeUtils.escapeHtml4(roles.getRole_type()));
		roles.setDescription(StringEscapeUtils.escapeHtml4(roles.getDescription()));

		return roles;		
	}

	public static UserDto preventUser(UserDto user){		
		user.setFirstName(StringEscapeUtils.escapeHtml4(user.getFirstName()));
		user.setLastName(StringEscapeUtils.escapeHtml4(user.getLastName()));
		user.setUsername(StringEscapeUtils.escapeHtml4(user.getUsername()));
		user.setPassword(StringEscapeUtils.escapeHtml4(user.getPassword()));
		user.setConfirmPassword(StringEscapeUtils.escapeHtml4(user.getConfirmPassword()));
		user.setEmail(StringEscapeUtils.escapeHtml4(user.getEmail()));
		user.setAddress(StringEscapeUtils.escapeHtml4(user.getAddress()));
		user.setContactNummber(StringEscapeUtils.escapeHtml4(user.getContactNummber()));
		user.setMobileNumber(StringEscapeUtils.escapeHtml4(user.getMobileNumber()));		

		return user;		
	}

	public static TendorsDepartment preventTenderDept(TendorsDepartment department){
		department.setDepartmentName(StringEscapeUtils.escapeHtml4(department.getDepartmentName()));
		department.setDept_name_h(StringEscapeUtils.escapeHtml4(department.getDept_name_h()));
		department.setDepartmentType(StringEscapeUtils.escapeHtml4(department.getDepartmentType()));

		return department;		
	}

	public static Taluka preventTaluka(Taluka taluka){
		taluka.setTaluka(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(taluka.getTaluka())));
		taluka.setTaluka_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(taluka.getTaluka_h())));
		taluka.setRemark(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(taluka.getRemark())));
		taluka.setRemark_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(taluka.getRemark_h())));

		return taluka;		
	}

	public static Video preventVideo(Video video){
		video.setTitle(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(video.getTitle())));
		video.setTitle_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(video.getTitle_h())));
		video.setLink(StringEscapeUtils.escapeHtml4(video.getLink()));
		
		return video;
	}
	
	public static LeadershipCoreTeam preventLeadership(LeadershipCoreTeam leader){
		leader.setName(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(leader.getName())));
		leader.setName_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(leader.getName_h())));
		leader.setPositon(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(leader.getPositon())));
		leader.setPositon_h(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(leader.getPositon_h())));
		leader.setDescription(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(leader.getDescription())));
		leader.setDescription_h(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(leader.getDescription_h())));
		
		return leader;		
	}

	public static MetaData preventMetadata(MetaData metadata){
		metadata.setTitle(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(metadata.getTitle())));
		metadata.setDescription(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(metadata.getDescription())));
		metadata.setType(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(metadata.getType())));
		metadata.setUrl(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(metadata.getUrl())));
		
		return metadata;		
	}
	
	public static FeedBack preventFeedback(FeedBack feedback){
		feedback.setName(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(feedback.getName())));
		//feedback.setEmail(StringEscapeUtils.escapeHtml4(feedback.getEmail()));
		feedback.setPhone(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(feedback.getPhone())));
		feedback.setCode(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(feedback.getCode())));
		feedback.setSubject(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(feedback.getSubject())));
		feedback.setDescription(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(feedback.getDescription())));
		
		return feedback;		
	}
	
}
