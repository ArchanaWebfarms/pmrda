package com.cmsManagement.dao;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.Notices;
import com.cmsManagement.util.Constants;


/**
 * @author ujwala_gawari
 *
 */
@Repository()
@Transactional
public class FinancialYearDaoImpl extends AbstractDao<Integer, FinancialYear> implements FinancialYearDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<FinancialYear> getFinancialYearList() {
		/*Criteria crit = getSession().createCriteria(FinancialYear.class).
				add(Restrictions.eq("state", Constants.ACTIVE_STATE)).
				addOrder(Order.desc("created_date"));
		return crit.list();*/
		return (List<FinancialYear>) getSession().createQuery("from FinancialYear where state='A'").list();

		
	}

	@Override
	public int saveFinancialYear(FinancialYear financialYear) {
		 return (int) getSession().save(financialYear);
	}
	
	/* public E update(E entity) {
	        currentSession().update(entity);
	        return (E) entity;
	    }*/
	
	@Override
	public boolean updateFinancialYear(FinancialYear financialYear) {
		try {
			getSession().update(financialYear);
			return true;
		} catch (Exception exception) {
			return false;
		}
	}

	@Override
	public FinancialYear getFinancialYear(int financialId) {
		Criteria crit = getSession().createCriteria(FinancialYear.class).
				add(Restrictions.eq("financialId", financialId));
		return (FinancialYear) crit.uniqueResult();
	}

	@Override
	public FinancialYear getCurrentActiveFinancialYear() {
		Criteria crit = getSession().createCriteria(FinancialYear.class).
				add(Restrictions.eq("currentStatus", Constants.YES_STATE));
		return (FinancialYear) crit.uniqueResult();
	}

	@Override
	public FinancialYear checkUniqueFinacialYear(String financialYear) {
		Criteria criteria = getSession().createCriteria(FinancialYear.class);
		criteria.add(Restrictions.eq("financialYear", financialYear));	
		return (FinancialYear) criteria.uniqueResult();
	}

	/*@Override
	public void deleteFinancialYear(FinancialYear financialYear) {
		System.out.println("Delete2");
	}

	@Override
	public void saveChangedFYCurrentStatus(FinancialYear financialYear) {
	}*/

}
