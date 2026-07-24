package com.itbank.repository;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itbank.model.MemberDTO;
import com.itbank.model.ProfileDTO;

public interface TestMemberDAO {

	@Select("select * from memberInfo where userid = #{userid}")
	ProfileDTO selectProfile(String userid);

	@Update("update member set "
			+ "username = #{username}, gender = #{gender}, birthYear = #{birthYear}, "
			+ "birthMonth = #{birthMonth}, birthDay = #{birthDay}, phoneNumber = #{phoneNumber} "
			+ "where userid = #{userid}")
	int updateInfo(MemberDTO dto);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Update("update member set user")
	int updatePw(MemberDTO dto);

}
