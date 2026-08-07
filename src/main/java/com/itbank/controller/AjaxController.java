package com.itbank.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.MailComponent;
import com.itbank.model.ConditionDTO;
import com.itbank.model.ProfileDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@RestController
public class AjaxController {

	public Random ran = new Random();

	@Autowired
	private MemberService ms;

	@Autowired
	private MailComponent mc;

	@GetMapping("duplicateCheck")
	public String duplicateCheck(String userid) {
		int count = ms.check(userid);
		return String.valueOf(count);
	}

	@PostMapping("/ajax/sendMail")
	public int sendMail(@RequestBody HashMap<String, String> param, HttpSession session) {

		int num = ran.nextInt(999999);
		String authNumber = String.format("%06d", num);

		session.setAttribute("authNumber", authNumber);
		session.setMaxInactiveInterval(300); 

		param.put("subject", "[듀세요] 회원가입 인증번호");
		param.put("content", authNumber);

		int row = mc.sendMimeMessage(param);
		return row;
	}

	@GetMapping("/ajax/authNumber/{inputNumber}")
	public int authNumber(@PathVariable("inputNumber") String inputNumber, HttpSession session) {
		String authNumber = (String) session.getAttribute("authNumber");
		int row = 0;
		if (inputNumber.equals(authNumber)) {
			row = 1;
		}
		return row;
	}
	
	@GetMapping("/ajax/myprofile")
	public HashMap<String, Object> myProfile(@RequestParam String userid){
		System.out.println(userid);
		ProfileDTO dto = ms.selectProfile(userid);
		HashMap<String, Object> map = new HashMap<>();
		map.put("dto", dto);
//		System.out.println(dto.getGrade());
//		System.out.println(dto.getProfile());
//		System.out.println(dto.getJoinDate());
//		System.out.println(dto.getLastLoginDate());
		return map;
	}

	@GetMapping(value = "/member/spec", produces = "application/json; charset=utf-8")
	public HashMap<String, Object> selectSpec(@RequestParam String userid) {
		System.out.println(userid);
		ConditionDTO dto = ms.selectCondition(userid);
		HashMap<String, Object> map = new HashMap<>();
		String profile = dto.getProfile();
		map.put("dto", dto);
		map.put("profile", profile);
		return map;
	}

	   @PostMapping("/ajax/mpmodify")
	   public HashMap<String, Object> mypageModify(@RequestBody MemberDTO dto) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      System.out.println(dto);
	      System.out.println(dto.getUsername());
	      System.out.println(dto.getGender());
	      int row = ms.mpModify(dto);
	      map.put("message", row == 0 ? "수정 실패하였습니다." : "수정 완료되었습니다. 로그인 페이지로 이동합니다.");
	      return map;
	   }

      @PostMapping("/ajax/newPw")
      public HashMap<String, Object> newPwModify(@RequestBody MemberDTO dto) {
         HashMap<String, Object> map = new HashMap<String, Object>();
         System.out.println(dto);
         System.out.println(dto.getUserid());
         int row = ms.newPw(dto);
         map.put("message", row == 0 ? "비밀번호 변경 실패하였습니다." : "비밀번호 수정 완료되었습니다. 다시 로그인 해주십시오.");
         return map;
      }
	
//	@RequestMapping(value = "/member/spec", method= {RequestMethod.POST})
	   @PostMapping("/member/spec")
	   public int conditionModify(ConditionDTO dto, @RequestParam String grade) {
	      System.out.println(dto);
	      System.out.println(dto.getEducation());
	      System.out.println(dto.getEstate());
	      System.out.println(dto.getHeight());
	      System.out.println(dto.getIntroduce());
	      System.out.println(dto.getMarriedCount());
	      System.out.println(dto.getOwncar());
	      System.out.println(dto.getProfile());
	      System.out.println(dto.getReligion());
	      System.out.println(dto.getResidence());
	      System.out.println(dto.getSalary());
	      System.out.println(dto.getGrade());
	      
	      dto.setGrade(grade);
	      
	      int row = ms.conditionModify(dto);
	      System.out.println(row != 0 ? "수정 성공" : "수정 실패");
	      return row;
	   }
	   
}
