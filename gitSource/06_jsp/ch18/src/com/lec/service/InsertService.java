package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//insert 로직(DAO 생성 - request.getParameter 파라미터 받아 dto 만들고 - dao.insert 호출 
//		 * int result = dao.insert(dto); // 이런식으로 만들면 dao.insert(dto)의 결과가 보나마나 0 아니면 1일 것
		int result = 1; //지금은 dao가 없으니 1로 셋팅 해놓기
		request.setAttribute("insertResult", result);
		//-- frontcontroller 로 향하게 됨 
		
		
	}

}
