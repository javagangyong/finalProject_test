package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.ChatService;
import com.itbank.service.MatchService;

@Controller
@RequestMapping("/match")
public class MatchController {

	@Autowired
	private MatchService ms;
	@Autowired
	private ChatService cs;

	@GetMapping("/match_main")
	public ModelAndView matchMain(HttpSession session) {
		ModelAndView mav = new ModelAndView("/match/match_main");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		MemberDTO dto = ms.getMyInfo(login.getUserid());
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/match_main")
	public ModelAndView matchMain(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("/match/match_list");
		List<MemberDTO> list = ms.getMatchList(dto);
		mav.addObject("list", list);
		return mav;
	}

	@GetMapping("/mymatch")
	public ModelAndView mymatch(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		List<MatchDTO> list = ms.selectMatches(login.getUserid());
		mav.addObject("list", list);

		return mav;
	}

	@GetMapping("/accept")
	public String accept(String reqUser, HttpSession session, RedirectAttributes rttr) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String respUser = login.getUserid();
		int row = ms.consentUpdate(reqUser, respUser);
		rttr.addFlashAttribute("matching", "matching");
		return "redirect:/match/mymatch";
	}
	
	@GetMapping("/deny")
	public String deny(String reqUser, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String respUser = login.getUserid();
		int row = ms.refuseUpdate(reqUser, respUser);
		return "redirect:/match/mymatch";
	}
}
