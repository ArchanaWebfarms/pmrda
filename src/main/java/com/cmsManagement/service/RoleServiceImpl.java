package com.cmsManagement.service;
import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.RoleDao;
import com.cmsManagement.model.Roles;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;

/**
 * @author ujwala_gawari
 *
 */
@Service()
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roledao;
	
	@Override
	public int saveRole(Roles role) {
		role.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		role.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		role.setStatus(Constants.ACTIVE_STATE);
		
		/*Prevent roles from XSS attack*/
		role=PreventionFromXSSAttack.preventRoles(role);
		
		return roledao.saveRole(role);
	}

	@Override
	public List<Roles> findAllRole() {
		return roledao.findAllRole();
	}

	@Override
	public Roles findRollById(int id) {
		return roledao.findRollById(id);
	}

	@Override
	public boolean deleteRole(int roleId) { 
		/*Roles roles= new Roles();
		roles.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		roles.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		roles.setStatus(Constants.DEACTIVE_STATE);*/
		//int updatedBy=LoginController.getCurrentLoggedInUser().getUser().getUser_id();
		//String updatedDate=MethodsHelper.getCurrentDateAndTime();
		//return roledao.deleteRole(roleId, updatedBy, updatedDate);
		return roledao.deleteRole(roleId);
	}

	@Override
	public boolean updateRole(Roles role) {
		Roles roles=roledao.findRollById(role.getRole_id());
		roles.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		roles.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		roles.setRole_type(role.getRole_type());
		roles.setDescription(role.getDescription());
		roles.setStatus(Constants.ACTIVE_STATE);
		
		/*Prevent roles from XSS attack*/
		roles=PreventionFromXSSAttack.preventRoles(roles);
		
		 return roledao.updateRole(roles);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Roles checkRole(String roleType) {
		return roledao.checkRole(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(roleType)));
	}

}
