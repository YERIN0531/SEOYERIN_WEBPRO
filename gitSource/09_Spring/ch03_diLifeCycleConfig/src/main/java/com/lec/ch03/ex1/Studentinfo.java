package com.lec.ch03.ex1;
import org.springframework.beans.factory.annotation.Autowired;
import lombok.Data;
@Data
public class Studentinfo {
	@Autowired
	private Student student;
}
