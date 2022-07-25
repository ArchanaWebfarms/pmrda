package com.cmsManagement.controller;
import java.io.File;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;















































import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
import com.cmsManagement.model.Department;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.RTIApplications;
import com.cmsManagement.service.AttachmentService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;


@Controller
public class NoticesController extends AbstractControllerHelper{	

	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	LocalDateTime now = LocalDateTime.now();


	@RequestMapping(value = "/noticesList",method=RequestMethod.GET)
	public ModelAndView noticesList(ModelAndView noticesListModel,HttpSession session) throws ParseException{
		try {
			String login=(String) session.getAttribute("login"); 
			if(login.equals("login")){
				List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
				noticesListModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if(((role.equals(GrantedPermission.CREATE_NOTIFICATIONS) || role.equals(GrantedPermission.VIEW_NOTIFICATIONS) || role.equals(GrantedPermission.UPDATE_NOTIFICATIONS) || role.equals(GrantedPermission.DELETE_NOTIFICATIONS)) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
						try {
							List<Notices> noticesList1 = noticesService.getNoticesList();
							List<Notices> noticesList=new ArrayList<Notices>();
							//java.util.Date date2=new SimpleDateFormat("dd-MM-yyyy").parse(dtf.format(now)); 
							for(Notices n:noticesList1){
								/*java.util.Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(n.getClosingDate()); 
if(date2.before(date1) || date1.equals(date2)) {
								System.err.println("in iffff"+n.getClosingDate());
}else{
								System.err.println("in elseeee"+n.getClosingDate());
								noticesService.changeNoticesStaus(n.getNoticeID(), "Archived", "Archive");
}*/	
								n.setPublish_date(MethodsHelper.convertDate1(n.getPublish_date()));

								if(n.getType().equals("CIRCULERS")){
									n.setType("NOTIFICATIONS");
								}else if(n.getType().equals("STATE GOV GR")){
									n.setType("ACTS & RULES");
								}else if(n.getType().equals("CENTRAL GOV GR")){
									n.setType("GOVERNMENT RESOLUTION");
								}else if(n.getType().equals("PRESS NOTES")){
									n.setType("PRESS RELEASE");
								}else if(n.getType().equals("RTI")){
									n.setType("PROACTIVE DISCLOSURES");
								}
								noticesList.add(n);
							}
							noticesListModel.addObject("noticesList", noticesList);
							noticesListModel.setViewName("notices/noticesList");
						} catch (Exception e) {
							e.printStackTrace();
							noticesListModel.setViewName("redirect:/errors");
						}
					}

				} 	
			}				
		} catch (Exception e1) {			
			noticesListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return noticesListModel;
	}

	/**
	 * page to create Notices.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/newNotices",method=RequestMethod.GET)
	public ModelAndView newNotices(HttpSession session, ModelAndView newNoticesModel) {
		try {
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
				newNoticesModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) && role.equals(GrantedPermission.CREATE_NOTIFICATIONS)) 
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){	
						try {
							Locale locale[] = Locale.getAvailableLocales();  
							System.err.println("Supported Locales:");  
							for (int i1 = 0; i1 < locale.length; i1++)  {
								System.out.println(locale[i].getDisplayName());  
							}  

							Notices notices=new Notices();
							newNoticesModel.addObject("notices", notices);
							List<Department> departments=departmentService.getDepartment();
							newNoticesModel.addObject("departments", departments);
							session.setAttribute("action", "newNotices");
							newNoticesModel.setViewName("notices/newNotices");	
							//newNoticesModel.setViewName("notices/new");	
						} catch (Exception e) {				
							e.printStackTrace();
							newNoticesModel.setViewName("redirect:/errors");
						}
					}
				}
				//newNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newNoticesModel.setViewName(Constants.HOME);	
			}else{
				newNoticesModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			newNoticesModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return newNoticesModel;
	}

	/**
	 * Register Or Update Notices based on Notices Id.
	 * @param tendors
	 * @return
	 * @throws ParseException 
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/saveNotices",method=RequestMethod.POST)
	public ModelAndView saveNotices(HttpServletRequest request,@ModelAttribute("notices") @Valid Notices notices,BindingResult result,
			@RequestParam("english") List<MultipartFile> english,@RequestParam("marathi") List<MultipartFile> marathi,
			ModelAndView model, HttpServletRequest req,SecurityContextHolder auth, HttpSession session) throws ParseException{
		try {
			if (result.hasErrors()) {

				List<Department> departments=departmentService.getDepartment();
				model.addObject("departments", departments);
				model.setViewName("notices/newNotices");

			}
			else{
				/*Prevent Notices from XSS attack*/
				notices=PreventionFromXSSAttack.preventNotice(notices);
				
				notices.setPublish_date(MethodsHelper.convertDate(notices.getPublish_date()));

				String title[]=req.getParameterValues("atitle");
				String mtitle[]=req.getParameterValues("mtitle");

				String RealPath = req.getServletContext().getRealPath("/staticResources/Notice/");
				File f = new File(RealPath);
				if (!f.exists()) {
					f.mkdirs();
				}
				String path = RealPath.replace("\\", "/");
				if (notices.getNoticeID() == 0) {


					int noticeId = noticesService.saveNotices(notices);
					if (noticeId > 0) {
						for(int j=0;j<english.size();j++)
						{
							String atitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(title[j]));
							if(!english.get(j).isEmpty()){
								attachmentservice.saveattachment(path, english.get(j), "english",noticeId,"NOTICE",atitle);
							}
						}
						for(int j=0;j<marathi.size();j++)
						{
							String mrtitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(mtitle[j]));
							if(!marathi.get(j).isEmpty()){
								attachmentservice.saveattachment(path, marathi.get(j), "marathi",noticeId,"NOTICE",mrtitle);
							}
						}

					}
				} else {
					int noticeId = Integer.parseInt(request.getParameter("noticeID"));

					if(notices.getType().equals("NOTIFICATIONS")){
						notices.setType("CIRCULERS");
					}else if(notices.getType().equals("ACTS & RULES")){
						notices.setType("STATE GOV GR");
					}else if(notices.getType().equals("GOVERNMENT RESOLUTION")){
						notices.setType("CENTRAL GOV GR");
					}else if(notices.getType().equals("PRESS RELEASE")){
						notices.setType("PRESS NOTES");
					}else if(notices.getType().equals("PROACTIVE DISCLOSURES")){
						notices.setType("RTI");
					}

					boolean b = noticesService.updateNotices(notices);

					if (b == true) {


						//attachmentservice.UpdateAttachmentByID(path, english,"english", noticeId);

						//	attachmentservice.UpdateAttachmentByID(path, marathi,"marathi", noticeId);
						for(int j=0;j<english.size();j++)
						{
							String atitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(title[j]));
							if(!english.get(j).isEmpty()){
								attachmentservice.saveattachment(path, english.get(j), "english",noticeId,"NOTICE",atitle);
							}
						}
						for(int j=0;j<marathi.size();j++)
						{
							String atitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(mtitle[j]));
							if(!marathi.get(j).isEmpty()){
								attachmentservice.saveattachment(path, marathi.get(j), "marathi",noticeId,"NOTICE",atitle);
							}
						}


					}

				}
				model.setViewName("redirect:/noticesList");


			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}

		return model;


	}


	/**
	 * @return Notices by id to Show Notices Information
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/viewNotices",method=RequestMethod.POST)
	public ModelAndView viewNotices(HttpServletRequest request, ModelAndView viewNoticesModel,HttpSession session) throws ParseException {
		try {
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
				viewNoticesModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) && role.equals(GrantedPermission.VIEW_NOTIFICATIONS) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){	
						int noticeId=0;
						try {
							noticeId = Integer.parseInt(request.getParameter("noticeId"));
							session.setAttribute("noticeID1", noticeId);
						} catch (Exception e1) {
							noticeId=(int) session.getAttribute("noticeID1");
						}finally{						
							try {
								Notices notices=noticesService.findNoticesById(noticeId);
								notices.setPublish_date(MethodsHelper.convertDate1(notices.getPublish_date()));
								if(notices.getType().equals("CIRCULERS")){
									notices.setType("NOTIFICATIONS");
								}else if(notices.getType().equals("STATE GOV GR")){
									notices.setType("ACTS & RULES");
								}else if(notices.getType().equals("CENTRAL GOV GR")){
									notices.setType("GOVERNMENT RESOLUTION");
								}else if(notices.getType().equals("PRESS NOTES")){
									notices.setType("PRESS RELEASE");
								}else if(notices.getType().equals("RTI")){
									notices.setType("PROACTIVE DISCLOSURES");
								}
								viewNoticesModel.addObject("notices", notices);
								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(notices.getNoticeID(),"NOTICE");
								System.err.println(attachmentlist.size());
								viewNoticesModel.addObject("attachmentlist", attachmentlist);
								/*if(notices.getDepartment().getDeptId()>0){
						TendorsDepartment tendorsDepartment = tenderService.findTenderDepartmentId(notices.getDepartment().getDeptId());
						viewNoticesModel.addObject("tendorsDepartment", tendorsDepartment);
						logger.debug("Inside viewNotices Method  of NoticesController- Tendors Department "+tendorsDepartment.toString());
					}*/
								viewNoticesModel.setViewName("notices/viewNotices");
							} catch (Exception e) {				
								e.printStackTrace();
								viewNoticesModel.setViewName("redirect:/errors");
							}
						}

					}

				}
				//viewNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				viewNoticesModel.setViewName(Constants.HOME);	
			}else{
				viewNoticesModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			viewNoticesModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return viewNoticesModel;
	}

	/**
	 * page to update Notices.
	 * @return
	 * @throws ParseException  
	 */
	@RequestMapping(value = "/editNotices",method=RequestMethod.POST)
	public ModelAndView editNotices(HttpServletRequest request, HttpSession session, ModelAndView editNoticesModel) throws ParseException {
		try {
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
				editNoticesModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) && role.equals(GrantedPermission.UPDATE_NOTIFICATIONS) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){

						int noticeId=0;
						try {
							noticeId = Integer.parseInt(request.getParameter("noticeId"));
							session.setAttribute("noticeID2", noticeId);
						} catch (Exception e1) {
							noticeId=(int) session.getAttribute("noticeID2");
						}finally{
							try {							
								Notices notices=noticesService.findNoticesById(noticeId);
								notices.setPublish_date(MethodsHelper.convertDate1(notices.getPublish_date()));
								if(notices.getType().equals("CIRCULERS")){
									notices.setType("NOTIFICATIONS");
								}else if(notices.getType().equals("STATE GOV GR")){
									notices.setType("ACTS & RULES");
								}else if(notices.getType().equals("CENTRAL GOV GR")){
									notices.setType("GOVERNMENT RESOLUTION");
								}else if(notices.getType().equals("PRESS NOTES")){
									notices.setType("PRESS RELEASE");
								}else if(notices.getType().equals("RTI")){
									notices.setType("PROACTIVE DISCLOSURES");
								}
								editNoticesModel.addObject("notices", notices);
								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(notices.getNoticeID(),"NOTICE");
								editNoticesModel.addObject("attachmentlist", attachmentlist);
								for(int x=0;x<attachmentlist.size();x++)
								{
									session.setAttribute("module",  attachmentlist.get(x).getModule_type());
								}
								session.setAttribute("size",  attachmentlist.size());

								List<Department> departments=departmentService.getDepartment();
								editNoticesModel.addObject("departments", departments);
								session.setAttribute("action", "editNotices");
								editNoticesModel.setViewName("notices/newNotices");

							} catch (Exception e) {				
								e.printStackTrace();
								editNoticesModel.setViewName("redirect:/errors");
							}
						}
					}
				}	
				//editNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				editNoticesModel.setViewName(Constants.HOME);	
			}else{
				editNoticesModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			editNoticesModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return editNoticesModel;
	}	

	/**
	 * Deactivate state of Notices By Notices Id.
	 * @return
	 */
	@RequestMapping(value = "/deleteNotices",method=RequestMethod.POST)
	public ModelAndView deleteNotices(HttpServletRequest request, ModelAndView deleteNoticesModel,HttpSession session) {	
		try {
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();	
				deleteNoticesModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) && role.equals(GrantedPermission.DELETE_NOTIFICATIONS) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
						try {
							int noticeId = Integer.parseInt(request.getParameter("noticeId"));
							boolean result=noticesService.deleteNotices(noticeId);
							deleteNoticesModel.setViewName("redirect:/noticesList");
						}catch (Exception e) {				
							e.printStackTrace();
							deleteNoticesModel.setViewName("redirect:/errors");
						}
					} 
				}	
				//deleteNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteNoticesModel.setViewName(Constants.HOME);	
			}else{
				deleteNoticesModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			deleteNoticesModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return deleteNoticesModel;
	}

	/**
	 * page to List of Notices at admin side
	 * 
	 */
	@RequestMapping(value = "/adminNoticesList",method=RequestMethod.GET)
	public ModelAndView adminNoticesList(ModelAndView adminNoticesListModel,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				adminNoticesListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						adminNoticesListModel.setViewName("notices/adminNoticesList");
					} catch (Exception e) {
						e.printStackTrace();
						adminNoticesListModel.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			adminNoticesListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminNoticesListModel;
	}

	/**
	 * @return List Of Notices in JSON format based on Notice Type And Notice Status(eg. Pending)
	 * @throws ParseException 
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/getNoticesListByStatus",method=RequestMethod.GET)
	public List<Notices> getNoticesListByStatus(HttpServletRequest request, ModelMap model) throws ParseException {
		List<Notices> list1 = null;
		try {
			String noticesStatus = StringEscapeUtils.escapeHtml4(request.getParameter("noticesStatus"));
			String type = StringEscapeUtils.escapeHtml4(request.getParameter("Noticetype"));
			List<Notices> list=noticesService.getNoticesListByStatus(noticesStatus, type);
			System.err.println("list :"+list.size());
			list1 = new ArrayList<Notices>();
			for(Notices n:list){
				n.setPublish_date(MethodsHelper.convertDate1(n.getPublish_date()));
				if(n.getType().equals("CIRCULERS")){
					n.setType("NOTIFICATIONS");
				}else if(n.getType().equals("STATE GOV GR")){
					n.setType("ACTS & RULES");
				}else if(n.getType().equals("CENTRAL GOV GR")){
					n.setType("GOVERNMENT RESOLUTION");
				}else if(n.getType().equals("PRESS NOTES")){
					n.setType("PRESS RELEASE");
				}else if(n.getType().equals("RTI")){
					n.setType("PROACTIVE DISCLOSURES");
				}
				list1.add(n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}			
		//model.addAttribute(Constants.USER, LoginController.getPrincipal());
		return list1;
	}

	/**
	 * @return Notice by id to Show Notice Information and update status
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/adminNoticesView",method=RequestMethod.POST)
	public ModelAndView adminTendorView(HttpServletRequest request, ModelAndView adminTendorViewModel,HttpSession session) throws ParseException {
		try {
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				adminTendorViewModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
					int noticeId = 0;
					try {
						noticeId = Integer.parseInt(request.getParameter("noticeId"));
						session.setAttribute("noticeID3", noticeId);
					} catch (Exception e1) {
						noticeId=(int) session.getAttribute("noticeID3");
					}finally{					
						try {
							Notices notices=noticesService.findNoticesById(noticeId);
							notices.setPublish_date(MethodsHelper.convertDate1(notices.getPublish_date()));
							if(notices.getType().equals("CIRCULERS")){
								notices.setType("NOTIFICATIONS");
							}else if(notices.getType().equals("STATE GOV GR")){
								notices.setType("ACTS & RULES");
							}else if(notices.getType().equals("CENTRAL GOV GR")){
								notices.setType("GOVERNMENT RESOLUTION");
							}else if(notices.getType().equals("PRESS NOTES")){
								notices.setType("PRESS RELEASE");
							}else if(notices.getType().equals("RTI")){
								notices.setType("PROACTIVE DISCLOSURES");
							}
							adminTendorViewModel.addObject("notices", notices);
							request.getSession().setAttribute("noticeId", noticeId);
							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(notices.getNoticeID(),"NOTICE");

							adminTendorViewModel.addObject("attachmentlist", attachmentlist);
							adminTendorViewModel.setViewName("notices/adminNoticesView");
						}catch (Exception e) {			
							e.printStackTrace();
							adminTendorViewModel.setViewName("redirect:/errors");
						}
					}
				} //adminTendorViewModel.addObject(Constants.USER, LoginController.getPrincipal());
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				adminTendorViewModel.setViewName(Constants.HOME);	
			}else{
				adminTendorViewModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			adminTendorViewModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminTendorViewModel;
	}

	/**
	 * Change/Update Notice Status by Id.
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/NoticesStaus",method=RequestMethod.POST )
	public ModelAndView changeNoticesStaus(@ModelAttribute("notices") Notices notices, HttpSession session,HttpServletRequest request, ModelAndView model) {
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						int noticeID = Integer.parseInt(request.getParameter("noticeID"));
						//	int noticeId=(int) (request.getSession().getAttribute("noticeId"));
						String Approved = StringEscapeUtils.escapeHtml4(request.getParameter("Approved"));

						notices.setPublishStatus(Approved);
						boolean id=noticesService.changeNoticesStaus(noticeID, ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(notices.getComment())), Approved);
						model.setViewName("redirect:/adminNoticesList");
						//model.addAttribute(Constants.USER, LoginController.getPrincipal());
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
		//return "redirect:/adminNoticesList";
	}

	@RequestMapping(value = "/deleteNoticeAttachmentById",method=RequestMethod.POST)
	public String deleteAttachmentById(HttpServletRequest request,
			ModelMap model) {

		int attachmentID = Integer.parseInt(request
				.getParameter("attachmentID"));
		attachmentservice.deleteAttachmentByID(attachmentID);

		model.addAttribute(Constants.USER, LoginController.getPrincipal());
		return "redirect:/editNotices";
	}


	@RequestMapping(value = "/deleteApprovedNotices",method=RequestMethod.POST)
	public ModelAndView deleteApprovedNews(HttpServletRequest req,ModelAndView deleteNewsModel,HttpSession session, SecurityContextHolder auth) {
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteNewsModel.setViewName(Constants.ACCESS_DENIED);
				List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();				
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) && role.equals(GrantedPermission.DELETE_NOTIFICATIONS)) 					
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) 
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
						try {
							int id = Integer.parseInt(req.getParameter("id"));
							noticesService.deleteApprovedNotices(Integer.parseInt(req.getParameter("id")));
							deleteNewsModel.setViewName("redirect:/noticesList");
						} catch (Exception e) {
							e.printStackTrace();
							deleteNewsModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteNewsModel.setViewName(Constants.HOME);	
			}else{
				deleteNewsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			deleteNewsModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return deleteNewsModel;
	}

	@RequestMapping(value = "/adminNoticesDashboard",method=RequestMethod.GET)
	public ModelAndView adminNewsDashboard(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	 || (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) )){						
					try {
						List<Notices> noticeDList=noticesService.getAllPendingDeactiveNotices("Pending");
						model.addObject("deleteCount", noticeDList.size());

						List<Notices> noticeList=noticesService.getApprovedNoticesbyStatus("Pending");
						model.addObject("createCount", noticeList.size());
						model.setViewName("notices/AdminNoticesDashboard");
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

	@RequestMapping(value ="adminDeleteNoticesList",method=RequestMethod.GET)
	public ModelAndView adminDeleteNewsList(ModelAndView  model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
					try {
						model.setViewName("notices/AdminDeleteNoticesList");
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
	@RequestMapping(value ="getNoticesByDeleteStatus",method=RequestMethod.GET)
	public List<Notices> getNewsByDeleteStatus(ModelAndView model,HttpServletRequest req) throws ParseException {
		List<Notices> noticesList = null;
		try {
			String status=StringEscapeUtils.escapeHtml4(req.getParameter("tendorStatus"));		
			noticesList = noticesService.getAllPendingDeactiveNotices(status);
			for(Notices n:noticesList){
				n.setPublish_date(MethodsHelper.convertStringToDateTime(n.getPublish_date()));

				if(n.getType().equals("CIRCULERS")){
					n.setType("NOTIFICATIONS");
				}else if(n.getType().equals("STATE GOV GR")){
					n.setType("ACTS & RULES");
				}else if(n.getType().equals("CENTRAL GOV GR")){
					n.setType("GOVERNMENT RESOLUTION");
				}else if(n.getType().equals("PRESS NOTES")){
					n.setType("PRESS RELEASE");
				}else if(n.getType().equals("RTI")){
					n.setType("PROACTIVE DISCLOSURES");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticesList;
	}

	@RequestMapping(value = "/adminDeleteViewNotices",method=RequestMethod.POST)
	public ModelAndView adminDeleteViewNews(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ){

					int id=0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("noticeID4", id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("noticeID4");
					}finally{
						try {
							Notices notice=noticesService.findNoticesById(id);
							notice.setPublish_date(MethodsHelper.convertDate1(notice.getPublish_date()));		

							if(notice.getType().equals("CIRCULERS")){
								notice.setType("NOTIFICATIONS");
							}else if(notice.getType().equals("STATE GOV GR")){
								notice.setType("ACTS & RULES");
							}else if(notice.getType().equals("CENTRAL GOV GR")){
								notice.setType("GOVERNMENT RESOLUTION");
							}else if(notice.getType().equals("PRESS NOTES")){
								notice.setType("PRESS RELEASE");
							}else if(notice.getType().equals("RTI")){
								notice.setType("PROACTIVE DISCLOSURES");
							}

							model.addObject("notices", notice);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(notice.getNoticeID(),"NOTICE");
							model.addObject("attachment", attachmentlist);
							model.setViewName("notices/AdminDeleteViewNotices");
						}catch (Exception e) {			
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
					}
				} 
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/DeleteNoticesStatus",method=RequestMethod.POST)
	public ModelAndView DeleteNewsStatus(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						String approvedStatus=req.getParameter("approvedStatus");
						String comment=req.getParameter("comment");
						int id=Integer.parseInt(req.getParameter("id"));

						noticesService.deleteNoticesStatus(approvedStatus,comment,id);

						model.setViewName("redirect:/adminDeleteNoticesList");
					} catch (Exception e1) {	
						e1.printStackTrace();
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

	@RequestMapping(value = "/ViewDeactivatedNotices",method=RequestMethod.POST)
	public ModelAndView ViewDeactivatedOpening(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){

					int id = 0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("noticeID5", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("noticeID5");
					}finally{
						try {						
							Notices notice=noticesService.findNoticesById(id);
							notice.setPublish_date(MethodsHelper.convertDate1(notice.getPublish_date()));		
							if(notice.getType().equals("CIRCULERS")){
								notice.setType("NOTIFICATIONS");
							}else if(notice.getType().equals("STATE GOV GR")){
								notice.setType("ACTS & RULES");
							}else if(notice.getType().equals("CENTRAL GOV GR")){
								notice.setType("GOVERNMENT RESOLUTION");
							}else if(notice.getType().equals("PRESS NOTES")){
								notice.setType("PRESS RELEASE");
							}else if(notice.getType().equals("RTI")){
								notice.setType("PROACTIVE DISCLOSURES");
							}
							model.addObject("notices", notice);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(notice.getNoticeID(),"NOTICE");
							model.addObject("attachment", attachmentlist);
							model.setViewName("notices/DeactivatedNotices");
						} catch (Exception e1) {
							e1.printStackTrace();
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

	/**************RTI DAshboard*******************************************************************/

	@RequestMapping(value = "/RTIDashboard",method=RequestMethod.GET)
	public ModelAndView RTIDashboard(ModelAndView adminNoticesListModel,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				adminNoticesListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<RTIApplications> rtiApplList=noticesService.getRTIApplications();
						for(int i=0;i<rtiApplList.size();i++){
							rtiApplList.get(i).setCreated_on(MethodsHelper.convertDate1(rtiApplList.get(i).getCreated_on()));
						}
						adminNoticesListModel.addObject("rtiApplList", rtiApplList);
						adminNoticesListModel.setViewName("notices/RTIDashboard");
					} catch (Exception e) {
						e.printStackTrace();
						adminNoticesListModel.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			adminNoticesListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminNoticesListModel;
	}

	@RequestMapping(value = "/AddRtiApplications",method=RequestMethod.GET)
	public ModelAndView AddRtiApplications(@ModelAttribute("rti") RTIApplications rti,ModelAndView adminNoticesListModel,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				adminNoticesListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						adminNoticesListModel.addObject("rti", rti);
						adminNoticesListModel.setViewName("notices/AddRtiApplications");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e1) {			
			adminNoticesListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminNoticesListModel;
	}

	@RequestMapping(value = "/saveRtiApplications",method=RequestMethod.POST)
	public ModelAndView saveRtiApplications(HttpServletRequest request,@ModelAttribute("rti") RTIApplications rti,ModelAndView model, HttpServletRequest req) throws ParseException{

		try {		
			
			if (rti.getId() == 0) {
				noticesService.saveRtiApplications(rti);
			} else {

			}
			model.setViewName("redirect:/RTIDashboard");
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}

		return model;
	}

	@RequestMapping(value = "/deleteRTIApllication",method=RequestMethod.POST)
	public ModelAndView deleteRTIApllication(ModelAndView adminNoticesListModel,HttpServletRequest req,HttpSession session){
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				adminNoticesListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						int id=Integer.parseInt(req.getParameter("id"));
						noticesService.deleteRTIApllication(id);
						adminNoticesListModel.setViewName("redirect:/RTIDashboard");
					} catch (Exception e) {
						e.printStackTrace();
						adminNoticesListModel.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			adminNoticesListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminNoticesListModel;
	}

}
