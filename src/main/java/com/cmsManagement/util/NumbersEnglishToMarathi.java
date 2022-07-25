package com.cmsManagement.util;


public class NumbersEnglishToMarathi {

	public static String convertInMarathi(String number) {
		String newNumb="";
		
		for(int i=0;i<number.length();i++){
			switch(number.charAt(i)){
			case '1':newNumb=newNumb+"१";
					break;
			case '2':newNumb=newNumb+"२";
					break;
			case '3':newNumb=newNumb+"३";
					break;
			case '4':newNumb=newNumb+"४";
					break;
			case '5':newNumb=newNumb+"५";
					break;
			case '6':newNumb=newNumb+"६";
					break;
			case '7':newNumb=newNumb+"७";
					break;
			case '8':newNumb=newNumb+"८";
					break;
			case '9':newNumb=newNumb+"९";
					break;
			default :newNumb=newNumb+"०";
					break;
			}
		}
		return newNumb;
	}
	
	public static String convertMonthsInMarathi(String mon) {		
		String month_mr="";
		
			switch(mon){
			case "01":month_mr="जानेवारी";
					break;
			case "02":month_mr="फेब्रुवारी";
					break;
			case "03":month_mr="मार्च";
					break;
			case "04":month_mr="एप्रिल";
					break;
			case "05":month_mr="मे";
					break;
			case "06":month_mr="जून";
					break;
			case "07":month_mr="जुलै";
					break;
			case "08":month_mr="ऑगस्ट";
					break;
			case "09":month_mr="सप्टेंबर";
					break;
			case "10":month_mr="ऑक्टोबर";
					break;
			case "11":month_mr="नोव्हेंबर";
					break;
			case "12":month_mr="डिसेंबर";
					break;
			default :month_mr="";
					break;
			}
		
		return month_mr;
	}
	     
}
