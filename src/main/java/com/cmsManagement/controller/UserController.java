package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.cmsManagement.dto.UserDto;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.PasswordEncryptionSHA512;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;

/**
 * @author ujwala_gawari
 *
 */
@Controller
public class UserController extends AbstractControllerHelper{

	@RequestMapping(value = "/userDashboard")
	public String userDashboard(ModelMap model) {

		return "user/userDashboard";
	}


	/**
	 * @return List of users based on state.
	 * 
	 */
	@RequestMapping(value = "/userList",method=RequestMethod.GET)
	public ModelAndView userList(ModelAndView userListModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				userListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<User> userList=userService.findAllUser();
						userListModel.addObject("userList", userList);
						userListModel.setViewName("user/userList");
					} catch (Exception e) {
						e.printStackTrace();
						userListModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				userListModel.setViewName(Constants.HOME);	
			}else{
				userListModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			userListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return userListModel;	 
	}



	/**
	 * page to create user.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/newUser",method=RequestMethod.GET)
	public ModelAndView newRegistration(UserDto userDto, ModelAndView newRegistrationModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				newRegistrationModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Roles> roles=roleService.findAllRole();
						newRegistrationModel.addObject("roles", roles);
						newRegistrationModel.addObject("userDto", userDto);
						newRegistrationModel.setViewName("user/newUser");
					} catch (Exception e) {
						e.printStackTrace();
						newRegistrationModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newRegistrationModel.setViewName(Constants.HOME);	
			}else{
				newRegistrationModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			newRegistrationModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return newRegistrationModel;
	}


	/**
	 * Register Or Update User based on User Id.
	 * @param userDto
	 * @return
	 */
	@RequestMapping(value = "/saveUser",method=RequestMethod.POST)
	public ModelAndView saveRegistration(@ModelAttribute("userDto")  @Valid UserDto userDto, BindingResult result, ModelAndView model) {

		try {
			if (result.hasErrors()) {
				List<Roles> roles=roleService.findAllRole();

				model.addObject("roles", roles);
				model.setViewName("user/newUser");
				return model;
			}
			else
			{
				/*Prevent User from XSS attack*/
				userDto=PreventionFromXSSAttack.preventUser(userDto);

				User user = new User();
				BeanUtils.copyProperties(userDto, user);
				if(userDto.getUser_id()==0){
					user.setState("A");
					int id=userService.saveUser(user);


				}else {
					boolean results = userService.updateUser(user);

				}
				//model.addAttribute("success", "User " + user.getFirstName() + " has been registered successfully");
				//model.addAttribute(Constants.USER, LoginController.getPrincipal());

				model.setViewName("redirect:/userList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}



	@RequestMapping(value = "/EditUser",method=RequestMethod.POST)
	public ModelAndView EditRegistration(@ModelAttribute("userDto")  @Valid UserDto userDto, BindingResult result, ModelAndView model) {

		try {
			/*Prevent User from XSS attack*/
			userDto=PreventionFromXSSAttack.preventUser(userDto);

			User user = new User();
			BeanUtils.copyProperties(userDto, user);

			boolean results = userService.updateUser(user);

			model.setViewName("redirect:/userList");
		} catch (BeansException e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}

		return model;
	}











	/**
	 * @return User in JSON format to check Unique User to Add
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/checkUsername")
	public User checkUsername(HttpServletRequest request, Model model) {

		User user = null;
		try {
			String username=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("username")));
			user = userService.checkUsername(username);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	/**
	 * @return User in JSON format to check Unique User to Update
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/checkEditedUsername")
	public User checkEditedUsername(HttpServletRequest request, Model model) {
		User user = null;
		try {
			String username=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("username")));
			int userId=Integer.parseInt(request.getParameter("user_id"));
			user = userService.checkEditedUsername(username, userId);
		} catch (Exception e) {
			e.printStackTrace();			
		}

		return user;
	}

	/**
	 * @return User by id to Show User Information
	 */
	@RequestMapping(value = "/viewUser",method=RequestMethod.POST)
	public ModelAndView viewUser(HttpServletRequest request, ModelAndView viewUserModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				viewUserModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE)){
					int userId = 0;
					try {
						userId = Integer.parseInt(request.getParameter("userId"));
						session.setAttribute("userID1", userId);
					} catch (Exception e) {
						userId=(int) session.getAttribute("userID1");
					}finally{
						try {
							User user=userService.findUserById(userId);
							viewUserModel.addObject("userDto", user);
							viewUserModel.setViewName("user/viewUser");
						} catch (Exception e) {
							e.printStackTrace();
							viewUserModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				viewUserModel.setViewName(Constants.HOME);	
			}else{
				viewUserModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			viewUserModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return viewUserModel;
	}

	/**
	 * page to update user.
	 * @return
	 */
	@RequestMapping(value = "/editUser",method=RequestMethod.POST)
	public ModelAndView editUser(HttpServletRequest request, ModelAndView editUserModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				editUserModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int userId =0;
					try {
						userId = Integer.parseInt(request.getParameter("userId"));
						session.setAttribute("userID2", userId);
					} catch (Exception e) {
						userId=(int) session.getAttribute("userID2");
					}finally{
						try {
							User user=userService.findUserById(userId);
							editUserModel.addObject("userDto", user);
							List<Roles> roles=roleService.findAllRole();
							editUserModel.addObject("roles", roles);
							editUserModel.setViewName("user/editUser");
						} catch (Exception e) {
							e.printStackTrace();
							editUserModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				editUserModel.setViewName(Constants.HOME);	
			}else{
				editUserModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			editUserModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return editUserModel;
	}

	/**
	 * Deactivate User By User Id.
	 * @return
	 */
	@RequestMapping(value = "/deleteUser",method=RequestMethod.POST)
	public ModelAndView deleteUser(HttpServletRequest request, ModelAndView deleteUserModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteUserModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						int userId = Integer.parseInt(request.getParameter("userId"));
						boolean result=userService.deleteUser(userId);
						deleteUserModel.setViewName("redirect:/userList");
					} catch (Exception e) {
						e.printStackTrace();
						deleteUserModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteUserModel.setViewName(Constants.HOME);	
			}else{
				deleteUserModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			deleteUserModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return deleteUserModel;
	}


	/**
	 * view to change user password.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/changePassword",method=RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request,  ModelAndView changePasswordModel,HttpSession session) {		
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				changePasswordModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int userId =0;
					try {
						userId = Integer.parseInt(request.getParameter("userId"));
						session.setAttribute("userID3", userId);
					} catch (Exception e) {
						userId=(int) session.getAttribute("userID3");
					}finally{
						try {
							changePasswordModel.addObject("userID", userId);
							changePasswordModel.setViewName("user/changePassword");
							session.setAttribute("action", "");
							session.setAttribute("msg", "Password Information");
						} catch (Exception e) {
							e.printStackTrace();
							changePasswordModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				changePasswordModel.setViewName(Constants.HOME);	
			}else{
				changePasswordModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			changePasswordModel.setViewName("redirect:/logout");
		}
		return changePasswordModel;		
	}


	/**
	 *check old oldPassword.
	 * 
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/CheckOldPassword")
	public String CheckOldPassword(HttpServletRequest request, Model model) {

		String CheckOldPassword = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("oldPassword")));

		int userId = Integer.parseInt(request.getParameter("user_id"));
		User user=userService.findUserById(userId);
		/*String password = user.getPassword();
		boolean isCurrentPasswordCorrect = new BCryptPasswordEncoder().matches(CheckOldPassword, user.getPassword());
		boolean isCurrentPasswordCorrect1 = new BCryptPasswordEncoder().matches(password, user.getPassword());

		if( isCurrentPasswordCorrect==isCurrentPasswordCorrect1 ){

			return "SAME";
		}

		if(isCurrentPasswordCorrect && isCurrentPasswordCorrect!=isCurrentPasswordCorrect1){

			return "Sucess";
		}*/

		String userPassword=PasswordEncryptionSHA512.getSecurePassword(CheckOldPassword, user.getPass_salt());
		if(userPassword.equals(user.getPassword())){
			return "Sucess";
		}else{
			return "Error";
		}

	}

	@ResponseBody
	@RequestMapping(value = "/PasswordPolicy")
	public String PasswordPolicy(HttpServletRequest request, Model model) {
		String policy = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";

		String newPassword = request.getParameter("newPassword");

		if(newPassword.matches(policy))
		{
			return "Sucess";
		}else{
			return "Error";
		}

		

	}
	/**
	 * Update User password.
	 * 
	 */

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/updatepassword", method = RequestMethod.POST)
	public ModelAndView saveChangedPassword(HttpServletRequest request, ModelAndView model) {	
		try {
			String action = request.getParameter("action");

			int userId = Integer.parseInt(request.getParameter("user_id"));
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("newPassword")));
			System.out.println("newPassword :"+newPassword);
			if(action.equals("FirstLogedIn"))
			{
				boolean result= userService.updatePassword(userId, newPassword);
				//model.setViewName("redirect:login?logout");
				model.setViewName("redirect:logout");
			}
			else
			{
				User user=userService.findUserById(userId);
				/*boolean isCurrentPasswordCorrect = new BCryptPasswordEncoder().matches(oldPassword, user.getPassword());
				if(isCurrentPasswordCorrect){
					boolean result= userService.updatePassword(userId, newPassword);
					model.setViewName("redirect:userList");

				}*/
				//String userPassword=PasswordEncryptionSHA512.getSecurePassword(oldPassword, user.getPass_salt());
				//if(userPassword.equals(user.getPassword())){
					boolean result= userService.updatePassword(userId, newPassword);
					model.setViewName("redirect:userList");
				//}
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}



		return model;
	}






}
