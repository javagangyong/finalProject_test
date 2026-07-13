package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MessageDTO;
import com.itbank.service.ChatService;
import com.itbank.service.ManagerService;
import com.itbank.service.MatchService;

@Controller
public class StompController {

	@Autowired
	private MatchService matchservice;
	@Autowired
	private ManagerService ms;
	@Autowired
	private ChatService cs;

	@MessageMapping("/register")
	@SendTo("/broker/admin")
	public MessageDTO register(String userid) {
		MessageDTO dto = new MessageDTO();
		dto.setText(userid + "님의 스펙이 등록되었습니다");
		return dto;
	}

	@MessageMapping("/ping")
	public void ping() {
	}

//	@MessageMapping("/enter")
//	@SendTo("/broker/chat")
//	public String enter() {
//		return "입장이요~";
//	}

	@MessageMapping("/message/{roomName}")
	@SendTo("/broker/chat/{roomName}")
	public MessageDTO sendMessage(MessageDTO message) {
		MatchDTO mat = new MatchDTO();
		mat.setReqUser(message.getUserid());
		mat.setRespUser(message.getTo());
//		int matched = matchservice.getMatched(mat);
//		if (matched == 3) {
//			message.setText("이미 끝난 매칭입니다");
//			return message;
//		}
		MemberDTO dto = ms.getUserDetail(message.getUserid());
		int record = cs.record(message);
		message.setProfile(dto.getProfile());
		return message;
	}

	@MessageMapping("/matchover/{roomName}")
	@SendTo("/broker/chat/{roomName}")
	public MessageDTO matchOver(MessageDTO message) {
		return message;
	}

	@MessageMapping("/tryMatch/{respUser}")
	@SendTo("/broker/{respUser}")
	public MessageDTO tryMatch(MessageDTO dto) {
		dto.setText(dto.getTime() + "님의 대화요청이 있습니다!");
		return dto;
	}

	@MessageMapping("/refuseMessage/{userid}")
	@SendTo("/broker/{userid}")
	public MessageDTO refuseMessage(MessageDTO dto) {
		return dto;
	}
	
	@MessageMapping("/broker/{userid}")
	@SendTo("/broker/{userid}")
	public MessageDTO sendResponse(MessageDTO dto) {
		return dto;
	}
}
