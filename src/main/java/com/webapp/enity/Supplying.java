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
@Table (name="Supplying")
public class Supplying {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="product_id")
	private int productId;
	
	@Column(name="product_name")
	private String name;
	
	@Column(name="product_type")
	private String type;
	
	@Temporal(TemporalType.DATE)
	@Column(name="date")
	private Date date;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="quantity_before")
	private int quantity_Before;

	public Supplying() {
		date=new Date();
	}

	public Supplying(int product_Id, String name, String type, Date date, int quantity, int quantity_Before) {
		super();
		this.productId = product_Id;
		this.name = name;
		this.type = type;
		this.date = date;
		this.quantity = quantity;
		this.quantity_Before = quantity_Before;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getQuantity_Before() {
		return quantity_Before;
	}

	public void setQuantity_Before(int quantity_Before) {
		this.quantity_Before = quantity_Before;
	}

	@Override
	public String toString() {
		return "Supplying [id=" + id + ", product_Id=" + productId + ", name=" + name + ", type=" + type + ", date="
				+ date + ", quantity=" + quantity + ", quantity_Before=" + quantity_Before + "]";
	}
	
	
}
