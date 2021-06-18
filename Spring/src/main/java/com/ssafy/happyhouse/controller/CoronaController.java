package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.CommerceDto;
import com.ssafy.happyhouse.model.CoronaDto;
import com.ssafy.happyhouse.service.CoronaService;

import io.swagger.annotations.Api;

@Controller
@RequestMapping("/corona")
@Api(value ="코로나 병원")
public class CoronaController {
private static final Logger logger = LoggerFactory.getLogger(EtcController.class);
	
	@Autowired
	private CoronaService coronaService;
	
	@RequestMapping(value = "/go", method = RequestMethod.GET)
	public String go() {
		return "corona/corona";
	}

	
	// 병원 찾기
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String coronaList(@RequestParam Map<String, String> map,Model model) 
	{ 
		List<CoronaDto> list = coronaService.CoronaSearch(map);
		model.addAttribute("hospitals", list);
		//System.out.println(list);
		return "corona/corona";
	}
}
