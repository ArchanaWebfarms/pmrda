package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Modules;
import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.model.UserPermissions;
import com.cmsManagement.util.Constants;

/**
 * @author ujwala_gawari
 *
 */
@Controller
public class UserPermissionController extends AbstractControllerHelper{


	/**
	 * page to create Permission Dash-board.
	 * @return
	 */
	@RequestMapping(value = "/rightDashboard" , method = RequestMethod.GET)
	public ModelAndView rightDashboard(ModelAndView rightDashboardModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				rightDashboardModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						rightDashboardModel.setViewName("permission/rightsDashboard");
					} catch (Exception e) {
						e.printStackTrace();
						rightDashboardModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				rightDashboardModel.setViewName(Constants.HOME);	
			}else{
				rightDashboardModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			rightDashboardModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return rightDashboardModel;
	}

	/**
	 * @return List of Users and Roles .
	 * 
	 */
	@RequestMapping(value = "/userPermission",method=RequestMethod.GET)
	public ModelAndView userPermission(ModelAndView userPermissionModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				userPermissionModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<User> userList=userService.findAllUser();
						userPermissionModel.addObject("userList", userList);
						List<Modules> moduleType=userService.findAllModules();
						userPermissionModel.addObject("moduleType", moduleType);
						List<Roles> roles=roleService.findAllRole();
						userPermissionModel.addObject("roles", roles);
						userPermissionModel.setViewName("permission/userPermission");	 
					} catch (Exception e) {
						e.printStackTrace();
						userPermissionModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				userPermissionModel.setViewName(Constants.HOME);	
			}else{
				userPermissionModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			userPermissionModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return userPermissionModel;
	}

	/**
	 * @return User List in JSON format based on Role ID
	 */
	@ResponseBody
	@RequestMapping(value = "/getUserByRoleID",method=RequestMethod.GET)
	public List<User> getUserByRoleID(ModelMap model, HttpServletRequest request) {
		List<User> userList = null;
		try {
			int roleID=Integer.parseInt(request.getParameter("roleID"));
			userList = userService.getUserByRoleID(roleID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	/**
	 * @return User Permission List in JSON format based on Module id and user id
	 */
	@ResponseBody
	@RequestMapping(value = "/getModulesPermissions", method=RequestMethod.GET)
	public ResponseEntity<List<Permissions>> getModulesPermissions(HttpServletRequest request, Model model){
		int moduleID=Integer.parseInt(request.getParameter("moduleID"));	
		//int userID=Integer.parseInt(request.getParameter("userID"));
		//List<UserPermissions> list= userService.getModulesPermissions1(moduleID, userID);
		//if(list.isEmpty()){
		List<Permissions> permissions= userService.getModulesPermissions(moduleID);
		/*if(permissions.isEmpty()){
			}else{
				for(int i=0; i<permissions.size(); i++){
					UserPermissions up=new UserPermissions();
					Permissions per=new Permissions();
					per.setPermissionID(permissions.get(i).getPermissionID());
					per.setPermissiontype(permissions.get(i).getPermissiontype());
					up.setPermissionID(per);
					up.setStatus("D");
					list.add(up);
				}
			}
		}*/
		return new ResponseEntity<List<Permissions>>(permissions, HttpStatus.OK);
	}

	/**
	 * Register Or Update User Permission based on User Id and module Id.
	 * @return
	 */
	@RequestMapping(value = "/setUserPermission")
	public String setUserPermission(HttpServletRequest request) {
		try {
			int userID= Integer.parseInt(request.getParameter("userID"));
			int moduleID= Integer.parseInt(request.getParameter("moduleID"));
			List<UserPermissions> moduleList = userService.getModulesPermissions1( moduleID,  userID);
			if (moduleList.isEmpty()) {
				List<Permissions> list= userService.getModulesPermissions(moduleID);
				for(int i=0; i<list.size(); i++){
					int pID=userService.setUserPermission(userID, list.get(i).getPermissionID());
				}
				String[] permissionID= request.getParameterValues("permission_ID");
				if(permissionID != null){
					for(int i=0; i<permissionID.length; i++){
						int pID = Integer.parseInt(permissionID[i]);
						boolean results=userService.updateUserPermission(userID, pID);
					}	
				}else{
				}

			}else{
				List<Permissions> list= userService.getModulesPermissions(moduleID);
				for(int i=0; i<list.size(); i++){
					userService.deactivateUserPermission(userID, list.get(i).getPermissionID());
				}
				String[] permissionID= request.getParameterValues("permission_ID");
				if(permissionID==null){
				}else{
					for(int i=0; i<permissionID.length; i++){
						int pID = Integer.parseInt(permissionID[i]);
						boolean results=userService.updateUserPermission(userID, pID);
					}	
				}	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/rightDashboard";
	}

	/**
	 * @return User Permission List.
	 */
	@RequestMapping(value = "/userPermissionsList" , method = RequestMethod.GET)
	public ModelAndView userPermissionsList(ModelAndView userPermissionsListModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				userPermissionsListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<User> userList=userService.findAllUser();
						userPermissionsListModel.addObject("userList", userList);
						userPermissionsListModel.setViewName("permission/userPermissionsList");	 
					} catch (Exception e) {
						e.printStackTrace();
						userPermissionsListModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				userPermissionsListModel.setViewName(Constants.HOME);	
			}else{
				userPermissionsListModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			userPermissionsListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return userPermissionsListModel;
	}

	/**
	 * @return User Permission List in JSON format based on user id.
	 */
	@ResponseBody
	@RequestMapping(value = "/getListOfUserPermissions", method=RequestMethod.GET)
	public ResponseEntity<List<UserPermissions>> getListOfUserPermissions(HttpServletRequest request, ModelMap model) {
		int userID=Integer.parseInt(request.getParameter("userID"));
		List<UserPermissions> permissionslist= userService.getListOfUserPermissions1(userID);
		return new ResponseEntity<List<UserPermissions>>(permissionslist, HttpStatus.OK);
	}

}
