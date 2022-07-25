package com.cmsManagement.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.MetaData;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
@Repository
public class MetaDaoImpl extends AbstractDao<Serializable, MetaData> implements MetaDao{

	@Override
	public int AddMeta(MetaData metada) {
		
		return (int) getSession().save(metada);
	}

	@Override
	public List<MetaData> metalist() {
		
		return (List<MetaData>) getSession().createQuery("from MetaData where state='A' ").list();
	}

	

	@Override
	public void UpdateMeta(MetaData metada) {
		getSession().update(metada);
		
	}

	@Override
	public ArrayList<MetaData> SearchByKeyWord(String str) {
		// TODO Auto-generated method stub
		Query qry =getSession().createQuery("From MetaData   where state='A'   and   ( title    like ? or description like ?  ) ");
		qry.setString(0, "%"+str+"%");
		qry.setString(1, "%"+str+"%");
		return (ArrayList<MetaData>) qry.list();
	}

	@Override
	public MetaData ViewMeta(int id) {
		
		return getByKey(id);
	}

	@Override
	public void deleteMeta(int id) {
		getSession().createQuery("update MetaData set state = 'D' where id = :id").setInteger( "id", id).executeUpdate();
		
	}

}
