package com.itbank.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.itbank.model.MemberDTO;
import com.itbank.model.MembershipDTO;
import com.itbank.repository.MembershipDAO;

public class MembershipInterceptor implements HandlerInterceptor{
	
	@Autowired MembershipDAO dao;
	
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		 	HttpSession session = request.getSession();
		    String url = request.getRequestURI();
		    String cpath = request.getContextPath();
		 	MemberDTO login = (MemberDTO) session.getAttribute("login");
		 
		 	String userid = login.getUserid();

	        // DAO를 사용하여 해당 사용자 정보 조회
	        MembershipDTO membership = dao.getMembershipInfo(userid);

	        // 사용자 정보가 없다면 접근 거부
	        if ((url.contains(cpath + "/membership/myMembership/") && membership == null) || membership == null) {
	        	 String path = "/WEB-INF/views/manageAlert.jsp";
	             RequestDispatcher rd = request.getRequestDispatcher(path);
	             request.setAttribute("msg", "멤버십 전용 입니다.");
	             request.setAttribute("url", "/");
	             rd.forward(request, response);
	        	return false;
	      
	        } else {
	        	return true;
	        }
	 }
}
