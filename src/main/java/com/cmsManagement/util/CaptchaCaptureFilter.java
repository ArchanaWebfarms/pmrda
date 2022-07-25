package com.cmsManagement.util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class CaptchaCaptureFilter extends OncePerRequestFilter {

	private String userCaptchaResponse;
	private String usernameResponse;
	private String passwordResponse;
	private HttpServletRequest request;

	@Override
	public void doFilterInternal(HttpServletRequest req, HttpServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		if (req.getParameter("captchaCode") != null) {
			request = req;        
			userCaptchaResponse = req.getParameter("captchaCode");
			usernameResponse=req.getParameter("username");
			passwordResponse=req.getParameter("password");			System.out.println("passwordResponse :"+passwordResponse);
		}

		// Proceed with the remaining filters
		chain.doFilter(req, res);
	}

	public String getUserCaptchaResponse() {
		return userCaptchaResponse;
	}

	public void setUserCaptchaResponse(String userCaptchaResponse) {
		this.userCaptchaResponse = userCaptchaResponse;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getUsernameResponse() {
		return usernameResponse;
	}

	public void setUsernameResponse(String usernameResponse) {
		this.usernameResponse = usernameResponse;
	}

	public String getPasswordResponse() {
		return passwordResponse;
	}

	public void setPasswordResponse(String passwordResponse) {
		this.passwordResponse = passwordResponse;
	}
}