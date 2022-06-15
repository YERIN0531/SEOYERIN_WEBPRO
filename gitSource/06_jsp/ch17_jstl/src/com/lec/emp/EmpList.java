package com.lec.emp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/emplist")
public class EmpList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request,response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDao eDao = new EmpDao(); //아까 싱글톤으로 안만들었으니 new 해줘야해
		ArrayList<EmpDto> emps = eDao.listEmp();
		request.setAttribute("emps", emps);
		RequestDispatcher dispatcher = request.getRequestDispatcher("3_emp/emplist.jsp");
		dispatcher.forward(request, response);
		//여기서 session은 못 씀 
		//HttpSession을 써서 session을 받아오면 됨 -금요일에 할 부분
		//화면에 뿌리는 단계에서 el 랭귀지 써서 뿌릴건데, 위에도 customer 쓰면 jsp에서 ${sessionScope.customer}이런식으로 scope 을 써주지 않는 이상 
		//중복이 되버릴수 있음. 우선ㄴ순위 높은게 가긴 하지만, 내가 원하지 않는게 들어가게 될 수도 있으니깐 
		//request setATtribute 할땐 꼭 session setAttribute에 한 거랑 다르게 이름을 설정 하면 됨 
//		HttpSession session = request.getSession();
//		session.setAttribute("emps", emps);
	}
}














