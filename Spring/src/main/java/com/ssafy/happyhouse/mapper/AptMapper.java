package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.AptDto;

public interface AptMapper {
	public List<AptDto> listApt(Map<String, Object> map) throws SQLException;
//	public int getTotalCount(Map<String, String> map) throws SQLException;

	public List<AptDto> listAptarea(Map<String, Object> param);

	public List<AptDto> aptSearch(Map<String, String> map);

	public AptDto getAptDeal(int no);

	public List<AptDto> listHouseDeal(Map<String, Object> param);

	public List<Map> clicksearch(String dong);
	
//	public AptDto getApt(int no) throws SQLException;

}
