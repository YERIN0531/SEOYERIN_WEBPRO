package com.lec.ch15.model;
import java.sql.Date;
import lombok.Data;
@Data
public class Emp {

	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
	private int sal;
	private int comm;
	private int deptno;
	private String dname;
	private String loc;
	private int startRow; // 페이징 처리를 위한 속성 변수 데이터 베이스에 있는건 아님
	private int endRow;	  // 페이징 처리를 위한 속성 변수
}
