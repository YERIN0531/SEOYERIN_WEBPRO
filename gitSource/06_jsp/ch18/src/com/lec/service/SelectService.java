package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		dao가 있으면 아래처럼 하겠지만 지금은 일단 간단하게 해보는 것 		
//		int currentPage;
//		ArrayList<Dto> dtos = dao.list(startRow, endRow);
//		int pageCnt, startpage, endPage;
		request.setAttribute("selectService", "list 결과");
		
	}
}
