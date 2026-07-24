package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MemberDTO;
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
	
	@PostMapping("/infoModify")
	public String infoModify(@RequestBody MemberDTO dto) {
		int row = tms.updateInfo(dto);
		if(row == 1) {
			return "정보 수정 완료. 다시 로그인 해주세요.";
		}
		return "정보 수정 실패. 관리자에 문의하세요.";
	}
	
	@PostMapping("/pwModify")
	public String pwModify(@RequestBody MemberDTO dto) {
		int row = tms.updatePw(dto);
		return row != 1 ? "비밀번호 변경 실패. 관리자에 문의하세요." : "비밀번호 변경. 다시 로그인 해주세요.";
	}

}
