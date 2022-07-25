package com.cmsManagement.util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import nl.captcha.Captcha;


import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.web.filter.OncePerRequestFilter;

import com.captcha.botdetect.web.servlet.Captcha;

public class CaptchaVerifierFilter extends OncePerRequestFilter {


	private String failureUrl;
	private CaptchaCaptureFilter captchaCaptureFilter;
	private String successResponse;

	// Inspired by log output: AbstractAuthenticationProcessingFilter.java:unsuccessfulAuthentication:320)
	// Delegating to authentication failure handlerorg.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler@15d4273
	private SimpleUrlAuthenticationFailureHandler failureHandler = new SimpleUrlAuthenticationFailureHandler();

	@Override
	public void doFilterInternal(HttpServletRequest req, HttpServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		// Assign values only when user has submitted a Captcha value
		try {	
			String usercaptcha=captchaCaptureFilter.getUserCaptchaResponse();

			if(usercaptcha!=null){
				/*Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);

				if (captcha.isCorrect(usercaptcha)) {					
					successResponse="Captcha Verified";

				} else {
					successResponse="Captcha Not Verified";

					failureHandler.setDefaultFailureUrl(failureUrl);
					failureHandler.onAuthenticationFailure(req, res, new BadCredentialsException("Captcha invalid! "));

				}*/

				Captcha captcha = Captcha.load(req, "exampleCaptcha");
				boolean isHuman = captcha.validate(usercaptcha);

				if (isHuman) {
					successResponse="Captcha Verified";	System.err.println("captcha verified");				
				} else {
					successResponse="Captcha Not Verified"; System.err.println("captcha not verified");		

					failureHandler.setDefaultFailureUrl(failureUrl);
					failureHandler.onAuthenticationFailure(req, res, new BadCredentialsException("Captcha invalid! "));
				}
			}
			resetCaptchaFields();

		} catch (Exception e) {
			e.printStackTrace();
		}

		// Proceed with the remaining filters
		
			chain.doFilter(req, res);
		
	}

	/**
	 * Reset Captcha fields
	 */
	public void resetCaptchaFields() {
		captchaCaptureFilter.setUserCaptchaResponse(null);
	}


	public String getFailureUrl() {
		return failureUrl;
	}

	public void setFailureUrl(String failureUrl) {
		this.failureUrl = failureUrl;
	}

	public CaptchaCaptureFilter getCaptchaCaptureFilter() {
		return captchaCaptureFilter;
	}

	public void setCaptchaCaptureFilter(CaptchaCaptureFilter captchaCaptureFilter) {
		this.captchaCaptureFilter = captchaCaptureFilter;
	}

	public String getSuccessResponse() {
		return successResponse;
	}

	public void setSuccessResponse(String successResponse) {
		this.successResponse = successResponse;
	}
}
