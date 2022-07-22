package com.lec.my.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.my.dto.Board;
@Mapper
public interface BoardDao {
		
	// 보드 목록
	public List<Board> boardList(Board board);
	// 원글 쓰기
	public int write(Board board);
	// 전체 글 갯수
	public int totCnt();
	// bid 글 조회수 1회 올리기 
	public int upHit(int bid);
	// bid로 dto 가져오기 
	public Board detail(int bid);
	// 답변글 쓰기 전 stepA
	public int stepA(Board board);
	// 답변글 쓰기 
	public int reply(Board board);
	// 글 수정하기 
	public int update(Board board);
	// 글 삭제하기 
	public int delete(int bid);
	
	
	
	
}