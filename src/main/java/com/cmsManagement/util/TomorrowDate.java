package com.cmsManagement.util;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar; 
import java.util.Date;



public class TomorrowDate {

	private static String dateFormat = "dd/MM/yyyy";

	// Method to get tomorrow Date
	public static Date getTomorrowDate(Date date) {

		Date tomorrowDate = null;
		if (date != null) {
			Calendar c = Calendar.getInstance();				
			c.setTime(date); // Setting the today date		
			c.add(Calendar.DATE, 1); // Increasing 1 day
				System.out.println("C "+c);
			tomorrowDate = (Date) c.getTime();
				System.out.println("tomorrowDate "+tomorrowDate);
		}
		
		/*if (date != null) {
			LocalDateTime now = LocalDateTime.now();		
			
			//tomorrowDate = now;
				System.out.println("now "+now);
		}*/

		return tomorrowDate;
	}

	// Method to get yesterday date
	public static Date getYesterdayDate(Date date) {

		Date yesterdayDate = null;

		if (date != null) {

			Calendar c = Calendar.getInstance();

			c.setTime(date); // Setting the today date

			c.add(Calendar.DATE, -1); // Decreasing 1 day

			yesterdayDate = (Date) c.getTime();
		}

		return yesterdayDate;
	}

	// Method to format the give date
	public static String getFormattedDate(Date date) {

		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);

		String formatedDate = null;

		if (date != null) {

			formatedDate = sdf.format(date);
		}

		return formatedDate;
	}

	public static void main(String[] args) {

		// Current Date
		Date todayDate = new Date(0);
		
		// Getting the tomorrow date
		Date tomorrowDate = getTomorrowDate(todayDate);
		
		// Getting the yesterday date
		Date yesterdayDate = getYesterdayDate(todayDate);
		
		// Printing all the results
		System.out.println("Yesterday Date is : "+getFormattedDate(yesterdayDate));
		System.out.println("Today Date is : "+getFormattedDate(todayDate));
		System.out.println("Tomorrow Date is : "+getFormattedDate(tomorrowDate));
		
	}
}
