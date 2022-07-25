package com.cmsManagement.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.currentOpeningDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.CurrentOpening;
import com.cmsManagement.model.User;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.NumbersEnglishToMarathi;
import com.cmsManagement.util.ValidateInput;

@Service
public class currentOpeningServiceImpl implements currentOpeningService{

	@Autowired
	private currentOpeningDao currentOpening;
	
	@Autowired
	private UserService userService;

	@Override
	public List<CurrentOpening> getAllOpening() {
		return currentOpening.getAllOpening();
	}

	@Override
	public void saveOpening(CurrentOpening opening, String path,MultipartFile english, MultipartFile marathi,String title, String mtitle) {
		User user=userService.findUserById(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		//opening.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		opening.setUser(user);
		opening.setCreated_date(MethodsHelper.getCurrentDate());
		opening.setState("A");
		opening.setOpening_status("Opened");
		opening.setOpening_status_h("उघडले");
		opening.setApproval_status("Pending");
		opening.setDelete_approval_status("Active");
		opening.setTotal_vacancy_h(NumbersEnglishToMarathi.convertInMarathi(String.valueOf(opening.getTotal_vacancy())));

		List<Attachment> attachlist=new ArrayList<Attachment>();

		try {
			Attachment attachment = new Attachment();
			String filename=english.getOriginalFilename();
			String fullpath= path+filename;				
			english.transferTo(new File(fullpath));			
			attachment.setPath(fullpath);
			attachment.setAttachmnt_name(filename);
			attachment.setModule_type("English Attachment");
			attachment.setCategory("OPENING");
			attachment.setExtension(FilenameUtils.getExtension(filename));
			attachment.setState("A");
			attachment.setTitle(title);
			attachment.setOpening(opening);	   	
			attachlist.add(attachment);
			opening.setAttachment(attachlist);
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		try {
			Attachment hattachment = new Attachment();
			String filename=marathi.getOriginalFilename();
			String fullpath= path+filename;				
			marathi.transferTo(new File(fullpath));			
			hattachment.setPath(fullpath);
			hattachment.setAttachmnt_name(filename);
			hattachment.setModule_type("Marathi Attachment");
			hattachment.setCategory("OPENING");
			hattachment.setExtension(FilenameUtils.getExtension(filename));
			hattachment.setTitle(mtitle);
			hattachment.setOpening(opening);	   	
			hattachment.setState("A");		   	
			attachlist.add(hattachment);
			opening.setAttachment(attachlist);
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		currentOpening.saveOpening(opening);
	}

	@Override
	public CurrentOpening getOpeningById(int id) {		
		return currentOpening.getOpeningById(id);
	}

	@Override
	public void editOpening(CurrentOpening opening, String path,MultipartFile english, MultipartFile marathi, String title,String mtitle) {
		CurrentOpening copening=currentOpening.getOpeningById(opening.getId());

		copening.setOpening_status("Opened");
		copening.setOpening_status_h("उघडले");
		copening.setState("A");		
		copening.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		copening.setUpdated_date(MethodsHelper.getCurrentDate());		
		copening.setApproval_status("Pending");
		copening.setPost(opening.getPost());
		copening.setPost_h(opening.getPost_h());
		copening.setTotal_vacancy(opening.getTotal_vacancy());
		copening.setDepartment(opening.getDepartment());
		copening.setTotal_vacancy_h(NumbersEnglishToMarathi.convertInMarathi(String.valueOf(copening.getTotal_vacancy())));


		List<Attachment> attachlist=new ArrayList<Attachment>();

		try {
			if(!english.isEmpty()){
				Attachment attachment = new Attachment();
				String filename=english.getOriginalFilename();
				String fullpath= path+filename;				
				english.transferTo(new File(fullpath));			
				attachment.setPath(fullpath);
				attachment.setAttachmnt_name(filename);
				attachment.setModule_type("English Attachment");
				attachment.setCategory("OPENING");
				attachment.setExtension(FilenameUtils.getExtension(filename));
				attachment.setState("A");
				attachment.setTitle(title);
				attachment.setOpening(opening);	   	
				attachlist.add(attachment);
				copening.setAttachment(attachlist);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		try {
			if(!marathi.isEmpty()){
				Attachment hattachment = new Attachment();
				String filename=marathi.getOriginalFilename();
				String fullpath= path+filename;				
				marathi.transferTo(new File(fullpath));			
				hattachment.setPath(fullpath);
				hattachment.setAttachmnt_name(filename);
				hattachment.setModule_type("Marathi Attachment");
				hattachment.setCategory("OPENING");
				hattachment.setExtension(FilenameUtils.getExtension(filename));
				hattachment.setTitle(mtitle);
				hattachment.setOpening(opening);	   	
				hattachment.setState("A");		   	
				attachlist.add(hattachment);
				copening.setAttachment(attachlist);
			}
		}catch (IllegalStateException e) {e.printStackTrace();} catch (IOException e) {e.printStackTrace();}

		currentOpening.editOpening(copening);
	}

	@Override
	public void closeOpening(int id) {
		currentOpening.closeOpening(id);
	}

	@Override
	public void deleteOpening(int id) {
		currentOpening.deleteOpening(id);
	}

	@Override
	public List<CurrentOpening> getAllActiveOpening() {		
		return currentOpening.getAllActiveOpening();
	}

	@SuppressWarnings("deprecation")
	@Override
	public void changeAdminOpeningStatus(String approvedStatus, String comment,	int id) {
		CurrentOpening opening=currentOpening.getOpeningById(id);

		opening.setApproval_status(StringEscapeUtils.escapeHtml4(approvedStatus));
		opening.setApproved_by(LoginController.getCurrentLoggedInUser().getUser().getFirstName()+" "+LoginController.getCurrentLoggedInUser().getUser().getLastName());
		opening.setApproved_date(MethodsHelper.getCurrentDateAndTime());
		opening.setComment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(comment)));

		currentOpening.editOpening(opening);
	}

	@Override
	public List<CurrentOpening> getAllActiveCurrentOpening() {		
		return currentOpening.getAllActiveCurrentOpening();
	}

	@Override
	public List<CurrentOpening> getAllApprovedOpening(String status) {		
		return currentOpening.getAllApprovedOpening(status);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void deleteOpeningStatus(String approvedStatus, String comment,int id) {
		CurrentOpening opening=currentOpening.getOpeningById(id);

		opening.setDelete_approval_status(StringEscapeUtils.escapeHtml4(approvedStatus));
		opening.setDelete_approved_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		opening.setDelete_approval_date(MethodsHelper.getCurrentDateAndTime());
		opening.setDelete_approval_comment(ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(comment)));

		if(approvedStatus.equals("Deactivate")){
			opening.setState("D");
		}

		currentOpening.editOpening(opening);
	}

	@Override
	public void deletePendingOpening(int id) {
		currentOpening.deletePendingOpening(id);
	}

	@Override
	public List<CurrentOpening> getOpeningByCreationStatus(String status) {
		return currentOpening.getOpeningByCreationStatus(status);
	}



}
