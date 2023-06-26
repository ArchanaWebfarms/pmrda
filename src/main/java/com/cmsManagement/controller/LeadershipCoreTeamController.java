package com.cmsManagement.controller;

import java.io.File;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.LeadershipCoreTeam;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.PreventionFromXSSAttack;


@Controller
public class LeadershipCoreTeamController extends AbstractControllerHelper{

	@RequestMapping(value = "/leadershipCoreteamDash",method=RequestMethod.GET)
	public ModelAndView leadershipCoreteamDash(ModelAndView model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						model.setViewName("LeadershipCoreTeam/LeadershipCoreTeamDashboard");
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

	@RequestMapping(value = "/leadershipList",method=RequestMethod.GET)
	public ModelAndView leadershipList(ModelAndView model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						try {
							List<LeadershipCoreTeam> leaderList = leadershipCoreTeamService.getAllLeadersList("LEADER");
							for(LeadershipCoreTeam l: leaderList) {
								if(l.getSequence()==0) {
									int maxSr = leadershipCoreTeamService.getLastSequence(Constants.ACTIVE_STATE,"LEADER");
									l.setSequence(maxSr+1);
									leadershipCoreTeamService.updateSequence(l);
								}
							}
						}catch(Exception e) {
							e.printStackTrace();
						}						
						List<LeadershipCoreTeam> list=leadershipCoreTeamService.getAllLeadersList("LEADER");
						Collections.reverse(list);
						
						boolean cm=false;
						boolean comm=false;
						for(LeadershipCoreTeam l:list) {
							if(l.getId()==1) {
								cm=true;
							}
							if(l.getId()==3) {
								comm=true;
							}
						}						
						try {
							if(!cm) {
								LeadershipCoreTeam leader = leadershipCoreTeamService.viewLeaderById(1);
								leader.setState("A");
								list.add(leader);
								leadershipCoreTeamService.activateLeader(leader);								
							}
						} catch (Exception e) {	e.printStackTrace();}
						try {
							if(!comm) {
								LeadershipCoreTeam leader = leadershipCoreTeamService.viewLeaderById(3);
								leader.setState("A");
								list.add(leader);
								leadershipCoreTeamService.activateLeader(leader);	
							}
						} catch (Exception e) {e.printStackTrace();	}
						Collections.reverse(list);
						model.addObject("list", list);
						model.setViewName("LeadershipCoreTeam/LeadershipList");
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

	@RequestMapping(value = "/newLeadership",method=RequestMethod.GET)
	public ModelAndView newLeadership(@ModelAttribute("leader") LeadershipCoreTeam leader,ModelAndView model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						int maxSr = leadershipCoreTeamService.getLastSequence(Constants.ACTIVE_STATE,"LEADER");
						leader.setSequence(maxSr+1);
						model.addObject("leader", leader);
						model.addObject("action", "new");
						model.setViewName("LeadershipCoreTeam/NewLeadership");
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

	@RequestMapping(value = "/saveLeadership",method=RequestMethod.POST)
	public ModelAndView saveLeadership(@ModelAttribute("leader") @Valid LeadershipCoreTeam leader,BindingResult result,@RequestParam("english") MultipartFile file,ModelAndView model,HttpServletRequest req) {

		try {
			if(result.hasErrors()){

				model.addObject("leader", leader);
				model.addObject("action", "new");
				model.setViewName("LeadershipCoreTeam/NewLeadership");
			}else{
				/*Prevent Leadership from XSS attack*/
				leader=PreventionFromXSSAttack.preventLeadership(leader);
				
				String RealPath = req.getServletContext().getRealPath("/staticResources/LeadershipCoreTeam/");
				File f = new File(RealPath);
				if (!f.exists()) {
					f.mkdirs();
				}
				String path = RealPath.replace("\\", "/");

				if(leader.getId()>0){
					leadershipCoreTeamService.editLeader(leader,path,file);
				}else{
					leadershipCoreTeamService.saveLeader(leader,path,file);
				}

				model.setViewName("redirect:/leadershipList");
			}


		} catch (Exception e1) {
			e1.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	@RequestMapping(value = "/editLeader",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView editLeader(@ModelAttribute("leader") LeadershipCoreTeam leader,ModelAndView model,HttpSession session,HttpServletRequest req) {
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
						session.setAttribute("leaderID1",id);
					} catch (Exception e) {
						id=(int) session.getAttribute("leaderID1");
					}finally{
						try {
							leader=leadershipCoreTeamService.viewLeaderById(id);						
							model.addObject("leader", leader);
							model.addObject("size", leader.getAttachment().size());
							model.addObject("action", "edit");
							model.setViewName("LeadershipCoreTeam/NewLeadership");
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

	@RequestMapping(value = "/viewLeader",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView viewLeader(ModelAndView model,HttpSession session,HttpServletRequest req) {
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
						session.setAttribute("leaderID2", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("leaderID2");
					}finally{
						try {
							LeadershipCoreTeam leader=leadershipCoreTeamService.viewLeaderById(id);
							model.addObject("leader", leader);
							model.setViewName("LeadershipCoreTeam/ViewLeadership");
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


	@RequestMapping(value = "/deleteLeader",method=RequestMethod.POST)
	public ModelAndView deleteLeader(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						leadershipCoreTeamService.deleteLeader(Integer.parseInt(req.getParameter("id")));
						model.setViewName("redirect:/leadershipList");
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


	@RequestMapping(value = "/coreteamList",method=RequestMethod.GET)
	public ModelAndView coreteamList(ModelAndView model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						try {
							List<LeadershipCoreTeam> leaderList = leadershipCoreTeamService.getAllLeadersList("CORE TEAM");
							for(LeadershipCoreTeam l: leaderList) {
								if(l.getSequence()==0) {
									int maxSr = leadershipCoreTeamService.getLastSequence(Constants.ACTIVE_STATE,"CORE TEAM");
									l.setSequence(maxSr+1);
									leadershipCoreTeamService.updateSequence(l);
								}
							}
						}catch(Exception e) {
							e.printStackTrace();
						}
						List<LeadershipCoreTeam> list=leadershipCoreTeamService.getAllLeadersList("CORE TEAM");
						System.err.println(list.size());
						model.addObject("list", list);
						model.setViewName("LeadershipCoreTeam/CoreteamList");
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

	@RequestMapping(value = "/newCoreTeam",method=RequestMethod.GET)
	public ModelAndView newCoreTeam(@ModelAttribute("leader") LeadershipCoreTeam leader,ModelAndView model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						int maxSr = leadershipCoreTeamService.getLastSequence(Constants.ACTIVE_STATE,"CORE TEAM");
						leader.setSequence(maxSr+1);
						model.addObject("leader", leader);
						model.addObject("action", "new");
						model.addObject("departments", departmentService.getDepartment());
						model.setViewName("LeadershipCoreTeam/NewCoreTeam");
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

	@RequestMapping(value = "/saveCoreTeam",method=RequestMethod.POST)
	public ModelAndView saveCoreTeam(@ModelAttribute("leader") @Valid LeadershipCoreTeam leader,BindingResult result,@RequestParam("english") MultipartFile file,ModelAndView model,HttpServletRequest req) {

		try {
			List<FieldError> errorsToKeep = result.getFieldErrors().stream()
					.filter(fer -> !fer.getField().equals("description"))
					.filter(fer -> !fer.getField().equals("description_h"))
					.collect(Collectors.toList());

			result = new BeanPropertyBindingResult(leader, "leader");

			for (FieldError fieldError : errorsToKeep) {
				result.addError(fieldError);
			}			

			if(result.hasErrors()){				
				model.addObject("leader", leader);
				model.addObject("action", "new");
				model.setViewName("LeadershipCoreTeam/NewCoreTeam");
			}else{
				/*Prevent Core team from XSS attack*/
				leader=PreventionFromXSSAttack.preventLeadership(leader);
				
				String RealPath = req.getServletContext().getRealPath("/staticResources/LeadershipCoreTeam/");
				File f = new File(RealPath);
				if (!f.exists()) {
					f.mkdirs();
				}
				String path = RealPath.replace("\\", "/");

				if(leader.getId()>0){
					leadershipCoreTeamService.editCoreTeam(leader,path,file);
				}else{
					leadershipCoreTeamService.saveCoreTeam(leader,path,file);
				}

				model.setViewName("redirect:/coreteamList");
			}


		} catch (Exception e1) {
			e1.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	@RequestMapping(value = "/editCoreTeam",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView editCoreTeam(@ModelAttribute("leader") LeadershipCoreTeam leader,ModelAndView model,HttpSession session,HttpServletRequest req) {
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
						session.setAttribute("leaderID3", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("leaderID3");
					}finally{
						try {
							leader=leadershipCoreTeamService.viewLeaderById(id);
							model.addObject("leader", leader);
							model.addObject("size", leader.getAttachment().size());
							model.addObject("departments", departmentService.getDepartment());
							model.addObject("action", "edit");
							model.setViewName("LeadershipCoreTeam/NewCoreTeam");
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

	@RequestMapping(value = "/viewCoreTeam",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView viewCoreTeam(ModelAndView model,HttpSession session,HttpServletRequest req) {
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
						session.setAttribute("leaderID4", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("leaderID4");
					}finally{
						try {
							LeadershipCoreTeam leader=leadershipCoreTeamService.viewLeaderById(id);
							model.addObject("leader", leader);
							model.setViewName("LeadershipCoreTeam/ViewCoreTeam");
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


	@RequestMapping(value = "/deleteCoreTeam",method=RequestMethod.POST)
	public ModelAndView deleteCoreTeam(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						leadershipCoreTeamService.deleteLeader(Integer.parseInt(req.getParameter("id")));
						model.setViewName("redirect:/coreteamList");
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


}
