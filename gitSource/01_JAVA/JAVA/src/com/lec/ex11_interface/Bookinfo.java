package com.lec.ex11_interface;

public class Bookinfo {

	
	private String bookNo;
	private String bookTitle;
	private String writer;
	
	public Bookinfo(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}

	public String getBookNo() {
		return bookNo;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public String getWriter() {
		return writer;
	}
	
}
