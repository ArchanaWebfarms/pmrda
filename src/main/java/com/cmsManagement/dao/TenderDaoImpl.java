package com.cmsManagement.dao;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.util.Constants;


@Repository()
public class TenderDaoImpl extends AbstractDao<Integer, Tendors> implements TenderDao {
	@Autowired
	FinancialYearDao financialYearDao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> getAllTendors() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		return (List<Tendors>) getSession().createQuery("from Tendors where state='A' and delete_approval_status='Active' ORDER BY id DESC").list();
	}

	@Override
	public int saveTendors(Tendors tendors) {
		return (int) getSession().save(tendors);
	}

	@Override
	public boolean updateTendors(Tendors tendors) {
		try {
			getSession().update(tendors);
			return true;

		} catch (Exception exception) {
			return false;
		}	
	}

	
	@Override
	public Tendors findTenderById(int tenderId) {
		Criteria criteria = getSession().createCriteria(Tendors.class); 
		
		criteria.add(Restrictions.eq("id", tenderId));
		return (Tendors) criteria.uniqueResult();
	}
	
	
	@Override
	public TendorsDepartment findTenderDepartmentId(int department) {
		Criteria criteria = getSession().createCriteria(TendorsDepartment.class);  
	    criteria.add(Restrictions.eq("dept_id",department));
	    criteria.add(Restrictions.eq("state","A"));
	    return (TendorsDepartment) criteria.uniqueResult();
	}
	

	@Override
	public boolean deleteTender(int tenderId) {
		try {
			getSession().createQuery("update Tendors set state = 'D' where id = :id")
	        .setInteger( "id", tenderId)
	        .executeUpdate();
			 return true;
		} catch (Exception exception) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TendorsDepartment> getTenderDepartment() {

		return (List<TendorsDepartment>) getSession().createQuery("from TendorsDepartment where state='A'  ORDER BY created_date DESC").list();

	}

	@Override
	public boolean deleteAttachmentById(int attachmentID) {
		try {
			Attachment attachment = (Attachment) getSession().createCriteria(Attachment.class)
	                 .add(Restrictions.eq("attachmentID", attachmentID)).uniqueResult();
			getSession().delete(attachment);
			return true;
		} catch (Exception exception) {
			return false;
		}	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> adminTenderList() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		Criteria crit = getSession().createCriteria(Tendors.class)
				  .add(Restrictions.eq("financialYear.financialId",financialId))
				  .add(Restrictions.eq(Constants.PUBLISH_STATUS, Constants.PENDING_STATUS))
				.addOrder(Order.desc(Constants.CREATED_DATE));
		return (List<Tendors>)crit.list();
	}

	@Override
	public void changeTendorStaus(int tender_id, String comment, String date, String approvalBy, String tendorStatus) {
		getSession().createQuery("update Tendors set approvalBy = '"+approvalBy+"', comment = '"+comment+"',"
				+ " approveddate = '"+date+"', publishStatus = '"+tendorStatus+"'  where id = :id")
        .setInteger( "id", tender_id)
        .executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> getTendorListByStatus(String tendorStatus) {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		if(tendorStatus.equals(Constants.REPORT_TYPE_ALL)){
			

			return (List<Tendors>) getSession().createQuery("from Tendors where state='A'  ORDER BY created_date DESC").list();
		}else{

			return (List<Tendors>) getSession().createQuery("from Tendors where state='A'  and publishStatus = '"+tendorStatus+"' ORDER BY created_date DESC").list();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> getAllPendingTendors() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		return (List<Tendors>) getSession().createQuery("from Tendors where state='A' and  publishStatus='Approved' and financialYear.financialId = '"+financialId+"' ORDER BY created_date DESC").list();
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> searchTendersByDepartment(int deptID) {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
	int financialId=f.getFinancialId();
		if(deptID==0){
			return (List<Tendors>) getSession().createQuery("from Tendors where  state='A' and publishStatus='Approved'  ORDER BY created_date DESC").list();
		}else{
			return (List<Tendors>) getSession().createQuery("from Tendors where state='A' and  publishStatus='Approved' and tendorsDepartment='"+deptID+"' ORDER BY created_date DESC").list();
		}		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> searchTendersByFinancialYear(int financialId) {
		if(financialId==0){
			return (List<Tendors>) getSession().createQuery("from Tendors where state='A' and publishStatus='Approved' ORDER BY id DESC").list();
		}else{
			return (List<Tendors>) getSession().createQuery("from Tendors where state='A' and publishStatus='Approved' and financialYear='"+financialId+"' ORDER BY id DESC").list();
		}
	}

	@Override
	public List<Tendors> getAllApprovedTendors() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		return (List<Tendors>) getSession().createQuery("from Tendors where state='A' and publishStatus = 'Approved' ORDER BY id DESC").list();
	
	}

	@Override
	public List<Tendors> GetdTendorsByDates(String date1, String date2) {

		String query2="from Tendors where (state='A') and  (publishStatus = 'Approved') and (publish_date BETWEEN '"+date1+"' and '"+date2+"' ) ORDER BY id DESC";
		Query query3=getSession().createQuery(query2);	

	   return query3.list();
	}

	@Override
	public ArrayList<Tendors> SearchTenderByKeyWord(String str) {
		Query qry =getSession().createQuery("From Tendors   where state='A' and   publishStatus = 'Approved' and  ( title    like ? or description like ?  )   ");
		qry.setString(0, "%"+str+"%");
		qry.setString(1, "%"+str+"%");
		return (ArrayList<Tendors>) qry.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> searchTendersByDepartment(int deptID,
			String publishStatus) {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
			if(deptID==0){
				return (List<Tendors>) getSession().createQuery("from Tendors where  state='A' and publishStatus='Archived' and financialYear.financialId = '"+financialId+"' ORDER BY id DESC").list();
			}else{
				return (List<Tendors>) getSession().createQuery("from Tendors where state='A' and  publishStatus='Archived' and financialYear.financialId = '"+financialId+"'  and tendorsDepartment='"+deptID+"' ORDER BY id DESC").list();
			}	
	}

	@Override
	public void changeTendorStaus1(int id, String string, String date,
			String string2) {
		getSession().createQuery("update Tendors set comment = '"+string+"',"
				+ " approveddate = '"+date+"', publishStatus = '"+string2+"'  where id = :id")
        .setInteger( "id", id)
        .executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tendors> getAllPendingDeactiveTender(String status) {
		return (List<Tendors>) getSession().createQuery("from Tendors where (publishStatus='Approved' or publishStatus='Archived') and delete_approval_status='"+status+"' ORDER BY id DESC").list();
	}

	
	
}
