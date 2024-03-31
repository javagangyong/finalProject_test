package com.itbank.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.MembershipDTO;

@Repository
public interface MembershipDAO {

   
//   IDX        NOT NULL NUMBER        
//   USERID     NOT NULL VARCHAR2(100) 
//   TYPE                VARCHAR2(50)  
//   JOINDATE            DATE          
//   PAYNUM     NOT NULL NUMBER        
//   PAYMETHOD  NOT NULL VARCHAR2(50)  
//   PRICE      NOT NULL NUMBER        
//   MATCHCOUNT NOT NULL NUMBER 
   
   // 결제 정보를 저장하는 메소드
   @Insert("insert into membership (payNum, type, userid, payMethod, price, matchCount)"
         + " values (#{payNum}, #{type}, #{userid}, #{payMethod}, #{price}, #{matchCount})") 
   int insertMpay(MembershipDTO mpay);

   // 사용자의 결제 정보를 가져오는 메소드
   @Select("select * from membership where payNum = #{payNum}")
   MembershipDTO selectPayment();

   @Select("select * from membership where userid = #{userid}")
   MembershipDTO selectPayOne(String userid);
   
   @Delete("delete from membership where payNum = #{payNum}")
   int delete(String payNum);
   
   @Select("SELECT DISTINCT m.* FROM membership m JOIN member mb ON m.userid = #{userid} WHERE m.userid = #{userid}")
   MembershipDTO getMembershipInfo(String userid);


}