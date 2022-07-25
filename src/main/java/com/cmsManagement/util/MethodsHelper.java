package com.cmsManagement.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

public class MethodsHelper {

	
	/**
	 * This method returns Current Date and Time.
	 * @return
	 */
	public static String getCurrentDateAndTime() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
	
	public static String getCurrentDateAndTime1() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
	
	public static String getCurrentDateAndTime2() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
	
	public static Date convertInDate3(String abc) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm", Locale.ENGLISH);
		Date date = format.parse(abc);		
		return date;
	}
	/**
	 * This method returns Current Date.
	 * @return
	 */
	public static String getCurrentDate() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
	/**
	 * This method returns Current Date.
	 * @return
	 */
	public static String getCurrentDateDDMMYYYY() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
	
	
	/**
	 * This method returns a DateTime object for the String passed.
	 * @param dateTimeString
	 * @return DateTime
	 * @throws ParseException 
	 */ 
	public static String convertStringToDateTime(String dateString) throws ParseException {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date date = format.parse(dateString);
		return formatter.format(date);
	}
	
	public static String convertDate(String dateString) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = format.parse(dateString);
		return formatter.format(date);
	}
	
public static String convertDate1(String dateString) throws ParseException {
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date date = format.parse(dateString);		
		return formatter.format(date);
	}

public static String convertDate3(String dateString) throws ParseException {
	DateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date date = format.parse(dateString);
	return formatter.format(date);
}

public static String convertDateAndTime(String abc) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("MMM dd, yyyy");
	Date date = format.parse(abc);		
	return formatter.format(date);
}

public static String convertDateAndTime2(String abc) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date date = format.parse(abc);		
	return formatter.format(date);
}


public static Object convertDateAndTime1(String currdatetime) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("MMM dd, yyyy");
	Date date = format.parse(currdatetime);		
	return formatter.format(date);
}

public static String convertDateAndTime3(String currdatetime) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	Date date = format.parse(currdatetime);		
	return formatter.format(date);
}

public static String getYear(String abc) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);	
	DateFormat formatter = new SimpleDateFormat("yyyy");
	Date date = format.parse(abc);		
	return formatter.format(date);
}

public static String convertInTime(String currdatetime) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("HH");
	Date date = format.parse(currdatetime);		
	return formatter.format(date);
}	

public static Date convertInDate(String abc) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
	Date date = format.parse(abc);		
	return date;
}

public static Date convertInDate2(String abc) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
	Date date = format.parse(abc);		
	return date;
}


public static Date convertInDate1(String abc) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	Date date = format.parse(abc);		
	return date;
}


public static String convertIn24hr(String time) throws ParseException {
	String t3=null;
	if(time.contains("PM")){
		DateFormat format = new SimpleDateFormat("HH:mm", Locale.ENGLISH);
		DateFormat formatter = new SimpleDateFormat("HH");
		Date date = format.parse(time);		
		String hr= formatter.format(date);
		int t2=12+Integer.parseInt(hr);
		String[] st1=time.split(":");
		String[] st2=st1[1].split(" ");
		t3=String.valueOf(t2)+":"+st2[0];
	}else{
		String[] st2=time.split(" ");
		t3=st2[0];
	}
	return t3;
}


public static String convertDateInTime(String time) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("HH:mm");
	Date date = format.parse(time);		
	return formatter.format(date);
}


public static String convertTimein12hr(String time) throws ParseException {
	DateFormat format = new SimpleDateFormat("HH:mm", Locale.ENGLISH);
	DateFormat formatter = new SimpleDateFormat("HH");
	Date date = format.parse(time);		
	String hr= formatter.format(date);
	String t2=null;
	if(Integer.parseInt(hr)>12){
		int hr1=Integer.parseInt(hr)-12;
		String[] t1=time.split(":");
		t2=String.valueOf(hr1)+":"+t1[1]+" PM";
	}else{
		String[] t1=time.split(":");
		t2=hr+":"+t1[1]+" AM";
	}
	return t2;
}


public static String convertDateInMarathi(String english_date) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	DateFormat formatter1 = new SimpleDateFormat("yyyy");
	DateFormat formatter2 = new SimpleDateFormat("MM");
	DateFormat formatter3 = new SimpleDateFormat("dd");
	Date date = format.parse(english_date);
	
	String year=formatter1.format(date);
	String mr_year=NumbersEnglishToMarathi.convertInMarathi(year);
	
	String month=formatter2.format(date);
	String mr_month=NumbersEnglishToMarathi.convertInMarathi(month);
	
	String day=formatter3.format(date);
	String mr_day=NumbersEnglishToMarathi.convertInMarathi(day);
	
	String marathi_date=mr_day+"-"+mr_month+"-"+mr_year;
	return marathi_date;
}

public static String convertDateInMarathi1(String english_date) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	DateFormat formatter1 = new SimpleDateFormat("yyyy");
	DateFormat formatter2 = new SimpleDateFormat("MM");
	DateFormat formatter3 = new SimpleDateFormat("dd");
	Date date = format.parse(english_date);
	
	String year=formatter1.format(date);
	String mr_year=NumbersEnglishToMarathi.convertInMarathi(year);
	
	String month=formatter2.format(date);
	String mr_month=NumbersEnglishToMarathi.convertMonthsInMarathi(month);
	
	String day=formatter3.format(date);
	String mr_day=NumbersEnglishToMarathi.convertInMarathi(day);
	
	String marathi_date=mr_month+" "+mr_day+", "+mr_year;
	return marathi_date;
}

public static String convertYearInMarathi(String english_date) throws ParseException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	DateFormat formatter1 = new SimpleDateFormat("yyyy");
	Date date = format.parse(english_date);
	
	String year=formatter1.format(date);
	String mr_year=NumbersEnglishToMarathi.convertInMarathi(year);
	
	return mr_year;
}

public static String convertTimeInMarathi(String time) throws ParseException {
	DateFormat format = new SimpleDateFormat("HH:mm", Locale.ENGLISH);
	DateFormat formatter1 = new SimpleDateFormat("HH");
	DateFormat formatter2 = new SimpleDateFormat("mm");
	Date date = format.parse(time);	
	
	String hr= formatter1.format(date);
	String mr_hr=null;
	if(Integer.parseInt(hr)>12){
		 int hr1=Integer.parseInt(hr)-12;
		 mr_hr=NumbersEnglishToMarathi.convertInMarathi(String.valueOf(hr1));
	}else{
		 mr_hr=NumbersEnglishToMarathi.convertInMarathi(hr);
	}
	
	String mm= formatter2.format(date);
	String mr_mm=NumbersEnglishToMarathi.convertInMarathi(mm);
	
	String mr_time=null;
	if(Integer.parseInt(hr)>12){
		mr_time=mr_hr+":"+mr_mm+" दु.";
	}else{
		mr_time=mr_hr+":"+mr_mm+" स.";
	}
	return mr_time;
}

}
