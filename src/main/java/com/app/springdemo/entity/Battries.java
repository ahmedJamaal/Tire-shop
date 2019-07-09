package com.app.springdemo.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name="battries")
public class Battries {

	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="capacity")
	private String capacity;
	
	@Column(name="production_country")
	private String productionCountry;
	
	@Column(name="warranty_year")
	private String warrantyYear;
	
	@Column(name="production_date")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	private Date productionDate;
	
	@Column(name="product_categoryID")
	private int productcategoryID;
	
	@Column(name="quatity")
	private int quatity;
	
	@Column(name="price")
	private int price;
	

	public Battries() {

	}



	public Battries(String name, String capacity, String productionCountry, String warrantyYear, Date productionDate,
			int productcategoryID, int quatity, int price) {
		super();
		this.name = name;
		this.capacity = capacity;
		this.productionCountry = productionCountry;
		this.warrantyYear = warrantyYear;
		this.productionDate = productionDate;
		this.productcategoryID = productcategoryID;
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


	public String getCapacity() {
		return capacity;
	}


	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}


	public String getProductionCountry() {
		return productionCountry;
	}


	public void setProductionCountry(String productionCountry) {
		this.productionCountry = productionCountry;
	}


	public String getWarrantyYear() {
		return warrantyYear;
	}


	public void setWarrantyYear(String warrantyYear) {
		this.warrantyYear = warrantyYear;
	}


	public Date getProductionDate() {
		return productionDate;
	}


	public void setProductionDate(Date productionDate) {
		this.productionDate = productionDate;
	}


	public int getProductcategoryID() {
		return productcategoryID;
	}


	public void setProductcategoryID(int productcategoryID) {
		this.productcategoryID = productcategoryID;
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



	@Override
	public String toString() {
		return "Battries [id=" + id + ", name=" + name + ", capacity=" + capacity + ", productionCountry="
				+ productionCountry + ", warrantyYear=" + warrantyYear + ", productionDate=" + productionDate
				+ ", productcategoryID=" + productcategoryID + ", quatity=" + quatity + ", price=" + price + "]";
	}

	

}
