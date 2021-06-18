package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.AptDto;
import com.ssafy.happyhouse.service.AptService;

import io.swagger.annotations.Api;
import springfox.documentation.annotations.ApiIgnore;

@Controller
@RequestMapping("/apt")
@Api(value = "apt controller API v1")
public class APTController {
	
	@Autowired
	private AptService aptService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		try {
			List<AptDto> list = aptService.listApt(map);
			//PageNavigation pageNavigation = aptService.makePageNavigation(map);
			model.addAttribute("apts", list);
			System.out.println("11");
			//System.out.println(list.get(0));
			//model.addAttribute("navigation", pageNavigation);
			return "apt/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "아파트 목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/searchlist", method = RequestMethod.POST)
	public String searchlist(@RequestParam Map<String, String> map, Model model) {
		List<AptDto> houselist = aptService.aptSearch(map);
		//System.out.println("dkss");
		model.addAttribute("apts", houselist);
		return "apt/list";
	}

	
	@RequestMapping(value = "/selectlist", method = RequestMethod.GET)
	public String selectlist(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		try {
			List<AptDto> list = aptService.listAptarea(map);
			//PageNavigation pageNavigation = aptService.makePageNavigation(map);
			model.addAttribute("apts", list);
			System.out.println("22");
			//System.out.println(list.get(0));
			//model.addAttribute("navigation", pageNavigation);
			return "apt/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@GetMapping("/detailview")
	public String houseView(@RequestParam("no") int no, Model model) {
		AptDto house = null;
		List<AptDto> list = new ArrayList<AptDto>();
		try {
			house = aptService.getAptDeal(no);
			try {
				Map<String, String> map = new HashMap<String, String>();
				map.put("dong", house.getDong());
				list = aptService.listApt(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("asd");
		model.addAttribute("house", house);
		model.addAttribute("houses", list);
		return "apt/detailview";
	}

	@RequestMapping(value ="/clickapt/{dong}", method=RequestMethod.GET)
	@ResponseBody
	public List<Map> clickSearch( @ApiIgnore HttpSession session, @ApiIgnore Model model) {
		try {
			AptDto tmp = (AptDto) session.getAttribute("dong");
			String dong = tmp.getDong();
			System.out.println(dong);
			return aptService.clicksearch(dong);
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관심지역 검색 중 문제가 발생했습니다.");
		}
		return null;
	}
}
