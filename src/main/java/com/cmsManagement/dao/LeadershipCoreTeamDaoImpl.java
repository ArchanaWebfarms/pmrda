package com.cmsManagement.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.LeadershipCoreTeam;
import com.cmsManagement.util.Constants;



@Transactional
@Repository
public class LeadershipCoreTeamDaoImpl extends AbstractDao<Integer, LeadershipCoreTeam> implements LeadershipCoreTeamDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<LeadershipCoreTeam> getAllLeadersList(String role) {
		Criteria cr = getSession().createCriteria(LeadershipCoreTeam.class)
				.add(Restrictions.eq("state",Constants.ACTIVE_STATE))	
				.add(Restrictions.eq("role",role))	
				.addOrder(Order.asc("id"));
		return cr.list();
		
		//return getSession().createQuery("from LeadershipCoreTeam").list();
	}

	@Override
	public void save(LeadershipCoreTeam leader) {
		getSession().save(leader);
	}

	@Override
	public LeadershipCoreTeam viewLeaderById(int id) {
		Criteria cr = getSession().createCriteria(LeadershipCoreTeam.class)
				.add(Restrictions.eq("id",id));	
		return (LeadershipCoreTeam) cr.uniqueResult();
	}

	@Override
	public void editLeader(LeadershipCoreTeam leader) {
		getSession().update(leader);
	}

	@Override
	public void deleteLeader(int id) {
		getSession().createQuery("update LeadershipCoreTeam set state='D' where id="+id+"").executeUpdate();
	}

}
