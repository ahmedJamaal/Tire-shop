package com.app.springdemo.handler;

public class CustomerErrorResponse {
	
	private int status;
	private String massage;
	private long timestamp;
	
	
	public CustomerErrorResponse(int status, String massage, long timestamp) {
		super();
		this.status = status;
		this.massage = massage;
		this.timestamp = timestamp;
	}
	public CustomerErrorResponse() {
		super();
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMassage() {
		return massage;
	}
	public void setMassage(String massage) {
		this.massage = massage;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
	
	
	
}
