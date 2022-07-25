package com.lec.ch19.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.ch19.dto.Book;

public interface BookService {

//	public List<Book> mainList();
//	public List<Book> bookList(Book book);
//	public int totCntBook();
//	public Book getDetailBook(int bnum);
//	public int registerBook(Book book);
//	public int modifyBook(Book book);
	public List<Book> mainList();
	public List<Book> bookList(String pageNum);
	public int totCntBook();
	public Book getDetailBook(int bnum);
	
	// 책 등록할건데, 매개변수로 책 이미지가 들어온 게 아니라, 파일첨부 한 상태
	// 컨트롤러에서 얘를 호출하는데, 우리는 컨트롤러에 multipartreqeust객체를 받은 상태 
	// 따라서 book만 받으면 안되고, mRequest에 파일첨부한 파일정보가 들어있기 때문에 mulipart 이 놈도 변수에 담아줘
	// 
	public int registerBook(Book book, MultipartHttpServletRequest mRequest);
	public int registerBook(MultipartHttpServletRequest mRequest); //비추
	
	public int modifyBook(MultipartHttpServletRequest mRequest, Book book);
	public int modifyBook(MultipartHttpServletRequest mRequest);
	
}
