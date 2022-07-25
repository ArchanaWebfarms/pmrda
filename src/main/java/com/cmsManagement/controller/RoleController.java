package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;















import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Designation;
import com.cmsManagement.model.Roles;
import com.cmsManagement.util.Constants;

/**
 * @author ujwala_gawari
 *
 */
@Controller
public class RoleController extends AbstractControllerHelper{


	@RequestMapping(value = "/roleDashboard" , method = RequestMethod.GET)
	public String roleDashboard(ModelMap model) {
		return "role/roleDashboard";
	}

	/**
	 * page to create new Role.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newRole", method = RequestMethod.GET)
	public ModelAndView newRoleRegistration(ModelAndView newRoleRegistrationModel,@ModelAttribute("roles")  Roles roles,BindingResult result,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				newRoleRegistrationModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						Roles role = new Roles();
						newRoleRegistrationModel.addObject("role", role);
						newRoleRegistrationModel.setViewName("role/newRole");
					} catch (Exception e) {
						e.printStackTrace();
						newRoleRegistrationModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newRoleRegistrationModel.setViewName(Constants.HOME);	
			}else{
				newRoleRegistrationModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			newRoleRegistrationModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return newRoleRegistrationModel;
	}


	/**
	 * Register Or Update Role based on Role Id.
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "/saveRoleRegistration",method=RequestMethod.POST)
	public ModelAndView saveRoleRegistration(@ModelAttribute("roles") @Valid Roles roles,BindingResult result, ModelAndView model){
		try {
			if (result.hasErrors()) {
				model.setViewName("role/newRole");
			}
			else
			{
				if(roles.getRole_id()==0){
					int id=roleService.saveRole(roles);
				}else{
					roleService.updateRole(roles);
				}
				model.setViewName("redirect:/listOfRoles");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	/**
	 * @return Role in JSON format to check Unique Role to Add
	 */
	@ResponseBody
	@RequestMapping(value = "/checkRole",method=RequestMethod.POST)
	public Roles checkRole(HttpServletRequest request, Model model) {
		Roles role = null;
		try {
			role = roleService.checkRole(request.getParameter("role_type"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return role;
	}


	/**
	 * @return List of Roles based on state.
	 * 
	 */
	@RequestMapping(value = "/listOfRoles",method=RequestMethod.GET)
	public ModelAndView listOfRoles(ModelAndView listOfRolesModel,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				listOfRolesModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Roles> roleList=roleService.findAllRole();				  
						listOfRolesModel.addObject("roleList", roleList);
						listOfRolesModel.setViewName("role/roleList");
					} catch (Exception e) {
						e.printStackTrace();
						listOfRolesModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				listOfRolesModel.setViewName(Constants.HOME);	
			}else{
				listOfRolesModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			listOfRolesModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return listOfRolesModel;
	}

	/**
	 * page to update Role.
	 * @return
	 */
	@RequestMapping(value = "/editRole",method=RequestMethod.POST)
	public ModelAndView editRole(@ModelAttribute("roles")  Roles roles, HttpServletRequest request, ModelAndView editRoleModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				editRoleModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int roleId=0;
					try {
						 roleId=Integer.parseInt(request.getParameter("roleId"));
						session.setAttribute("roleID1", roleId);
					} catch (Exception e) {
						roleId=(int) session.getAttribute("roleID1");
					}finally{
						try {
							roles=roleService.findRollById(roleId);
							editRoleModel.addObject("roles", roles);
							editRoleModel.setViewName("role/newRole");
						} catch (Exception e) {
							e.printStackTrace();
							editRoleModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				editRoleModel.setViewName(Constants.HOME);	
			}else{
				editRoleModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			editRoleModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return editRoleModel;
	}

	/**
	 * Deactivate Role By Role Id.
	 * @return
	 */
	@RequestMapping(value = "/deleteRole",method=RequestMethod.POST)
	public ModelAndView deleteRole(HttpServletRequest request,ModelAndView deleteRoleModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteRoleModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						int roleId=Integer.parseInt(request.getParameter("id"));
						boolean result=roleService.deleteRole(roleId);
						deleteRoleModel.setViewName("redirect:/listOfRoles");
					} catch (Exception e) {
						e.printStackTrace();
						deleteRoleModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteRoleModel.setViewName(Constants.HOME);	
			}else{
				deleteRoleModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			deleteRoleModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return deleteRoleModel;
	}

}
