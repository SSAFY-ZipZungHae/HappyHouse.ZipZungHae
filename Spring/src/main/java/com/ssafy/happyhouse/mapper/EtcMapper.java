package com.ssafy.happyhouse.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.CommerceDto;
import com.ssafy.happyhouse.model.EnvDto;

public interface EtcMapper {
	//void aptDealRegister(Map<String, String> map);
	void commerceRegister(CommerceDto commerceDto);
	List<CommerceDto> commerceSearch(Map<String, String> map);
	void envRegister(EnvDto envDto);
	List<EnvDto> envSearch(Map<String, String> map);
	Map<String, String> findcomm(Map<String, String> map);
	List<CommerceDto> listcommerce(Map<String, Object> param);
}
