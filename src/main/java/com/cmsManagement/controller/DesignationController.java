package com.cmsManagement.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Designation;
import com.cmsManagement.service.DesignationService;
import com.cmsManagement.util.Constants;
/**
 * 
 *
 */
@Controller
public class DesignationController {
	 @Autowired
	DesignationService designationservice;
	/**
	 * 
	 * @return  List of Active  Designation 
	 *
	 */
	
	@RequestMapping(value = "/DesignationList" , method = RequestMethod.GET)
	public ModelAndView  DesignationList(ModelAndView  DesignationListModel) {
		DesignationListModel.setViewName(Constants.ACCESS_DENIED);
	
        if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
		DesignationListModel.addObject("designationlist",  designationservice.getDesignationList());
		DesignationListModel.setViewName("Designation/DesignationList");
		DesignationListModel.addObject("user", LoginController.getPrincipal());
        }
		
		
		
		
	
		return DesignationListModel;
	}
	/**
	 * 
	 * @Go To New Designation page
	 *
	 */
	@RequestMapping(value = "/newDesignation", method = RequestMethod.GET)
	public ModelAndView NewNewsRegistration(ModelAndView NewDesignationgistrationModel,@ModelAttribute("designation") Designation designation,BindingResult result, HttpSession session) {	
		NewDesignationgistrationModel.setViewName(Constants.ACCESS_DENIED);
        if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
        
		NewDesignationgistrationModel.addObject("designation", designation);
		NewDesignationgistrationModel.setViewName("Designation/newDesignation");
        }
       
		return NewDesignationgistrationModel;
   }
	/**
	 * 
	 * @To Add New Designation 
	 *
	 */
	@RequestMapping(value="saveDesignation")
	public ModelAndView saveDesignation(ModelAndView DesignationRegistrationModel,@ModelAttribute("designation") @Valid Designation designation,BindingResult result){	
		if(result.hasErrors()){
			DesignationRegistrationModel.setViewName("Designation/newDesignation");
		}
		else{
		if(designation.getDesignationId()==0){
			designationservice.saveDesignation(designation);
		}else{
			designationservice.updateDesignation(designation);
        }
		DesignationRegistrationModel.setViewName("redirect:/DesignationList");
		}
		return DesignationRegistrationModel;
	}
	/**
	 * 
	 * @To View  Designation By Id
	 *
	 */
	@RequestMapping(value="viewDesignation")
	public ModelAndView viewValidation(ModelAndView viewValidationModel, HttpServletRequest request){
		viewValidationModel.setViewName(Constants.ACCESS_DENIED);
        if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
        
		viewValidationModel.addObject("designation", designationservice.findDesignationById(Integer.parseInt(request.getParameter("designationId"))));
		viewValidationModel.setViewName("Designation/viewDesignation");
        }
		return viewValidationModel;
	}
	/**
	 * 
	 * @To View  Designation 
	 *
	 */
	@RequestMapping(value="editDesignation")
	public ModelAndView editValidation(ModelAndView editDesignationModel, HttpServletRequest request){
		editDesignationModel.setViewName(Constants.ACCESS_DENIED);
        if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
		editDesignationModel.addObject("designation",  designationservice.findDesignationById(Integer.parseInt(request.getParameter("designationId"))));
		editDesignationModel.setViewName("Designation/newDesignation");
        }
		return editDesignationModel;
	}
	/**
	 * Deactivate state of Download By Download Id.
	 * @return
	 */
	@RequestMapping(value = "/deleteDesignation" , method = RequestMethod.GET)
	public ModelAndView deleteDesignation(HttpServletRequest request, ModelAndView deleteDesignationModel) {	
		deleteDesignationModel.setViewName(Constants.ACCESS_DENIED);
        if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
        
		designationservice.deleteDesignationById(Integer.parseInt(request.getParameter("designationId")));
		deleteDesignationModel.setViewName("redirect:/DesignationList");
        }
		
		return deleteDesignationModel;
	}
	@ExceptionHandler(value=NullPointerException.class)
	   public static String HandleNullPoiterException()
	   {
		return "redirect:login";
		   
	   }
}
