package com.webapp.utils;

import java.sql.Date;
import java.time.LocalDate;


public class CustomDate {

	private int month;
	private int year;
	private int day;
	
	LocalDate toDay;
	
	public CustomDate() {
		toDay = LocalDate.now();
		this.month=toDay.getMonthValue();
		this.year = toDay.getYear();
		this.day = toDay.getDayOfMonth();
	}
	public Date getStartCurrentDate()
	{
		LocalDate now=LocalDate.of(year,month, 1);
		return java.sql.Date.valueOf(now);
	}
	
	public Date getCurrentDate()
	{
		LocalDate now=LocalDate.now();
		return java.sql.Date.valueOf(now);
	}
	
	public Date getStartDate()
	{
		LocalDate now;
		if(month==1)
			now=LocalDate.of(year,12, 1);
		else
			now=LocalDate.of(year,month-1, 1);
		return java.sql.Date.valueOf(now);
		
	}
	
	public Date getEndDate()
	{
		 int daysInMonth ;
		 int mon;
		 if(month==1)
			 mon=12;
		 else
		 mon = month-1;
		    if (mon == 4 || mon == 6 || mon == 9 || mon == 11) {
		        daysInMonth = 30;
		    }
		    else {
		        if (mon == 2) {
		            daysInMonth = (year % 4 == 0) ? 29 : 28;
		        } else {
		            daysInMonth = 31;		         
		        }
		    }
		    LocalDate now=LocalDate.of(year,mon, daysInMonth);
		    return java.sql.Date.valueOf(now);
	}
	public Date getStartYear()
	{
		LocalDate now=LocalDate.of(year,1, 1);
		return java.sql.Date.valueOf(now);
		
	}
	public Date getEndYear()
	{
		LocalDate now=LocalDate.of(year,12, 31);
		return java.sql.Date.valueOf(now);
		
	}
	public String CurrentMonthName()
	{
		LocalDate now=LocalDate.of(year,month, day);
		return now.getMonth().toString();
	}
	
	public String LastMonthName()
	{
		LocalDate now;
		if(month==1)
			 now = LocalDate.of(year-1,12, 28);
		
		else
			 now = LocalDate.of(year,month-1, 28);
		return now.getMonth().toString();
	}
	
	public int getThisYear()
	{
		LocalDate now = LocalDate.now();	
		return now.getYear();
	}
}
