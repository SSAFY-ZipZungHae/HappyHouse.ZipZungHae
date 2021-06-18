package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.CommerceDto;
import com.ssafy.happyhouse.model.EnvDto;
import com.ssafy.happyhouse.service.CommerceService;

import io.swagger.annotations.Api;

//@RequestMapping("/commerce")
@Controller
@RequestMapping(value = {"/commerce", "/env"})
@Api(value ="상권 정보, 환경정보 API")
public class EtcController {

	private static final Logger logger = LoggerFactory.getLogger(EtcController.class);
	
	@Autowired
	private CommerceService commerceService;
	
	// 환경정보 찾기
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String coronaList(@RequestParam Map<String, String> map,Model model) 
		{ 
			List<EnvDto> list = commerceService.envSearch(map);
			model.addAttribute("envs", list);
			//System.out.println(list);
			return "etc/environment";
		}
	
	
	@RequestMapping(value = "/go", method = RequestMethod.GET)
	public String go() {
		return "etc/environment";
	}
	@RequestMapping(value = "/dong", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> map, Model model) {
//		String spp = map.get("spp");
//		map.put("spp", spp != null ? spp : "10");//sizePerPage
		try {
			List<CommerceDto> list = commerceService.listcommerce(map);
			//PageNavigation pageNavigation = aptService.makePageNavigation(map);
			model.addAttribute("commerces", list);
			//System.out.println("성공");
			//System.out.println(list.get(0));
			//model.addAttribute("navigation", pageNavigation);
			return "apt/detailview";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "아파트 목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

	@GetMapping("search/{comm}")
	@ResponseBody
	public Map<String, String> findcomm(@PathVariable("dong") String dong) {
		Map<String, String> map = new HashMap<>();
		map.put("dong", dong);
		System.out.println("역삼동");
		return commerceService.findcomm(map);
	}

	
	
//	@RequestMapping(value = "/envsearch", method = RequestMethod.GET)
//	@ResponseBody
//	public List<EnvDto> envList(HttpSession session) 
//	{ 
//		Map<String, String> tmp = (Map<String, String>) session.getAttribute("nowInterestArea");
//		List<EnvDto> list = commerceService.envSearch(tmp);
//		session.setAttribute("envList", list);
//		return list;
//	}
//	
	
	
	
	
}
