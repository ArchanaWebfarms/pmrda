package com.cmsManagement.dao;

import java.util.List;

import com.cmsManagement.model.LeadershipCoreTeam;


public interface LeadershipCoreTeamDao {

	List<LeadershipCoreTeam> getAllLeadersList(String role);

	void save(LeadershipCoreTeam leader);

	LeadershipCoreTeam viewLeaderById(int id);

	void editLeader(LeadershipCoreTeam leader);

	void deleteLeader(int id);

	int getLastSequence(String activeState, String role);

	List<LeadershipCoreTeam> getAllLeadersListBySquence(String type);

	LeadershipCoreTeam getBySequence(String string, int sequence);

}
