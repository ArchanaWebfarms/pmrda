package com.cmsManagement.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.LeadershipCoreTeamDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.LeadershipCoreTeam;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

@Service
public class LeadershipCoreTeamServiceImpl implements LeadershipCoreTeamService {

	@Autowired
	private LeadershipCoreTeamDao leadershipCoreTeamDao;

	@Autowired
	private AttachmentService attachmentService;

	@Override
	public List<LeadershipCoreTeam> getAllLeadersList(String role) {		
		return leadershipCoreTeamDao.getAllLeadersList(role);
	}

	@Override
	public void saveLeader(LeadershipCoreTeam leader, String path,	MultipartFile file) {
		// set seq to 0 if exists
		LeadershipCoreTeam chkexists = leadershipCoreTeamDao.getBySequence("LEADER", leader.getSequence());
		if(chkexists!=null) {
			chkexists.setSequence(0);
			leadershipCoreTeamDao.editLeader(chkexists);
		}

		List<Attachment> list=new ArrayList<Attachment>();
		Attachment attachment = new Attachment();
		String filename=file.getOriginalFilename();
		String fullpath= path+filename;				
		try {
			file.transferTo(new File(fullpath));
		} catch (Exception e) {
			e.printStackTrace();
		} 		
		attachment.setPath(fullpath);
		attachment.setAttachmnt_name(filename);			
		attachment.setCategory("LEADERSHIP");
		attachment.setExtension(FilenameUtils.getExtension(filename));
		attachment.setState("A");
		attachment.setLeader(leader);
		list.add(attachment);

		leader.setAttachment(list);
		leader.setState(Constants.ACTIVE_STATE);
		leader.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		leader.setCreated_date(MethodsHelper.getCurrentDate());
		leader.setRole("LEADER");

		leadershipCoreTeamDao.save(leader);		
	}

	@Override
	public void editLeader(LeadershipCoreTeam leader, String path,	MultipartFile file) {
		//set seq to 0 if exists
		LeadershipCoreTeam chkexists = leadershipCoreTeamDao.getBySequence("LEADER", leader.getSequence());
		if(chkexists!=null) {
			chkexists.setSequence(0);
			leadershipCoreTeamDao.editLeader(chkexists);
		}

		LeadershipCoreTeam leaders=leadershipCoreTeamDao.viewLeaderById(leader.getId());

		leader.setState(Constants.ACTIVE_STATE);
		leader.setCreated_by(leaders.getCreated_by());
		leader.setCreated_date(leaders.getCreated_date());
		leader.setUpdate_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		leader.setUpdated_date(MethodsHelper.getCurrentDate());
		leader.setAttachment(leaders.getAttachment());
		leader.setRole(leaders.getRole());;

		if(!file.isEmpty()){
			List<Attachment> list=new ArrayList<Attachment>();
			Attachment attachment = new Attachment();
			String filename=file.getOriginalFilename();
			String fullpath= path+filename;				
			try {
				file.transferTo(new File(fullpath));
			} catch (Exception e) {
				e.printStackTrace();
			} 		
			attachment.setPath(fullpath);
			attachment.setAttachmnt_name(filename);			
			attachment.setCategory("LEADERSHIP");
			attachment.setExtension(FilenameUtils.getExtension(filename));
			attachment.setState("A");
			attachment.setLeader(leader);
			list.add(attachment);
			leader.setAttachment(list);
		}

		leadershipCoreTeamDao.editLeader(leader);		
	}

	@Override
	public LeadershipCoreTeam viewLeaderById(int id) {
		return leadershipCoreTeamDao.viewLeaderById(id);
	}

	@Override
	public void deleteLeader(int id) {
		leadershipCoreTeamDao.deleteLeader(id);
	}

	@Override
	public void saveCoreTeam(LeadershipCoreTeam leader, String path,MultipartFile file) {
		// set seq to 0 if exists
		LeadershipCoreTeam chkexists = leadershipCoreTeamDao.getBySequence("CORE TEAM", leader.getSequence());
		if(chkexists!=null) {
			chkexists.setSequence(0);
			leadershipCoreTeamDao.editLeader(chkexists);
		}

		List<Attachment> list=new ArrayList<Attachment>();
		Attachment attachment = new Attachment();
		String filename=file.getOriginalFilename();
		String fullpath= path+filename;				
		try {
			file.transferTo(new File(fullpath));
		} catch (Exception e) {
			e.printStackTrace();
		} 		
		attachment.setPath(fullpath);
		attachment.setAttachmnt_name(filename);			
		attachment.setCategory("CORE TEAM");
		attachment.setExtension(FilenameUtils.getExtension(filename));
		attachment.setState("A");
		attachment.setLeader(leader);
		list.add(attachment);

		leader.setAttachment(list);
		leader.setState(Constants.ACTIVE_STATE);
		leader.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		leader.setCreated_date(MethodsHelper.getCurrentDate());
		leader.setRole("CORE TEAM");
		leader.setDescription("NA");
		leader.setDescription_h("NA");

		leadershipCoreTeamDao.save(leader);
	}

	@Override
	public void editCoreTeam(LeadershipCoreTeam leader, String path,MultipartFile file) {
		// set seq to 0 if exists
		LeadershipCoreTeam chkexists = leadershipCoreTeamDao.getBySequence("CORE TEAM", leader.getSequence());
		if(chkexists!=null) {
			chkexists.setSequence(0);
			leadershipCoreTeamDao.editLeader(chkexists);
		}

		LeadershipCoreTeam leaders=leadershipCoreTeamDao.viewLeaderById(leader.getId());

		leader.setState(Constants.ACTIVE_STATE);
		leader.setCreated_by(leaders.getCreated_by());
		leader.setCreated_date(leaders.getCreated_date());
		leader.setUpdate_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		leader.setUpdated_date(MethodsHelper.getCurrentDate());
		leader.setAttachment(leaders.getAttachment());
		leader.setRole(leaders.getRole());
		leader.setDescription(leaders.getDescription());
		leader.setDescription_h(leaders.getDescription_h());

		if(!file.isEmpty()){
			List<Attachment> list=new ArrayList<Attachment>();
			Attachment attachment = new Attachment();
			String filename=file.getOriginalFilename();
			String fullpath= path+filename;				
			try {
				file.transferTo(new File(fullpath));
			} catch (Exception e) {
				e.printStackTrace();
			} 		
			attachment.setPath(fullpath);
			attachment.setAttachmnt_name(filename);			
			attachment.setCategory("CORE TEAM");
			attachment.setExtension(FilenameUtils.getExtension(filename));
			attachment.setState("A");
			attachment.setLeader(leader);
			list.add(attachment);
			leader.setAttachment(list);
		}

		leadershipCoreTeamDao.editLeader(leader);
	}

	@Override
	public int getLastSequence(String activeState, String role) {		
		return leadershipCoreTeamDao.getLastSequence(activeState, role);
	}

	@Override
	public void updateSequence(LeadershipCoreTeam l) {
		leadershipCoreTeamDao.editLeader(l);
	}

	@Override
	public List<LeadershipCoreTeam> getAllLeadersListBySquence(String type) {		
		return leadershipCoreTeamDao.getAllLeadersListBySquence(type);
	}

	@Override
	public void activateLeader(LeadershipCoreTeam leader) {
		leadershipCoreTeamDao.editLeader(leader);
	}

}
