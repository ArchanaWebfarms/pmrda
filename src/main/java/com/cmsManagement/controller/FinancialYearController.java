package com.cmsManagement.controller;
import java.util.ArrayList;
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
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.util.Constants;

/**
 * @author ujwala_gawari
 *
 */
@Controller
public class FinancialYearController extends AbstractControllerHelper{


	/**
	 * @return List of Financial Year based on state.
	 * 
	 */
	@RequestMapping(value ="financialYearDashboard", method = RequestMethod.GET)
	public ModelAndView financialYearDashboard(ModelAndView financialYearDashboardModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				financialYearDashboardModel.setViewName(Constants.ACCESS_DENIED);
				try {
					if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
						List<FinancialYear> financialYear=financialYearService.getFinancialYearList();
						financialYearDashboardModel.addObject("financialYear", financialYear);
						financialYearDashboardModel.setViewName("financialYear/financialYearDashboard");	 
					}
				} catch (Exception e) {			
					e.printStackTrace();
				}//financialYearDashboardModel.addObject(Constants.USER, LoginController.getPrincipal());
			}
		} catch (Exception e1) {			
			financialYearDashboardModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return financialYearDashboardModel;
	}

	/**
	 * page to create Financial Year.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newFinancialYear")
	public ModelAndView newFinancialYear(ModelMap model, HttpSession session, ModelAndView newFinancialYearModel,@ModelAttribute("financialYear") FinancialYear financialYear, BindingResult result) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
				newFinancialYearModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){	        	
						model.addAttribute("financialYear", financialYear);
						newFinancialYearModel.setViewName("financialYear/newFinancialYear");
					}
				}  
				//newFinancialYearModel.addObject(Constants.USER, LoginController.getPrincipal());
			}
		} catch (Exception e1) {			
			newFinancialYearModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return newFinancialYearModel;
	}

	/**
	 * page to update Financial Year.
	 * @return
	 */
	@RequestMapping(value ="editFinancialYear", method = RequestMethod.GET)
	public ModelAndView editFinancialYear(ModelAndView editFinancialYearModel , HttpServletRequest request,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){		
				editFinancialYearModel.setViewName(Constants.ACCESS_DENIED);
				try {
					if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
						int financialId=Integer.parseInt(request.getParameter("financialId"));
						FinancialYear financialYear = financialYearService.getFinancialYear(financialId);
						editFinancialYearModel.addObject("financialYear", financialYear);
						editFinancialYearModel.setViewName("financialYear/newFinancialYear");	 
					}
				} catch (Exception e) {			
					e.printStackTrace();
				}//editFinancialYearModel.addObject(Constants.USER, LoginController.getPrincipal());
			}
		} catch (Exception e1) {			
			editFinancialYearModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return editFinancialYearModel;
	}

	/**
	 * Register Or Update Financial Year based on financialYear Id.
	 * @param financialYear
	 * @return
	 */
	@RequestMapping(value = "/saveFinancialYear")
	public ModelAndView saveFinancialYear(@ModelAttribute("financialYear") @Valid FinancialYear financialYear, BindingResult result, ModelAndView model){	
		if(result.hasErrors())
		{

			model.setViewName("financialYear/newFinancialYear");
		}
		else
		{


			if(financialYear.getFinancialId()== 0){
				int id=financialYearService.saveFinancialYear(financialYear);
			}else{
				boolean results=financialYearService.updateFinancialYear(financialYear);
			}
			//model.addAttribute(Constants.USER, LoginController.getPrincipal());
			model.setViewName("redirect:/financialYearDashboard");
		}
		return model;

	}

	/**
	 * @return Financial Year by id to Show FinancialYear Information
	 */
	@RequestMapping(value ="viewFinancialYear", method = RequestMethod.GET)
	public ModelAndView viewFinancialYear(ModelAndView viewFinancialYearModel, HttpServletRequest request) {
		viewFinancialYearModel.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
			int financialId=Integer.parseInt(request.getParameter("financialId"));
			FinancialYear financialYear = financialYearService.getFinancialYear(financialId);
			viewFinancialYearModel.addObject("financialYear", financialYear);
			viewFinancialYearModel.setViewName("financialYear/viewFinancialYear");	 
		} 
		//viewFinancialYearModel.addObject(Constants.USER, LoginController.getPrincipal());
		return viewFinancialYearModel;
	}

	/**
	 * Deactivate Financial Year By Financial Year Id.
	 * @return
	 */

	@RequestMapping(value ="deleteFinancialYear", method = RequestMethod.GET)
	public ModelAndView deleteFinancialYear(ModelAndView deleteFinancialYearModel, HttpServletRequest request) {
		String abc = null;
		List<FinancialYear> financialYear = new ArrayList<FinancialYear>();
		int financialId=Integer.parseInt(request.getParameter("financialId"));
		deleteFinancialYearModel.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
			boolean result=financialYearService.deleteFinancialYear(financialId);
			if(result==true){

				deleteFinancialYearModel.setViewName("redirect:/financialYearDashboard");
			}


		} 
		//deleteFinancialYearModel.addObject(Constants.USER, LoginController.getPrincipal());
		return deleteFinancialYearModel;
	}

	/**
	 * Change Financial Status.
	 * 
	 */
	@RequestMapping(value ="changeFYCurrentStatus", method = RequestMethod.GET)
	public ModelAndView changeFYCurrentStatus(ModelAndView changeFYCurrentStatusModel, HttpServletRequest request,HttpSession session) {
		int financialId=Integer.parseInt(request.getParameter("financialId"));

		changeFYCurrentStatusModel.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
			boolean result=financialYearService.changeFYCurrentStatus(financialId);
			FinancialYear financialYear=financialYearService.getCurrentActiveFinancialYear();
			String financialYearID = financialYear.getFinancialYear();


			try
			{
				changeFYCurrentStatusModel.addObject("financialYear", financialYear);
			}
			catch(java.lang.NullPointerException e){}
			session.setAttribute("financialYearID", financialYearID);
			changeFYCurrentStatusModel.addObject(Constants.USER, LoginController.getPrincipal());
			changeFYCurrentStatusModel.addObject("financialYearID", financialYearID);
			changeFYCurrentStatusModel.setViewName("redirect:/financialYearDashboard");	 
		}//changeFYCurrentStatusModel.addObject(Constants.USER, LoginController.getPrincipal());
		return changeFYCurrentStatusModel;
	}

	/**
	 * @return Financial Year to check Unique year.
	 */
	@ResponseBody
	@RequestMapping(value = "/checkUniqueFinacialYear")
	public FinancialYear checkUniqueFinacialYear(HttpServletRequest request, Model model) {
		String financialYear=request.getParameter("financialYear");
		FinancialYear fYear=financialYearService.checkUniqueFinacialYear(financialYear);

		return fYear;
	}
}
