package com.itbank.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.TestMatchService;

@RestController
@RequestMapping("/testMatchAjax")
public class TestMatchAjaxController {

	@Autowired TestMatchService tms;
	
	@GetMapping("/userInfo/{userid}")
	public MemberDTO userInfo(@PathVariable("userid") String userid) {
		MemberDTO dto = tms.getUserCon(userid);
		return dto;
	}
	
	@PostMapping("/testTryMatch")
	public HashMap<String, Object> testTryMatch(@RequestBody MatchDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("reqUser는 " + dto.getReqUser());
		System.out.println("respUser는 " + dto.getRespUser());
		int row = tms.insertTryMatch(dto);
		map.put("message", row != 0 ? "매칭 시도 완료! 마이매칭을 확인해주세용" : "매칭 시도 오류. 관리자에 문의해주세요");
		return map;
	}
	
	@PostMapping("/testConsent")
	public int testConsent(@RequestBody MatchDTO dto) {
		int row = tms.updateConsent(dto);
		return row;
	}
	
	@PostMapping("/testRefuse")
	public int testRefuse(@RequestBody MatchDTO dto) {
		int row = tms.updateRefuse(dto);
		return row;
	}
	
	
}
