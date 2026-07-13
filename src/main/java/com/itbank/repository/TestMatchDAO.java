package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.MatchDTO;
import com.itbank.model.MemberDTO;

@Repository
public interface TestMatchDAO {

	@Select("select * from member_con where userid = #{userid}")
	MemberDTO selectUserCon(String userid);

	@Select("select mc.* from member_con mc "
			+ "join membership ms "
			+ "on ms.userid = mc.userid "
			+ "where "
			+ "	("
			+ "	 	(#{gender} = '남성' and mc.gender = '여성') "
			+ "	or	(#{gender} = '여성' and mc.gender = '남성') "
			+ "	)"
			+ " and grade = #{grade} "
			+ " order by dbms_random.value")
	List<MemberDTO> selectMemberList(MemberDTO dto);

	@Insert("insert into matching(reqUser, respUser) "
			+ " values(#{reqUser}, #{respUser})")
	int insertTestMatch(MatchDTO dto);

	@Update("update matching set matched = 1 "
			+ "where ((reqUser = #{reqUser} and respUser = #{respUser}) "
			+ "or (reqUser = #{respUser} and respUser = #{reqUser})) and matched = 0")
	int updateConsent(MatchDTO dto);

	@Update("update matching set matched = 2 "
			+ "where ((reqUser = #{reqUser} and respUser = #{respUser}) "
			+ "or (reqUser = #{respUser} and respUser = #{reqUser})) "
			+ "and matched = 0")
	int updateRefuse(MatchDTO dto);


}
