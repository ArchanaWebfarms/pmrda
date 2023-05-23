package com.cmsManagement.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.Designation;
import com.cmsManagement.model.MetaData;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.service.MetaService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.PreventionFromXSSAttack;

@Controller
public class MetaDataController {
	@Autowired
	MetaService metaservice;

	@RequestMapping(value = "/metadatalist",method=RequestMethod.GET)
	public ModelAndView metadatalist(ModelAndView adminTenderListModel,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<MetaData> metadatalist = metaservice.metalist();
						adminTenderListModel.addObject("metadatalist", metadatalist);
						adminTenderListModel.setViewName("metadata/metadatalist");
					} catch (Exception e) {
						e.printStackTrace();
						adminTenderListModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				adminTenderListModel.setViewName(Constants.HOME);	
			}else{
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			adminTenderListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminTenderListModel;
	}

	@RequestMapping(value = "/newMetaData",method=RequestMethod.GET)
	public ModelAndView newMetaData(ModelAndView adminTenderListModel,@ModelAttribute("meta") MetaData meta  ,BindingResult result, HttpSession session, SecurityContextHolder auth){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
					adminTenderListModel.setViewName("metadata/newMetaData");
					} catch (Exception e) {
						e.printStackTrace();
						adminTenderListModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				adminTenderListModel.setViewName(Constants.HOME);	
			}else{
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			adminTenderListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminTenderListModel;
	}

	@RequestMapping(value="saveMeta",method=RequestMethod.POST)
	public ModelAndView saveMeta(ModelAndView model,@ModelAttribute("meta") @Valid  MetaData meta,BindingResult result){	
		try {
			if(result.hasErrors()){
				model.setViewName("metadata/newMetaData");
			}
			else{
				/*Prevent Metadata from XSS attack*/
				meta=PreventionFromXSSAttack.preventMetadata(meta);
				
				if(meta.getId()==0){
					int id = metaservice.AddMeta(meta);
				}else{
					metaservice.UpdateMeta(meta);
				}
				model.setViewName("redirect:/metadatalist");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}



	@RequestMapping(value="editMeta",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView editDepartment( HttpServletRequest request,ModelAndView adminTenderListModel,@ModelAttribute("meta") MetaData meta  ,BindingResult result, HttpSession session, SecurityContextHolder auth){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {	
						 id=Integer.parseInt(request.getParameter("id"));
						session.setAttribute("metaID1", id);	
					} catch (Exception e) {
						id=(int) session.getAttribute("metaID1");
					}finally{
						try {
							meta = metaservice.ViewMeta(id);
							adminTenderListModel.addObject("meta", meta);
							adminTenderListModel.setViewName("metadata/newMetaData");
						} catch (Exception e) {
							e.printStackTrace();
							adminTenderListModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				adminTenderListModel.setViewName(Constants.HOME);	
			}else{
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			adminTenderListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminTenderListModel;
	}


	@RequestMapping(value="view_Meta",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView view_Meta( HttpServletRequest request,ModelAndView adminTenderListModel,@ModelAttribute("meta") MetaData meta  ,BindingResult result, HttpSession session, SecurityContextHolder auth){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {
						 id=Integer.parseInt(request.getParameter("id"));
						session.setAttribute("metaID2", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("metaID2");
					}finally{
						try {
							meta = metaservice.ViewMeta(id);
							adminTenderListModel.addObject("meta", meta);
							adminTenderListModel.setViewName("metadata/viewMeta");
						} catch (Exception e) {
							e.printStackTrace();
							adminTenderListModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				adminTenderListModel.setViewName(Constants.HOME);	
			}else{
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			adminTenderListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminTenderListModel;
	}



	@RequestMapping(value="deleteMeta",method=RequestMethod.POST)
	public ModelAndView deleteMeta(ModelAndView deleteDepartmentModel, HttpServletRequest request,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteDepartmentModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						int id=Integer.parseInt(request.getParameter("id"));
						metaservice.deleteMeta(id);
						deleteDepartmentModel.setViewName("redirect:/metadatalist");
					} catch (Exception e) {
						e.printStackTrace();
						deleteDepartmentModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteDepartmentModel.setViewName(Constants.HOME);	
			}else{
				deleteDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			deleteDepartmentModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return deleteDepartmentModel;
	}











}
