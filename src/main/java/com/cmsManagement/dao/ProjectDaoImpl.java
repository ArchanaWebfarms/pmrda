package com.cmsManagement.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.MetaData;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Project;
import com.cmsManagement.model.project_features;
import com.cmsManagement.util.Constants;
@Transactional
@Repository
public class ProjectDaoImpl extends AbstractDao<Serializable, Project> implements ProjectDao{

	@Autowired
	FinancialYearDao financialYearDao;
	
	@Override
	public List<Project> getAllProjectList() {
		System.out.println("***");
		Criteria criteria=getSession().createCriteria(Project.class)
			.add(Restrictions.eq("status", Constants.ACTIVE_STATE))
			.add(Restrictions.eq("delete_approval_status", "Active"))
			.addOrder(Order.desc("id"));
	System.out.println("***");
		return  criteria.list();
		
		
	}

	@Override
	public Project getProjectById(int id) {
		
		return getByKey(id);
	}

	@Override
	public boolean deleteProjectById(int id) {
		System.err.println(id);
		try {
			getSession().createQuery("update Project  set status = 'D' where id = :id")
	        .setInteger( "id", id)
	        .executeUpdate();
			 return true;
		} catch (Exception exception) {
			exception.printStackTrace();
			return false;
		}
		
	}

	@Override
	public int saveProject(Project project) {

		return (int) getSession().save(project);
	}//save

	@Override
	public boolean projectUpdate(Project project) {
		try {
			getSession().update(project);
			return true;

		} catch (Exception exception) {
			return false;
		}
	}// update method

	@Override
	public int saveProject_Feature(project_features features) {
		
		return (int) getSession().save(features);
	}//method

	@Override
	public List<Project> getProjectListByStatus(String status) {
		// TODO Auto-generated method stub
		
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		Criteria cr = getSession().createCriteria(Project.class)
				  /* .add(Restrictions.eq("financialYear.financialId",financialId))*/
		           .add(Restrictions.eq("status",Constants.ACTIVE_STATE)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		           .addOrder(Order.desc("id"));
		
		if(status.equals("All")){
			List<Project> GetProject = cr.list();
			
			return GetProject;
		}else{
			cr.add(Restrictions.eq("approvedStatus"
					+ "",status));
			return (List<Project>)cr.list();
		}
		
	}

	@Override
	public void updateStatus(Project project) {
		getSession().createQuery("update Project set approved_by = '"+project.getApproved_by()+"', approvedStatus = '"
	                              +project.getApprovedStatus()+"', approved_on = '"+project.getApproved_on()+"'  where id = :id")
                                    .setInteger( "id", project.getId())
                                    .executeUpdate();
		
	}

	@Override
	public List<Project> getActiveProject() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		Criteria cr = getSession().createCriteria(Project.class)
				   .add(Restrictions.eq("financialYear.financialId",f.getFinancialId()))
		           .add(Restrictions.eq("status",Constants.ACTIVE_STATE))
		           .addOrder(Order.desc("id"));
		
	   return cr.list();
	}

	@Override
	public List<Project> getProjectListByApprovedStatus() {
		Criteria criteria=getSession().createCriteria(Project.class)
				.add(Restrictions.eq("approvedStatus", Constants.APPROVED_STATUS))
		        .add(Restrictions.eq("status", Constants.ACTIVE_STATE));
		        /*.addOrder(Order.desc("id"));	*/	
		return criteria.list();
	}

	@Override
	public List<project_features> getProjectFeaturesById(int id) {
	Criteria criteria=getSession().createCriteria(project_features.class)
				.add(Restrictions.eq("project_id",id))
				.add(Restrictions.eq("status", "A"));				
		return  criteria.list();

	}

	@Override
	public void deleteProjectScope(int id) {
		try {
			getSession().createQuery("update project_features  set status = 'D' where id = :id")
	        .setInteger( "id", id)
	        .executeUpdate();			
		} catch (Exception exception) {	}		
	}

	@Override
	public List<Project> getAllPendingProject(String status) {
		Criteria criteria=getSession().createCriteria(Project.class)				
				.add(Restrictions.eq("delete_approval_status", status))
				.add(Restrictions.eq("approvedStatus", "Approved"))
				.addOrder(Order.desc("id"));
		
			return  criteria.list();
	}

	@Override
	public List<Project> getAllAdminActiveProject() {
		Criteria criteria=getSession().createCriteria(Project.class)
				.add(Restrictions.eq("status", Constants.ACTIVE_STATE))
				.addOrder(Order.desc("id"));
		
			return  criteria.list();
	}

	@Override
	public List<Project> getProjectListByApprovedStatusAndType(String type) {
		Criteria criteria=getSession().createCriteria(Project.class)
				.add(Restrictions.eq("approvedStatus", Constants.APPROVED_STATUS))
		        .add(Restrictions.eq("status", Constants.ACTIVE_STATE))
		 .add(Restrictions.eq("type", type));
		        /*.addOrder(Order.desc("id"));	*/	
		return criteria.list();
	}

	


}//class
