package com.cmsManagement.controller;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;










































import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
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
import com.cmsManagement.model.News;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.ValidateInput;



@Controller
public class TenderController extends AbstractControllerHelper{

	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
	LocalDateTime now = LocalDateTime.now();

	/**
	 * @return List of Tenders based on status.
	 * @throws ParseException 
	 * 
	 */
	@RequestMapping(value = "/tenderList",method=RequestMethod.GET)
	public ModelAndView tenderList(ModelAndView tenderListModel, SecurityContextHolder auth,HttpSession session) throws ParseException{
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){ 
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();
				tenderListModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if(((role.equals(GrantedPermission.CREATE_TENDERS) || role.equals(GrantedPermission.VIEW_TENDER) || role.equals(GrantedPermission.UPDATE_TENDERS) || role.equals(GrantedPermission.DELETE_TENDER))
							&& LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							List<Tendors> tenderList = tenderService.getAllTendors();		           
							//java.util.Date date2=new SimpleDateFormat("dd-MM-yyyy").parse(dtf.format(now)); 
							//java.util.Date date2=new SimpleDateFormat("dd-MM-yyyy HH:mm").parse(dtf.format(now)); 
							Date date2=MethodsHelper.convertInDate3(MethodsHelper.getCurrentDateAndTime2());
							System.err.println("Now :"+date2);
							for (int x = 0; x < tenderList.size(); x++) {
								java.util.Date date1=new SimpleDateFormat("dd-MM-yyyy HH:mm").parse(tenderList.get(x).getClosingDate()+" "+tenderList.get(x).getClosing_time()); 
								System.err.println("tender date :"+date1);
								if(date2.before(date1) || date1.equals(date2)) {
									System.out.println("in if");
									/*}if(date1.equals(date2)){									
									long d=date2.getTime()-date1.getTime();
									System.err.println("d :"+d);
									if(d!=0){
										System.out.println("in iffff");		
										tenderService.changeTendorStaus(tenderList.get(x).getId(), "Archived", "Archived");	
										System.out.println(date1+" "+tenderList.get(x).getId());
									}*/
								}else{
									System.out.println("in else");									
									tenderService.changeTendorStaus(tenderList.get(x).getId(), "Archived", "Archived");	
									System.out.println(date1+" "+tenderList.get(x).getId());
								}
								tenderList.get(x).setPublish_date(MethodsHelper.convertDate1(tenderList.get(x).getPublish_date()));
								tenderList.get(x).setPublish_time(MethodsHelper.convertTimein12hr(tenderList.get(x).getPublish_time()));
								tenderList.get(x).setClosing_time(MethodsHelper.convertTimein12hr(tenderList.get(x).getClosing_time()));
								tenderList.get(x).setOpening_time(MethodsHelper.convertTimein12hr(tenderList.get(x).getOpening_time()));
							} 			  
							tenderListModel.addObject("tenderListt", tenderList);
							tenderListModel.setViewName("tender/tenderList");
						}catch (Exception e) {			
							e.printStackTrace();
							tenderListModel.setViewName("redirect:/errors");
						}
					} //departmentListModel.addObject(Constants.USER, LoginController.getPrincipal());	
				}
			}		
		} catch (Exception e1) {			
			tenderListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return tenderListModel;
	}

	/**
	 * page to create Tender.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/newTender",method=RequestMethod.GET)
	public ModelAndView newTender(HttpSession session, ModelAndView newTenderModel,@ModelAttribute("tendors") Tendors tendors, BindingResult result, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				newTenderModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_TENDERS) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							newTenderModel.addObject("tendors", tendors);
							List<TendorsDepartment>	departments=tenderService.getTenderDepartment();
							newTenderModel.addObject("departments", departments);
							session.setAttribute("action", "newTender");
							newTenderModel.setViewName("tender/newTender");
						} catch (Exception e) {									
							e.printStackTrace();
							newTenderModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newTenderModel.setViewName(Constants.HOME);	
			}else{
				newTenderModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			newTenderModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newTenderModel;
	}

	/**
	 * Register Or Update User based on User Id.
	 * @param tendors
	 * @return
	 */
	@RequestMapping(value = "/saveTendors",method=RequestMethod.POST)
	public ModelAndView saveTendors(@ModelAttribute("tendors") @Valid Tendors tendors, BindingResult result, ModelAndView model,@RequestParam MultipartFile file, HttpSession session,HttpServletRequest request){	

		try {
			int titleLength = tendors.getTitle().length();
			int descriptionlength = tendors.getDescription().length();
			//System.out.println("file=="+file.isEmpty());
			Boolean what = file.isEmpty();

			if(result.hasErrors()){

				List<TendorsDepartment>	departments=tenderService.getTenderDepartment();

				model.addObject("departments", departments);
				model.setViewName("tender/newTender");
			}
			/*else if(titleLength>150){
				//session.setAttribute("titlemsg", "Title must be less than 150 characters");
				model.addObject("titlemsg", "Title must be less than 150 characters");
				model.setViewName("tender/newTender");
			}
			else if(descriptionlength>500){
				//session.setAttribute("titlemsg", "Title must be less than 150 characters");
				model.addObject("descriptionmsg", "Description  must be less than 250 characters");
				model.setViewName("tender/newTender");
			}*/
			else{
				if(tendors.getId()== 0){
					int id=tenderService.saveTendors(tendors, file, session);

				}else{
					boolean results=tenderService.updateTendors(tendors, file, session);

				}
				//model.addAttribute(Constants.USER, LoginController.getPrincipal());

				//return "redirect:/tenderList";
				model.setViewName("redirect:/tenderList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}


	/*@Scheduled(cron = "0 55 17 * * ?")
	public void abc() {
		System.out.println("CONTROLLER");
		List<Tendors> approvedNotice = tenderService.getAllApprovedTendors();
		System.out.println("TO STRING=="+approvedNotice.toString());
		for(int i=0;i<approvedNotice.size();i++)
		{
			String date = approvedNotice.get(i).getClosingDate();
			String abc = MethodsHelper.getCurrentDateDDMMYYYY();
			System.out.println(date);
	        System.out.println(abc);

	            if (date.compareTo(abc) < 0) {
	            	 System.out.println("start is before end"+approvedNotice.get(i).getId());
	            	// tenderService.changeTendorStaus(approvedNotice.get(i).getId(), "Archive", "Archive");

	            } 

			}


	}*/


	/*@RequestMapping(value = "/saveTendors")
	public String saveTendors(@ModelAttribute("tendors") Tendors tendors, BindingResult result, ModelMap model,
			@RequestParam MultipartFile file, HttpSession session)throws IOException{	
		System.out.println("getDept_id impl "+tendors.getTendorsDepartment().getDept_id());
		if(tendors.getTender_id()== 0){
			System.out.println(2);
			tenderService.saveTendors(tendors, file, session);
			System.out.println(5);
		}else{
			tenderService.updateTendors(tendors, file, session);
		}
		model.addAttribute("user", LoginController.getPrincipal());
		System.out.println(tendors.toString());
		return "redirect:/tenderList";
	}*/


	/*	@RequestMapping(value = "/saveTendors",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseStatus(value=HttpStatus.OK)
	public String saveTendors(HttpServletRequest req, @RequestParam("title") String title, @RequestParam("subTitle") String subTitle,
			@RequestParam("description") String description, @RequestParam("openingDate") String openingDate, @RequestParam("closingDate") String closingDate,
			@RequestParam("publish_date") String publish_date, @RequestParam("tags") String tags,@RequestParam("department") String department,
		    @RequestParam("tender_id") String tender_id)throws IOException{
		System.out.println("title "+title+" subTitle "+subTitle+" description "+description+" tender_id "+tender_id);

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("file");
		if(tender_id=='0'){
			System.out.println(2);
			tenderService.saveTendors(tendors);
			System.out.println(5);
		}else{
			tenderService.updateTendors(tendors);
		}
		System.out.println(tendors.toString());
		return "redirect:/newTender";
	}*/


	/**
	 * @return Tender by id to Show Tender Information
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/view_Tender",method=RequestMethod.POST)
	public ModelAndView viewTender(HttpServletRequest request, ModelAndView viewTenderModel,HttpSession session, SecurityContextHolder auth) throws ParseException {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				viewTenderModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.VIEW_TENDER) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          

						int tenderId = 0;
						try {
							tenderId = Integer.parseInt(request.getParameter("tenderId"));
							session.setAttribute("tenderID1", tenderId);
						} catch (Exception e1) {
							tenderId=(int) session.getAttribute("tenderID1");
						}finally{
							try {
								Tendors tendors=tenderService.findTenderById(tenderId);
								tendors.setPublish_date(MethodsHelper.convertDate1(tendors.getPublish_date()));
								viewTenderModel.addObject("tendors", tendors);
								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(tendors.getId(),"TENDER");
								viewTenderModel.addObject("attachmentlist", attachmentlist);
								if(tendors.getTendorsDepartment().getDept_id()>0){
									TendorsDepartment tendorsDepartment = tenderService.findTenderDepartmentId(tendors.getTendorsDepartment().getDept_id());
									viewTenderModel.addObject("tendorsDepartment", tendorsDepartment);
								}
								viewTenderModel.setViewName("tender/viewTender");
							} catch (Exception e) {									
								e.printStackTrace();
								viewTenderModel.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				viewTenderModel.setViewName(Constants.HOME);	
			}else{
				viewTenderModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			viewTenderModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}

		return viewTenderModel;
	}	

	/**
	 * page to update Tender.
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/editTender",method=RequestMethod.POST)
	public ModelAndView editUser(HttpServletRequest request, HttpSession session, ModelAndView editUserModel, SecurityContextHolder auth) throws ParseException {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				editUserModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.UPDATE_TENDERS) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int tenderId = 0;
						try {
							tenderId = Integer.parseInt(request.getParameter("tenderId"));
							session.setAttribute("tenderID2", tenderId);
						} catch (Exception e1) {
							tenderId=(int) session.getAttribute("tenderID2");
						}finally{
							try {
								Tendors tendors=tenderService.findTenderById(tenderId);				
								tendors.setPublish_date(MethodsHelper.convertDate1(tendors.getPublish_date()));				
								editUserModel.addObject("tendors", tendors);
								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(tendors.getId(),"TENDER");
								editUserModel.addObject("attachmentlist", attachmentlist);
								for(int x=0;x<attachmentlist.size();x++)
								{
									session.setAttribute("module",  attachmentlist.get(x).getModule_type());
								}
								session.setAttribute("size",  attachmentlist.size());
								if(tendors.getTendorsDepartment().getDept_id()>0){
									TendorsDepartment tendorsDepartment=tenderService.findTenderDepartmentId(tendors.getTendorsDepartment().getDept_id());
									editUserModel.addObject("tendorsDepartment", tendorsDepartment.getDepartmentName());
								}
								List<TendorsDepartment>	departments=tenderService.getTenderDepartment();
								editUserModel.addObject("departments", departments);
								session.setAttribute("action", "editTender");
								editUserModel.setViewName("tender/newTender");
							} catch (Exception e) {									
								e.printStackTrace();
								editUserModel.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				editUserModel.setViewName(Constants.HOME);	
			}else{
				editUserModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			editUserModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return editUserModel;
	}

	/**
	 * Download Attachment based on path
	 * @param path
	 * @return
	 */
	/*@ResponseBody
	@RequestMapping(value="/attachmentDownload")
	public void downloadFile(@RequestParam("path") String path, HttpServletResponse resonse) throws IOException {
		logger.debug("path "+path);

		      File file = new File(path.trim());	    
		      resonse.setContentType("application/pdf");
		      resonse.setHeader("Content-Disposition", "attachment;filename=" + file.getName());

		    if(file.exists() && !file.isDirectory()) { 
		    	BufferedInputStream inStrem = new BufferedInputStream(new FileInputStream(file));
		    	BufferedOutputStream outStream = new BufferedOutputStream(resonse.getOutputStream());

		      byte[] buffer = new byte[1024];
		      int bytesRead = 0;
		      while ((bytesRead = inStrem.read(buffer)) != -1) {
		        outStream.write(buffer, 0, bytesRead);
		      }
		      outStream.flush();
		      inStrem.close();
		   } 
	   }*/
	@RequestMapping(value="/attachmentDownload")
	public ModelAndView downloadFile(@RequestParam("path") String path, HttpServletResponse resonse,ModelAndView modelAndView) throws IOException {
		File file = new File(path);
		if(file.exists()){
			resonse.setContentType("application/pdf");
			resonse.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
			BufferedInputStream inStrem = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream outStream = new BufferedOutputStream(resonse.getOutputStream());

			byte[] buffer = new byte[1024];
			int bytesRead = 0;
			while ((bytesRead = inStrem.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			outStream.flush();
			outStream.close();
			inStrem.close(); 
			modelAndView.setViewName("static/home/errorPage");


		}else{

			modelAndView.setViewName("error");


		}
		return modelAndView;


	} 
	/*@ResponseBody
	@RequestMapping(value="/attachmentDownload")
	public String downloadFile(@RequestParam("attachmentID") int attachmentID, HttpServletResponse resonse) throws IOException {
		logger.debug("attachmentID "+attachmentID);
			  Attachment attachment = noticesService.findAttachmentById(attachmentID);
			  System.out.println("attachment "+attachment);
		      File file = new File(attachment.getPath());
		      System.out.println("file "+file.getName());	    
		      resonse.setContentType("application/pdf");
		      resonse.setHeader("Content-Disposition", "attachment;filename=" + file.getName());

		    if(file.exists() && !file.isDirectory()) { 
		    	BufferedInputStream inStrem = new BufferedInputStream(new FileInputStream(file));
		    	BufferedOutputStream outStream = new BufferedOutputStream(resonse.getOutputStream());

		      byte[] buffer = new byte[1024];
		      int bytesRead = 0;
		      while ((bytesRead = inStrem.read(buffer)) != -1) {
		        outStream.write(buffer, 0, bytesRead);
		      }
		      outStream.flush();
		      inStrem.close();
		      return "success";
		    }else{
		    	System.out.println("File Not Exist");
		    	return "fail";
		    }
	   }*/

	/**
	 * Deactivate Tender By Tender Id.
	 * @return
	 */
	@RequestMapping(value = "/deleteTender",method=RequestMethod.POST)
	public ModelAndView deleteTender(HttpServletRequest request, ModelAndView deleteTenderModel,HttpSession session, SecurityContextHolder auth) {	
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteTenderModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_TENDER) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							int tenderId = Integer.parseInt(request.getParameter("tenderId"));
							boolean result=tenderService.deleteTender(tenderId);
							deleteTenderModel.setViewName("redirect:/tenderList");	
						} catch (Exception e) {									
							e.printStackTrace();
							deleteTenderModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteTenderModel.setViewName(Constants.HOME);	
			}else{
				deleteTenderModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			deleteTenderModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return deleteTenderModel;
	}

	@RequestMapping(value = "/tenderDashboard",method=RequestMethod.GET)
	public String tenderDashboard(ModelMap model) {
		return "tender/tenderDashboard";
	}

	@RequestMapping(value = "/deleteApprovedTender",method=RequestMethod.POST)
	public ModelAndView deleteApprovedTender(HttpServletRequest req,ModelAndView deleteTenderModel,HttpSession session, SecurityContextHolder auth) {		
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteTenderModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_TENDER) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							tenderService.deleteApprovedTender(Integer.parseInt(req.getParameter("id")));
							deleteTenderModel.setViewName("redirect:/tenderList");
						} catch (Exception e) {									
							e.printStackTrace();
							deleteTenderModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteTenderModel.setViewName(Constants.HOME);	
			}else{
				deleteTenderModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			deleteTenderModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return deleteTenderModel;
	}

	@RequestMapping(value = "/adminTenderDashboard",method=RequestMethod.GET)
	public ModelAndView adminNewsDashboard(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Tendors> tenderDList=tenderService.getAllPendingDeactiveTender("Pending");
						model.addObject("deleteCount", tenderDList.size());

						List<Tendors> tenderList=tenderService.getTendorListByStatus("Pending");
						model.addObject("createCount", tenderList.size());
						model.setViewName("tender/AdminTenderDashboard");
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

	@RequestMapping(value ="adminDeleteTenderList",method=RequestMethod.GET)
	public ModelAndView adminDeleteNewsList(ModelAndView  model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						model.setViewName("tender/AdminDeleteTenderList");
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

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value ="getTenderByDeleteStatus",method=RequestMethod.GET)
	public List<Tendors> getNewsByDeleteStatus(ModelAndView model,HttpServletRequest req) throws ParseException {
		List<Tendors> tendorlist = null;
		try {
			String status=StringEscapeUtils.escapeHtml4(req.getParameter("tendorStatus"));		
			tendorlist = tenderService.getAllPendingDeactiveTender(status);
			for(Tendors n:tendorlist){
				n.setPublish_date(MethodsHelper.convertStringToDateTime(n.getPublish_date()));
				n.setPublish_time(MethodsHelper.convertTimein12hr(n.getPublish_time()));
				n.setClosing_time(MethodsHelper.convertTimein12hr(n.getClosing_time()));
				n.setOpening_time(MethodsHelper.convertTimein12hr(n.getOpening_time()));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tendorlist;
	}


	@RequestMapping(value = "/adminDeleteViewTender",method=RequestMethod.POST)
	public ModelAndView adminDeleteViewNews(ModelAndView model,HttpSession session,HttpServletRequest req) {
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
						session.setAttribute("tenderID3", id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("tenderID3");
					}finally{
						try {
							Tendors tender=tenderService.findTenderById(id);
							tender.setPublish_date(MethodsHelper.convertDate1(tender.getPublish_date()));
							tender.setCreated_date(MethodsHelper.convertDate1(tender.getCreated_date()));
							tender.setOpeningDate(MethodsHelper.convertDate1(tender.getOpeningDate()));
							tender.setClosingDate(MethodsHelper.convertDate1(tender.getClosingDate()));
							model.addObject("tender", tender);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(tender.getId(),"TENDER");
							model.addObject("attachment", attachmentlist);
							model.setViewName("tender/AdminDeleteViewTender");
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

	@RequestMapping(value = "/DeleteTenderStatus",method=RequestMethod.GET)
	public ModelAndView deleteTenderStatus(ModelAndView model,HttpServletRequest req) {
		try {
			String approvedStatus=req.getParameter("approvedStatus");
			String comment=req.getParameter("comment");
			int id=Integer.parseInt(req.getParameter("id"));

			tenderService.deleteTenderStatus(approvedStatus,comment,id);

			model.setViewName("redirect:/adminDeleteTenderList");

		} catch (Exception e1) {	
			e1.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	@RequestMapping(value = "/viewDeactivatedTender",method=RequestMethod.POST)
	public ModelAndView ViewDeactivatedTender(ModelAndView model,HttpServletRequest req,HttpSession session) {
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
						session.setAttribute("tenderID4", id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("tenderID4");
					}finally{
						try {
							Tendors tender=tenderService.findTenderById(id);
							tender.setPublish_date(MethodsHelper.convertDate1(tender.getPublish_date()));
							tender.setCreated_date(MethodsHelper.convertDate1(tender.getCreated_date()));
							tender.setOpeningDate(MethodsHelper.convertDate1(tender.getOpeningDate()));
							tender.setClosingDate(MethodsHelper.convertDate1(tender.getClosingDate()));
							model.addObject("tender", tender);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(tender.getId(),"TENDER");
							model.addObject("attachment", attachmentlist);

							model.setViewName("tender/ViewDeactivatedTender");

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

	@ResponseBody
	@RequestMapping(value = "/convertTimeInMarathi",method=RequestMethod.GET)
	public String convertTimeInMarathi(ModelAndView model,HttpServletRequest req) throws ParseException {
		String time_mr = null;
		try {
			String time_en=req.getParameter("time");
			time_mr = MethodsHelper.convertTimeInMarathi(time_en);
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return time_mr;
	}

}
