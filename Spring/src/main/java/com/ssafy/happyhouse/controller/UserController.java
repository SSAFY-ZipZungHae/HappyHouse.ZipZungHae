package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.mapper.UserMapper;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) {
		try {
			MemberDto memberDto = userService.login(map);
			if (memberDto != null) {
				session.setAttribute("userinfo", memberDto);

				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserid());
				cookie.setPath("/");
				if ("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);// 40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);

			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "index";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "user/list";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "user/mypage";
	}
	@RequestMapping(value = "/passfind", method = RequestMethod.GET)
	public String passfind() {
		return "user/passfind";
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDto memberDto, Model model, HttpSession session) {
		userService.userRegister(memberDto);
		// System.out.println("회원가입 성공");
		return "user/list";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("userid") String userid, Model model) {
		try {
			userService.deleteMember(userid);
			return "user/logout";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
//	
//	//회원탈퇴
//		@GetMapping(value="/delete")
//		public String delete(HttpSession session) {
//			System.out.println("삭제진행");
//			String userId = (String)session.getAttribute("userid");
//			userService.deleteMember(userId);
//			session.invalidate();
//			return "index";
//		}
		@GetMapping("/api/user")
		public @ResponseBody ResponseEntity<MemberDto> userModify(@RequestBody MemberDto memberDto) {
			System.out.println(memberDto.toString());
			userService.update(memberDto);		
			String userId = memberDto.getUserid();		
			memberDto = userService.lookupmember(userId);
			return new ResponseEntity<MemberDto>(memberDto, HttpStatus.OK);
		}
		
	@PostMapping("/findpass")
	public String findpass(@RequestParam Map<String, String> map, Model model) {
		MemberDto memberDto = null;
		try {
			memberDto = userService.getMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(memberDto != null) {
			model.addAttribute("pass", memberDto.getUserpwd());
		} else {
			model.addAttribute("pass", "해당 ID, 이름과 일치하는 비밀번호가 없습니다");
		}
		return "index";
	}
	@GetMapping("/modify")
	public String openmodify(@RequestParam("userid") String userid, Model model) {
		MemberDto memberDto = null;
		try {
			memberDto = userService.getMemberbyId(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("currentuser", memberDto);
		return "user/usermodify";
	}
	
	@PostMapping("/modify")
	public String modify(@RequestParam Map<String, String> map, Model model) {
		MemberDto memberDto = null;
		try {
			userService.modifyMember(map);
			memberDto = userService.getMemberbyId(map.get("userid"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("currentuser", memberDto);
		return "user/usermodify";
	}
	
	 @PostMapping("/usermodify")
	   public String usermodify(@RequestParam Map<String, String> map, Model model, HttpSession session) {
	      try {
	         userService.modifyMember(map);
	         session.setAttribute("userinfo", userService.getMember(map));
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return "user/mypage";
	   }
	 
	 @GetMapping("/findpassword/{userid}/{username}")
		@ResponseBody
		public Map<String, String> findPassWord(@PathVariable("userid") String userid, @PathVariable("username")  String username) {
			Map<String, String> map = new HashMap<>();
			map.put("userid", userid);
			map.put("username", username);
			return userService.findPassword(map);
		}

}