package com.itbank.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.component.MailComponent;
import com.itbank.model.ConditionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService ms;

	@Autowired
	private MailComponent mailComponent;

	@GetMapping("/join")
	public void join() {
	}

	@PostMapping("/join")
	public String join(MemberDTO dto, RedirectAttributes rttr) {
		int row = ms.join(dto);
		rttr.addFlashAttribute("userid", dto.getUserid());
		return "redirect:/member/survey";
	}

	@GetMapping("/survey")
	public void survey() {
	}

	@PostMapping("/survey")
	public String survey(ConditionDTO dto) {
		int row = ms.insertCondition(dto);
		return row != 0 ? "redirect:/member/login" : "redirect:/alert";
	}

	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session, String save, HttpServletResponse response) {
		MemberDTO login = ms.selectOne(dto);
		if (login == null) {
			return "redirect:/alert";
		}
		int row = ms.updateLastLogin(login.getUserid());

		java.util.Date utilDate = new java.util.Date();

		// java.util.Date를 java.sql.Date로 변환
		java.sql.Date today = new java.sql.Date(utilDate.getTime());

		login.setLastLoginDate(today);

		if (save != null) {
			Cookie cookie = new Cookie("save", dto.getUserid());
			cookie.setMaxAge(604800);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		session.setAttribute("login", login);
		session.setAttribute("dologin", 1);
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response, String mypage) {
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("save")) {
					c.setMaxAge(0);
					c.setPath("/");
					response.addCookie(c);
					break;
				}
			}
		}
		return mypage != null ? "redirect:/member/login" : "redirect:/";
	}

	@GetMapping("/find")
	public void find() {
	}

	@GetMapping("/resetPass")
	public void resetPass() {
	}

	@PostMapping("/resetPass")
	public ModelAndView resetPass(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		String pass = ms.resetPass(dto);
		mav.addObject("msg", "변경된 비밀번호는 [" + pass + "] 입니다.");
		mav.addObject("url", pass != null ? "/member/login" : "");
		return mav;
	}

	@GetMapping("/mypage")
	public void mypage() {
	}

	@GetMapping("/mpmodify")
	public void mpmodify() {
	}

	@GetMapping("/withdrawMember/{idx}")
	public ModelAndView withdrawMember(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/withdrawMember");
		MemberDTO dto = ms.memberOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/withdrawMember/{idx}")
	public String withdrawMemberPost(MemberDTO dto) {
		int row = ms.memberDelete(dto);
		System.out.println(row != 0 ? "삭제 성공" : "삭제 실패");
		return "redirect:/member/logout";
	}

	@PostMapping("/findID")
	@ResponseBody
	public String findID(@RequestBody MemberDTO dto) {
		String userId = ms.findID(dto);
		System.out.println(userId);
		if (userId != null) {
			// 아이디가 존재하는 경우 해당 이메일 주소로 아이디 발송
			sendIdToEmail(dto.getEmail(), userId); // 이메일 발송
			return userId;
		} else {
			return "not_found";
		}
	}

	private void sendIdToEmail(String email, String userId) {
		try {
			// 이메일 발송 코드 추가
			// 메일 컴포넌트를 사용하여 아이디를 이메일로 발송
			// email 매개변수로 받은 이메일 주소로 아이디를 발송
			// userId 매개변수로 받은 아이디를 해당 이메일 주소로 발송
			mailComponent.sendIdToEmail(email, userId);
		} catch (Exception e) {
			// 예외가 발생한 경우 적절한 처리를 수행합니다.
			throw new RuntimeException("이메일 발송 중 오류가 발생했습니다: " + e.getMessage());
		}
	}

	@PostMapping("/findPW")
	@ResponseBody
	public String findPW(@RequestBody MemberDTO dto) {
		String result = ms.resetPassword(dto);
		if (result != null) {
			ms.sendTemporaryPasswordByEmail(dto.getEmail(), result); // 이메일로 임시 비밀번호 전송
		}
		return result != null ? "success" : "fail"; // 성공 여부 반환
	}

}
