package com.cmsManagement.util;




import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import javassist.NotFoundException;
@ControllerAdvice
public class GlobalDefaultExceptionHandler {
	
	
	
	
	@ExceptionHandler({
		 NotFoundException.class,
		 MissingServletRequestParameterException.class,
		 NoHandlerFoundException.class,
		 java.lang.IllegalArgumentException.class
		
		 })
	
	public ModelAndView handleNoHandlerFoundException()
	{
		
		ModelAndView m = new ModelAndView("Exception/GlobalException");
		m.addObject("Error","The Page You Are Requested Is Not Available");
		return m;
		
	}


}
