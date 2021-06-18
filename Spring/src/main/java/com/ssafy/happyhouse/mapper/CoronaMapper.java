package com.ssafy.happyhouse.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.CoronaDto;

public interface CoronaMapper {

	List<CoronaDto> coronaSearch(Map<String, String> map);

}
