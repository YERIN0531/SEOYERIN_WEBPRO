package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	//public 빼도 되지만 넣어놔야 이쁨 
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
