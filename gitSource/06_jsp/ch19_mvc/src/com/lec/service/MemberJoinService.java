package com.lec.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.MemberDao;
import com.lec.dto.MemberDto;

public class MemberJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		// 생년월일이 빈스트링일 수 있음. 데이타 베이스에 null로 넣어줘야하고, 빈스트링이 아니라면 데이터값을 넣어줘야함
		Timestamp birth = null;
		if(! request.getParameter("birth").equals("")) {
			birth = Timestamp.valueOf(request.getParameter("birth") + " 00:00:00");
		}
		MemberDto member = new MemberDto(id, pw, name, birth, null);
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.joinMember(member);
		request.setAttribute("joinResult", result);
	}

}
