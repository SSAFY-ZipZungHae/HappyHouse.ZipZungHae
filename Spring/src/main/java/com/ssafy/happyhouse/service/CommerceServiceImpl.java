package com.ssafy.happyhouse.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.AptMapper;
import com.ssafy.happyhouse.mapper.CoronaMapper;
import com.ssafy.happyhouse.mapper.EtcMapper;
import com.ssafy.happyhouse.model.CommerceDto;
import com.ssafy.happyhouse.model.CoronaDto;
import com.ssafy.happyhouse.model.EnvDto;


@Service
public class CommerceServiceImpl implements CommerceService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CommerceDto> commerceSearch(Map<String, String> map) {
		return sqlSession.getMapper(EtcMapper.class).commerceSearch(map);
	}

//	@Override
//	public List<EnvDto> envSearch(Map<String, String> map) {
//		return sqlSession.getMapper(EtcMapper.class).envSearch(map);
//	}
	@Override
	public List<EnvDto> envSearch(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("gungutext", map.get("gungutext") == null ? "" : map.get("gungutext"));
		param.put("gunguarea", "gungu");
		
		System.out.println(map.get("gungutext"));
		System.out.println(map.get("gunguarea"));
		return sqlSession.getMapper(EtcMapper.class).envSearch(map);

	}

	@Override
	public List<Map> clicksearch(String dong) {
		return sqlSession.getMapper(AptMapper.class).clicksearch(dong);
		
	}

	@Override
	public Map<String, String> findcomm(Map<String, String> map) {
		return sqlSession.getMapper(EtcMapper.class).findcomm(map);

	}

	@Override
	public List<CommerceDto> listcommerce(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("comm", map.get("comm") == null ? "" : map.get("comm"));
//		int currentPage = Integer.parseInt(map.get("pg"));
//		int sizePerPage = Integer.parseInt(map.get("spp"));
//		int start = (currentPage - 1) * sizePerPage;
//		param.put("start", start);
//		param.put("spp", sizePerPage);
		return sqlSession.getMapper(EtcMapper.class).listcommerce(param);
	
	}

}
