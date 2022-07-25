/*package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.apache.log4j.Logger;
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
import com.cmsManagement.model.Department;
import com.cmsManagement.model.Notices;
import com.cmsManagement.util.Constants;


@Controller
public class DownloadController extends AbstractControllerHelper{
//private static final Logger logger = Logger.getLogger(DownloadController.class);
	

	@RequestMapping(value = "/downloadList")
	public ModelAndView downloadList(ModelAndView noticesListModel){
	//	logger.debug("Inside downloadList Method  of DownloadController "); 
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		noticesListModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(role.equals(GrantedPermission.CREATE_DOWNLOAD) || role.equals(GrantedPermission.VIEW_DOWNLOAD) || role.equals(GrantedPermission.UPDATE_DOWNLOAD) || 
	        		role.equals(GrantedPermission.DELETE_DOWNLOAD) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
				List<Notices> downloadList = downloadService.getDownloadList();
			//	logger.debug("Inside downloadList Method  of DownloadController downloadList isEmpty "+downloadList.isEmpty()); 
				noticesListModel.addObject("downloadList", downloadList);
				noticesListModel.setViewName("download/downloadList");
	        }               
	    } 
		//noticesListModel.addObject(Constants.USER, LoginController.getPrincipal());
	//	logger.debug("Completed downloadList Method  of DownloadController"); 
		return noticesListModel;
	}
	

	@RequestMapping(value = "/newDownload")
	public ModelAndView newDownload(HttpSession session, ModelAndView newDownloadModel) {
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
	//	logger.debug("Inside newDownload Method  of DownloadController "); 
		newDownloadModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.CREATE_DOWNLOAD) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){	
	        	
				Notices downloads=new Notices();
				newDownloadModel.addObject("downloads", downloads);
				List<Department> departments=departmentService.getDepartment();
		//		logger.debug("Inside newDownload Method  of DownloadController Tendors Department isEmpty "+departments.isEmpty()); 
				newDownloadModel.addObject("departments", departments);
				session.setAttribute("action", "newNotices");
				newDownloadModel.setViewName("download/newDownload");
	        }
	       }
				//newDownloadModel.addObject(Constants.USER, LoginController.getPrincipal());
//		logger.debug("Completed newDownload Method  of DownloadController "); 
		return newDownloadModel;
	}
	

	@RequestMapping(value = "/saveDownload")
	public String saveDownload(@ModelAttribute("downloads") Notices downloads, BindingResult result, ModelMap model,
			@RequestParam MultipartFile file, HttpSession session){
		//logger.debug("Inside saveNotices Method  of DownloadController before saving notice- Notice ID "+downloads.getNoticeID()); 
		if(downloads.getNoticeID()==0){
			int id=downloadService.saveDownload(downloads, file, session);
			//logger.debug("Inside saveDownload Method  of DownloadController after saving notice- Notice ID "+id);
		}else{
			//logger.debug("Inside saveNotices Method  of DownloadController attachment Id "+downloads.getAttachment());
			boolean results=downloadService.updateDownload(downloads, file, session);
			//logger.debug("Inside saveDownload Method  of DownloadController is download updated "+results);
		}
		//model.addAttribute(Constants.USER, LoginController.getPrincipal());
		//logger.debug("Completed saveDownload Method  of DownloadController ");
		return "redirect:/downloadList";
	}
	

	@RequestMapping(value = "/editDownload" , method = RequestMethod.GET)
	public ModelAndView editDownload(HttpServletRequest request, HttpSession session, ModelAndView editDownloadModel) {
		//logger.debug("Inside editDownload Method  of DownloadController.");
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		editDownloadModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.UPDATE_DOWNLOAD) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				Notices downloads=noticesService.findNoticesById(noticeId);
				//logger.debug("Inside editDownload Method  of DownloadController- downloads "+downloads.toString());
				editDownloadModel.addObject("downloads", downloads);
				List<Department> departments=departmentService.getDepartment();
				//logger.debug("Inside editDownload Method  of DownloadController Tendors Department "+departments.toString());
				editDownloadModel.addObject("departments", departments);
				
				session.setAttribute("action", "editNotices");
				editDownloadModel.setViewName("download/newDownload");
	        }
	       }	
		//editDownloadModel.addObject(Constants.USER, LoginController.getPrincipal());
		//logger.debug("Completed editDownload Method  of DownloadController");
		return editDownloadModel;
	}	

	@RequestMapping(value = "/deleteDownload" , method = RequestMethod.GET)
	public ModelAndView deleteDownload(HttpServletRequest request, ModelAndView deleteDownloadModel) {	
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();	
		//logger.debug("Inside deleteDownload Method  of DownloadController");
		deleteDownloadModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.DELETE_DOWNLOAD) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				boolean result=noticesService.deleteNotices(noticeId);
				//logger.debug("Inside deleteDownload Method  of DownloadController- is Download deleted "+result);
				deleteDownloadModel.setViewName("redirect:/downloadList");
		    }
		   }	
		//deleteDownloadModel.addObject(Constants.USER, LoginController.getPrincipal());
		//logger.debug("Completed deleteDownload Method  of DownloadController ");
		return deleteDownloadModel;
	}
	

	@RequestMapping(value = "/viewDownload" , method = RequestMethod.GET)
	public ModelAndView viewDownload(HttpServletRequest request, ModelAndView viewDownloadModel) {
		//logger.debug("Inside viewDownload Method  of DownloadController");
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		viewDownloadModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.VIEW_DOWNLOAD) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){	
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				Notices downloads=noticesService.findNoticesById(noticeId);
				viewDownloadModel.addObject("downloads", downloads);
				viewDownloadModel.setViewName("download/viewDownload");
	        }
	       }
		//viewDownloadModel.addObject(Constants.USER, LoginController.getPrincipal());
		//logger.debug("Completed viewDownload Method  of DownloadController ");
		return viewDownloadModel;
	}
	

	@RequestMapping(value = "/adminDownloadList")
	public ModelAndView adminDownloadList(ModelAndView adminDownloadListModel){
		adminDownloadListModel.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
			adminDownloadListModel.setViewName("download/adminDownloadList");
		}//adminDownloadListModel.addObject(Constants.USER, LoginController.getPrincipal());
		return adminDownloadListModel;
	}

	@ResponseBody
	@RequestMapping(value = "/getDownloadListByStatus")
	public List<Notices> getDownloadListByStatus(HttpServletRequest request, ModelMap model) {
		 //logger.debug("Inside getDownloadListByStatus Method  of DownloadController");
			String downloadStatus = request.getParameter("downloadStatus");
			List<Notices> list=downloadService.getDownloadListByStatus(downloadStatus);
			//logger.debug("Inside getDownloadListByStatus Method  of DownloadController - Notices list is Empty = "+list.isEmpty());
		//	model.addAttribute(Constants.USER, LoginController.getPrincipal());
		  //logger.debug("Completed getDownloadListByStatus Method  of DownloadController.");	
		return list;
	}
	

	@RequestMapping(value = "/adminDownloadView" , method = RequestMethod.GET)
	public ModelAndView adminDownloadView(HttpServletRequest request, ModelAndView adminDownloadViewModel) {
		adminDownloadViewModel.setViewName(Constants.ACCESS_DENIED);
		//logger.debug("Inside adminDownloadView Method  of DownloadController.");
		if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
			int noticeId = Integer.parseInt(request.getParameter("noticeId"));
			Notices download=noticesService.findNoticesById(noticeId);
			adminDownloadViewModel.addObject("download", download);
			adminDownloadViewModel.setViewName("download/adminDownloadView");
		}//adminDownloadViewModel.addObject(Constants.USER, LoginController.getPrincipal());
		//logger.debug("Completed adminDownloadView Method  of DownloadController.");
		return adminDownloadViewModel;
	}
	

	@RequestMapping(value = "/changeDownloadStatus" , method = RequestMethod.GET)
	public String changeDownloadStatus(HttpServletRequest request, ModelMap model) {
		 //logger.debug("Inside changeDownloadStatus Method  of DownloadController");
		int noticeID = Integer.parseInt(request.getParameter("noticeID"));
		String comment = request.getParameter("comment");
		String status = request.getParameter("status");
			boolean result=noticesService.changeNoticesStaus(noticeID, comment, status);
		//logger.debug("Completed changeDownloadStatus Method  of DownloadController is Notice Status Changed= "+result);	
		//model.addAttribute(Constants.USER, LoginController.getPrincipal());
		return "redirect:/adminDownloadList";
	}
	
}
*/