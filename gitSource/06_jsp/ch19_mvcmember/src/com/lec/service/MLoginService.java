package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.MemberDao;
import com.lec.dto.MemberDto;

public class MLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginCheck(mid, mpw);
		if(result == MemberDao.LOGIN_SUCCESS) {
			MemberDto dto = mDao.getMember(mid);
			HttpSession session = request.getSession();
			session.setAttribute("member" , dto);
			request.setAttribute("loginResult", "로그인이 완료되었습니다");
		}else {
			request.setAttribute("loginerror", "로그인에 실패되었습니다");
		}
	}

}
