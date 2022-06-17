package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// list.do 또는 list.do?pageNum=2 또는 list.do?pageNum=10
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE +1 ;
		int endRow = (startRow+BLOCKSIZE)-1;
		
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("list", bDao.listboard(startRow, endRow));
		
		int totalCnt = bDao.getBoardTotalCnt(); //등록된 글 갯수, 얘를 알아야 pageCnt 알 수 있음
		int pageCnt  = (int)Math.ceil((double)totalCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE +1;
		int endPage = (startPage + BLOCKSIZE)-1;
		if(endPage >pageCnt) {
			endPage = pageCnt;
		}
		
		request.setAttribute("BLOCKSIZE", BLOCKSIZE); //★ 이하 페이지 관련 항복들
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum",currentPage ); //pageNum이라는 이름으로 currentPage를 넘기기
		//지금 페이지 숫자를 부리는데 페이지 숫자가 2를 뿌리는데 i가 페이지 num이랑 같냐라는 걸 물어보야 되기 때문에 
		request.setAttribute("pageCnt", pageCnt);
		
		
		
		
	}
}
