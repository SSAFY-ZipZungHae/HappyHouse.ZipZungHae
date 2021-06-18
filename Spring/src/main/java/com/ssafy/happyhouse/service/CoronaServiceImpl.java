package com.ssafy.happyhouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.CoronaMapper;
import com.ssafy.happyhouse.model.CoronaDto;

@Service
public class CoronaServiceImpl implements CoronaService{
	
private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CoronaDto> CoronaSearch(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("gungutext", map.get("gungutext") == null ? "" : map.get("gungutext"));
		param.put("gunguarea", "gungu");
		
		System.out.println(map.get("gungutext"));
		System.out.println(map.get("gunguarea"));
		return sqlSession.getMapper(CoronaMapper.class).coronaSearch(map);

	}

}
