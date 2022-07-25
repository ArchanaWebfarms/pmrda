package com.cmsManagement.controller;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.captcha.botdetect.web.servlet.Captcha;
import com.cmsManagement.dto.PasswordValidation;
import com.cmsManagement.model.LoginInfo;
import com.cmsManagement.model.User;
import com.cmsManagement.model.UserOtp;
import com.cmsManagement.service.CustomUserDetail;
import com.cmsManagement.util.DateDifference;
import com.cmsManagement.util.Email;
import com.cmsManagement.util.ValidateInput;
import com.cmsManagement.util.ValidationResponse;


@Controller

public class LoginController extends AbstractControllerHelper{
	@Autowired
	DateDifference difference;
	Date objDate = new Date();
	/**
	 * page to Access Denied
	 * @return
	 */
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model,HttpSession session) {
		String url=null;
		try {
			String login=(String) session.getAttribute("login");
			if(login.equals("login")){
				model.addAttribute("user", getPrincipal());
				url="accessDenied";
			}
		} catch (Exception e1) {			
			url="redirect:/logout";
		}
		return url;
	}

	/*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if ((auth instanceof AnonymousAuthenticationToken)){    
		model.addAttribute("user", getPrincipal());
		return "redirect:/login";
	}*/

	/**
	 * page to create Login.
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "masters/login";
	}


	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response,ModelAndView model,HttpSession session) {
		//	LoginInfo info = new LoginInfo();
		//info.setUserId(LoginController.getCurrentLoggedInUser().getUser().getUser_id());

		//info.setLogoutTime(objDate.toString());

		//	difference.CalculateTimeBetweenTwoDates(date1, date2)
		//logindaoservice.UpdateUserIdAndTimeAfterLogout(info);
		session.removeAttribute("login");

		session.invalidate();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";

		//model.setViewName("masters/login");
		//return model;
	}


	/**
	 * Get details of currently logged in user.
	 *
	 * @return
	 */
	public static CustomUserDetail getCurrentLoggedInUser() {
		ModelAndView model = null;
		CustomUserDetail user = null;
		try
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (null != auth) {
				Object principal = auth.getPrincipal();
				if (principal instanceof CustomUserDetail) {
					user = (CustomUserDetail) principal;
				}
			}	
		}
		catch(java.lang.NullPointerException e)
		{
			model.setViewName("accessDenied");
		}

		return user;
	}



	/**
	 * Get User Name of currently logged in user.
	 *
	 * @return
	 */
	public static String getPrincipal(){
		ModelAndView model = null;
		String userName = null;
		try
		{
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (principal instanceof UserDetails) {
				userName = ((UserDetails)principal).getUsername();
			} else {
				userName = principal.toString();
			}
		}
		catch(java.lang.NullPointerException e)
		{
			model.setViewName("accessDenied");
		}

		return userName;
	}
	/**
	 * Get User Type  of currently logged in user.
	 *
	 * @return
	 */
	public static int GetTypeID(  ) {
		int user = 0;
		try{
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			CustomUserDetail customUser = (CustomUserDetail)authentication.getPrincipal();
			user = customUser.getUser().getRoleID().getRole_id();
		}
		catch(java.lang.ClassCastException e){}
		return user;
	}


	/*****************Forgot Password**************************************************/

	@RequestMapping(value = "/forgotPass", produces="application/json")
	public ModelAndView forgotPass(ModelAndView model) {
		model.setViewName("masters/forgotPass");
		return model;
	}

	@ResponseBody
	@RequestMapping(value = "/sendOTP", produces="application/json", method = RequestMethod.POST)
	public int sendOTP(HttpServletRequest req,HttpServletResponse response) {
		int i = 0;
		String usercaptcha=req.getParameter("forgetEmailcaptchaCode");		//System.err.println("usercaptcha :"+usercaptcha);			

		Captcha captcha = Captcha.load(req, "emailCaptcha");//System.err.println("captcha :"+captcha.toString());
		boolean isHuman = captcha.validate(usercaptcha);		//System.err.println("isHuman :"+isHuman);	

		if (isHuman) {
		
		try {
			i = 0;
			String email=req.getParameter("email");
		//	System.err.println("email :"+email);
			User user=userService.findUserByEmail(email);
			if(user==null){
				i=-1;
			}else{
				userService.deleteOtp(user.getUser_id());

				Random rnd = new Random();		
				int otp = 100000 + rnd.nextInt(900000);

				userService.saveUserOtp(user,otp);

				/***************send email*********************/
				try{ 
					String emailSubject = "OTP";
					mailSenderObj.send(new MimeMessagePreparator() {
						public void prepare(MimeMessage mimeMessage) throws Exception {					
							MimeMessageHelper mimeMsgHelperObj1 = new MimeMessageHelper(mimeMessage, true, "UTF-8");				

							mimeMsgHelperObj1.setTo(user.getEmail().trim());						
							mimeMsgHelperObj1.setSubject(emailSubject);
							mimeMsgHelperObj1.setText( Email.sendOTP(response,user,otp), true);

						}
					});
					i=user.getUser_id();
				}catch(Exception e1){

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		}else{
			i=-2;
		}
		return i;
	}

	@RequestMapping(value = "otpPage", produces="application/json", method = RequestMethod.POST)
	public ModelAndView otpPage( ModelAndView model,HttpServletRequest req,HttpSession session) {
		int id=0;
		try {
			id=Integer.parseInt(req.getParameter("id"));
			session.setAttribute("otpID1", id);
		} catch (Exception e) {
			id=(int) session.getAttribute("otpID1");
		}finally{
			try {
				model.addObject("id", id);
				/*model.addObject("status", req.getParameter("status"));*/
				model.setViewName("masters/otpPage");
			} catch (Exception e) {
				e.printStackTrace();
				model.setViewName("redirect:/errors");
			}
		}
		return model;
	}

	@ResponseBody
	@RequestMapping(value = "verifyOTP", produces="application/json", method = RequestMethod.POST)
	public int verifyOTP(HttpServletRequest req) {
		int i=0;
		try {
			int otp=Integer.parseInt(req.getParameter("otp"));
			int id=Integer.parseInt(req.getParameter("id")); 

			User user=userService.findUserById(id);
			UserOtp userOtp=userService.getUserByOtp(otp);

			if(userOtp==null || user.getUser_id()!=userOtp.getUser().getUser_id()){
				i=1;
			}else{
				i=2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}


	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "changeForgotPassword", produces="application/json", method = RequestMethod.POST)
	public ValidationResponse changeForgotPassword(@ModelAttribute("changePassword") @Valid PasswordValidation passValidation,BindingResult result,ValidationResponse resp,HttpServletRequest req) {
		String usercaptcha=req.getParameter("passCaptchaCode");					

		Captcha captcha = Captcha.load(req, "passwordCaptcha");
		boolean isHuman = captcha.validate(usercaptcha);			

		if (isHuman) {

			if(result.hasFieldErrors()){			
				resp.setStatus("FAIL");
				Map<String, String> errors = result
						.getFieldErrors()
						.stream()
						.collect(
								Collectors.toMap(FieldError::getField,
										FieldError::getDefaultMessage));

				resp.setErrorMessages(errors);
			}
			else{
				if(passValidation.getNewPass().equals(passValidation.getConfPass())){				
					try {
						String password=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("newPass")));
						int id=Integer.parseInt(req.getParameter("id"));
						
						userService.changePassword(id,password);	
						resp.setStatus("SUCCESS");

					} catch (Exception e) {			
						e.printStackTrace();
					}
				}else{
					resp.setStatus("FieldUnmatch");
				}

			}
		} else {
			resp.setStatus("captchaError");			
		}

		return resp;
	}

	@RequestMapping(value = "resendOtp", produces="application/json", method=RequestMethod.POST)
	public ModelAndView resendOtp(HttpServletRequest req,ModelAndView model,HttpServletResponse response) {

		try {
			int id=Integer.parseInt(req.getParameter("id"));

			userService.deleteOtp(id);
			User user=userService.findUserById(id);

			Random rnd = new Random();		
			int otp = 100000 + rnd.nextInt(900000);

			userService.saveUserOtp(user,otp);

			/***************send email*********************/
			try{ 
				String emailSubject = "Re-send OTP";
				mailSenderObj.send(new MimeMessagePreparator() {
					public void prepare(MimeMessage mimeMessage) throws Exception {					
						MimeMessageHelper mimeMsgHelperObj1 = new MimeMessageHelper(mimeMessage, true, "UTF-8");				

						mimeMsgHelperObj1.setTo(user.getEmail().trim());						
						mimeMsgHelperObj1.setSubject(emailSubject);
						mimeMsgHelperObj1.setText( Email.sendOTP(response,user,otp), true);

					}
				});

			}catch(Exception e1){

			}
			model.addObject("status","resend");
			model.addObject("id",id);
			model.setViewName("masters/otpPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;

	}

}



