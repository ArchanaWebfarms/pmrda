package com.cmsManagement.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.LeadershipCoreTeam;



public interface LeadershipCoreTeamService {

	List<LeadershipCoreTeam> getAllLeadersList(String role);

	void saveLeader(LeadershipCoreTeam leader, String path, MultipartFile file);

	void editLeader(LeadershipCoreTeam leader, String path, MultipartFile file);

	LeadershipCoreTeam viewLeaderById(int parseInt);

	void deleteLeader(int parseInt);

	void saveCoreTeam(LeadershipCoreTeam leader, String path, MultipartFile file);

	void editCoreTeam(LeadershipCoreTeam leader, String path, MultipartFile file);

}
