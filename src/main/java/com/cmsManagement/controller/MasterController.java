package com.cmsManagement.controller;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.CurrentOpening;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.Enquiry;
import com.cmsManagement.model.FeedBack;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.LoginInfo;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.Project;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.User;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.SpecialCharacter;


@Controller
public class MasterController extends AbstractControllerHelper{
	
	private static final Logger logger = Logger.getLogger(MasterController.class);


	Date objDate = new Date();
	// Display the Date & Time using toString()

	@RequestMapping(value ="/", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpServletRequest request,ModelAndView dashboardModel,HttpSession session) {
		try {
			
			if(logger.isDebugEnabled()){
				logger.debug("pmrda logs is executed!");
			}
			
			LoginInfo info = new LoginInfo();
			info.setUserId(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			info.setUsername(LoginController.getCurrentLoggedInUser().getUser().getUsername());	
			
			userService.resetFailedLoginAttept(LoginController.getCurrentLoggedInUser().getUser());
			
			info.setTime(objDate.toString());
			logindaoservice.SaveUserIdAndTimeAfterLogin(info);	
			logger.info("Login details saved");

			if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getPass_Status().equals(Constants.TEMPORARY)){
				dashboardModel.setViewName("user/changePassword");	 
				int userId = LoginController.getCurrentLoggedInUser().getUser().getUser_id();
				session.setAttribute("loginID", userId);
				String sessionid= request.getSession().getId();
				dashboardModel.addObject(sessionid);
				dashboardModel.addObject("userID", userId);
				session.setAttribute("action", "FirstLogedIn");
				session.setAttribute("msg", "Please Update Your password Once and logIn again To Continue");
				User user=userService.findUserById(userId);
				session.setAttribute("userName", user.getFirstName());
				session.setAttribute("login", "login");
				session.setAttribute("userType", user.getPass_Status());
			}
			else if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getPass_Status().equals(Constants.PERMANENT)){
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int userId = LoginController.getCurrentLoggedInUser().getUser().getUser_id();
					session.setAttribute("loginID", userId);
					dashboardModel.addObject("loginID", userId);
					dashboardModel.setViewName("adminDashboard");	
					session.setAttribute("login", "login");
					User user=userService.findUserById(userId);
					session.setAttribute("userName", user.getFirstName());
					session.setAttribute("userType", user.getPass_Status());

					List<FeedBack> feedback=feedBackService.getFeedbackReport("All", null, null);
					dashboardModel.addObject("feedbackCount", feedback.size());

					List<Enquiry> enquiry=feedBackService.getEnquirykReport("All", null, null);
					dashboardModel.addObject("enquiryCount", enquiry.size());

					List<CurrentOpening> list=currentOpening.getAllApprovedOpening("Pending");
					List<CurrentOpening> list1=currentOpening.getOpeningByCreationStatus("Pending");
					dashboardModel.addObject("openingCount", (list.size()+list1.size()));

					List<News> newsDeletelist=newsservice.getAllPendingDeactiveNews("Pending");			
					List<News> newslistlist=newsservice.GetNewsListByStatus("Pending");
					dashboardModel.addObject("newsCount", (newsDeletelist.size()+newslistlist.size()));

					List<Project> projectDList=projectService.getAllPendingProject("Pending");				
					List<Project> projectList=projectService.getProjectListByStatus("Pending");
					dashboardModel.addObject("projectCount", (projectDList.size()+projectList.size()));

					List<Notices> noticeDList=noticesService.getAllPendingDeactiveNotices("Pending");			
					List<Notices> noticeList=noticesService.getApprovedNoticesbyStatus("Pending");
					dashboardModel.addObject("noticeCount", (noticeDList.size()+noticeList.size()));

					List<Tendors> tenderDList=tenderService.getAllPendingDeactiveTender("Pending");				
					List<Tendors> tenderList=tenderService.getTendorListByStatus("Pending");
					dashboardModel.addObject("tendorCount", (tenderDList.size()+tenderList.size()));			

					List<Department> deptDeleteList=departmentService.getDepartmentByDeletionStatus("Pending");
					List<Department> deptCreteList=departmentService.getDepartmentByCreationStatus("Pending");
					dashboardModel.addObject("deptCount", (deptDeleteList.size()+deptCreteList.size()));

				}else if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE)){
					int userId = LoginController.getCurrentLoggedInUser().getUser().getUser_id();
					session.setAttribute("loginID", userId);
					dashboardModel.addObject("loginID", userId);
					dashboardModel.setViewName("mainDashboard");	
					session.setAttribute("login", "login");
					User user=userService.findUserById(userId);
					session.setAttribute("userName", user.getFirstName());
					session.setAttribute("userType", user.getPass_Status());

					List<News> newsList=newsservice.GetActiveNews();
					dashboardModel.addObject("newsCount", newsList.size());

					List<Notices> noticeList = noticesService.getNoticesList();
					dashboardModel.addObject("noticeCount", noticeList.size());

					List<Tendors> tenderList = tenderService.getAllTendors();	
					dashboardModel.addObject("tenderCount", tenderList.size());

					List<Project> projectList=projectService.getAllProjectList();
					dashboardModel.addObject("projectCount", projectList.size());

					List<CurrentOpening> openingList=currentOpening.getAllActiveOpening();			
					dashboardModel.addObject("openingCount", openingList.size());

					List<Department> deptList=departmentService.getActiveDepartment();
					dashboardModel.addObject("deptCount", deptList.size());
				}

			}
			FinancialYear financialYear=financialYearService.getCurrentActiveFinancialYear();
			String financialYearID = financialYear.getFinancialYear();

			dashboardModel.addObject("financialYear", financialYear);
			session.setAttribute("financialYearID", financialYearID);
			dashboardModel.addObject(Constants.USER, LoginController.getPrincipal());
			dashboardModel.addObject("financialYearID", financialYearID);

			List<Attachment> mannualList=attachmentservice.getAttachmentByModuleType("USERMANNUAL");
			if(mannualList.size()>0){
				//session.setAttribute("userMannual", mannualList.get(0).getAttachmnt_name());
				session.setAttribute("userMannual", "YesMannual");
			}else{
				session.setAttribute("userMannual", "NoMannual");
			}
		} catch (Exception e) {
			logger.info(e);
			dashboardModel.setViewName("redirect:/index");
			e.printStackTrace();
		}

		return dashboardModel;
	}

	/**
	 * page to create Main Dash-board.
	 * @return
	 */
	@RequestMapping(value ="/mainDashboard")
	public ModelAndView mainDashboard(ModelAndView mainDashboardModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				mainDashboardModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE)){
					try {
						mainDashboardModel.setViewName("mainDashboard");	 
					} catch (Exception e) {
						e.printStackTrace();
						mainDashboardModel.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				mainDashboardModel.setViewName(Constants.HOME);	
			}else{
				mainDashboardModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			mainDashboardModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return mainDashboardModel;
	}

	/**
	 * page to create Master Dash-board.
	 * @return
	 */
	@RequestMapping(value = "/masterDashboard" , method = RequestMethod.GET)
	public ModelAndView masterDashboard(HttpServletRequest request,ModelAndView masterDashboardModel) {
		masterDashboardModel.setViewName(Constants.ACCESS_DENIED);

		masterDashboardModel.setViewName("masters/masterDashboard");	

		return masterDashboardModel;
	}
	@ResponseBody
	@RequestMapping(value ="GetSpecailCharactor")
	public String[]  GetSpecailCharactor(ModelAndView UpdateNewsStatus) {

		SpecialCharacter sp = new SpecialCharacter();
		String[] a  = sp.show();

		return a;
	}

	@RequestMapping(value = "/home" , method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request,ModelAndView masterDashboardModel,HttpSession session) {			
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){	

					List<FeedBack> feedback=feedBackService.getFeedbackReport("All", null, null);
					masterDashboardModel.addObject("feedbackCount", feedback.size());

					List<Enquiry> enquiry=feedBackService.getEnquirykReport("All", null, null);
					masterDashboardModel.addObject("enquiryCount", enquiry.size());

					List<CurrentOpening> list=currentOpening.getAllApprovedOpening("Pending");
					List<CurrentOpening> list1=currentOpening.getOpeningByCreationStatus("Pending");
					masterDashboardModel.addObject("openingCount", (list.size()+list1.size()));

					List<News> newsDeletelist=newsservice.getAllPendingDeactiveNews("Pending");			
					List<News> newslistlist=newsservice.GetNewsListByStatus("Pending");
					masterDashboardModel.addObject("newsCount", (newsDeletelist.size()+newslistlist.size()));

					List<Project> projectDList=projectService.getAllPendingProject("Pending");				
					List<Project> projectList=projectService.getProjectListByStatus("Pending");
					masterDashboardModel.addObject("projectCount", (projectDList.size()+projectList.size()));

					List<Notices> noticeDList=noticesService.getAllPendingDeactiveNotices("Pending");			
					List<Notices> noticeList=noticesService.getApprovedNoticesbyStatus("Pending");
					masterDashboardModel.addObject("noticeCount", (noticeDList.size()+noticeList.size()));

					List<Tendors> tenderDList=tenderService.getAllPendingDeactiveTender("Pending");				
					List<Tendors> tenderList=tenderService.getTendorListByStatus("Pending");
					masterDashboardModel.addObject("tendorCount", (tenderDList.size()+tenderList.size()));

					List<Department> deptDeleteList=departmentService.getDepartmentByDeletionStatus("Pending");
					List<Department> deptCreteList=departmentService.getDepartmentByCreationStatus("Pending");
					masterDashboardModel.addObject("deptCount", (deptDeleteList.size()+deptCreteList.size()));

					masterDashboardModel.setViewName("adminDashboard");	 
				}else if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE)){	
					List<News> newsList=newsservice.GetActiveNews();
					masterDashboardModel.addObject("newsCount", newsList.size());

					List<Notices> noticeList = noticesService.getNoticesList();
					masterDashboardModel.addObject("noticeCount", noticeList.size());

					List<Tendors> tenderList = tenderService.getAllTendors();	
					masterDashboardModel.addObject("tenderCount", tenderList.size());

					List<Project> projectList=projectService.getAllProjectList();
					masterDashboardModel.addObject("projectCount", projectList.size());

					List<CurrentOpening> openingList=currentOpening.getAllActiveOpening();			
					masterDashboardModel.addObject("openingCount", openingList.size());

					List<Department> deptList=departmentService.getActiveDepartment();
					masterDashboardModel.addObject("deptCount", deptList.size());

					masterDashboardModel.setViewName("mainDashboard");	 
				}

			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				masterDashboardModel.setViewName("user/changePassword");	
			}else{
				masterDashboardModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			masterDashboardModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}	

		return masterDashboardModel;
	}


	@RequestMapping(value = "/previewPdf")
	public ModelAndView previewPdf(ModelAndView modelAndView,HttpServletRequest request,  HttpSession session,
			HttpServletResponse response) {			

		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){

				int id=0;
				try{
					id=Integer.parseInt(request.getParameter("id"));
					session.setAttribute("pdfID1", id);
				}catch(Exception e){
					id=(int) session.getAttribute("pdfID1");
				}finally{					

					Attachment attachment=attachmentservice.getAttachmentById(id);
					File file = new File(attachment.getPath());
					if(file.exists()){
						BufferedOutputStream outStream = null;
						BufferedInputStream inStrem = null;
						try{
							response.setContentType("application/pdf");
							response.setHeader("Content-Disposition", "inline;filename=" + file.getName());
							inStrem= new BufferedInputStream(new FileInputStream(file));

							outStream= new BufferedOutputStream(response.getOutputStream());
						}catch(Exception e){

						}

						byte[] buffer = new byte[1024];
						int bytesRead = 0;
						while ((bytesRead = inStrem.read(buffer)) != -1) {
							outStream.write(buffer, 0, bytesRead);
						}
						outStream.flush();
						outStream.close(); 
						inStrem.close(); 
						//modelAndView.setViewName("static/home/courtnoticeList");
						modelAndView.addObject("user", LoginController.getPrincipal());

					}else{
						modelAndView.setViewName("Exception/AttachmentException");
						modelAndView.addObject("user", LoginController.getPrincipal());				
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				modelAndView.setViewName("user/changePassword");				
			}else{
				modelAndView.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.setViewName("redirect:/errors");
		}
		return modelAndView;


	}		

	@RequestMapping(value = "/previewImage")
	public ModelAndView previewImage(ModelAndView modelAndView,HttpServletRequest request,  HttpSession session,
			HttpServletResponse response) {			

		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){

				int id=0;
				try{
					id=Integer.parseInt(request.getParameter("id"));
					session.setAttribute("imageID1", id);
				}catch(Exception e){
					id=(int) session.getAttribute("imageID1");
				}finally{
					Attachment attachment=attachmentservice.getAttachmentById(id);
					File file = new File(attachment.getPath());
					if(file.exists()){
						BufferedOutputStream outStream = null;
						BufferedInputStream inStrem = null;
						try{
							MimetypesFileTypeMap mimetypesFileTypeMap=new MimetypesFileTypeMap();
							response.setContentType(mimetypesFileTypeMap.getContentType(file.getName()));
							response.setHeader("Content-Disposition", "inline;filename=" + file.getName());
							inStrem= new BufferedInputStream(new FileInputStream(file));

							outStream= new BufferedOutputStream(response.getOutputStream());
						}catch(Exception e){

						}

						byte[] buffer = new byte[1024];
						int bytesRead = 0;
						while ((bytesRead = inStrem.read(buffer)) != -1) {
							outStream.write(buffer, 0, bytesRead);
						}
						outStream.flush();
						outStream.close(); 
						inStrem.close(); 
						//modelAndView.setViewName("static/home/courtnoticeList");
						modelAndView.addObject("user", LoginController.getPrincipal());

					}else{
						modelAndView.setViewName("Exception/AttachmentException");
						modelAndView.addObject("user", LoginController.getPrincipal());				
					}
				}


			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				modelAndView.setViewName("user/changePassword");				
			}else{
				modelAndView.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.setViewName("redirect:/errors");
		}
		return modelAndView;


	}		


	@RequestMapping(value = "/previewAllVillagepdf")
	public ModelAndView previewAllVillagepdf(ModelAndView modelAndView,HttpServletRequest request,  HttpSession session,
			HttpServletResponse response) {			

		try {
			String RealPath=request.getServletContext().getRealPath("/staticResources/Villages/");
			String path=RealPath.replace("\\", "/"); 
				String pathfinal=path+"List of all Villages.pdf";
					File file = new File(pathfinal);
					if(file.exists()){
						BufferedOutputStream outStream = null;
						BufferedInputStream inStrem = null;
						try{
							response.setContentType("application/pdf");
							response.setHeader("Content-Disposition", "inline;filename=" + file.getName());
							inStrem= new BufferedInputStream(new FileInputStream(file));

							outStream= new BufferedOutputStream(response.getOutputStream());
						}catch(Exception e){

						}

						byte[] buffer = new byte[1024];
						int bytesRead = 0;
						while ((bytesRead = inStrem.read(buffer)) != -1) {
							outStream.write(buffer, 0, bytesRead);
						}
						outStream.flush();
						outStream.close(); 
						inStrem.close(); 
						//modelAndView.setViewName("static/home/courtnoticeList");
						modelAndView.addObject("user", LoginController.getPrincipal());

					}else{
						modelAndView.setViewName("Exception/AttachmentException");
						modelAndView.addObject("user", LoginController.getPrincipal());				
					}
				
			
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.setViewName("redirect:/errors");
		}
		return modelAndView;

	}	
	
	
}
