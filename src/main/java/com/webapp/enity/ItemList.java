package com.webapp.enity;

import java.util.ArrayList;
import java.util.List;



public class ItemList {

	private List<String> countryList;

	
	public ItemList() {
		countryList=new ArrayList<>();
		AddcountryList();
	}
	
	public void AddcountryList()
	{
		countryList.add("China");
		countryList.add("Singapore");
		countryList.add("Malaysia");
		countryList.add("Korea");
		countryList.add("Egypt");
		countryList.add("Germin");
		countryList.add("Turkey");
		countryList.add("France");
		countryList.add("Italy");
		countryList.add("Japan");
		countryList.add("India");
		countryList.add("Finland");
	}

	public List<String> getCountryList() {
		return countryList;
	}

	public void setCountryList(List<String> countryList) {
		this.countryList = countryList;
	}


	
	
}
