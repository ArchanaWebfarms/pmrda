package com.cmsManagement.dao;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.util.Constants;

/**
 * @author ujwala_gawari
 *
 */
@Transactional
@Repository
public class TendorDepartmentDaoImpl  extends AbstractDao<Integer, TendorsDepartment> implements TendorDepartmentDao {

	@Override
	public TendorsDepartment getTendorsDepartmentById(int deptId) {
		Criteria criteria=getSession().createCriteria(TendorsDepartment.class);
		    criteria.add(Restrictions.eq("dept_id", deptId));
		return (TendorsDepartment) criteria.uniqueResult();
	}

	@Override
	public boolean updateTenderDepartment(TendorsDepartment tendorsDepartment) {
		try {
			getSession().update(tendorsDepartment);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public int saveTenderDepartmentRegistration(TendorsDepartment tendorsDepartment) {
		return (int) getSession().save(tendorsDepartment);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TendorsDepartment> tendorDepartmentList() {
		Criteria criteria=getSession().createCriteria(TendorsDepartment.class);
	    criteria.add(Restrictions.eq("state", "A"))
	    .addOrder(Order.desc(Constants.CREATED_DATE));
	    return criteria.list();

	}

	@Override
	public TendorsDepartment checkTenderDepartment(String departmentName) {
		Criteria criteria=getSession().createCriteria(TendorsDepartment.class);
	    criteria.add(Restrictions.eq("departmentName", departmentName));
	    return (TendorsDepartment) criteria.uniqueResult();
	}

}
