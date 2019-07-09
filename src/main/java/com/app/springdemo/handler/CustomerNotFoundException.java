package com.app.springdemo.handler;

public class CustomerNotFoundException extends RuntimeException{
	
	public CustomerNotFoundException(String message, Throwable cause,boolean enableSuppression,boolean writeableStackTace) {
		super(message, cause,enableSuppression,writeableStackTace);
		
	}
	
	public CustomerNotFoundException(String message, Throwable cause) {
		super(message, cause);
		
	}

	public CustomerNotFoundException(String message) {
		super(message);
		
	}

	public CustomerNotFoundException(Throwable cause) {
		super(cause);
		
	}

	
	
}
