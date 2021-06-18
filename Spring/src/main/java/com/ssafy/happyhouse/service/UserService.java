package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.AptDto;
import com.ssafy.happyhouse.model.MemberDto;

public interface UserService {

	public MemberDto login(Map<String, String> map) throws Exception;

//	REST 
	public List<MemberDto> userList();

	public MemberDto userInfo(String userid);

	public int userRegister(MemberDto memberDto);

	public int userModify(MemberDto memberDto);

	public int userDelete(String userid);

	// 회원정보 수정
	void modifyMember(Map<String, String> map)throws Exception;


	public List<MemberDto> listUser(Map<String, String> map) throws Exception;

	MemberDto getMember(Map<String, String> map);

//	회원탈퇴
	void deleteMember(String userId);


	MemberDto getMemberbyId(String userId);

	public void update(MemberDto memberDto);

	public MemberDto lookupmember(String userid);

	public  Map<String, String> findPassword(Map<String, String> map);
}
		
