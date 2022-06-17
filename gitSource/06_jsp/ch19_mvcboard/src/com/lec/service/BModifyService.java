package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bid 		= Integer.parseInt(request.getParameter("bid"));
		String bname 	= request.getParameter("bname");
		String btitle 	= request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bip 		= request.getRemoteAddr();
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("modifyResult", bDao.UpdateBoard(bname, btitle, bcontent, bip, bid));
	}

}
