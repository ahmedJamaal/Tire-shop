package com.webapp.enity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="Supplier")
public class Supplier {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="fullname")
	private String fullName;
	
	@Column(name="address")
	private String address;
	
	@Column(name="info")
	private String info;
	
	@Column(name="phone1")
	private String phone1;
	
	@Column(name="phone2")
	private String phone2;
	
	

	public Supplier() {
		
	}



	public Supplier(String fullName, String address, String info, String phone1, String phone2) {
		super();
		this.fullName = fullName;
		this.address = address;
		this.info = info;
		this.phone1 = phone1;
		this.phone2 = phone2;
	}




	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getFullName() {
		return fullName;
	}



	public void setFullName(String fullName) {
		this.fullName = fullName;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
	}



	public String getPhone1() {
		return phone1;
	}



	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}



	public String getPhone2() {
		return phone2;
	}



	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

}
