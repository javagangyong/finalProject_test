package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MessageDTO;
import com.itbank.repository.MatchDAO;

@Service
public class MatchService {

	@Autowired
	private MatchDAO dao;

	public MemberDTO getMyInfo(String userid) {
		return dao.getMyDetail(userid);
	}

	public List<MemberDTO> getMatchList(MemberDTO dto) {
		List<MemberDTO> list = dao.selectMatchList(dto);
		list.removeIf(e -> dao.getMatchingCount(e.getUserid()) >= 5);
		return list;
	}

	public MemberDTO getUserInfo(String userid) {
		return dao.selectGetUserInfo(userid);
	}

	public List<MatchDTO> selectMatches(String userid) {
		return dao.selectMatches(userid);
	}

	public int disconnect(MatchDTO dto) {
		return dao.disconnect(dto);
	}

	public int getMatched(MatchDTO dto) {
		return dao.getMatched(dto);
	}

	public int insertMatch(MatchDTO dto) {
		int num = dao.matchtTryUpdate(dto);
		System.out.println(num != 0 ? "매칭시도 후 매치카운트 -1 완료" : "매칭 시도 후 매치카운트 수정 실패");
		return dao.insertMatch(dto);
	}

	public int refuseUpdate(String reqUser, String respUser) {
		MatchDTO dto = new MatchDTO();
		dto.setReqUser(reqUser);
		dto.setRespUser(respUser);
//		System.out.println("matchService에서 요청은" + dto.getReqUser());
		return dao.refuseUpdate(dto);
	}

	public int matchCount(String reqUser, String respUser) {
		MatchDTO dto = new MatchDTO();
		dto.setReqUser(reqUser);
		dto.setRespUser(respUser);
		return dao.matchCount(dto);
	}

	public int consentUpdate(String reqUser, String respUser) {
		MatchDTO dto = new MatchDTO();
		dto.setReqUser(reqUser);
		dto.setRespUser(respUser);
		int num = dao.consentMatchCountUpdate(dto);
		System.out.println(num != 0 ? "수락 후 매치카운트 -1" : "수락 후 매치카운트 변동없음");
		return dao.consentUpdate(dto);
	}

	public int getWaitingMatchCount(String userid) {
		return dao.getWaitingMatchCount(userid);
	}

	public int getCurrentMatching(String userid) {
		return dao.getMatchingCount(userid);
	}
}
