package com.lec.ch12.bservice;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

import com.lec.ch12.dao.BoardDao;
import com.lec.ch12.dto.BoardDto;
public class BWriteService implements Service {
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		//컨트롤러에서 model에 넣어놓은 아이를 빼내는 것 
		BoardDto bDto = (BoardDto)map.get("bDto"); // bname, btitle, bcontent
		HttpServletRequest request = (HttpServletRequest)map.get("request"); 
		
		//이 아이피 주소 셋팅할려고 reqeust 객체 받음
		bDto.setBip(request.getRemoteAddr());  // ip
		BoardDao boardDao = BoardDao.getInstance();
		model.addAttribute("writeResult", boardDao.write(bDto));
	}
}















