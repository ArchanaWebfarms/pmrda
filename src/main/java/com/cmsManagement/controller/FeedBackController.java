package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Complaint;
import com.cmsManagement.model.Enquiry;
import com.cmsManagement.model.FeedBack;
import com.cmsManagement.util.Constants;


@Controller
public class FeedBackController extends AbstractControllerHelper {


	/**
	 * page to create feedback at Front Controller.
	 * 
	 * @return
	 */
	@RequestMapping(value ="feedback")
	public ModelAndView feedback(ModelAndView feedbackModel, Complaint complaint) {
		feedbackModel.addObject("complaint", complaint);
		feedbackModel.setViewName("static/home/feedback");	
		return feedbackModel;
	}

	/**
	 * Register Feedback at Front Controller.
	 * @param feedBack
	 * @return
	 */
	@RequestMapping(value ="saveFeedback")
	public ModelAndView saveFeedback(ModelAndView saveFeedbackModel, FeedBack  feedBack) {
		int id=feedBackService.saveComplaint(feedBack);
		saveFeedbackModel.setViewName("redirect:/feedback");
		return saveFeedbackModel;
	}


	/**
	 * page to feedback report at Admin side.
	 * @return
	 */
	@RequestMapping(value ="feedbackDashboard",method=RequestMethod.GET)
	public ModelAndView feedbackDashboard(ModelAndView feedbackDashboardModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				feedbackDashboardModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						feedbackDashboardModel.setViewName("reports/feedbackDashboard");	 
					} catch (Exception e) {
						e.printStackTrace();
						feedbackDashboardModel.setViewName("redirect:/errors");
					}
				}//feedbackDashboardModel.addObject(Constants.USER, LoginController.getPrincipal());
			}
		} catch (Exception e1) {			
			feedbackDashboardModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return feedbackDashboardModel;
	}


	/**
	 * @return List of Feedbacks in JSON format based on Report type and Created Date
	 */
	@ResponseBody
	@RequestMapping(value ="getFeedbackReport", method=RequestMethod.POST)
	public List<FeedBack> getFeedbackReport(HttpServletRequest request) {
		List<FeedBack> feedBacks = null;
		try {
			String reportType= request.getParameter("reportType");
			String startDate =request.getParameter("startDate");
			String endDate =request.getParameter("endDate");

			feedBacks = feedBackService.getFeedbackReport(reportType, startDate, endDate);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return feedBacks;
	}

	/**
	 * @return FeedBack Details by id.
	 */
	@RequestMapping(value ="viewFeedBackDetails",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView viewFeedBackDetails(ModelAndView viewFeedBackDetailsModel, HttpServletRequest request,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				viewFeedBackDetailsModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int feedBackID = 0;
					try {
						 feedBackID = Integer.parseInt(request.getParameter("feedBackID"));
						 session.setAttribute("feedbackID1", feedBackID);
					} catch (Exception e) {
						feedBackID=(int) session.getAttribute("feedbackID1");
					}finally{
						try {
							FeedBack feedBacks=feedBackService.viewFeedBackDetails(feedBackID);
							viewFeedBackDetailsModel.addObject("feedBacks", feedBacks);
							viewFeedBackDetailsModel.setViewName("reports/viewFeedBackDetails");
						} catch (Exception e) {
							e.printStackTrace();
							viewFeedBackDetailsModel.setViewName("redirect:/errors");
						}	
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				viewFeedBackDetailsModel.setViewName(Constants.HOME);	
			}else{
				viewFeedBackDetailsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			viewFeedBackDetailsModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return viewFeedBackDetailsModel;
	}

	/****************************Enquiry **********************/
	
	@RequestMapping(value ="enquiryDashboard",method=RequestMethod.GET)
	public ModelAndView enquiryDashboard(ModelAndView feedbackModel,HttpSession session) {		
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				feedbackModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						feedbackModel.setViewName("reports/enquiryDashboard");
					} catch (Exception e) {
						e.printStackTrace();
						feedbackModel.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			feedbackModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return feedbackModel;
	}


	@ResponseBody
	@RequestMapping(value ="getEnquirykReport", method=RequestMethod.POST)
	public List<Enquiry> getEnquirykReport(HttpServletRequest request) {
		List<Enquiry> enquiry = null;
		try {
			String reportType= request.getParameter("reportType");
			String startDate =request.getParameter("startDate");
			String endDate =request.getParameter("endDate");

			enquiry = feedBackService.getEnquirykReport(reportType, startDate, endDate);
			System.out.println("size :"+enquiry.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return enquiry;
	}


	@RequestMapping(value ="viewEnquiry",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView viewEnquiry(ModelAndView viewFeedBackDetailsModel, HttpServletRequest request,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				viewFeedBackDetailsModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id =0;
					try {
						 id = Integer.parseInt(request.getParameter("id"));
						session.setAttribute("enquiryID1", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("enquiryID1");
					}finally{
						try {
							Enquiry feedBacks=feedBackService.viewEnquiry(id);
							viewFeedBackDetailsModel.addObject("feedBacks", feedBacks);
							viewFeedBackDetailsModel.setViewName("reports/viewEnquiry");
						} catch (Exception e) {
							e.printStackTrace();
							viewFeedBackDetailsModel.setViewName("redirect:/errors");
						}	 
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				viewFeedBackDetailsModel.setViewName(Constants.HOME);	
			}else{
				viewFeedBackDetailsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			viewFeedBackDetailsModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return viewFeedBackDetailsModel;
	}
}
