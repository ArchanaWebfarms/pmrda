package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;





















import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.service.TenderService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;

/**
 * @author ujwala_gawari
 *
 */
@Controller
public class TendorDepartmentController extends AbstractControllerHelper{


	@Autowired
	TenderService tenderService;

	@RequestMapping(value="/tendorDepartmentList",method=RequestMethod.GET)
	public ModelAndView tendorDepartmentList(ModelAndView tendorDepartmentListModel,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				tendorDepartmentListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<TendorsDepartment>	departments=tendorDepartmentService.tendorDepartmentList();
						tendorDepartmentListModel.addObject("departments", departments);
						tendorDepartmentListModel.setViewName("tender/tendorDepartmentList");
					} catch (Exception e) {
						e.printStackTrace();
						tendorDepartmentListModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				tendorDepartmentListModel.setViewName(Constants.HOME);	
			}else{
				tendorDepartmentListModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			tendorDepartmentListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return tendorDepartmentListModel;
	}

	@RequestMapping(value="newTenderDepartment",method=RequestMethod.GET)
	public ModelAndView newTenderDepartment(ModelAndView newTenderDepartmentModel ,@ModelAttribute("departments") TendorsDepartment departments  ,BindingResult result,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				newTenderDepartmentModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						newTenderDepartmentModel.addObject("departments", departments);
						newTenderDepartmentModel.setViewName("tender/newTenderDepartment");
					} catch (Exception e) {
						e.printStackTrace();
						newTenderDepartmentModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newTenderDepartmentModel.setViewName(Constants.HOME);	
			}else{
				newTenderDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			newTenderDepartmentModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return newTenderDepartmentModel;
	}

	@RequestMapping(value="deleteTenderDepartment",method=RequestMethod.POST)
	public ModelAndView deleteTenderDepartment(ModelAndView deleteTenderDepartmentModel, HttpServletRequest request,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteTenderDepartmentModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						int dept_id=Integer.parseInt(request.getParameter("dept_id"));
						boolean result=tendorDepartmentService.deleteTenderDepartment(dept_id);
						deleteTenderDepartmentModel.setViewName("redirect:/tendorDepartmentList");
					} catch (Exception e) {
						e.printStackTrace();
						deleteTenderDepartmentModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteTenderDepartmentModel.setViewName(Constants.HOME);	
			}else{
				deleteTenderDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			deleteTenderDepartmentModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return deleteTenderDepartmentModel;
	}

	@RequestMapping(value="editTenderDepartment",method=RequestMethod.POST)
	public ModelAndView editTenderDepartment(ModelAndView editTenderDepartmentModel, HttpServletRequest request,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				editTenderDepartmentModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int deptId=0;
					try {
						 deptId=Integer.parseInt(request.getParameter("dept_id"));
						session.setAttribute("tenderDeptID1", deptId);
					} catch (Exception e) {
						deptId=(int) session.getAttribute("tenderDeptID1");
					}finally{
						try {
							TendorsDepartment departments=tendorDepartmentService.getTendorsDepartmentById(deptId);
							editTenderDepartmentModel.addObject("departments", departments);
							editTenderDepartmentModel.setViewName("tender/newTenderDepartment");
						} catch (Exception e) {
							e.printStackTrace();
							editTenderDepartmentModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				editTenderDepartmentModel.setViewName(Constants.HOME);	
			}else{
				editTenderDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			editTenderDepartmentModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return editTenderDepartmentModel;
	}


	@RequestMapping(value="saveTenderDepartmentRegistration",method=RequestMethod.POST)
	public ModelAndView saveDepartmentRegistration(ModelAndView saveDepartmentRegistrationModel,@ModelAttribute("departments") @Valid TendorsDepartment departments  ,BindingResult result){
		try {
			if (result.hasErrors()) {

				saveDepartmentRegistrationModel.setViewName("tender/newTenderDepartment");
				
			}
			else
			{
				/*Prevent Tender Dept From XSS attack*/
				departments=PreventionFromXSSAttack.preventTenderDept(departments);
				
				if(departments.getDept_id()==0){
					int deptId=tendorDepartmentService.saveTenderDepartmentRegistration(departments);
				}else{
					boolean resulta = tendorDepartmentService.updateTenderDepartmentRegistration(departments);
				}
				saveDepartmentRegistrationModel.setViewName("redirect:/tendorDepartmentList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			saveDepartmentRegistrationModel.setViewName("redirect:/errors");
		}
		return saveDepartmentRegistrationModel;
	}

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value="checkTenderDepartment")
	public TendorsDepartment checkTenderDepartment(HttpServletRequest request){
		TendorsDepartment departments = null;
		try {
			String departmentName=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("departmentName")));
			departments = tendorDepartmentService.checkTenderDepartment(departmentName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return departments;
	}

}
