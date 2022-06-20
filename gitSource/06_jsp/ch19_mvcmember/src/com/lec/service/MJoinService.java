package com.lec.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.MemberDao;
import com.lec.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024*1024; //사진 업로드 제한 용량 : 1M
		String mphoto = ""; // 첨부된 파일이 저장된 파일 이름 
//		MultipartRequest mRequest = null;  // 파일이름 받을 때 뿐 아니라 , 파라미터 받아올때도 사용하기 때문에 try절 위에다가 빼기 
		try {
			// mRequest 객체 생성 후 mPhoto 파일 이름 얻어옴
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize,
					"utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
				String param = params.nextElement();
				mphoto = mRequest.getFilesystemName(param);// 파라미터 이름과 짝지어서 해당되는 파일 이름 받아오기
			
			//mRequest를 이용해 파라미터 받아와서 DB 저장 
				String mid = mRequest.getParameter("mid");
				String mpw = mRequest.getParameter("mpw");
				String mname = mRequest.getParameter("mname");
				String memail = mRequest.getParameter("memail");
				mphoto = (mphoto == null? "NOIMG.JPG" : mphoto); 
				
				String mbirthStr = mRequest.getParameter("mbirth");
				Date mbirth = null; 
				if(!mbirthStr.equals("")) {
					mbirth = Date.valueOf(mbirthStr);
				}
				String maddress = mRequest.getParameter("maddress");
				
				MemberDao mDao = MemberDao.getInstance();
				int result = mDao.confirmId(mid);
				if(result == MemberDao.MEMBER_NONEXISTENT) {
					//중복체크 했으니 회원가입 하기 
					MemberDto member = new MemberDto(mid, mpw, mname, memail, mphoto, mbirth, maddress, null);
					result = mDao.JoinMember(member);
					if(result == MemberDao.SUCCESS) {
						HttpSession session = request.getSession();
						session.setAttribute("mphoto", mphoto);
						session.setAttribute("mid", mid);
						request.setAttribute("joinResult", "회원가입이 완료되었습니다");
					}else {
						request.setAttribute("joinErrorMsg", "정보가 너무 길어 회원가입이 불가합니다");
					}
				}else { //중복된 아이디입니다 라는 메시지를 뿌려줘야 하기 떄문에 setAttribute 해주기 
					request.setAttribute("joinErrorMsg", "중복된 ID는 회원가입이 불가합니다");
				}
		}catch(Exception e) {
		 System.out.println(e.getMessage());
		}
		
		
		
		//서버에 업로드된 파일을 소스 폴더로 복사
		File serverFile = new File(path + "/" + mphoto);
		if(serverFile.exists() && !mphoto.equals("NOIMG.JPG")) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/webPro/SOURCE/06_jsp/ch19_mvcmember/WebContent/memberPhotoUp/" + mphoto);
				byte[]bs = new byte[(int)serverFile.length()];
				while(true) {
					int readByteCnt = is.read();
					if(readByteCnt == -1) break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e2) {
					System.out.println(e2.getMessage());
				}
			}
		}
		
		
		
		
		
		
		
		
	}

}



