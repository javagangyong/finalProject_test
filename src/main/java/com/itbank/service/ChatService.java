package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ChatDTO;
import com.itbank.model.MatchDTO;
import com.itbank.model.MessageDTO;
import com.itbank.repository.ChatDAO;

@Service
public class ChatService {
	
	@Autowired private ChatDAO dao;

	public int record(MessageDTO message) {
		return dao.record(message);
	}

	public List<ChatDTO> selectChats(MatchDTO dto) {
		return dao.selectChats(dto);
	}

	public int deleteChats(MatchDTO dto) {
		return dao.deleteChats(dto);
	}
}
