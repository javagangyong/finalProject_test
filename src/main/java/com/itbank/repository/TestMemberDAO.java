package com.itbank.repository;

import org.apache.ibatis.annotations.Select;

import com.itbank.model.ProfileDTO;

public interface TestMemberDAO {

	@Select("select * from memberInfo where userid = #{userid}")
	ProfileDTO selectProfile(String userid);

}
