package com.app.springdemo.entity;

import java.util.Date;

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
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="production_date")
	private Date ProductionDate;
	
	@Column(name="product_categoryID")
	private int productCategoryID;
	
	@Column(name="quatity")
	private int quatity;
	
	@Column(name="price")
	private int price;
	
	
	public Tires() {
		
	}


	public Tires(String name, String deminsion, String productionCountry, Date productionDate, int productCategoryID,
			int quatity, int price) {
		super();
		this.name = name;
		this.deminsion = deminsion;
		this.productionCountry = productionCountry;
		ProductionDate = productionDate;
		this.productCategoryID = productCategoryID;
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


	public Date getProductionDate() {
		return ProductionDate;
	}


	public void setProductionDate(Date productionDate) {
		ProductionDate = productionDate;
	}


	public int getProductCategoryID() {
		return productCategoryID;
	}


	public void setProductCategoryID(int productCategoryID) {
		this.productCategoryID = productCategoryID;
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
		return "Tires [id=" + id + ", name=" + name + ", deminsion=" + deminsion + ", productionCountry="
				+ productionCountry + ", ProductionDate=" + ProductionDate + ", productCategoryID=" + productCategoryID
				+ ", quatity=" + quatity + ", price=" + price + "]";
	}
	
	
}
