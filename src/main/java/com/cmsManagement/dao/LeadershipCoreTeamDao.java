package com.cmsManagement.dao;

import java.util.List;

import com.cmsManagement.model.LeadershipCoreTeam;


public interface LeadershipCoreTeamDao {

	List<LeadershipCoreTeam> getAllLeadersList(String role);

	void save(LeadershipCoreTeam leader);

	LeadershipCoreTeam viewLeaderById(int id);

	void editLeader(LeadershipCoreTeam leader);

	void deleteLeader(int id);

}
