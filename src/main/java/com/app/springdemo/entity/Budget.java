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
@Table (name="budget")
public class Budget {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="type")
	private String type;
	
	@Column(name="value")
	private int value;
	
	@Column(name="total")
	private int total;
	
	@Column(name="total_income")
	private int totalIncome;
	
	@Column(name="total_expences")
	private int totalExpences;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	@Column(name="date")
	private Date date;
	
	public Budget() {
		date=new Date();
		////Calculation(type);
	}

	
	public Budget(String name, String type, int value, int total, int totalIncome, int totalExpences, Date date) {
		super();
		this.name = name;
		this.type = type;
		this.value = value;
		this.total = total;
		this.totalIncome = totalIncome;
		this.totalExpences = totalExpences;
		this.date = date;
	}
	public void Calculation(String type)
	{
		if(type.equals("Income"))
		{
			totalIncome=CalculateTotalIncome();
		}
		else if(type.equals("Expences"))
		{
			totalExpences=CalculateTotalExpencess();
		}
		
		total=totalIncome-totalExpences;
		
	}

	public int CalculateTotalIncome()
	{
		
		return value + totalIncome;
	}
	
	public int CalculateTotalExpencess()
	{
		
		return value + totalExpences;
	}
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(int totalIncome) {
		this.totalIncome = totalIncome;
	}

	public int getTotalExpences() {
		return totalExpences;
	}

	public void setTotalExpences(int totalExpences) {
		this.totalExpences = totalExpences;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}


	public int getValue() {
		return value;
	}


	public void setValue(int value) {
		this.value = value;
	}
	
	

}
