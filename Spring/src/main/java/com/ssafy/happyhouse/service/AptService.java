package com.ssafy.happyhouse.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.*;
import com.ssafy.util.PageNavigation;

public interface AptService {
	public List<AptDto> listApt(Map<String, String> map) throws Exception;
	//public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	//public AptDto getApt(int no) throws Exception;
	public List<AptDto> listAptarea(Map<String, String> map) throws Exception;
	public List<AptDto> aptSearch(Map<String, String> map);
	public AptDto getAptDeal(int no) throws SQLException;
	public List<AptDto> listHouseDeal(Map<String, String> map) throws Exception;
	public List<Map> clicksearch(String dong);
		
}
