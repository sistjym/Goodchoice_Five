package com.five.goodchoice.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

public class Myutil {

	public static String getDefaultCheckInDate() { // 기본 체크인 날짜(오늘)
			
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String defaultCheckInDate = sdf.format(now.getTime());
		return defaultCheckInDate;
	}// end of public static String getDefaultCheckInDate() -----------------------
	
	
	public static String getDefaultCheckOutDate(){ // 기본 체크아웃 날짜(내일)
		
		Calendar now = Calendar.getInstance();
		now.add(Calendar.DATE, 1); // 내일 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String defaultCheckOutDate = sdf.format(now.getTime());
		return defaultCheckOutDate;
		
	}// end of public static String getDefaultCheckOutDate() -----------------------
	
	
	public static boolean checkIsNull(Object obj) { // Null 인지 판단하는 메소드
		boolean isNull = true;
		
		if(obj != null) {
			isNull = false;
		}
		
		return isNull;
	}// end of public static boolean checkIsNull(Object obj) {} ----------------------

	
	public static boolean checkStringIsEmpty(String str) { // 문자열이 공백인지 확인하는 메소드
		
		boolean isEmpty = true;
		
		String resultStr = deleteSpaceByString(str);
		
		if(!resultStr.isEmpty()) {
			isEmpty = false;
		}
		
		return isEmpty;
		
	}// end of public static boolean checkStringIsEmpty(String str) {} -------------------
	
	public static boolean check_Invalid_String(String str) {
		
		boolean isInvalid = false;
		
		if(checkIsNull(str) || checkStringIsEmpty(str)) {
			isInvalid = true;
		}
		
		return isInvalid;
	}
	
	
	public static String deleteSpaceByString(String str) { // 문자열의 공백을 제거하는 메소드
		
		String resultStr = "";
		char[] charArr = str.toCharArray();
		
		for(int i=0;i<charArr.length;i++) { // 공백 제거를 위한 for 문
			
			if(charArr[i] == ' ') {
				continue;
			}
			
			resultStr += charArr[i];
		}
		
		return resultStr;
	}// end of public static String deleteSpaceByString(String str) -----------
	
}
