package com.inventory.exceptions;

// RuntimeException 보다 구체적인 예외
public class MainControllerException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public MainControllerException() {
		super("MainControllerException occurs!");
	}
	
	public MainControllerException(String message) {
		super(message);
	}
}
