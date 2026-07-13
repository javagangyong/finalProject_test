package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.repository.TestMatchDAO;


@Service
public class TestMatchService {
	
	@Autowired private TestMatchDAO dao;

	public MemberDTO getUserCon(String userid) {
		return dao.selectUserCon(userid);
	}

	public List<MemberDTO> getMemberList(MemberDTO dto) {
		return dao.selectMemberList(dto);
	}

	public int insertTryMatch(MatchDTO dto) {
		return dao.insertTestMatch(dto);
	}

	public int updateConsent(MatchDTO dto) {
		return dao.updateConsent(dto);
	}

	public int updateRefuse(MatchDTO dto) {
		return dao.updateRefuse(dto);
	}

}
