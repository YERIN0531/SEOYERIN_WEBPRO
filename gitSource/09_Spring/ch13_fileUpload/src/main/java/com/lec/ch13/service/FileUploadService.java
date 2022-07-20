package com.lec.ch13.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Service
public class FileUploadService {
	//mRequest 받고, 파일 업로드, 파일카피 순조롭게 진행되면 true를 출력하고 싶어서 타입을 boolean으로 지정
	public boolean fileUp(MultipartHttpServletRequest mRequest,
			ModelAndView mav) {
		boolean isUpload = false;
		// 파일 업로드 - 파라미터의 파일이 어떤게 들어왔는지 물어보고, 서버에 파일 있는지 확인후 서버에 저장하고 , 프로젝트 폴더에 복사
		
		String uploadPath = mRequest.getRealPath("upload/");
		//업로드한 소스 를 복사해야하는 프로젝트 폴더 // webapp에 있는 폴더upload 의 경로 복사하기  
		String backupPath = "D:\\webPro\\SOURCE\\09_Spring\\ch13_fileUpload\\src\\main\\webapp\\upload\\";
		String[] filenames = new String[3];
		int i = 0;
		Iterator<String> params = mRequest.getFileNames(); //file1, file2, file3 
		while(params.hasNext()) {
			String param = params.next();
			System.out.println(i+"번째 파라미터 이름 : " + param);
			MultipartFile mFile = mRequest.getFile(param);
			filenames[i] = mFile.getOriginalFilename(); //param으로 첨부한 파일의 오리지널 파일명 
			if(filenames[i]!=null && !filenames[i].equals("")) { //첨부한 파일이 있을 경우
			 if(new File(uploadPath + filenames[i]).exists()) {//있으면 파일이름 rename 해줘야됨 
				 filenames[i] = System.currentTimeMillis() + filenames[i]; // rename 할 내용을 뒤에다 붙이면 확장자명이 달라지니 파일명 앞에 붙이기
			 } // if- 중복된 파일명일 경우 변경 
			 //파일 저장하기 ( cos.jar는 알아서 저장해주지만 얘는 알아서 안해주기 때문에 우리가 써줘야함
			 // transferTo 는 파일 저장해주는 아이
			 // trycatch 만들어주기 
			 try {
				mFile.transferTo(new File(uploadPath+filenames[i])); //서버에 파일 저장 
				// 서버에만 저장하면 톰캣 껏다 킬때 파일 날라가기 때문에 내 프로젝트에 백업, 즉 복사해놔야됨
				System.out.println("서버에 저장된 파일 : " + uploadPath + filenames[1]);
				System.out.println("백업 복사 파일 : " + backupPath + filenames[i]);
				isUpload = filecopy(uploadPath + filenames[i], backupPath + filenames[i]);
			}catch (IOException e) {
				System.out.println(e.getMessage());
			}
			 
			}else {
				System.out.println(i+ "번쨰는 파일 첨부 안함");
				isUpload = true;
			}//if-첨부여부
			i++;
		}//while
		mav.addObject("filenames",filenames);
		return isUpload;
	}
	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null;
		OutputStream os = null;
		try {
			//한번에 읽고 쓰기 위하여 serverFile로 file 객체를 만들어 놓기 
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e){
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return isCopy;
	}
}
