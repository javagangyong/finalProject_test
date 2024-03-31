package com.itbank.repository;

import java.util.List;

import com.itbank.model.ChatDTO;
import com.itbank.model.MatchDTO;
import com.itbank.model.MessageDTO;

public interface ChatDAO {

	int record(MessageDTO message);

	List<ChatDTO> selectChats(MatchDTO dto);

	int deleteChats(MatchDTO dto);

}
