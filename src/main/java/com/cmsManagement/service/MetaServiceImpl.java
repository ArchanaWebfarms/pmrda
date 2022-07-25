package com.cmsManagement.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.dao.MetaDao;
import com.cmsManagement.model.MetaData;
@Service
@Transactional
public class MetaServiceImpl implements  MetaService{
@Autowired
MetaDao meta;
	@Override
	public int AddMeta(MetaData metada) {
	metada.setState("A");
		return meta.AddMeta(metada);
	}

	@Override
	public List<MetaData> metalist() {
		// TODO Auto-generated method stub
		return meta.metalist();
	}

	@Override
	public void UpdateMeta(MetaData metada) {
		metada.setState("A");
		meta.UpdateMeta(metada);
		
	}

	@Override
	public ArrayList<MetaData> SearchByKeyWord(String str) {
		// TODO Auto-generated method stub
		return meta.SearchByKeyWord(str);
	}

	@Override
	public MetaData ViewMeta(int id) {
		// TODO Auto-generated method stub
		return meta.ViewMeta(id);
	}

	@Override
	public void deleteMeta(int id) {
		meta.deleteMeta(id);
		
	}

}
