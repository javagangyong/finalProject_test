package com.itbank.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class MatchExceptionHandler {

	@ExceptionHandler(CannotMatchException.class)
	public ModelAndView accessDeny(CannotMatchException e) {
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", e.getMessage());
		mav.addObject("url", "/");
		return mav;
	}
}
