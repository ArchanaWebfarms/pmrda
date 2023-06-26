package com.cmsManagement.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.ProjectLogs;
import com.cmsManagement.service.LogsService;
import com.cmsManagement.util.Constants;

@Controller
public class LogsController {
	
	@Autowired
	private LogsService logsService;

	@RequestMapping(value = "/module_logs",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView modulelogs(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					model.setViewName("Logs/logsDashboard");
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/project_logs",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView projectlogs(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					List<ProjectLogs> list = logsService.getAllProjectLogs();
					model.addObject("list", list);
					model.setViewName("Logs/projectLogs");
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}
	
	/*
	 * @RequestMapping(value = "/news_logs",method=
	 * {RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * newsLogs(ModelAndView model,HttpServletRequest req,HttpSession session) { try
	 * { String login=(String) session.getAttribute("login"); String
	 * userType=(String) session.getAttribute("userType"); if(login.equals("login")
	 * && userType.equals(Constants.PERMANENT)){
	 * model.setViewName(Constants.ACCESS_DENIED);
	 * if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().
	 * getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
	 * LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type()
	 * .equals(GrantedPermission.SUPER_ADMIN_ROLE)){ List<ProjectLogs> list =
	 * logsService.getAllProjectLogs(); model.addObject("list", list);
	 * model.setViewName("Logs/newslogs"); } }else if(login.equals("login") &&
	 * userType.equals(Constants.TEMPORARY)){ model.setViewName(Constants.HOME);
	 * }else{ model.setViewName(Constants.ACCESS_DENIED); } } catch (Exception e1) {
	 * model.setViewName("redirect:/logout"); e1.printStackTrace(); } return model;
	 * }
	 * 
	 * @RequestMapping(value = "/tender_notice_logs",method=
	 * {RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * tender_notice_logs(ModelAndView model,HttpServletRequest req,HttpSession
	 * session) { try { String login=(String) session.getAttribute("login"); String
	 * userType=(String) session.getAttribute("userType"); if(login.equals("login")
	 * && userType.equals(Constants.PERMANENT)){
	 * model.setViewName(Constants.ACCESS_DENIED);
	 * if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().
	 * getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
	 * LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type()
	 * .equals(GrantedPermission.SUPER_ADMIN_ROLE)){ List<ProjectLogs> list =
	 * logsService.getAllProjectLogs(); model.addObject("list", list);
	 * model.setViewName("Logs/tenderLogs"); } }else if(login.equals("login") &&
	 * userType.equals(Constants.TEMPORARY)){ model.setViewName(Constants.HOME);
	 * }else{ model.setViewName(Constants.ACCESS_DENIED); } } catch (Exception e1) {
	 * model.setViewName("redirect:/logout"); e1.printStackTrace(); } return model;
	 * }
	 * 
	 * @RequestMapping(value = "/current_opening_logs",method=
	 * {RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * current_opening_logs(ModelAndView model,HttpServletRequest req,HttpSession
	 * session) { try { String login=(String) session.getAttribute("login"); String
	 * userType=(String) session.getAttribute("userType"); if(login.equals("login")
	 * && userType.equals(Constants.PERMANENT)){
	 * model.setViewName(Constants.ACCESS_DENIED);
	 * if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().
	 * getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
	 * LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type()
	 * .equals(GrantedPermission.SUPER_ADMIN_ROLE)){ List<ProjectLogs> list =
	 * logsService.getAllProjectLogs(); model.addObject("list", list);
	 * model.setViewName("Logs/currentOpeningLogs"); } }else
	 * if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
	 * model.setViewName(Constants.HOME); }else{
	 * model.setViewName(Constants.ACCESS_DENIED); } } catch (Exception e1) {
	 * model.setViewName("redirect:/logout"); e1.printStackTrace(); } return model;
	 * }
	 * 
	 * @RequestMapping(value = "/department_logs",method=
	 * {RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * department_logs(ModelAndView model,HttpServletRequest req,HttpSession
	 * session) { try { String login=(String) session.getAttribute("login"); String
	 * userType=(String) session.getAttribute("userType"); if(login.equals("login")
	 * && userType.equals(Constants.PERMANENT)){
	 * model.setViewName(Constants.ACCESS_DENIED);
	 * if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().
	 * getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
	 * LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type()
	 * .equals(GrantedPermission.SUPER_ADMIN_ROLE)){ List<ProjectLogs> list =
	 * logsService.getAllProjectLogs(); model.addObject("list", list);
	 * model.setViewName("Logs/departmentLogs"); } }else if(login.equals("login") &&
	 * userType.equals(Constants.TEMPORARY)){ model.setViewName(Constants.HOME);
	 * }else{ model.setViewName(Constants.ACCESS_DENIED); } } catch (Exception e1) {
	 * model.setViewName("redirect:/logout"); e1.printStackTrace(); } return model;
	 * }
	 * 
	 * @RequestMapping(value = "/notification_logs",method=
	 * {RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * notification_logs(ModelAndView model,HttpServletRequest req,HttpSession
	 * session) { try { String login=(String) session.getAttribute("login"); String
	 * userType=(String) session.getAttribute("userType"); if(login.equals("login")
	 * && userType.equals(Constants.PERMANENT)){
	 * model.setViewName(Constants.ACCESS_DENIED);
	 * if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().
	 * getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
	 * LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type()
	 * .equals(GrantedPermission.SUPER_ADMIN_ROLE)){ List<ProjectLogs> list =
	 * logsService.getAllProjectLogs(); model.addObject("list", list);
	 * model.setViewName("Logs/notifictionLogs"); } }else if(login.equals("login")
	 * && userType.equals(Constants.TEMPORARY)){ model.setViewName(Constants.HOME);
	 * }else{ model.setViewName(Constants.ACCESS_DENIED); } } catch (Exception e1) {
	 * model.setViewName("redirect:/logout"); e1.printStackTrace(); } return model;
	 * }
	 */
}