-- ★★ 고객(CUSTOMER) 테이블 DAO ★★
SELECT * FROM CUSTOMER;

-- 1. 회원가입시 CID 중복 체크
SELECT * FROM CUSTOMER WHERE CID='aaa';

-- 2. 회원가입
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('ggg','111','서예린','010-0000-1234', 'ggg@naver.com', '서울시 구로구','f','1995-05-31');

-- 3. 로그인(CID/CPW)
SELECT * FROM CUSTOMER WHERE CID='aaa' AND CPW='111';

-- 4. CID로 DTO가져오기(CUSTOMER TABLE에 있는 객체를 SESSION에 담기위함)
SELECT * FROM CUSTOMER WHERE CID='aaa';

-- 5. 회원정보 수정
UPDATE CUSTOMER SET CPW='111',
                    CNAME='홍홍홍',
                    CTEL ='010-1111-0000',
                    CEMAIL = 'GG@G.COM',
                    CADDRESS = '부산',
                    CGENDER = 'm',
                    CBIRTH = '1999-12-12'
                    WHERE CID ='ggg';

-- 6. 회원리스트 출력하기(첫화면 main.jsp에서 사용할 부분)-Top-N구문
SELECT * FROM (SELECT ROWNUM RN, CID, CPW, CNAME, CEMAIL, CADDRESS 
                FROM(SELECT * FROM CUSTOMER ORDER BY CID))
                WHERE RN BETWEEN 4 AND 6;
                
-- 7. 등록된 회원수 (이게 있어야 페이지 갯수 설정가능)
SELECT COUNT(*) CNT FROM CUSTOMER;


-- ★★ 도서(BOOK) 테이블 DAO ★★
-- 1. 책등록
INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
    VALUES(BOOK_SEQ.NEXTVAL, '이것은 자바다', 30000, 'noImg.png','NOTHING.JPG','책설명',20);

-- 2. 책목록(전체 LIST)
SELECT * FROM BOOK ORDER BY BRDATE DESC; -- 최신순을 위에 올리기 위해 해줌 

-- **********페이징 처리 하기위해 필요한구문 
-- 3. 책목록(top-n구문)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A)
WHERE RN BETWEEN 
2 AND 3;
-- 4. 등록된 책 갯수
SELECT COUNT(*) CNT FROM BOOK;

-- **********

-- 5. 책 상세보기(BDI로 DTO 가져오기)
SELECT * FROM BOOK WHERE BID=1;
COMMIT;

-- ★★ 파일첨부게시판(FILEBOARD) 테이블 DAO ★★
SELECT * FROM FILEBOARD;
-- 1. 글목록(startRow~endRow)
    -- 이큐조인
    SELECT F.*,CNAME, CEMAIL
        FROM FILEBOARD F, CUSTOMER C
        WHERE F.CID = C.CID
        ORDER BY FREF DESC, FRE_STEP;
    -- TOP-N구문 
SELECT * FROM (SELECT ROWNUM RN, A.* 
FROM(SELECT F.*,CNAME, CEMAIL
        FROM FILEBOARD F, CUSTOMER C
        WHERE F.CID = C.CID
        ORDER BY FREF DESC, FRE_STEP) A)
WHERE RN BETWEEN 2 AND 3;

-- 2. 등록된 글 수 
SELECT COUNT(*) FROM FILEBOARD;

-- 3. 원글쓰기 
INSERT INTO FILEBOARD (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, FREF, FRE_STEP, FRE_LEVEL,FIP )
    VALUES(FILEBOARD_SEQ.NEXTVAL, 'aaa','글1','본문1',NULL,'111',FILEBOARD_SEQ.CURRVAL,0,0,'126.12.12.1');
SELECT * FROM FILEBOARD ORDER BY FREF DESC; 
SELECT * FROM FILEBOARD WHERE FNUM=5; --방금 쓴 원글 5번글

-- 4. 답변글 쓰기 전 step A
UPDATE FILEBOARD SET FRE_STEP = FRE_STEP+1 WHERE FREF=5 AND FRE_LEVEL>0;

-- 5. 답변글 쓰기 -- 5번글의 답변
INSERT INTO FILEBOARD(FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, FREF, FRE_STEP, FRE_LEVEL,FIP )
    VALUES(FILEBOARD_SEQ.NEXTVAL, 'bbb', '글1-1','답',NULL,'111',5,1,1,'192.168.10.10');

SELECT * FROM FILEBOARD WHERE FREF = 5 ORDER BY FRE_STEP;

-- 6. 글 상세보기(fnum으로 dto 가져오기)
SELECT * FROM FILEBOARD WHERE FNUM=5;

-- 7. 글 수정하기 -- 내가 쓴 글아니면 수정 못하게 (따라서 작성자는 수정되면 안됨)
-- 내가 쓴 글이 아니면 애초에 수정버튼이 안만들어지게 만들것 
UPDATE FILEBOARD SET FSUBJECT ='수정된 제목',
                     FCONTENT ='수정된 본문',
                     FFILENAME = NULL,
                     FPW = '111',
                     FIP = '192.168.10.30' --수정된 아이피는 자동적으로 들어가는 걸로
                     WHERE FNUM=1;
                     
-- 8. 글 삭제하기
DELETE FROM FILEBOARD WHERE FNUM=1 AND FPW='111';
COMMIT;
SELECT * FROM FILEBOARD;























