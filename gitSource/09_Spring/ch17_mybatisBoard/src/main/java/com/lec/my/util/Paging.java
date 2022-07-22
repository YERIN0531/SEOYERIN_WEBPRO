package com.lec.my.util;

import lombok.Data;

@Data
public class Paging {
	private int currentPage=1;
	private int pageSize;
	private int blockSize;
	private int startRow;
	private int endRow;
	private int totCnt;
	private int pageCnt;
	private int startPage;
	private int endPage;
	//Paging paging = new Paging(14, pageNum, 10, 10) (총페이지수, 페이지넘, 페이지사이즈, 블럭사이즈)
	public Paging(int totCnt, String pageNum, int pageSize, int blockSize) {
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		this.pageSize = pageSize; // 내 객체의 pageSize = 매개변수로 들어온 pageSize
		this.blockSize = blockSize; 
		startRow = (currentPage-1) * pageSize + 1;
		endRow = startRow + pageSize -1;
		this.totCnt = totCnt; 
		pageCnt = (int)Math.ceil((double)totCnt/pageSize);
//		startPage = ((currentPage-1) / blockSize) * blockSize + 1; 밑에꺼랑 이거 중에 둘 중 하나 해주면 됨 
		startPage = currentPage - (currentPage-1) % blockSize;
		endPage = startPage + blockSize -1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}
	
	
	
	//Paging paging = new Paging(14, pageNum)
	public Paging(int totCnt, String pageNum) {
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		this.pageSize  = 10; // 내 객체의 pageSize = 매개변수로 들어온 pageSize
		this.blockSize = 10; 
		startRow = (currentPage-1) * pageSize + 1;
		endRow = startRow + pageSize -1;
		this.totCnt = totCnt; 
		pageCnt = (int)Math.ceil((double)totCnt/pageSize);
//		startPage = ((currentPage-1) / blockSize) * blockSize + 1; 밑에꺼랑 이거 중에 둘 중 하나 해주면 됨 
		startPage = currentPage - (currentPage-1) % blockSize;
		endPage = startPage + blockSize -1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}
}
