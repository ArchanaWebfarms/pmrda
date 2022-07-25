package com.cmsManagement.util;

public class ValidateInput {
	public static String replaceAll(String value){		
		String filterValue=null;
		System.out.println("value :"+value);
		try {
			/**** <b></b> tag ****/
			filterValue=value.replaceAll("&lt;b&gt;", "<b>");		
			filterValue=filterValue.replaceAll("&lt;/b&gt;", "</b>");
			
			/**** <u></u> tag ****/
			filterValue=filterValue.replaceAll("&lt;u&gt;", "</u>");
			filterValue=filterValue.replaceAll("&lt;/u&gt;", "</u>");
			
			/**** <li></li> tag ****/
			filterValue=filterValue.replaceAll("&lt;li&gt;", "<li>");		
			filterValue=filterValue.replaceAll("&lt;/li&gt;", "</li>");
			
			/**** <ul></ul> tag ****/
			filterValue=filterValue.replaceAll("&lt;ul&gt;", "<ul>");		
			filterValue=filterValue.replaceAll("&lt;/ul&gt;", "</ul>");
			
			/**** <ol></ol> tag ****/
			filterValue=filterValue.replaceAll("&lt;ol&gt;", "<ol>");		
			filterValue=filterValue.replaceAll("&lt;/ol&gt;", "</ol>");
			
			/**** <i></i> tag ****/
			filterValue=filterValue.replaceAll("&lt;i&gt;", "<i>");		
			filterValue=filterValue.replaceAll("&lt;/i&gt;", "</i>");
			
			/**** <br></br> tag ****/
			filterValue=filterValue.replaceAll("&lt;br&gt;", "<br>");		
			filterValue=filterValue.replaceAll("&lt;/br&gt;", "</br>");
			
			/**** <p></p> tag ****/
			filterValue=filterValue.replaceAll("&lt;p&gt;", "<p>");		
			filterValue=filterValue.replaceAll("&lt;/p&gt;", "</p>");		
			
			/**** <h1></h1> tag ****/
			filterValue=filterValue.replaceAll("&lt;h1&gt;", "<h1>");		
			filterValue=filterValue.replaceAll("&lt;/h1&gt;", "</h1>");		
			
			/**** <h2></h2> tag ****/
			filterValue=filterValue.replaceAll("&lt;h2&gt;", "<h2>");		
			filterValue=filterValue.replaceAll("&lt;/h2&gt;", "</h2>");
			
			/**** <h3></h3> tag ****/
			filterValue=filterValue.replaceAll("&lt;h3&gt;", "<h3>");		
			filterValue=filterValue.replaceAll("&lt;/h3&gt;", "</h3>");
			
			/**** <h4></h4> tag ****/
			filterValue=filterValue.replaceAll("&lt;h4&gt;", "<h4>");		
			filterValue=filterValue.replaceAll("&lt;/h4&gt;", "</h4>");
			
			/**** <h5></h5> tag ****/
			filterValue=filterValue.replaceAll("&lt;h5&gt;", "<h5>");		
			filterValue=filterValue.replaceAll("&lt;/h5&gt;", "</h5>");
			
			/**** <h6></h6> tag ****/
			filterValue=filterValue.replaceAll("&lt;h6&gt;", "<h6>");		
			filterValue=filterValue.replaceAll("&lt;/h6&gt;", "</h6>");
			
			/**** <small></small> tag ****/
			filterValue=filterValue.replaceAll("&lt;small&gt;", "<small>");		
			filterValue=filterValue.replaceAll("&lt;/small&gt;", "</small>");
			
			/**** <strong></strong> tag ****/
			filterValue=filterValue.replaceAll("&lt;strong&gt;", "<strong>");		
			filterValue=filterValue.replaceAll("&lt;/strong&gt;", "</strong>");
			
			/**** <sub></sub> tag ****/
			filterValue=filterValue.replaceAll("&lt;sub&gt;", "<sub>");		
			filterValue=filterValue.replaceAll("&lt;/sub&gt;", "</sub>");
			
			/**** <sup></sup> tag ****/
			filterValue=filterValue.replaceAll("&lt;sup&gt;", "<sup>");		
			filterValue=filterValue.replaceAll("&lt;/sup&gt;", "</sup>");
			
			/**** <ol type="1"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ol type=&quot;1&quot;&gt;", "<ol type='1'>");		
			
			/**** <ol type="A"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ol type=&quot;A&quot;&gt;", "<ol type='A'>");		
			
			/**** <ol type="a"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ol type=&quot;a&quot;&gt;", "<ol type='a'>");		
			
			/**** <ol type="i"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ol type=&quot;i&quot;&gt;", "<ol type='i'>");		
			
			/**** <ol type="I"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ol type=&quot;I&quot;&gt;", "<ol type='I'>");
			
			/**** <ul type="disc"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ul type=&quot;disc&quot;&gt;", "<ul type='disc'>");		
			
			/**** <ul type="circle"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ul type=&quot;circle&quot;&gt;", "<ul type='circle'>");		
			
			/**** <ul type="square"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ul type=&quot;square&quot;&gt;", "<ul type='square'>");		
			
			/**** <ul type="none"> tag ****/
			filterValue=filterValue.replaceAll("&lt;ul type=&quot;none&quot;&gt;", "<ul type='none'>");		
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return filterValue;
	}
	
	public static String replaceSome(String value) {		
		String filterValue=null;
		
		try {
			/**** <b></b> tag ****/
			filterValue=value.replaceAll("&lt;b&gt;", "<b>");		
			filterValue=filterValue.replaceAll("&lt;/b&gt;", "</b>");
			
			/**** <u></u> tag ****/
			filterValue=filterValue.replaceAll("&lt;u&gt;", "</u>");
			filterValue=filterValue.replaceAll("&lt;/u&gt;", "</u>");
			
			/**** <i></i> tag ****/
			filterValue=filterValue.replaceAll("&lt;i&gt;", "<i>");		
			filterValue=filterValue.replaceAll("&lt;/i&gt;", "</i>");
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return filterValue;
	}
	    
}
