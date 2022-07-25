package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cmsManagement.dto.Rights;
import com.cmsManagement.model.RightsDto;
import com.cmsManagement.service.RightService;


@Controller
public class RightsController {

	
	@Autowired
	RightService rightService;
	
	
	
	@RequestMapping(value = "/newRights", method = RequestMethod.GET)
	public String newRightsRegistration(ModelMap model) {
		Rights rights = new Rights();
		model.addAttribute("rights", rights);
		return "rights/newRights";
	}

	/*
	 * This method will be called on form submission, handling POST request It
	 * also validates the user input
	 */
	@RequestMapping(value = "/newRights", method = RequestMethod.POST)
	public String saveRightsRegistration(@Valid Rights rights, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "redirect:/newRights";
		}
		if (rights.getRight_id() == 0) { // if employee id is 0 then creating the // employee other updating the employee
			rightService.saveRights(rights);
		} else {
			rightService.updateRights(rights);
		}				
		model.addAttribute("success", "User " + rights.getRight_type() + " has been registered successfully");
		return "redirect:/newRights";
	}
	
	
	
	@RequestMapping(value = "/listOfRights")
	public String listOfRoles(Model model) {
		 model.addAttribute("listOfRights", rightService.findAllRights());
		 return "rights/rightList";
	}
	
	@RequestMapping(value = "/viewRight" , method = RequestMethod.GET)
	public String viewRight(ModelMap model) {
		return "rights/viewRight";
	}
	
	@RequestMapping(value = "/editRight" , method = RequestMethod.GET)
	public String editRight(HttpServletRequest request, Model model) {
		model.addAttribute("rights", rightService.findRightsById( Integer.parseInt(request.getParameter("rightId"))));
		return "rights/newRights";
	}
	
	@RequestMapping(value = "/deleteRight" , method = RequestMethod.GET)
	public String deleteRight(HttpServletRequest request) {
		rightService.deleteRight(Integer.parseInt(request.getParameter("rightId")));
		return "rights/rightsDashboard";
	}
	

	
}
