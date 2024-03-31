package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.model.MemberDTO;
import com.itbank.service.MatchService;
import com.itbank.service.MemberService;

@Controller
public class HomeController {

	@Autowired private MemberService ms;
	@Autowired private MatchService mts;
	
	@RequestMapping("/")
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView("home");
		Integer dologin = (Integer) session.getAttribute("dologin");
		if(dologin != null) {			
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			int count = mts.getWaitingMatchCount(login.getUserid());
			if(count != 0) {
				mav.addObject("wait_count", count);
			}
			session.removeAttribute("dologin");
		}
		String gender = "남성";
		List<String> menProfiles = ms.getProfiles(gender);
		gender = "여성";
		List<String> womenProfiles = ms.getProfiles(gender);
		mav.addObject("mProfiles", menProfiles);
		mav.addObject("wProfiles", womenProfiles);
		return mav;
	}
	
	@GetMapping("/alert")
	public String alert() {
		return "alert";
	}
}
