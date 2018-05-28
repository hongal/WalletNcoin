package com.geopia.wallet_ncoin.util;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class NcoinDateUtil {

	@SuppressWarnings("rawtypes")
	public static boolean isEmpty(Object obj) {
		if (obj == null)
			return true;
		if (obj instanceof String)
			return obj.toString().trim().length() == 0;
		else if (obj instanceof List)
			return ((List) obj).isEmpty();
		else if (obj instanceof Map)
			return ((Map) obj).isEmpty();
		else if (obj instanceof Object[])
			return Array.getLength(obj) == 0;
		else return null == obj;
	}
	
	public static boolean isNotEmpty(Object obj) {
		return !isEmpty(obj);
	}
	
	/**
	 * Date를 yyyyMMddHHmmss로 리턴
	 * @param now Date객체. null이면 현재 시간.
	 * @return
	 */
	public static String getFullTime(Date now) {
		Date date = now;
		if (date == null)
			date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(date);
	}
	
	/**
	 * 한달 후 날짜 구하기
	 * @param now
	 * @param format
	 * @return
	 */
	public static String getAddMonth(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, +1);
		return sdf.format(cal.getTime());
	}
	
	/**
	 * Date를 yyyyMMdd로 리턴
	 * @param now Date객체. null이면 현재 시간.
	 * @return
	 */
	public static String getDateString(Date now) {
		Date date = now;
		if (date == null)
			date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(date);
	}
	
}
