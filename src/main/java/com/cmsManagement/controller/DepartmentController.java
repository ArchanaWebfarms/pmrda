package com.cmsManagement.controller;
import java.io.File;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;








import org.apache.commons.lang3.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.DemoDepatment;
import com.cmsManagement.model.DepartmantOffice;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.DepartmentOfficeContact;
import com.cmsManagement.model.Taluka;
import com.cmsManagement.model.WorkStatus;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.DynamicFieldDesign;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;


@SuppressWarnings("deprecation")
@Controller
public class DepartmentController extends AbstractControllerHelper {

	@RequestMapping(value="/departmentList",method=RequestMethod.GET)
	public ModelAndView departmentList(ModelAndView departmentListModel,HttpSession session,SecurityContextHolder auth){
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){ 
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();
				departmentListModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if(((role.equals(GrantedPermission.CREATE_DEPARTMENT) || role.equals(GrantedPermission.VIEW_DEPARTMENT) || role.equals(GrantedPermission.UPDATE_DEPARTMENT) || role.equals(GrantedPermission.DELETE_DEPARTMENT))
							&& LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							List<Department> departments=departmentService.getActiveDepartment();
							departmentListModel.addObject("departments", departments);
							departmentListModel.setViewName("Department/departmentList");
						}catch (Exception e) {			
							e.printStackTrace();
							departmentListModel.setViewName("redirect:/errors");
						}
					} //departmentListModel.addObject(Constants.USER, LoginController.getPrincipal());	
				}
			}		
		} catch (Exception e1) {			
			departmentListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return departmentListModel;
	}	

	@RequestMapping(value="newDepartment",method=RequestMethod.GET)
	public ModelAndView newDepartment(ModelAndView newDepartmentModel,@ModelAttribute("departments")  Department departments ,BindingResult result,HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				newDepartmentModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							newDepartmentModel.addObject("departments", departments);
							newDepartmentModel.setViewName("Department/newDepartment");
							newDepartmentModel.addObject("action", "new");
						} catch (Exception e) {									
							e.printStackTrace();
							newDepartmentModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newDepartmentModel.setViewName(Constants.HOME);	
			}else{
				newDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			newDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newDepartmentModel;
	}

	@RequestMapping(value="deleteDepartment",method=RequestMethod.POST)
	public ModelAndView deleteDepartment(ModelAndView deleteDepartmentModel,HttpSession session, HttpServletRequest request,SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteDepartmentModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							int deptId=Integer.parseInt(request.getParameter("deptId"));
							boolean result=departmentService.deleteDepartment(deptId);
							deleteDepartmentModel.setViewName("redirect:/departmentList");
						} catch (Exception e) {									
							e.printStackTrace();
							deleteDepartmentModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteDepartmentModel.setViewName(Constants.HOME);	
			}else{
				deleteDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			deleteDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return deleteDepartmentModel;
	}


	@RequestMapping(value="viewDepartment",method=RequestMethod.POST)
	public ModelAndView viewDepartment(ModelAndView model, HttpServletRequest request,HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.VIEW_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int deptId=0;
						try {
							deptId=Integer.parseInt(request.getParameter("deptId"));
							session.setAttribute("deptID1", deptId);
						} catch (Exception e) {									
							deptId=(int) session.getAttribute("deptID1");
						}finally{
							try {
								Department department=departmentService.getDepartmentById(deptId);
								model.addObject("department", department);
								model.setViewName("Department/ViewDepartment");
							} catch (Exception e) {
								e.printStackTrace();
								model.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			model.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value="editDepartment",method=RequestMethod.POST)
	public ModelAndView editDepartment(@ModelAttribute("departments")  Department departments,ModelAndView editDepartmentModel, HttpServletRequest request,HttpSession session, SecurityContextHolder auth){		
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				editDepartmentModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.UPDATE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int deptId=0;
						try {
							deptId=Integer.parseInt(request.getParameter("deptId"));
							session.setAttribute("deptID2", deptId);
						} catch (Exception e) {									
							deptId=(int) session.getAttribute("deptID2");
						}finally{
							try {
								departments=departmentService.getDepartmentById(deptId);
								editDepartmentModel.addObject("departments", departments);
								editDepartmentModel.addObject("action", "edit");
								editDepartmentModel.addObject("size", departments.getAttachment().size());
								editDepartmentModel.setViewName("Department/newDepartment");
							} catch (Exception e) {
								e.printStackTrace();
								editDepartmentModel.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				editDepartmentModel.setViewName(Constants.HOME);	
			}else{
				editDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			editDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return editDepartmentModel;
	}


	@RequestMapping(value="saveDepartmentRegistration",method=RequestMethod.POST)
	public ModelAndView saveDepartmentRegistration(ModelAndView newDepartmentModel,@ModelAttribute("departments")  @Valid Department departments,BindingResult result,@RequestParam("english") MultipartFile english,@RequestParam("marathi") MultipartFile marathi,HttpServletRequest req){	
		try {
			if(result.hasErrors())
			{
				newDepartmentModel.addObject("departments", departments);
				newDepartmentModel.setViewName("Department/newDepartment");
				newDepartmentModel.addObject("action", "new");
			}
			else{				
				/*******Apply input filter to prevent xss attack**********/
				departments=PreventionFromXSSAttack.preventDepartment(departments);
				
				String RealPath = req.getServletContext().getRealPath("/staticResources/Department/");
				File f = new File(RealPath);
				if (!f.exists()) {
					f.mkdirs();
				}
				String path = RealPath.replace("\\", "/");

				if(departments.getDeptId()==0){
					int deptId=departmentService.saveDepartmentRegistration(departments,path,english,marathi);
				}else{
					boolean results = departmentService.updateDepartmentRegistration(departments,path,english,marathi);
				}
				newDepartmentModel.setViewName("redirect:/departmentList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			newDepartmentModel.setViewName("redirect:/errors");
		}
		return newDepartmentModel;
	}

	@ResponseBody
	@RequestMapping(value="checkDepartment",method=RequestMethod.POST)
	public Department checkDepartment(HttpServletRequest request){
		String departmentName=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("departmentName")));
		Department departments=departmentService.checkDepartment(departmentName);
		return departments;
	}


	/************************************Villages Methods*************************************************/

	@RequestMapping(value="/talukaList",method=RequestMethod.GET)
	public ModelAndView villageList(ModelAndView model,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Taluka> list=departmentService.getAllVillages();
						model.addObject("list", list);
						model.setViewName("masters/villageList");

					} catch (Exception e) {			
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
					model.setViewName(Constants.HOME);	
				}else{
					model.setViewName(Constants.ACCESS_DENIED);		
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value="/newTaluka",method=RequestMethod.GET)
	public ModelAndView newTaluka(@ModelAttribute("taluka") Taluka taluka,ModelAndView model,HttpSession session){
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try{
						model.addObject("taluka", taluka);
						model.addObject("action", "new");
						model.setViewName("masters/newTaluka");

					} catch (Exception e) {			
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
					model.setViewName(Constants.HOME);	
				}else{
					model.setViewName(Constants.ACCESS_DENIED);		
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value="/saveTaluka",method=RequestMethod.POST)
	public ModelAndView saveTaluka(@ModelAttribute("taluka") @Valid Taluka taluka,BindingResult result,ModelAndView model,@RequestParam MultipartFile english,@RequestParam MultipartFile marathi,HttpServletRequest req){		
		try {			
			if(result.hasErrors()){			
				model.addObject("action", "new");
				model.addObject("taluka", taluka);
				model.setViewName("masters/newTaluka");
			}else{
				/*Prevent Taluka from XSS attack*/
				taluka=PreventionFromXSSAttack.preventTaluka(taluka);
				
				String RealPath=req.getServletContext().getRealPath("/staticResources/Villages/");	    		
				File f = new File(RealPath);
				if (!f.exists()) { f.mkdirs();}
				String path=RealPath.replace("\\", "/"); 

				if(taluka.getId()>0){
					departmentService.updateTaluka(taluka,path,english,marathi);
				}else{
					departmentService.saveTaluka(taluka,path,english,marathi);
				}

				model.setViewName("redirect:/talukaList");
			}
		} catch (Exception e) {			
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}


	@RequestMapping(value="/viewTaluka",method=RequestMethod.POST)
	public ModelAndView viewTaluka(HttpServletRequest req,ModelAndView model,HttpSession session){
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {
						id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("talukaID1", id);
					} catch (Exception e) {			
						id=(int) session.getAttribute("talukaID1");
					}finally{
						try {
							Taluka taluka=departmentService.getTalukaById(id);
							System.out.println(taluka.toString());
							model.addObject("taluka", taluka);
							model.setViewName("masters/viewTaluka");
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
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}


	@RequestMapping(value="/editTaluka",method=RequestMethod.POST)
	public ModelAndView editTaluka(@ModelAttribute("taluka") Taluka taluka,ModelAndView model,HttpSession session,HttpServletRequest req){
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {
						id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("talukaID2", id);						
					} catch (Exception e) {			
						id=(int) session.getAttribute("talukaID2");
					}finally{
						try {
							taluka=departmentService.getTalukaById(id);
							model.addObject("taluka", taluka);
							model.addObject("size", taluka.getAttachment().size());
							model.addObject("action", "edit");
							model.setViewName("masters/newTaluka");
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
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@ResponseBody
	@RequestMapping(value="/deleteAttachmentById")
	public void deleteAttachmentById(HttpServletRequest req){		
		try {
			int id=Integer.parseInt(req.getParameter("attachmentID"));
			System.err.println("id  :"+id);
			attachmentservice.deleteAttachment(id);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}


	@RequestMapping(value="/deleteTaluka",method=RequestMethod.POST)
	public ModelAndView deleteTaluka(ModelAndView model,HttpSession session,HttpServletRequest req){
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						int id=Integer.parseInt(req.getParameter("id"));
						departmentService.deleteTaluka(id);
						model.setViewName("redirect:/talukaList");
					} catch (Exception e) {			
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
					model.setViewName(Constants.HOME);	
				}else{
					model.setViewName(Constants.ACCESS_DENIED);		
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	/***************************** Department Methods*/

	@RequestMapping(value="addContactDetailst")
	public ModelAndView addContactDetailst(@ModelAttribute("conatct") DepartmentOfficeContact contact,ModelAndView model, HttpServletRequest req,HttpSession session,SecurityContextHolder auth){		
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int id=0;
						try {
							 id=Integer.parseInt(req.getParameter("deptId"));
							session.setAttribute("deptID7", id);
						} catch (Exception e) {									
							id=(int) session.getAttribute("deptID7");
						}finally{
							try {
								List<DepartmantOffice> officeList=departmentService.getActiveOffice();
								model.addObject("officeList", officeList);
								
								Department dept=departmentService.getDepartmentById(id);
								contact.setDepartment(dept);
								model.addObject("contact", contact);
								model.setViewName("Department/OfficeContact");
							} catch (Exception e) {
								e.printStackTrace();
								model.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			model.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return model;
	}


	@RequestMapping(value="/saveDepartmentContact",method=RequestMethod.POST)
	public ModelAndView saveDepartmentContact(@ModelAttribute("conatct") @Valid DepartmentOfficeContact contact,BindingResult result,ModelAndView model,HttpServletRequest req,HttpSession session){		
		try {		
			if(result.hasErrors()){			
				List<DepartmantOffice> officeList=departmentService.getActiveOffice();
				model.addObject("officeList", officeList);
				model.addObject("contact", contact);
				model.setViewName("Department/OfficeContact");				
			}else{
				/*Prevent Deptartment Contact From XSS attack*/
				contact=PreventionFromXSSAttack.preventDeptOfficeContact(contact);
				
				if(contact.getId()>0){
					departmentService.updateDeptOfficeContact(contact);
				}else{
					departmentService.saveDepartmentContact(contact);
				}				
				//model.addObject("deptId", contact.getDepartment().getDeptId());
				session.setAttribute("deptID7", contact.getDepartment().getDeptId());
				model.setViewName("redirect:/addContactDetailst");
			}
		} catch (Exception e) {			
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}


	@ResponseBody
	@RequestMapping(value="/getOfficeContactList",method=RequestMethod.GET)
	public List<DepartmentOfficeContact> getOfficeContactList(HttpServletRequest req){
		List<DepartmentOfficeContact> list = null;
		try {
			int deptId=Integer.parseInt(req.getParameter("deptid"));
			list = departmentService.getOfficeContactList(deptId);
			//System.err.println("list :"+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@RequestMapping(value="deleteDepartmentContact",method=RequestMethod.POST)
	public ModelAndView deleteDepartmentContact(ModelAndView model, HttpServletRequest req,HttpSession session,SecurityContextHolder auth){		
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							int id=Integer.parseInt(req.getParameter("id"));
							departmentService.deleteDepartmentOfficeContact(id);

							//model.addObject("deptId", Integer.parseInt(req.getParameter("deptId")));
							session.setAttribute("deptID7", Integer.parseInt(req.getParameter("deptId")));
							model.setViewName("redirect:/addContactDetailst");				
						} catch (Exception e) {									
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			model.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value="editDepartmentContact",method=RequestMethod.POST)
	public ModelAndView editDepartmentContact(@ModelAttribute("conatct") DepartmentOfficeContact contact,ModelAndView model, HttpServletRequest req,HttpSession session,SecurityContextHolder auth){		
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int id=0;
						try {
							 id=Integer.parseInt(req.getParameter("id"));
							 session.setAttribute("deptID6", id);
						} catch (Exception e) {									
							id=(int) session.getAttribute("deptID6"); 
						}finally{
							try {
								List<DepartmantOffice> officeList=departmentService.getActiveOffice();
								model.addObject("officeList", officeList);
								
								contact=departmentService.getDepartmentOfficeContactById(id);
								model.addObject("contact", contact);
								model.setViewName("Department/OfficeContact");
							} catch (Exception e) {
								e.printStackTrace();
								model.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			model.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return model;
	}


	@RequestMapping(value = "/adminDepartmentDashboard", method = RequestMethod.GET)
	public ModelAndView adminNewsDashboard(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Department> deptDeleteList=departmentService.getDepartmentByDeletionStatus("Pending");
						model.addObject("deleteCount", deptDeleteList.size());

						List<Department> deptCreteList=departmentService.getDepartmentByCreationStatus("Pending");
						model.addObject("createCount", deptCreteList.size());
						model.setViewName("Department/AdminDepartmentDashboard");

					} catch (Exception e) {			
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/adminDepartmentList", method = RequestMethod.GET)
	public ModelAndView adminDepartmentList(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");		 
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						List<Department> list=departmentService.getAllDepartment();
						model.addObject("list", list);
						model.setViewName("Department/AdminDepartmentList");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/adminViewDepartment",method=RequestMethod.POST)
	public ModelAndView adminViewDepartment(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {
						id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("deptID3", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("deptID3");
					}finally{
						try {
							Department department=departmentService.getDepartmentById(id);
							model.addObject("department", department);
							model.setViewName("Department/AdminViewDepartment");
						} catch (Exception e) {
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
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

	@RequestMapping(value = "/saveAdminCreationStatus",method=RequestMethod.POST)
	public ModelAndView saveAdminCreationStatus(ModelAndView model,HttpServletRequest req) {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String status=req.getParameter("approvedStatus");
			String comment=req.getParameter("comment");

			//System.out.println(id+" "+status+" "+comment);
			departmentService.changeAdminStatus(id,status,comment);

			model.setViewName("redirect:/adminDepartmentList");
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}

		return model;
	}

	@RequestMapping(value ="adminDeleteDepartmentList",method=RequestMethod.GET)
	public ModelAndView adminDeleteNewsList(ModelAndView  model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);				
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
					try {
						model.setViewName("Department/AdminDeleteDepartmentList");
					}catch (Exception e) {			
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					} 
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@ResponseBody
	@RequestMapping(value ="getDepartmentByDeleteStatus",method=RequestMethod.GET)
	public List<Department> getDepartmentByDeleteStatus(ModelAndView model,HttpServletRequest req) throws ParseException {
		String status=StringEscapeUtils.escapeHtml4(req.getParameter("tendorStatus"));		
		List<Department> deptList=departmentService.getDepartmentByDeletionStatus(status);	
		return deptList;
	}

	@RequestMapping(value = "/adminDeleteViewDepartment",method=RequestMethod.POST)
	public ModelAndView adminDeleteViewNews(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {
						id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("deptID4", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("deptID4");
					}finally{
						try {
							Department department=departmentService.getDepartmentById(id);
							model.addObject("department", department);
							model.setViewName("Department/AdminDeleteViewDepartment");
						} catch (Exception e) {
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
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

	@RequestMapping(value = "/saveAdminDeletionStatus",method=RequestMethod.POST)
	public ModelAndView saveAdminDeletionStatus(ModelAndView model,HttpServletRequest req) {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String status=req.getParameter("approvedStatus");
			String comment=req.getParameter("comment");

			//System.out.println(id+" "+status+" "+comment);
			departmentService.changeAdminDeletionStatus(id,status,comment);

			model.setViewName("redirect:/adminDeleteDepartmentList");
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}

		return model;
	}	

	@RequestMapping(value = "/deleteAdminDepartment",method=RequestMethod.POST)
	public ModelAndView deleteAdminDepartment(ModelAndView model,HttpServletRequest req,HttpSession session, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							int id=Integer.parseInt(req.getParameter("deptId"));
							departmentService.deleteAdminDepartment(id);
							model.setViewName("redirect:/departmentList");
						} catch (Exception e) {									
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			model.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/viewDeactivatedDepartment",method=RequestMethod.POST)
	public ModelAndView viewDeactivatedDepartment(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE))){
					int id=0;
					try {
						 id=Integer.parseInt(req.getParameter("id"));			
						session.setAttribute("deptID5", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("deptID5");
					}finally{
						try {
							Department department=departmentService.getDepartmentById(id);
							model.addObject("department", department);
							model.setViewName("Department/ViewDeactivatedDepartment");
						} catch (Exception e) {
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}

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


	@RequestMapping(value="newDemoDepartment")
	public ModelAndView newDemoDepartment(ModelAndView newDepartmentModel,@ModelAttribute("departments")  DemoDepatment departments ,BindingResult result,HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				newDepartmentModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							newDepartmentModel.addObject("departments", departments);
							newDepartmentModel.setViewName("Department/NewDemoDept");
							newDepartmentModel.addObject("action", "new");
						} catch (Exception e) {									
							e.printStackTrace();
							newDepartmentModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newDepartmentModel.setViewName(Constants.HOME);	
			}else{
				newDepartmentModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			newDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newDepartmentModel;
	}

	@RequestMapping(value="saveDemoDepartment")
	public ModelAndView saveDemoDepartment(ModelAndView newDepartmentModel,@ModelAttribute("departments") DemoDepatment departments,HttpServletRequest req){	
		String function_content="";

		if(departments.getFunction_type().equals("Multi-line Text")){
			String[] function=req.getParameterValues("function_content_text");	
			function_content=DynamicFieldDesign.dynamicMultilineText(function);
		}else if(departments.getFunction_type().equals("Text")){
			String[] function=req.getParameterValues("function_content_text");						
			function_content=DynamicFieldDesign.dynamicText(function);
		}else if(departments.getFunction_type().equals("Bulletine")){			
			String function_content_header="";
			try{
				String[] header=req.getParameterValues("fun_cont_bull_header");

				for(int s=0;s<header.length;s++){
					String function_content_point="";
					try {
						String[] functions=req.getParameterValues("function_content_point_text"+(s+1));						
						for(int j=0;j<functions.length;j++){	
							String function_content_subpoint="";
							System.err.println("j :"+functions[j]);
							try {
								String[] subfunctions=req.getParameterValues("function_content_subpoint_text"+(s+1)+""+j);
								System.err.println("subfunctions"+(s+1)+""+j+" :"+subfunctions.length);
								for(int k=0;k<subfunctions.length;k++){	
									function_content_subpoint=function_content_subpoint+"<li>"+subfunctions[k]+"</li>";
								}

							} catch (Exception e) {
								e.printStackTrace();
							}
							function_content_point=function_content_point+"<li>"+functions[j]+"<ul>"+function_content_subpoint+"</ul></li>";
						}												
					} catch (Exception e) {						
						e.printStackTrace();
					}							
					function_content_header=function_content_header+"<li>"+header[s]+"<ul>"+function_content_point+"</ul></li>";						
				}
				function_content="<ul>"+function_content_header+"</ul>";									

			}catch(Exception e){

			}				
		}else if(departments.getFunction_type().equals("Image")){

		}



		System.out.println("function_content :"+function_content);
		departments.setFunction_content(function_content);

		System.err.println("departments :"+departments.toString());

		departmentService.saveDemoDepartment(departments);

		newDepartmentModel.setViewName("redirect:/demodepartmentList");

		return newDepartmentModel;
	}

	@RequestMapping(value="/demodepartmentList")
	public ModelAndView demodepartmentList(ModelAndView departmentListModel,HttpSession session,SecurityContextHolder auth){
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){ 
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();
				departmentListModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if(((role.equals(GrantedPermission.CREATE_DEPARTMENT) || role.equals(GrantedPermission.VIEW_DEPARTMENT) || role.equals(GrantedPermission.UPDATE_DEPARTMENT) || role.equals(GrantedPermission.DELETE_DEPARTMENT))
							&& LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							List<DemoDepatment> departments=departmentService.getDemoDepartment();
							departmentListModel.addObject("departments", departments);
							departmentListModel.setViewName("Department/demodepartmentList");
						}catch (Exception e) {			
							e.printStackTrace();
						}
					} //departmentListModel.addObject(Constants.USER, LoginController.getPrincipal());	
				}
			}		
		} catch (Exception e1) {			
			departmentListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return departmentListModel;
	}	

	@RequestMapping(value="viewDemoDepartment")
	public ModelAndView viewDemoDepartment(ModelAndView model, HttpServletRequest request,HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.VIEW_DEPARTMENT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							int deptId=Integer.parseInt(request.getParameter("deptId"));
							DemoDepatment department=departmentService.getDepartment(deptId);
							model.addObject("department", department);
							model.setViewName("Department/ViewDemoDepartment");
						} catch (Exception e) {									
							e.printStackTrace();
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			model.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return model;
	}


	@RequestMapping(value="workstatus",method=RequestMethod.GET)
	public ModelAndView workstatus(ModelAndView newDepartmentModel){
		try
		{
			//List<WorkStatus> workList=departmentService.getWorkList();
			newDepartmentModel.setViewName("Department/workstatusList");
		}
		catch(Exception s)
		{
			newDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newDepartmentModel;
	}

	@RequestMapping(value="addwrokstatus",method=RequestMethod.POST)
	public ModelAndView addwrokstatus(@ModelAttribute("work") WorkStatus work,ModelAndView newDepartmentModel){
		try
		{
			WorkStatus lastwork=departmentService.getLastRecord();
			work.setProject_name_heading(lastwork.getProject_name_heading());
			work.setDistrict_heading(lastwork.getDistrict_heading());
			work.setLac_heading(lastwork.getLac_heading());
			work.setNo_of_schools_heading(lastwork.getNo_of_schools_heading());
			newDepartmentModel.addObject("work", work);
			newDepartmentModel.setViewName("Department/addwrokstatus");
		}
		catch(Exception s)
		{
			newDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newDepartmentModel;
	}

	@RequestMapping(value="saveworkstatus",method=RequestMethod.POST)
	public ModelAndView saveworkstatus(@ModelAttribute("work") WorkStatus work,ModelAndView newDepartmentModel){
		try
		{
			System.err.println("work :"+work.toString());
			departmentService.saveWorkStatus(work);
			newDepartmentModel.setViewName("redirect:/workstatus");
		}
		catch(Exception s)
		{
			newDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newDepartmentModel;
	}

	@RequestMapping(value="viewwrokstatus",method=RequestMethod.POST)
	public ModelAndView viewwrokstatus(ModelAndView newDepartmentModel){
		try
		{
			List<WorkStatus> workList=departmentService.getWorkList();
			WorkStatus work=departmentService.getLastRecord();
			newDepartmentModel.addObject("work", work);
			newDepartmentModel.addObject("workList", workList);
			newDepartmentModel.setViewName("Department/viewwrokstatus");
		}
		catch(Exception s)
		{
			newDepartmentModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newDepartmentModel;
	}

}
