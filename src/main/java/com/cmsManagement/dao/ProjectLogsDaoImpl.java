package com.cmsManagement.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.Project;
import com.cmsManagement.model.ProjectLogs;

@Transactional
@Repository
public class ProjectLogsDaoImpl extends AbstractDao<Serializable, ProjectLogs> implements ProjectLogsDao{

	@Override
	public List<ProjectLogs> getAllProjectLogs() {
		Criteria criteria=getSession().createCriteria(ProjectLogs.class)
			.addOrder(Order.desc("id"));
		return  criteria.list();
	}

}
