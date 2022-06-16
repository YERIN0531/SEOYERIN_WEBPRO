package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//success를 return 했다고 생각만 하고 일단 이렇게 만들어주기 
		int result = 1;
		request.setAttribute("deleteResult", result);
	}

}
