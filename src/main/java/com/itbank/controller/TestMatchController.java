package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.TestMatchService;


@Controller
@RequestMapping("/testMatch")
public class TestMatchController {

	@Autowired
	private TestMatchService tms; 
	
	
	@GetMapping("/testMatch_main")
	public ModelAndView testMatchMain(HttpSession session) {
		ModelAndView mav = new ModelAndView("/testMatch/testMatch_main");
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		MemberDTO dto = tms.getUserCon(login.getUserid()); 
		mav.addObject("dto", dto); 
		return mav;
	}
	
	@PostMapping("/testMatch_main")
	public ModelAndView testMatchMain(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("/testMatch/testMatch_list");
		List<MemberDTO> list = tms.getMemberList(dto);
		System.out.println(list != null ? "리스트 사이즈는" + list.size() : "리스트 사이즈는 0");
		mav.addObject("list", list);
		return mav;
	}
	
	
}
