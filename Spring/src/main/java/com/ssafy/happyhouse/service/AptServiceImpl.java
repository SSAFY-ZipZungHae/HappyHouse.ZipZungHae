package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.AptMapper;
import com.ssafy.happyhouse.model.AptDto;

@Service
public class AptServiceImpl implements AptService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AptDto> listApt(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
//		int currentPage = Integer.parseInt(map.get("pg"));
//		int sizePerPage = Integer.parseInt(map.get("spp"));
//		int start = (currentPage - 1) * sizePerPage;
//		param.put("start", start);
//		param.put("spp", sizePerPage);
		return sqlSession.getMapper(AptMapper.class).listApt(param);
	}

	@Override
	public List<AptDto> listAptarea(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dongtext", map.get("dongtext") == null ? "" : map.get("dongtext"));
		param.put("dongarea", "dong");
		// System.out.println(map.get("dongtext"));
		// System.out.println(map.get("dongarea"));
//		int currentPage = Integer.parseInt(map.get("pg"));
//		int sizePerPage = Integer.parseInt(map.get("spp"));
//		int start = (currentPage - 1) * sizePerPage;
//		param.put("start", start);
//		param.put("spp", sizePerPage);
		return sqlSession.getMapper(AptMapper.class).listAptarea(param);
	}

	/**
	 * @Override public PageNavigation makePageNavigation(Map<String, String> map)
	 *           throws Exception { int naviSize = 10; int currentPage =
	 *           Integer.parseInt(map.get("pg")); int sizePerPage =
	 *           Integer.parseInt(map.get("spp")); PageNavigation pageNavigation =
	 *           new PageNavigation(); pageNavigation.setCurrentPage(currentPage);
	 *           pageNavigation.setNaviSize(naviSize); int totalCount =
	 *           sqlSession.getMapper(AptMapper.class).getTotalCount(map);
	 *           pageNavigation.setTotalCount(totalCount); int totalPageCount =
	 *           (totalCount - 1) / sizePerPage + 1;
	 *           pageNavigation.setTotalPageCount(totalPageCount); boolean
	 *           startRange = currentPage <= naviSize;
	 *           pageNavigation.setStartRange(startRange); boolean endRange =
	 *           (totalPageCount - 1) / naviSize * naviSize < currentPage;
	 *           pageNavigation.setEndRange(endRange);
	 *           pageNavigation.makeNavigator(); return pageNavigation; }
	 * 
	 * @Override public AptDto getApt(int no) throws Exception { return
	 *           sqlSession.getMapper(AptMapper.class).getApt(no); }
	 **/

	@Override
	public List<AptDto> aptSearch(Map<String, String> map) {
		return sqlSession.getMapper(AptMapper.class).aptSearch(map);

	}

	@Override
	public AptDto getAptDeal(int no) throws SQLException {
		return sqlSession.getMapper(AptMapper.class).getAptDeal(no);

	}

	@Override
	public List<AptDto> listHouseDeal(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		param.put("dong", map.get("dong") == null ? "" : map.get("dong"));
		return sqlSession.getMapper(AptMapper.class).listHouseDeal(param);
	}

	@Override
	public List<Map> clicksearch(String dong) {
		return sqlSession.getMapper(AptMapper.class).clicksearch(dong);

	}

}
