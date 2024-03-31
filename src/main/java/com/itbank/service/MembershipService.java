package com.itbank.service;

import java.io.IOException;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.MembershipComponent;
import com.itbank.model.MembershipDTO;
import com.itbank.repository.MembershipDAO;

@Service
public class MembershipService {

   @Autowired MembershipDAO msDao;
   @Autowired private MembershipComponent membershipComponent;
   
   public void test() throws URISyntaxException, IOException, InterruptedException {
       String token = membershipComponent.getImportToken();
       System.out.println("Access Token: " + token);
   }
   
   // 결제정보 데이터베이스로 넘기기
   public int insertMPay(MembershipDTO mpay, HttpSession session) {
       return msDao.insertMpay(mpay);
   }
   
   // 결제완표 페이지 컨트롤
   public MembershipDTO paymentContent(HttpSession session) {
      return msDao.selectPayment();
   }


	public MembershipDTO getmyMembership(String userid) {
		return msDao.selectPayOne(userid);
	}

	public int deletePaymentInfo(String payNum) {
		return msDao.delete(payNum);
	}



}
