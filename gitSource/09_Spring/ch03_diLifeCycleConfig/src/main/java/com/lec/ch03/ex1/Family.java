package com.lec.ch03.ex1;
import lombok.Data;
@Data
public class Family {

	private String papaName;
	private String mamiName;
	private String sisterName;
	private String brotherName;
	
	public Family(String papaName, String mamiName) {
		this.papaName = papaName;
		this.mamiName = mamiName;
	}
	
	
}
