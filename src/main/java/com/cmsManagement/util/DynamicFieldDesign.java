package com.cmsManagement.util;

public class DynamicFieldDesign {

	public static String dynamicText(String[] content) {
		String field_content="";
		field_content=content[0];
		return field_content;
	}
	
	public static String dynamicMultilineText(String[] content) {
		String field_content="";
		for(String s:content){			
			field_content=field_content+"<p>"+s+"</p>";		
		}
		return field_content;
	}
	
	public static String dynamicBulletineContentText(String content) {
		String field_content="";
		field_content="<ul>"+content+"</ul>";
		return field_content;
	}
	
	public static String dynamicBulletineContentText(String[] content,String header) {
		String field_content="";
		String function_content_point="";
		for(int j=0;j<content.length;j++){	
			field_content=field_content+"<li>"+content[j]+"</li>";
		}
		field_content=field_content+"<li>"+header+"<ul>"+function_content_point+"</ul></li>";						
		return field_content;
	}
}
