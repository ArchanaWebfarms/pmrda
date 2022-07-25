package com.cmsManagement.dao;

import java.util.ArrayList;
import java.util.List;

import com.cmsManagement.model.MetaData;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;

public interface MetaDao {

	int AddMeta(MetaData metada);
	
	List<MetaData> metalist ();
	public void UpdateMeta(MetaData metada);
	public MetaData ViewMeta(int id);
	void deleteMeta(int id);
	ArrayList<MetaData> SearchByKeyWord(String str);
	
}
