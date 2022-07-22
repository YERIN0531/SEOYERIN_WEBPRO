package com.lec.ch15;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch15.model.Emp;
import com.lec.ch15.service.EmpService;
import com.lec.ch15.util.Paging;

@Controller
public class EmpController {

	@Autowired
	private EmpService empService;
	@RequestMapping(value="empList", method = RequestMethod.GET)
	public String empList(String pageNum, Model model) {
		//empList.do?pageNum=2, empList.do
		model.addAttribute("empList", empService.empList(pageNum));
		model.addAttribute("paging", new Paging(empService.totCnt(), pageNum, 10, 5));
		return "empList";
	}
	
	@RequestMapping(value="dummyDataInsert", method=RequestMethod.GET)
	public String dummyDataInsert() {
		empService.dummyDataInsert50();
		return "redirect:empList.do";
	}

	@RequestMapping(value="empDeptList", method= {RequestMethod.GET, RequestMethod.POST})
	public String empDeptList(String pageNum, Model model) {
		//empDeptList.do , empDeptList.do?pageNum=2
		model.addAttribute("empList", empService.empDeptList(pageNum));
		model.addAttribute("paging", new Paging(empService.totCnt(), pageNum, 10, 5));
		return "empDeptList";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(int empno, Model model) {
		model.addAttribute("empDto", empService.detail(empno));
		return "detail";
	}
	
	@RequestMapping(value="updateView", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateView(int empno, Model model) {
		model.addAttribute("empDto", empService.detail(empno));
		return "update";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(Emp emp, Model model) {
		try {
			model.addAttribute("updateResult", empService.update(emp));
		}catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("updateResult", "필드 값이 너무 깁니다. 수정 실패");
			return "forward:updateView.do";
		}
		return "forward:empDeptList.do";
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int empno, Model model) {
		model.addAttribute("deleteResult", empService.delete(empno));
		return "forward:empDeptList.do";
	}
	
	@RequestMapping(value="writeView", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeView(Model model) {
		model.addAttribute("managerList",empService.managerList());
		model.addAttribute("deptList",empService.deptList());
		return "write";
	}
	@RequestMapping(value="confirmNo", method=RequestMethod.GET)
	public String confirmNo(Emp emp, Model model) {
		if(empService.detail(emp.getEmpno())==null) {
			model.addAttribute("msg", "사용가능한 사번입니다");
		}else {
			model.addAttribute("msg","중복된 사번은 사용불가합니다");
		}
		return "forward:writeView.do";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(Emp emp, Model model) {
		try {
			model.addAttribute("writeResult", empService.insert(emp));
		}catch(Exception e) {
			model.addAttribute("writeResult", "필드값이 너무 길어 등록 불가");
			return "forward:writeView.do";
		}
		return "forward:empDeptList.do";
	}
	
	
}

