package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ProfileDTO;
import com.itbank.service.TestMemberService;

@RestController
@RequestMapping("/testMemberAjax")
public class TestMemberAjaxController {
	
	@Autowired TestMemberService tms;
	
	@GetMapping("/myProfile/{userid}")
	public ProfileDTO myProfile(@PathVariable String userid) {
		ProfileDTO dto = tms.getMyProfile(userid);
		return dto;
	}

}
