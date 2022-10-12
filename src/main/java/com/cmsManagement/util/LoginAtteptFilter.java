package com.cmsManagement.util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.web.filter.OncePerRequestFilter;

import com.cmsManagement.model.User;
import com.cmsManagement.service.UserService;

public class LoginAtteptFilter extends OncePerRequestFilter {

	public static final int MAX_FAILED_ATTEMPTS = 3;    

	@Autowired
	private UserService userService;

	private String failureUrl; 
	private CaptchaCaptureFilter captchaCaptureFilter;
	private CaptchaVerifierFilter captchaVerifierFilter;

	private SimpleUrlAuthenticationFailureHandler failureHandler = new SimpleUrlAuthenticationFailureHandler();

	@Override
	protected void doFilterInternal(HttpServletRequest req,HttpServletResponse resp, FilterChain filterChain)throws ServletException, IOException {
		try {
			if(captchaVerifierFilter.getSuccessResponse().equals("Captcha Verified")){

				try {
					String username=captchaCaptureFilter.getUsernameResponse();

					if(username!=null){					
						User users = userService.findByUsername(username);

						if(users.getUser_id()>0){
							if(users.isAccountNonLocked()){
								if (users.getFailed_attempt() < MAX_FAILED_ATTEMPTS) {
									userService.increaseFailedAttempts(users);
								} else {
									userService.lock(users);

									req.getSession().setAttribute("LoginAtteptError", "Your account has been locked due to 3 failed attempts. It will be unlocked after 60 minutes.");

									failureHandler.setDefaultFailureUrl(failureUrl);
									failureHandler.onAuthenticationFailure(req, resp, new LockedException("Your account has been locked due to 3 failed attempts."
											+ " It will be unlocked after 60 minutes. "));
								}
							}else{
								boolean lockunlock=userService.unlockWhenTimeExpired(users);							
								if (lockunlock) {
									req.getSession().setAttribute("LoginAtteptError", "Your account has been unlocked. Please try to login again.");

									failureHandler.setDefaultFailureUrl(failureUrl);
									failureHandler.onAuthenticationFailure(req, resp, new LockedException("Your account has been unlocked. Please try to login again. "));
								}else{
									req.getSession().setAttribute("LoginAtteptError", "Your account has been locked due to 3 failed attempts. It will be unlocked after 60 minutes.");

									failureHandler.setDefaultFailureUrl(failureUrl);
									failureHandler.onAuthenticationFailure(req, resp, new LockedException("Your account has been locked due to 3 failed attempts. It will be unlocked after 60 minutes. "));
								}

							}			
						}
						resetUsernameField();
					}
				} catch (Exception e) {e.printStackTrace();}
			}else{
				req.getSession().setAttribute("LoginAtteptError", "Captcha Verification Failed.");

				failureHandler.setDefaultFailureUrl(failureUrl);
			}

		} catch (Exception e) {}
		filterChain.doFilter(req, resp);
	}

	private void resetUsernameField() {
		captchaCaptureFilter.setUsernameResponse(null);
		captchaCaptureFilter.setUserCaptchaResponse(null);
	}

	public CaptchaCaptureFilter getCaptchaCaptureFilter() {
		return captchaCaptureFilter;
	}

	public void setCaptchaCaptureFilter(CaptchaCaptureFilter captchaCaptureFilter) {
		this.captchaCaptureFilter = captchaCaptureFilter;
	}

	public CaptchaVerifierFilter getCaptchaVerifierFilter() {
		return captchaVerifierFilter;
	}

	public void setCaptchaVerifierFilter(CaptchaVerifierFilter captchaVerifierFilter) {
		this.captchaVerifierFilter = captchaVerifierFilter;
	}

	public String getFailureUrl() {
		return failureUrl;
	}

	public void setFailureUrl(String failureUrl) {
		this.failureUrl = failureUrl;
	}

}
