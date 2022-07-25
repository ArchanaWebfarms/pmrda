package com.cmsManagement.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class DateDifference {

	
	public Long CalculateTimeBetweenTwoDates(String date1,String date2){
		

	 
	    SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");

	    Date d1 = null;
	    Date d2 = null;
	    try {
	        d1 = format.parse(date1);
	        d2 = format.parse(date2);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }

	    // Get msec from each, and subtract.
	    long diff = d2.getTime() - d1.getTime();
	    long diffSeconds = diff / 1000 % 60;
	    long diffMinutes = diff / (60 * 1000) % 60;
	    long diffHours = diff / (60 * 60 * 1000);
	    System.out.println("Time in seconds: " + diffSeconds + " seconds.");
	    System.out.println("Time in minutes: " + diffMinutes + " minutes.");
	    System.out.println("Time in hours: " + diffHours + " hours.");
		return null;
		
	}
	
	
}
