package com.itbank.exception;

public class CannotMatchException extends Exception {
	private static final long serialVersionUID = 1L;

	public CannotMatchException(String message) {
		super(message);
	}
}
