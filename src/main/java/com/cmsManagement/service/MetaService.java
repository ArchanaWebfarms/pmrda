package com.cmsManagement.service;

import java.util.ArrayList;
import java.util.List;



import org.springframework.stereotype.Service;

import com.cmsManagement.model.MetaData;

public interface MetaService {
    int AddMeta(MetaData metada);
	List<MetaData> metalist ();
	public void UpdateMeta(MetaData metada);
	public MetaData ViewMeta(int id);
	void deleteMeta(int id);
	ArrayList<MetaData> SearchByKeyWord(String str);
}
