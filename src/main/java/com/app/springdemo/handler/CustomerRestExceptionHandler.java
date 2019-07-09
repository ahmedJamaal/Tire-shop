package com.app.springdemo.handler;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CustomerRestExceptionHandler {

	//exption handler when studnetID <5
	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException(CustomerNotFoundException exc) {
		//create student error response
		CustomerErrorResponse error = new CustomerErrorResponse(HttpStatus.NOT_FOUND.value(),
				exc.getMessage(),System.currentTimeMillis());
		
		//set error type
		/*error.setStatus(HttpStatus.NOT_FOUND.value());
		error.setMassage(exc.getMessage());
		error.setTimestamp(System.currentTimeMillis());
		*/
		return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
	 }
	/// handle all exptions
	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException(Exception exc) {
		
		CustomerErrorResponse error = new CustomerErrorResponse();
		
		error.setStatus(HttpStatus.BAD_REQUEST.value());
		error.setMassage(exc.getMessage());
		error.setTimestamp(System.currentTimeMillis());
		
		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}
}
