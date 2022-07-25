package com.cmsManagement.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController{
	 @RequestMapping(value = "errors")
	    public ModelAndView renderErrorPage(HttpServletRequest httpRequest,ModelAndView errorPage) {
	         
	      //  ModelAndView errorPage = new ModelAndView("errorPage");
	        String errorMsg = "";
	        int httpErrorCode = getErrorCode(httpRequest);
	       // System.err.println("httpErrorCode :"+httpErrorCode);
	 
	        switch (httpErrorCode) {
	           
	            case 404: {
	                errorMsg = "Http Error Code: 404. Resource not found";
	                break;
	            }
	            case 500: {
	                errorMsg = "Http Error Code: 500. Internal Server Error";
	                break;
	            }
	            default :{
	            	errorMsg = "Http Error Code: 500. Internal Server Error";
	                break;
	            }
	        }
	       /* errorPage.addObject("errorMsg", errorMsg);
	        errorPage.setViewName("errorPage");*/
	        errorPage.addObject("Error", errorMsg);
	        errorPage.setViewName("Exception/GlobalException");
	        return errorPage;
	    }
	     
	    private int getErrorCode(HttpServletRequest httpRequest) {
	        return (Integer) httpRequest
	          .getAttribute("javax.servlet.error.status_code");
	    }
}