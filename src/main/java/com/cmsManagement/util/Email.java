package com.cmsManagement.util;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletResponse;

import com.cmsManagement.model.Complaint;
import com.cmsManagement.model.Enquiry;
import com.cmsManagement.model.FeedBack;
import com.cmsManagement.model.User;

/**
 * @author ujwala_gawari
 *
 */

public class Email {
	
	public static String sendMail(HttpServletResponse response, Complaint complaint) throws IOException{
     
     PrintWriter writer = response.getWriter();
      
     String htmlRespone = "<html><head></head>";
     htmlRespone += "<body>";       
     htmlRespone += "Hi, <br><br>";      
     htmlRespone += "Your Complaint dated "+complaint.getCreated_date()+" has been successfully registered, our concerned person will get back to you as early as possible.  <br>"; 
     htmlRespone += "Thank You.  <br><br>";      
     htmlRespone += "Complaint ID: "+complaint.getComplaintID()+"<br>"; 
     htmlRespone += "Title: "+complaint.getTitle()+"<br>";      
     htmlRespone += "Message: "+complaint.getDescription()+"<br>";
     htmlRespone += "Name of Person: "+complaint.getName()+"<br>";
     htmlRespone += "Contact No: "+complaint.getPhone()+"<br>";
     htmlRespone += "</body>";      
     htmlRespone += "</html>";
     

     writer.println(htmlRespone); 
     
     return htmlRespone;
	}

	public static String sendFeedbackMail(HttpServletResponse response,FeedBack info) throws IOException, ParseException {
		// PrintWriter writer = response.getWriter();
	      
	     String htmlRespone = "<html><head></head>";
	     htmlRespone += "<body>";       
	     htmlRespone += "Hi, <br><br>";      
	     htmlRespone += "Your feedback dated "+MethodsHelper.convertStringToDateTime(info.getCreated_date())+" has been successfully registered, our concerned person will get back to you as early as possible.  <br>"; 
	     htmlRespone += "Thank You.  <br><br>";      
	     htmlRespone += "Subject: "+info.getSubject()+"<br>";      
	     htmlRespone += "Message: "+info.getDescription()+"<br>";
	     htmlRespone += "Name of Person: "+info.getName()+"<br>";
	     htmlRespone += "Contact No: "+info.getPhone()+"<br>";
	     htmlRespone += "</body>";      
	     htmlRespone += "</html>";
	     

	   //  writer.println(htmlRespone); 
	     
	     return htmlRespone;
	}

	public static String sendEnquiryMail(HttpServletResponse response,Enquiry info) throws ParseException {
		 String htmlRespone = "<html><head></head>";
	     htmlRespone += "<body>";       
	     htmlRespone += "Hi, <br><br>";      
	     htmlRespone += "Your enquiry dated "+MethodsHelper.convertStringToDateTime(info.getCreated_date())+" has been successfully registered, our concerned person will get back to you as early as possible.  <br>"; 
	     htmlRespone += "Thank You.  <br><br>";      
	     htmlRespone += "Subject: "+info.getSubject()+"<br>";        
	     htmlRespone += "Message: "+info.getDescription()+"<br>";
	     htmlRespone += "Name of Person: "+info.getName()+"<br>";
	     htmlRespone += "Contact No: "+info.getPhone()+"<br>";
	     htmlRespone += "</body>";      
	     htmlRespone += "</html>";
	     
		return htmlRespone;
	}

	public static String sendOTP(HttpServletResponse response, User user,int otp) {
		String htmlRespone = "<html><head></head>";
		   htmlRespone += "<body>";       
		   htmlRespone += "Hello "+user.getFirstName()+" "+user.getLastName()+", <br><br>";  
		   htmlRespone += "Welcome to Pune Metropolitan Region Development Authority (PMRDA).<br><br>";		  
		   htmlRespone += "Your One Time Password is(OTP) :"+otp+"<br><br>";
		   htmlRespone += "For more information contact  020-25933333 or email us your queries on ad.pmrda@gmail.com <br>"; 
		   htmlRespone += "<br><br>"; 
		   htmlRespone += "Thank You."; 
		   htmlRespone += "</body>";      
		   htmlRespone += "</html>";
		   return htmlRespone ; 
	}
	
}
