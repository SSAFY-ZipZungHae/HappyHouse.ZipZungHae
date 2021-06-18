package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.Board;


public interface BoardService {
	public List<Board> retrieveBoard();
	public Board detailBoard(int no);
	public boolean writeBoard(Board board);
	public boolean updateBoard(Board board);
	public boolean deleteBoard(int no);
}
