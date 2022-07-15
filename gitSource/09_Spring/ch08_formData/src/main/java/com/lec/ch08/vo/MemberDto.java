package com.lec.ch08.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MemberDto {

	private String name;
	private String id;
	private String pw;
	private int age;
	private String email;
	private String address;
	// 폼데이터 사용을 위해 : getter & 매개변수 없는 생성자 
}
