-- DROP & CREATE 
DROP SEQUENCE BOOK_SEQ;
DROP TABLE BOOK;

CREATE SEQUENCE BOOK_SEQ 
    MAXVALUE 99999
    NOCACHE 
    NOCYCLE;
    
CREATE TABLE BOOK(
    BID         NUMBER(5)       PRIMARY KEY,          -- 책번호
    BTITLE      VARCHAR2(100)   NOT NULL,             -- 책제목
    BPRICE      NUMBER(7)       NOT NULL,             -- 책가격
    BIMAGE1     VARCHAR2(30)    NOT NULL,             -- 책 대표 이미지(첨부 안 할 경우 : noImg.png 로 대체) 
    BIMAGE2     VARCHAR2(30)    NOT NULL,             -- 책 부가 이미지(첨부 안 할 경우 : NOTHING.JSP 로 대체)
    BCONTENT    VARCHAR2(4000),                       -- 책 설명(한글 1,333글자 이내)
    BDISCOUNT   NUMBER(3)       NOT NULL,             -- 할인율(0~100% 이내)
    BRDATE      DATE            DEFAULT SYSDATE       -- 책 등록일
);

SELECT * FROM BOOK;
 
-- 책등록
INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
    VALUES(BOOK_SEQ.NEXTVAL, '이것은 자바다', 30000, 'noImg.png','NOTHING.JPG','책설명',20);
INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
    VALUES(BOOK_SEQ.NEXTVAL, 'JSP도서', 23000, 'NOTHING.JPG','noImg.png','책설명',10);
INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
    VALUES(BOOK_SEQ.NEXTVAL, 'Spring', 30000, 'noImg.png','NOTHING.JPG','책설명',5);
INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
    VALUES(BOOK_SEQ.NEXTVAL, '봄', 40000, 'NOTHING.JPG','noImg.png','책설명',20);

-- 책목록(전체 LIST)
SELECT * FROM BOOK ORDER BY BRDATE DESC; -- 최신순을 위에 올리기 위해 해줌 

-- **********페이징 처리 하기위해 필요한구문 
-- 책목록(top-n구문)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A)
WHERE RN BETWEEN 2 AND 3;
-- 등록된 책 갯수
SELECT COUNT(*) CNT FROM BOOK;

-- **********

-- 책 상세보기(BDI로 DTO 가져오기)
SELECT * FROM BOOK WHERE BID=1;
COMMIT;











