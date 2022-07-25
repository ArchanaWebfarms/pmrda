package com.cmsManagement.service;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.dao.RightsDao;
import com.cmsManagement.dto.Rights;
import com.cmsManagement.model.RightsDto;


@Service()
@Transactional
public class RightServiceImpl implements RightService {

	@Autowired
	private RightsDao rightsdao;
	
	@Override
	public void saveRights(Rights rights) {

		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();

		rights.setCreated_by(1);
		rights.setCreated_date(dateFormat.format(date));
		rights.setUpdated_by(0);
		rights.setUpdated_date("");
		rightsdao.saveRights(rights);
	}


	@Override
	public List<Rights> findAllRights() {
		return rightsdao.findAllRights();
	}


	@Override
	public RightsDto findRightsById(int id) {
		return rightsdao.findRightsById(id);
	}


	@Override
	public void deleteRight(int rightId) {
		rightsdao.deleteRight(rightId);
		
	}


	@Override
	public Rights updateRights(Rights rights) {
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		rights.setUpdated_by(1);
		rights.setUpdated_date(dateFormat.format(date));		
		return rightsdao.updateRights(rights);
	}

}
