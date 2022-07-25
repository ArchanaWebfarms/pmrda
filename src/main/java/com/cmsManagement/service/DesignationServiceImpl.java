package com.cmsManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.DesignationDao;
import com.cmsManagement.model.Designation;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

@Service
public class DesignationServiceImpl implements DesignationService{
@Autowired
DesignationDao designationdao;
	@Override
	public int saveDesignation(Designation designation) {
		List<Designation> sequencesise = designationdao.getDesignationList();
		int size = sequencesise.size();
		int nextdesignationsnumber = size+1;
		designation.setSequence(nextdesignationsnumber);
		designation.setState(Constants.ACTIVE_STATE);
		designation.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		designation.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		
		
		
		return designationdao.saveDesignation(designation);
	}
	@Override
	public List<Designation> getDesignationList() {
		return designationdao.getDesignationList();
	}
	@Override
	public boolean updateDesignation(Designation designation) {
		designation.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		designation.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		
		return designationdao.updateDesignation(designation);
	}
	@Override
	public Designation findDesignationById(int designationId) {
		// TODO Auto-generated method stub
		return designationdao.findDesignationById(designationId);
	}
	@Override
	public void deleteDesignationById(int id) {
		designationdao.deleteDesignationById(id);
		
	}

}
