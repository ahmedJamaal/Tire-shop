package com.webapp.enity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="Tires")
public class Tires {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="deminsion")
	private String deminsion;
	
	@Column(name="production_country")
	private String productionCountry;
	
	@Column(name="production_date")
	private String productionDate;
	
	@Column(name="quatity")
	private int quatity;
	
	@Column(name="price")
	private int price;
	
	
	public Tires() {
		
	}


	public Tires(String name, String deminsion, String productionCountry, String productionDate, int quatity, int price) {
		super();
		this.name = name;
		this.deminsion = deminsion;
		this.productionCountry = productionCountry;
		this.productionDate = productionDate;
		this.quatity = quatity;
		this.price = price;
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDeminsion() {
		return deminsion;
	}


	public void setDeminsion(String deminsion) {
		this.deminsion = deminsion;
	}


	public String getProductionCountry() {
		return productionCountry;
	}


	public void setProductionCountry(String productionCountry) {
		this.productionCountry = productionCountry;
	}
	
	public int getQuatity() {
		return quatity;
	}


	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getProductionDate() {
		return productionDate;
	}


	public void setProductionDate(String productionDate) {
		this.productionDate = productionDate;
	}

	
	
}
