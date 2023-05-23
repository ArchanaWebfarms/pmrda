package com.cmsManagement.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
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
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.CurrentOpening;
import com.cmsManagement.model.Department;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;

@Controller
public class CurrentOpeningController extends AbstractControllerHelper{

	@RequestMapping(value = "/currOpeningList",method=RequestMethod.GET)
	public ModelAndView currOpeningList(ModelAndView model,HttpSession session,SecurityContextHolder auth) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){ 
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();
				model.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if(((role.equals(GrantedPermission.CREATE_OPENING) || role.equals(GrantedPermission.VIEW_OPENING) || role.equals(GrantedPermission.UPDATE_OPENING) || role.equals(GrantedPermission.DELETE_OPENING) || role.equals(GrantedPermission.CLOSED_OPENING))
							&& LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							List<CurrentOpening> list=currentOpening.getAllActiveOpening();						
							//System.err.println("size:"+list.size());
							model.addObject("list", list);
							model.setViewName("CurrentOpening/CurrentOpeningList");

						}catch (Exception e) {			
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
					} //departmentListModel.addObject(Constants.USER, LoginController.getPrincipal());	
				}
			}		
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/newOpening",method=RequestMethod.GET)
	public ModelAndView newOpening(@ModelAttribute("opening") CurrentOpening opening,ModelAndView model,HttpSession session, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_OPENING) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							model.addObject("opening", opening);
							model.addObject("action", "newOpening");
							List<Department> departments=departmentService.getDepartment();
							model.addObject("departments", departments);
							model.setViewName("CurrentOpening/NewOpening");
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

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/saveOpening",method=RequestMethod.POST)
	public ModelAndView saveOpening(@ModelAttribute("opening") @Valid CurrentOpening opening,BindingResult result,ModelAndView model,@RequestParam("english") MultipartFile english,@RequestParam("marathi") MultipartFile marathi,HttpServletRequest req) {		
		try {
			if(result.hasErrors()){				
				model.addObject("opening", opening);
				model.setViewName("CurrentOpening/NewOpening");
				model.addObject("action", "newOpening");
				List<Department> departments=departmentService.getDepartment();
				model.addObject("departments", departments);
			}else{	
				/*Prevent Current Opening from XSS attack*/
				opening=PreventionFromXSSAttack.preventCurrentOpening(opening);
				
				String title=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("atitle")));
				String mtitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("mtitle")));

				String RealPath = req.getServletContext().getRealPath("/staticResources/CurrentOpening/");
				File f = new File(RealPath);
				if (!f.exists()) {
					f.mkdirs();
				}
				String path = RealPath.replace("\\", "/");

				if(opening.getId()>0){
					currentOpening.editOpening(opening,path,english,marathi,title,mtitle);
				}else{
					currentOpening.saveOpening(opening,path,english,marathi,title,mtitle);
				}

				model.setViewName("redirect:/currOpeningList");
			}


		} catch (Exception e1) {
			e1.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	@RequestMapping(value = "/editOpening",method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView editOpening(@ModelAttribute("opening") CurrentOpening opening,ModelAndView model,HttpSession session,HttpServletRequest req, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.UPDATE_OPENING) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          

						int id = 0;
						try {
							id = Integer.parseInt(req.getParameter("id"));
							session.setAttribute("openingID1", id);
						} catch (Exception e1) {
							id=(int) session.getAttribute("openingID1");
						}finally{
							try {
								opening=currentOpening.getOpeningById(id);
								model.addObject("opening", opening);
								model.addObject("action", "editOpening");
								List<Department> departments=departmentService.getDepartment();
								model.addObject("departments", departments);
								model.addObject("size", opening.getAttachment().size());
								model.setViewName("CurrentOpening/NewOpening");

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

	@RequestMapping(value = "/closeOpening",method=RequestMethod.POST)
	public ModelAndView closeOpening(ModelAndView model,HttpSession session,HttpServletRequest req, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_OPENING) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int id = 0;
						try {
							id = Integer.parseInt(req.getParameter("id"));
							session.setAttribute("openingID2", id);
						} catch (Exception e1) {
							id=(int) session.getAttribute("openingID2");
						}finally{
							try {
								currentOpening.closeOpening(id);
								model.setViewName("redirect:/currOpeningList");
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

	@RequestMapping(value = "/deleteOpening",method=RequestMethod.POST)
	public ModelAndView deleteOpening(ModelAndView model,HttpSession session,HttpServletRequest req, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_OPENING) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							int id=Integer.parseInt(req.getParameter("id"));
							currentOpening.deleteOpening(id);
							model.setViewName("redirect:/currOpeningList");
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

	@RequestMapping(value = "/viewOpening",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView viewOpening(ModelAndView model,HttpSession session,HttpServletRequest req, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.VIEW_OPENING) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int id = 0;
						try {
							id = Integer.parseInt(req.getParameter("id"));
							session.setAttribute("openingID3", id);
						} catch (Exception e1) {
							id=(int) session.getAttribute("openingID3");
						}finally{
							try {
								CurrentOpening opening=currentOpening.getOpeningById(id);
								model.addObject("opening", opening);
								model.setViewName("CurrentOpening/ViewOpening");
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

	@RequestMapping(value = "/adminCurrOpeningList",method=RequestMethod.GET)
	public ModelAndView adminCurrOpeningList(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ){
					try {
						List<CurrentOpening> list=currentOpening.getAllOpening();
						model.addObject("list", list);
						model.setViewName("CurrentOpening/AdminOpeningList");
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

	@RequestMapping(value = "/adminViewOpening",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminViewOpening(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id = 0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("openingID6", id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("openingID6");
					}finally{
						try {						
							CurrentOpening opening=currentOpening.getOpeningById(id);
							model.addObject("opening", opening);
							model.setViewName("CurrentOpening/AdminViewOpening");
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

	@RequestMapping(value = "/OpeningStatus",method=RequestMethod.POST)
	public ModelAndView OpeningStatus(ModelAndView model,HttpServletRequest req) {
		try {
			String approvedStatus=req.getParameter("approvedStatus");
			String comment=req.getParameter("comment");
			int id=Integer.parseInt(req.getParameter("id"));

			currentOpening.changeAdminOpeningStatus(approvedStatus,comment,id);
			model.setViewName("redirect:/adminCurrOpeningList");
		} catch (Exception e1) {	
			e1.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	@RequestMapping(value = "/adminOpeningDashboard",method=RequestMethod.GET)
	public ModelAndView adminOpeningDashboard(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ){						
					try {
						List<CurrentOpening> list=currentOpening.getAllApprovedOpening("Pending");
						model.addObject("deleteCount", list.size());

						List<CurrentOpening> list1=currentOpening.getOpeningByCreationStatus("Pending");
						model.addObject("createCount", list1.size());
						model.setViewName("CurrentOpening/AdminOpeningDashboard");
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

	@RequestMapping(value = "/adminDeleteOpeningList",method=RequestMethod.GET)
	public ModelAndView adminDeleteOpeningList(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						model.setViewName("CurrentOpening/AdminDeleteOpeningList");
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

	@RequestMapping(value = "/adminDeleteViewOpening",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminDeleteViewOpening(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id = 0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("openingID4", id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("openingID4");
					}finally{
						try {
							CurrentOpening opening=currentOpening.getOpeningById(id);
							model.addObject("opening", opening);
							model.setViewName("CurrentOpening/AdminViewDeleteOpening");
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

	@RequestMapping(value = "/DeleteOpeningStatus",method=RequestMethod.POST)
	public ModelAndView DeleteOpeningStatus(ModelAndView model,HttpServletRequest req) {
		try {
			String approvedStatus=req.getParameter("approvedStatus");
			String comment=req.getParameter("comment");
			int id=Integer.parseInt(req.getParameter("id"));

			currentOpening.deleteOpeningStatus(approvedStatus,comment,id);
			model.setViewName("redirect:/adminDeleteOpeningList");

		} catch (Exception e1) {		
			e1.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	@ResponseBody
	@RequestMapping(value = "/getOpeningByDeleteStatus",method=RequestMethod.GET)
	public List<CurrentOpening> getOpeningByDeleteStatus(HttpServletRequest req) {		
		@SuppressWarnings("deprecation")
		String status=StringEscapeUtils.escapeHtml4(req.getParameter("tendorStatus"));		
		List<CurrentOpening> list=currentOpening.getAllApprovedOpening(status);

		return list;
	}


	@RequestMapping(value = "/ViewDeactivatedOpening",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView ViewDeactivatedOpening(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("openingID5", id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("openingID5");
					}finally{
						try {						
							CurrentOpening opening=currentOpening.getOpeningById(id);
							model.addObject("opening", opening);
							model.setViewName("CurrentOpening/DeactivatedOpening");
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

	@RequestMapping(value = "/deletePendingOpening",method=RequestMethod.POST)
	public ModelAndView deletePendingOpening(ModelAndView model,HttpSession session,HttpServletRequest req, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_OPENING) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							int id=Integer.parseInt(req.getParameter("id"));
							currentOpening.deletePendingOpening(id);
							model.setViewName("redirect:/currOpeningList");
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
}
