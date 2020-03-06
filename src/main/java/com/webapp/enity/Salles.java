package com.webapp.enity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table (name="Salles")
public class Salles {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="customer_car")
	private String customerCar;
	
	@Column(name="product_name")
	private String productName;
	
	@Temporal(TemporalType.DATE)
	@Column(name="date")
	private Date date;
	
	@Column(name="product_id")
	private int productId;
	
	@Column(name="type")
	private String type;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="price")
	private int price;
	
	public Salles() {
		date=new Date();
	
	   
	}

	public Salles(String customerCar, String productName, Date date, int productId, String type, int quantity,
			int price) {
		super();
		this.customerCar = customerCar;
		this.productName = productName;
		this.date = date;
		this.productId = productId;
		this.type = type;
		this.quantity = quantity;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomerCar() {
		return customerCar;
	}

	public void setCustomerCar(String customerCar) {
		this.customerCar = customerCar;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Salles [id=" + id + ", customerCar=" + customerCar + ", productName=" + productName + ", date=" + date
				+ ", productId=" + productId + ", type=" + type + ", quantity=" + quantity + ", price=" + price + "]";
	}
	
	

}
