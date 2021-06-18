package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface UserMapper {

public MemberDto login(Map<String, String> map) throws SQLException;
	
//	REST
	public List<MemberDto> userList();
	public MemberDto userInfo(String userid);
	public int userRegister(MemberDto memberDto);
	public int userModify(MemberDto memberDto);
	public int userDelete(String userid);
//	회원정보 수정
	void modifyMember(Map<String, Object> map);
	public List<MemberDto> listUser(Map<String, Object> map) throws SQLException;

	public MemberDto getMember(Map<String, Object> param);

	public MemberDto getMemberbyId(String userId);

	public void deleteMember(String userid);

	public MemberDto lookupmember(String userid);
	public void update(MemberDto memberDto);

	public Map<String, String> findPassword(Map<String, String> map);

}
