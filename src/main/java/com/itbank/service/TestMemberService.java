package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.model.ProfileDTO;
import com.itbank.repository.TestMemberDAO;

@Service
public class TestMemberService {
	
	@Autowired TestMemberDAO dao;

	public ProfileDTO getMyProfile(String userid) {
		return dao.selectProfile(userid);
	}

	public int updateInfo(MemberDTO dto) {
		return dao.updateInfo(dto);
	}

	public int updatePw(MemberDTO dto) {
		return dao.updatePw(dto);
	}

}
