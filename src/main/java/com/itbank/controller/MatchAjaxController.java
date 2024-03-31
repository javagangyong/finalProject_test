package com.itbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MembershipDTO;
import com.itbank.service.ChatService;
import com.itbank.service.MatchService;
import com.itbank.service.MembershipService;

@RestController
@RequestMapping("/matchAjax")
public class MatchAjaxController {

	@Autowired
	private MatchService ms;
	@Autowired
	private MembershipService membershipService;
	@Autowired 
	private ChatService cs;

	@GetMapping("/userInfo/{userid}")
	public MemberDTO userInfo(@PathVariable("userid") String userid) {
		MemberDTO dto = ms.getUserInfo(userid);
		return dto;
	}

	@PostMapping("/disconnect")
	public int disconnect(@RequestBody MatchDTO dto) {
		int row = ms.disconnect(dto);
		int deleted = cs.deleteChats(dto);
		return row;
	}

	@GetMapping("/matchList/{userid}")
	public List<MatchDTO> matchList(@PathVariable("userid") String userid) {
		List<MatchDTO> list = ms.selectMatches(userid);
		if (list == null) {
			return new ArrayList<MatchDTO>();
		}
		list.removeIf(dto -> dto.getMatched() != 1);
		return list;
	}

	@PostMapping("/tryMatch")
	public HashMap<String, Object> tryMatch(@RequestBody MatchDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
//		System.out.println("requestId 는 " + dto.getReqUser() + "responseId 는 " + dto.getRespUser());
		int row = ms.insertMatch(dto);
		map.put("message", row == 0 ? "매칭 실패 오류." : "상대방에게 알림을 보냈어요 ! 마이 매칭을 확인하세요 :)");
		return map;
	}

	@GetMapping("/refuse")
	public int refuse(@RequestParam String reqUser, @RequestParam String respUser) {
		int row = ms.refuseUpdate(reqUser, respUser);
		return row;
	}

	@GetMapping("/matchCount")
	public int matchCount(@RequestParam String reqUser, @RequestParam String respUser) {
		System.out.println("reqUser는" + reqUser + " respUser는" + respUser);
		int row = ms.matchCount(reqUser, respUser);
		return row;
	}

	@GetMapping("/consent")
	public int consent(@RequestParam String reqUser, @RequestParam String respUser) {
		int row = ms.consentUpdate(reqUser, respUser);
		return row;
	}

	@GetMapping("/waiting")
	public int waiting(String userid) {
		int waitMatches = ms.getWaitingMatchCount(userid);
		return waitMatches;
	}
	
	@GetMapping("/membershipCount")
	public MembershipDTO matchCount(String userid) {
		MembershipDTO dto = membershipService.getmyMembership(userid);
		return dto;
	}
	
}
