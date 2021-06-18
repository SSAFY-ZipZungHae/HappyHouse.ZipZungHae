package com.ssafy.happyhouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.UserMapper;
import com.ssafy.happyhouse.model.MemberDto;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto login(Map<String, String> map) throws Exception {
		if (map.get("userid") == null || map.get("userpwd") == null)
			return null;
		return sqlSession.getMapper(UserMapper.class).login(map);
	}

	@Override
	public List<MemberDto> userList() {
		return sqlSession.getMapper(UserMapper.class).userList();
	}

	@Override
	public MemberDto userInfo(String userid) {
		return sqlSession.getMapper(UserMapper.class).userInfo(userid);
	}

	@Override
	public int userRegister(MemberDto memberDto) {
		return sqlSession.getMapper(UserMapper.class).userRegister(memberDto);
	}

	@Override
	public int userModify(MemberDto memberDto) {
		return sqlSession.getMapper(UserMapper.class).userModify(memberDto);
	}

	@Override
	public int userDelete(String userid) {
		return sqlSession.getMapper(UserMapper.class).userDelete(userid);
	}

	@Override
	public void modifyMember(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userid", map.get("userid"));
		param.put("userpwd", map.get("userpwd"));
		param.put("username", map.get("username"));
		param.put("email", map.get("email"));
		param.put("address", map.get("address"));
		sqlSession.getMapper(UserMapper.class).modifyMember(param);
	}

	@Override
	public List<MemberDto> listUser(Map<String, String> map) throws Exception {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		return sqlSession.getMapper(UserMapper.class).listUser(param);
	}

	@Override
	public MemberDto getMember(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userid", map.get("userid"));
		param.put("username", map.get("username"));
		param.put("userpwd", map.get("userpwd"));
		param.put("email", map.get("email"));
		param.put("address", map.get("address"));
		return sqlSession.getMapper(UserMapper.class).getMember(param);
	}

	@Override
	public MemberDto getMemberbyId(String userId) {
		return sqlSession.getMapper(UserMapper.class).getMemberbyId(userId);
	}

	@Override
	public void deleteMember(String userId) {
		sqlSession.getMapper(UserMapper.class).deleteMember(userId);
	}

	@Override
	public void update(MemberDto memberDto) {
		sqlSession.getMapper(UserMapper.class).update(memberDto);
		
	}

	@Override
	public MemberDto lookupmember(String userid) {
		return sqlSession.getMapper(UserMapper.class).lookupmember(userid);

	}

	@Override
	public Map<String, String> findPassword(Map<String, String> map) {
		return sqlSession.getMapper(UserMapper.class).findPassword(map);

	}

}
