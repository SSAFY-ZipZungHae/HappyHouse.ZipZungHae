package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.GuestBookDto;
import com.ssafy.util.PageNavigation;

public interface GuestBookService {

	public void writeArticle(GuestBookDto guestBookDto) throws Exception;
	public List<GuestBookDto> listArticle(Map<String, String> map) throws Exception;
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	
	public GuestBookDto getArticle(int articleno) throws Exception;
	public void modifyArticle(GuestBookDto guestBookDto) throws Exception;
	public void deleteArticle(int articleno) throws Exception;
	
}
