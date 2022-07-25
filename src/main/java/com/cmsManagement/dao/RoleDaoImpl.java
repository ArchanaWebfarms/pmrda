package com.cmsManagement.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.Roles;
import com.cmsManagement.util.Constants;

/**
 * @author ujwala_gawari
 *
 */
@Repository()
public class RoleDaoImpl extends AbstractDao<Integer, Roles> implements RoleDao {

	
	@Override
	public int saveRole(Roles role) {
		return (int) getSession().save(role);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Roles> findAllRole() {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq(Constants.STATUS, Constants.ACTIVE_STATE));
		crit.addOrder(Order.desc(Constants.CREATED_DATE));
		return (List<Roles>)crit.list();
	}

	@Override
	public Roles findRollById(int id) {
		return getByKey(id);
	}

	

	@Override
	public boolean updateRole(Roles role) {
		try {
			getSession().update(role);
			return true;
		} catch (Exception exception) {
			return false;
		}	
	}

	@Override
	public Roles checkRole(String roleType) {
		Criteria criteria = getSession().createCriteria(Roles.class, "role");
		criteria.add(Restrictions.eq("role.role_type", roleType));	
		return (Roles) criteria.uniqueResult();
	}

	@Override
	public boolean deleteRole(int roleId) {
		try {
			getSession().createQuery("update Roles set STATUS = 'D' where ID = :ID").setInteger( "ID", roleId).executeUpdate();
           return true;
		} catch (Exception exception) {
			return false;
		}
	}

}
