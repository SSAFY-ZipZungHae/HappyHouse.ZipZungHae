package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.CommerceDto;
import com.ssafy.happyhouse.model.EnvDto;

public interface CommerceService {
	List<CommerceDto> commerceSearch(Map<String, String> map);
	List<EnvDto> envSearch(Map<String, String> map);
	List<Map> clicksearch(String dong);
	Map<String, String> findcomm(Map<String, String> map);
	List<CommerceDto> listcommerce(Map<String, String> map);
}
