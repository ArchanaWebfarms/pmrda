package com.cmsManagement.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.model.CurrentOpening;

@Transactional
@Repository()
@SuppressWarnings("unchecked")
public class currentOpeningDaoImpl extends AbstractDao<Integer, CurrentOpening> implements currentOpeningDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<CurrentOpening> getAllOpening() {
		return getSession().createQuery("from CurrentOpening where state='A' and (delete_approval_status='Active' or delete_approval_status='Pending') order by id desc").list();
	}

	@Override
	public void saveOpening(CurrentOpening opening) {
		getSession().save(opening);
	}

	@Override
	public CurrentOpening getOpeningById(int id) {
		/*Criteria criteria=getSession().createCriteria(CurrentOpening.class);
		criteria.add(Restrictions.eq("id", id));		
		return (CurrentOpening) criteria.uniqueResult();*/
		return getByKey(id);
	}

	@Override
	public void editOpening(CurrentOpening copening) {
		//System.out.println("in dao copening :"+copening.toString());
		getSession().update(copening);
	}

	@Override
	public void closeOpening(int id) {
		getSession().createQuery("update CurrentOpening set opening_status = 'Closed'  where id =  :id").setInteger("id", id).executeUpdate();
	}

	@Override
	public void deleteOpening(int id) {
		getSession().createQuery("update CurrentOpening set delete_approval_status='Pending' where id =  :id").setInteger("id", id).executeUpdate();
	}

	@Override
	public List<CurrentOpening> getAllActiveOpening() {
		return getSession().createQuery("from CurrentOpening where state='A' and delete_approval_status='Active' order by id desc").list();	
	}

	@Override
	public List<CurrentOpening> getAllActiveCurrentOpening() {
		return getSession().createQuery("from CurrentOpening where state='A' and opening_status='Opened' and approval_status='Approved' order by id desc").list();	
	}

	@Override
	public List<CurrentOpening> getAllApprovedOpening(String status) {
		return getSession().createQuery("from CurrentOpening where approval_status='Approved' and delete_approval_status='"+status+"' order by id desc").list();	
	}

	@Override
	public void deletePendingOpening(int id) {
		getSession().createQuery("update CurrentOpening set state='D' where id =  :id").setInteger("id", id).executeUpdate();
	}

	@Override
	public List<CurrentOpening> getOpeningByCreationStatus(String status) {
		return getSession().createQuery("from CurrentOpening where approval_status='"+status+"' and state='A' order by id desc").list();	
	}
	

}
