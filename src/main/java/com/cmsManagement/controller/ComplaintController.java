package com.cmsManagement.controller;
import java.text.ParseException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/*import nl.captcha.Captcha;*/

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Complaint;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.Email;
import com.cmsManagement.util.MethodsHelper;

/**
 * @author ujwala_gawari
 *
 */
@Controller
public class ComplaintController extends AbstractControllerHelper{

	 
	String emailSubject; 
	
	@Autowired
	private JavaMailSender mailSenderObj;
	
	/**
	 * page to create complaint at Front Controller.
	 * 
	 * @return
	 */
	@RequestMapping(value ="complaint", method = RequestMethod.GET)
	public ModelAndView mainDashboard(ModelAndView model, @ModelAttribute("complaint") Complaint complaint  ,BindingResult result) {
			model.addObject("complaint", complaint);
			model.setViewName("static/home/complaint");	
		return model;
	}
	
	/**
	 * Register Complaint at Front Controller and Send mail to register Complaint User.
	 * @param complaint
	 * @return
	 */
	@RequestMapping(value ="saveComplaint")
	public ModelAndView saveComplaint(HttpSession session, ModelAndView model, @ModelAttribute("complaint") @Valid  Complaint complaint  ,BindingResult result, HttpServletResponse response,HttpServletRequest req) throws ParseException {
		/* captcha = (Captcha) session.getAttribute(Captcha.NAME);

		String answer = req.getParameter("answer");
		
		if (result.hasErrors() ) {
			model.setViewName("static/home/complaint");	
			
		}
		else if(captcha.isCorrect(answer))
		{
			
		
			int id=complaintService.saveComplaint(complaint);
		 	
			Complaint returnComp=complaintService.viewComplaintDetails(id);
			 returnComp.setCreated_date(MethodsHelper.convertStringToDateTime(returnComp.getCreated_date()));
			 
			 	*//**
				 *  Send complaint registration mail to user
				 *//*
				
			try{ 
				emailSubject = "Your File "+returnComp.getComplaintID()+" Has been Approved";
				mailSenderObj.send(new MimeMessagePreparator() {
					public void prepare(MimeMessage mimeMessage) throws Exception {
						MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");				
						mimeMsgHelperObj.setTo(returnComp.getEmail());
						mimeMsgHelperObj.setFrom(Constants.EMAIL_FROM_RECIPIENT);	
						mimeMsgHelperObj.setSubject(emailSubject);
						mimeMsgHelperObj.setText( Email.sendMail(response, returnComp), true);
					}
				});
				 model.addObject("messageObj1", "Thank You '"+complaint.getName()+"'! Your Email Has Been Sent!");
				 model.addObject("messageObj2", "We will contact you as soon as possible.");	
		 	}catch(Exception e){
		 	}
			model.setViewName("static/mailSuccess");
		}
		
		else
		{
			model.setViewName("static/home/complaint");
		}*/
				
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value ="captchasubmit")
	public String captchasubmit(ModelAndView captchasubmitModel, HttpServletRequest request, HttpSession session) {
		String msg=null;
		/*Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		if (captcha.isCorrect( request.getParameter("answer"))) {
			msg="success";
		} else {
			msg="fail";
			session.setAttribute("captcah", "fail");
		}
		captchasubmitModel.setViewName("captchasubmit");*/
		return msg;
	}
	
	/**
	 * page to Complaint report at Admin side.
	 * @return
	 */
	@RequestMapping(value ="complaintDashboard", method = RequestMethod.GET)
	public ModelAndView complaintDashboard(ModelAndView model) {
		model.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
			model.setViewName("reports/complaintDashboard");	 
		}//model.addObject(Constants.USER, LoginController.getPrincipal());
		return model;
	}
	
	/**
	 * @return List of Complaint in JSON format based on Report type and Created Date
	 */
	@ResponseBody
	@RequestMapping(value ="getComplaintReport", method=RequestMethod.POST, produces="application/json")
	public List<Complaint> getComplaintReport(HttpServletRequest request) {
		 	String reportType= request.getParameter("reportType");
			String startDate =request.getParameter("startDate");
			String endDate =request.getParameter("endDate");
			String status =request.getParameter("status");

			List<Complaint> complaints=complaintService.getComplaintReport(reportType, startDate, endDate, status);

			
			
		 return complaints;
	}
	
	/**
	 * @return Complaint Details by id.
	 */
	@RequestMapping(value ="viewComplaintDetails", method = RequestMethod.GET)
	public ModelAndView viewComplaintDetails(ModelAndView model, HttpServletRequest request) {
		 model.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
		    int complaintID = Integer.parseInt(request.getParameter("complaintID"));
		    Complaint complaint=complaintService.viewComplaintDetails(complaintID);
		     model.addObject("complaint", complaint);
			model.setViewName("reports/viewComplaintDetails");	 
		}//model.addObject(Constants.USER, LoginController.getPrincipal());
		 return model;
	}
	
	/**
	 * Register Or Update Complaint Department Comment based on  Id.
	 * Send Mail with comment to complaint User with message.
	 * @return
	 */
	@RequestMapping(value ="addComplaintDptComments", method = RequestMethod.GET)
	public String addComplaintDptComments(Model model, HttpServletResponse response, HttpServletRequest request) throws ParseException {
		     int complaintID = Integer.parseInt(request.getParameter("complaintID"));
		    String comment = request.getParameter("comment");
		    String status = request.getParameter("status");
		     Complaint complaint=complaintService.addComplaintDptComments(complaintID, comment, status);
		    String updatedDate= MethodsHelper.convertStringToDateTime(complaint.getUpdated_date());
			/**
			 *  Send complaint registration mail to user
			 */
			
		    try{ 
		    	emailSubject = "Your File "+complaint.getComplaintID()+" Has been Approved";
				mailSenderObj.send(new MimeMessagePreparator() {
					public void prepare(MimeMessage mimeMessage) throws Exception {
						MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");				
						mimeMsgHelperObj.setTo(complaint.getEmail());
						mimeMsgHelperObj.setFrom(Constants.EMAIL_FROM_RECIPIENT);	
						mimeMsgHelperObj.setSubject(emailSubject);
						mimeMsgHelperObj.setText("Hi, <br> Complaint ID: "+complaint.getComplaintID()+"<br> Date: "+updatedDate+
								"<br> Comments by Department: "+complaint.getComments(), true);
					}
				});
				model.addAttribute("messageObj", "Thank You!"+LoginController.getPrincipal()+" Your Email Has Been Sent!");
		   }catch(Exception e){
			 }
		return "redirect:/complaintDashboard";
	}
	
}
