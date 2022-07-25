package com.cmsManagement.dao;


import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.model.Designation;
import com.cmsManagement.model.Notices;
@Repository
@Transactional
public class DesignationDaoImpl extends AbstractDao<Integer, Designation> implements DesignationDao {

	public int saveDesignation(Designation designation) {
		return (int) getSession().save(designation);
	}

	@Override
	public List<Designation> getDesignationList() {
		
		return (List<Designation>) getSession().createQuery("from Designation where state='A'").list();

	}

	@Override
	public boolean updateDesignation(Designation designation) {
		int id = designation.getDesignationId();
		try{
			getSession().createQuery("update Designation set sequence = '"+designation.getSequence()+"', designation =  '"+designation.getDesignation()+"',description = '"+designation.getDescription()+"' , MODIFIED_BY =  '"+designation.getUpdated_by()+"',MODIFIED_ON = '"+designation.getUpdated_date()+"' where id = :id").setInteger( "id", id).executeUpdate();

			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Designation findDesignationById(int designationId) {
		return getByKey(designationId);
	}

	@Override
	public void deleteDesignationById(int id) {
		getSession().createQuery("update Designation set sequence = '0', state ='D' where id = :id").setInteger( "id", id).executeUpdate();

	}

}
