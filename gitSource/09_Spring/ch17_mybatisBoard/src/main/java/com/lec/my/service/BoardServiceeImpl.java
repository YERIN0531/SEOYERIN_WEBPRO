package com.lec.my.service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.my.dao.BoardDao;
import com.lec.my.dto.Board;
import com.lec.my.util.Paging;
@Service
public class BoardServiceeImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> boardList(String pageNum) {
		Paging paging = new Paging(boardDao.totCnt(), pageNum, 10, 5);
		Board board = new Board();
		board.setStartRow(paging.getStartRow());
		board.setEndRow(paging.getEndRow());
		return boardDao.boardList(board);
	}

	@Override
	public int write(Board board) {
		return boardDao.write(board);
	}

	@Override
	public int totCnt() {
		return boardDao.totCnt();
	}

	@Override
	public int upHit(int bid) {
		return boardDao.upHit(bid);
	}

	@Override
	public Board detail(int bid) {
		return boardDao.detail(bid);
	}

	@Override
	public int reply(Board board) {
		return boardDao.reply(board);
	}

	@Override
	public int update(Board board) {
		return boardDao.update(board);
	}

	@Override
	public int delete(int bid) {
		return boardDao.delete(bid);
	}

	@Override
	public int stepA(Board board) {
		return boardDao.stepA(board);
	}

}
