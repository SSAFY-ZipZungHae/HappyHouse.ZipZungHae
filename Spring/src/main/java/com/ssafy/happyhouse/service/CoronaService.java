package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.CoronaDto;

public interface CoronaService {
	List<CoronaDto> CoronaSearch(Map<String, String> map);

}
