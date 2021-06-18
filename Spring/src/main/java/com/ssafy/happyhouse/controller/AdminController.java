package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.service.UserService;

@RestController
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<MemberDto> userList() {
		return userService.userList();
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	public List<MemberDto> userRegister(@RequestBody MemberDto memberDto) {
		userService.userRegister(memberDto);
		return userService.userList();
	}
	//"회원정보검색"
	@RequestMapping(value = "/user/{userid}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public MemberDto userInfo(@PathVariable("userid") String userid) {
		return userService.userInfo(userid);
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.PUT, headers = { "Content-type=application/json" })
	public List<MemberDto> userModify(@RequestBody MemberDto memberDto) {
		userService.userModify(memberDto);
		System.out.println("성공제발");
		return userService.userList();
	}
	
	@RequestMapping(value = "/user/{userid}", method = RequestMethod.DELETE, headers = { "Content-type=application/json" })
	public List<MemberDto> userDelete(@PathVariable("userid") String userid) {
		userService.userDelete(userid);
		return userService.userList();
	}
	
	///////////////////////////////////////////////////////////
	
//	@ApiOperation(value="회원목록", notes = "회원의<big>전체목록</big>을 반환해 줍니다.")
//	@ApiResponses({
//		@ApiResponse(code=200, message="회원목록OK"),
//		@ApiResponse(code=404, message="페이지없어!!"),
//		@ApiResponse(code=500, message="서버에러!!!")
//	})
//	@GetMapping(value = "/user")
//	public ResponseEntity<List<MemberDto>> userList() {
//		List<MemberDto> list = userService.userList();
//		if(list != null && !list.isEmpty()) {
//			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
////			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
////			return new ResponseEntity(HttpStatus.NOT_FOUND);
//		} else {
//			return new ResponseEntity(HttpStatus.NO_CONTENT);
//		}
//	}
//	
//	@ApiOperation(value="회원등록 ", notes="회원 정보를 받아서 DB에 저장.")
//	@PostMapping(value = "/user")
//	public ResponseEntity<List<MemberDto>> userRegister(@RequestBody @ApiParam(value="회원 한명의 정보",required=true) MemberDto memberDto) {
//		int cnt = userService.userRegister(memberDto);
//		if(cnt != 0) {
//			List<MemberDto> list = userService.userList();
//			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
////			return new ResponseEntity<Integer>(cnt, HttpStatus.CREATED);
//		} else
//			return new ResponseEntity(HttpStatus.NO_CONTENT);
//	}
//	
//	@ApiOperation(value="회원정보검색", notes="userid에 해당하는 회원 한명을 리턴.")
//	@GetMapping(value = "/user/{userid}")
//	public ResponseEntity<MemberDto> userInfo(@PathVariable("userid") @ApiParam(value="검색할 회원 아이디") String userid) {
//		logger.debug("파라미터 : {}", userid);
//		MemberDto memberDto = userService.userInfo(userid);
//		if(memberDto != null)
//			return new ResponseEntity<MemberDto>(memberDto, HttpStatus.OK);
//		else
//			return new ResponseEntity(HttpStatus.NO_CONTENT);
//	}
//	
//	@ApiOperation(value="회원정보수정 ", notes="회원의 정보를 수정합니다.")
//	@PutMapping(value = "/user")
//	public ResponseEntity<List<MemberDto>> userModify(@RequestBody @ApiParam(value="수정 할 회원정보",required=true) MemberDto memberDto) {
//		userService.userModify(memberDto);
//		List<MemberDto> list = userService.userList();
//		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
//	}
//	
//	@ApiOperation(value="회원삭제", notes="회원의 정보를 삭제합니다.")
//	@DeleteMapping(value = "/user/{userid}")
//	public ResponseEntity<List<MemberDto>> userDelete(@PathVariable("userid") @ApiParam(value="삭제 할 회원 아이디") String userid) {
//		userService.userDelete(userid);
//		List<MemberDto> list = userService.userList();
//		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
//	}
	
}
