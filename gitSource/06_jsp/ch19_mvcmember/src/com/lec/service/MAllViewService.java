package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.MemberDao;

public class MAllViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 3, BLOCKSIZE = 5;
		int startRow = (currentPage-1)*PAGESIZE +1 ;
		int endRow = (startRow+PAGESIZE)-1;
		
		MemberDao mDao = MemberDao.getInstance();
		request.setAttribute("memberView",mDao.listMember(startRow, endRow));

		int totalCnt = mDao.getMemberToCnt();
		int pageCnt  = (int)Math.ceil((double)totalCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE +1;
		int endPage = (startPage + BLOCKSIZE)-1;
		if(endPage >pageCnt) {
			endPage = pageCnt;
		}
		
		request.setAttribute("BLOCKSIZE", BLOCKSIZE); //★ 이하 페이지 관련 항복들
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum",currentPage ); 
		request.setAttribute("pageCnt", pageCnt);
	}

}
