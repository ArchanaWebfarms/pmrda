package com.cmsManagement.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dao.ReportsDao;
import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.CmsReports;
import com.cmsManagement.model.LoginInfo;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.service.LogDaoService;
import com.cmsManagement.service.NewsService;
import com.cmsManagement.service.ReportService;
import com.cmsManagement.service.RoleService;
import com.cmsManagement.service.UserService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

@Controller
public class ReportsController {
	int UserRoleID=0;
	@Autowired
	ReportService reportsservice;
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;
	@Autowired
	ReportsDao reportsdao;
	@Autowired
	NewsService newsservice;
	@Autowired
	LogDaoService logdao;

	/**
	 * 
	 * @Return reportsDashboard
	 *
	 */

	@RequestMapping(value = "/reportsDashboard",method=RequestMethod.GET)
	public ModelAndView ReportsDashboard(ModelAndView model, SecurityContextHolder auth,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<User> userList=userService.findAllUser();
						model.addObject("userList", userList);
						model.setViewName("reports/reportsDashboard");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
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
	/**
	 * 
	 * @Return to  Cms Data reports
	 *
	 */
	@RequestMapping(value = "/cmsDatareports",method=RequestMethod.GET)
	public ModelAndView DataReport(ModelAndView model,SecurityContextHolder auth,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<User> userList=userService.findAllUser();
						model.addObject("userList",userList);
						model.setViewName("reports/cmsDatareports");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
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

	/**
	 * 
	 * @Return to  Cms User reports
	 *
	 */
	@RequestMapping(value = "/cmsUserreport",method=RequestMethod.GET)
	public ModelAndView UserReport(ModelAndView model,SecurityContextHolder auth,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Roles> roles=roleService.findAllRole();
						model.addObject("roles",roles);
						model.setViewName("reports/cmsUserreport");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
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
	@RequestMapping(value = "/userLoginReport",method=RequestMethod.GET)
	public ModelAndView userLoginReport(ModelAndView model,SecurityContextHolder auth,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						List<Roles> roles=roleService.findAllRole();
						model.addObject("roles",roles);
						model.setViewName("reports/userLoginReport");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
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

	/*@RequestMapping(value = "/cmsUserreport" , method = RequestMethod.GET)
			public String UserReport(ModelMap model) {
			    	List<Roles> roles=roleService.findAllRole();
					model.addAttribute("roles", roles);
					return "reports/cmsUserreport";
		     }*/


	/**
	 * 
	 * @throws ParseException 
	 * @Return Cms Data reports
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/getReports", method=RequestMethod.POST, produces="application/json")
	public List<CmsReports> getCMSReport( HttpSession session,ModelAndView model,String Module,String reportType, String startDate, String endDate,String user) throws ParseException {

		List<CmsReports> reportlist = null;
		try {
			reportlist = reportsservice.GetCmsReports(Module, reportType, startDate, endDate, user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reportlist;
	}

	/**
	 * 
	 * @Cms Data Report Download
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/downloadReport",method=RequestMethod.POST)
	public ModelAndView downloadReport(HttpSession session,ModelAndView downloadReport){
		try {
			downloadReport.setViewName("reports/cmsDatareports");
			session.setAttribute("Download", "Download Sucessfull");
		} catch (Exception e) {
			e.printStackTrace();
			downloadReport.setViewName("redirect:/errors");
		}
		return downloadReport;
	}
	//UserReport
	/**
	 * 
	 * @Cms Data UserReport 
	 *
	 */
	@RequestMapping(value = "/userCmsReport",method=RequestMethod.GET)
	public String userCmsReport(ModelMap model) {
		try {
			model.addAttribute("roles", roleService.findAllRole());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "reports/cmsUserreport";
	}

	/**
	 * 
	 * @Cms Get Users by RoleID
	 *
	 */
	@ResponseBody
	@RequestMapping(value = "/getRoleID")
	public List<User> getuserRoleID(ModelMap model, HttpServletRequest request) {
		List<User> userlist = null;
		try {
			int roleID = Integer.parseInt(request.getParameter("roleID"));
			UserRoleID = roleID;
			userlist = userService.getUserByRoleID(roleID);
			model.addAttribute("userlist", userlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userlist;
	}


	/**
	 * 
	 * @Cms User report By RoleID and UserID
	 *
	 */
	@ResponseBody
	@RequestMapping(value = "/getUser")
	public List<User> GeUserReport(ModelMap GeUserReport ,int user) {
		List<User> userlist = null;

		try {
			if(user==0){

				userlist= userService.getUserByRoleID(UserRoleID);
			}
			else{
				userlist= userService.getUserByUserID(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userlist;
	}
	@ResponseBody
	@RequestMapping(value = "/LoginInfo",method=RequestMethod.POST)
	public List<LoginInfo> LoginInfo(ModelMap GeUserReport ,int user) {
		List<LoginInfo> list=null;
		try {
			 list=logdao.getInfoByID(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 
	 * @Cms User report Download
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/downloadUserReport",method=RequestMethod.POST)
	public ModelAndView downloaduserReport(HttpSession session,ModelAndView downloaduserReport, HttpServletResponse response){
		try {
			downloaduserReport.setViewName("reports/userCmsReport");
			session.setAttribute("Download", "Download Sucessfull");
		} catch (Exception e) {
			e.printStackTrace();
			downloaduserReport.setViewName("redirect:/errors");
		}
		return downloaduserReport;
	}


}
