/*
 * Created on 2003/06/16
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package jp.co.lastminute.maintenance.Tool.KNT;

import java.util.*;
import java.text.*;

/**
 * @author skondo
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class DateUtil {
	public static final String[] month = new String[12];
	public static final int TODAY = 100;
	public static final Locale DEFAULT_LOCALE =Locale.getDefault();
	public static final Calendar DEFAULT_CALENDAR =
		new GregorianCalendar (DateUtil.DEFAULT_LOCALE);
	static	{
		//for
		for (int i = 0 ; i<12; i++){
			if (i <9){
				month[i]= "0"+String.valueOf(i+1)	 ;
			}else{
			 month[i]= String.valueOf(i+1)	 ;
			}
		}//end of for
	}


	/**
	* Get today with specified format symbol
	* @param instance of format symbol is yyyy-mm-dd
	* @return String of today formatted with format symbol
	*/
	public static String getToday(String formatSymbol)
	{
		Date today = new GregorianCalendar().getTime();
		return dateFormat(today, formatSymbol);
	}

	/**
	 * A methode to get only year
	 * @return this year String
	 */
	public static String getThisYear(){
		return String.valueOf(DateUtil.DEFAULT_CALENDAR.get(Calendar.YEAR));
	}

	/**
	 * A methode to get only arabic month
	 * @return this year String
	 */
	public static String getThisMonth(){
		int monthInt = DateUtil.DEFAULT_CALENDAR.get(Calendar.MONTH);
		return String.valueOf(DateUtil.month[monthInt]);
	}

	/**
	 * A methode to get only arabic month
	 * @return this year String
	 */
	public static String getThisDay(){
		return
			String.valueOf(DateUtil.DEFAULT_CALENDAR.get(Calendar.DAY_OF_MONTH));
	}

	/**
	* Get Date from String.
	* @param dateStr is formated "/", "2001/2/10'
	* @return Date object
	*/
	public static Date parseStrToDate(String dateStr){
		DateFormat df = DateFormat.getDateInstance();
		Date d = null;

		try{
			d = df.parse(dateStr);
		}catch(ParseException e){
			String msg = "The parameter need to format 'yyyy/mm/dd' as '2001/10/10'";
			//throw new DateUtilException(msg,e);
			d = null;
		}


		return d;
	}

	/**
	 * value format must be yyyyMMdd.
	 * ex)2002/08/08 , 2002-08-08 ...
	 */
	public static Date parseStrToDate(String value, String delim)
		throws Exception{
		StringTokenizer st = new StringTokenizer(value, delim);
		StringBuffer digitSB = new StringBuffer();
		digitSB.append((String)st.nextToken());
		digitSB.append((String)st.nextToken());
		digitSB.append((String)st.nextToken());

		return parseDigitToDate(digitSB.toString());
	}

	/**
	 * dateDigiString must be formatted yyyyMMdd
	 * ex)20020808
	 */
	public static Date parseDigitToDate(String dateDigitString)
		throws Exception{

		GregorianCalendar newDate =
				new GregorianCalendar(
					Integer.parseInt(dateDigitString.substring(0,4)),
					Integer.parseInt(dateDigitString.substring(4,6))-1,
					Integer.parseInt(dateDigitString.substring(6,8)));
		return newDate.getTime();
	}

	/**
	 * digitDate must be formatted yyyyMMdd
	 * ex)20020808
	 */
	public static Date parseDigitToDate(int digitDate)
		throws Exception{
		return parseDigitToDate(String.valueOf(digitDate));
	}

	/**
	 * The class which return String formated with specified format
	 * @param paramDate is Date object which you want to convert to String
	 * @param instance of formatType is 'yyyy/MM/dd'
	 * @return formated String
	 */
	public static String dateFormat(Date paramDate, String formatType){
		String dateString = "";
		SimpleDateFormat formatter
			= new SimpleDateFormat (formatType);
		dateString = formatter.format(paramDate);
		return dateString;
	}

	/**
	 * Return day of The week
	 * If Locale is null then use default Locale.
	 * if dayNum is DateUtil.TODAY then return today.
	 *<blockquote><pre>
	 *  System.out.println(DateUtil.DayOfTheWeek(null,DateUtil.TODAY));
	 *  Locale l = new Locale("ja","JAPAN");
	 *  System.out.println(DateUtil.DayOfTheWeek(l,DateUtil.TODAY));
	 * </prea></blockquote>
	 * @param locale
	 * @param dayNum  0 : Sunday ~ 6 : Saturday
	 * @return DayOfTheWeek
	 */
	public static String DayOfTheWeek(Locale locale, int dayNum){
		if(locale == null){
			locale = Locale.getDefault();
		}
			
		String weekdays[] = DateUtil.DaysOfTheWeek(locale);
		Calendar c = Calendar.getInstance(locale);
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);

		if(dayNum == DateUtil.TODAY)
		   return weekdays[dayOfWeek];
		else
		   return weekdays[dayNum];
	}

	/**
	 * Return days of The week
	 * If Locale is null then use default Locale.
	 *<blockquote><pre>
	 *  System.out.println(DateUtil.DaysOfTheWeek(null));
	 *  Locale l = new Locale("ja","JAPAN");
	 *  System.out.println(DateUtil.DayOfTheWeek(l));
	 * </prea></blockquote>
	 * @param locale
	 * @return a array of DayOfTheWeek
	 */
	public static String[] DaysOfTheWeek(Locale locale){
		if(locale == null){
			locale = Locale.getDefault();
		}
		DateFormatSymbols dfs = new DateFormatSymbols(locale);
		return dfs.getWeekdays();
	}

	/**
	 * Return new date object calculate with parameter and vlaue from today
	 *<blockquote><pre>
	 * </prea></blockquote>
	 * @param field is Calendar.YEAR, Calendar.MONTH or Calendar.Date
	 * @param value to calculate if you want to minus from today you can user
	 * nagative value
	 * @return new Date object calculated
	 */
	public static Date calculate(int field, int value){
		GregorianCalendar mortgage = new GregorianCalendar();
		mortgage.add(field,value);
		Date calculatedDate = mortgage.getTime();
		return calculatedDate;
	}

	/**
	* A method to get today formatted by yyyymmdd
	* @return
	*/
	public static String getYYYYMMDD(){
		String dateString = "";
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMddHHmmss");
		dateString = formatter.format(new Date());
		return dateString.substring(0,8);
	}

	/**
	* A method to get this time formatted by yyyymmdd
	* @return
	*/
	public static String getHHMMSS(){
		String dateString = "";
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMddHHmmss");
		dateString = formatter.format(new Date());
		return dateString.substring(8,dateString.length());
	}

}
