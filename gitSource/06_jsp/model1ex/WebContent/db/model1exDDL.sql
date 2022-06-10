-- 테이블 & 시퀀스 drop 및 create
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER(
    CID         VARCHAR2(50) PRIMARY KEY,
    CPW         VARCHAR2(50) NOT NULL,
    CNAME       VARCHAR2(50) NOT NULL,
    CTEL        VARCHAR2(50) NOT NULL,
    CEMAIL      VARCHAR2(50),
    CADDRESS    VARCHAR2(250),
    CGENDER     VARCHAR2(10) NOT NULL,
    CBIRTH      DATE         NOT NULL,
    CRDATE      DATE DEFAULT SYSDATE
);


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



DROP SEQUENCE FILEBOARD_SEQ;
DROP TABLE FILEBOARD;
CREATE SEQUENCE FILEBOARD_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;

CREATE TABLE FILEBOARD(
    FNUM        NUMBER(7)       PRIMARY KEY, 
    CID         VARCHAR2(50)    REFERENCES CUSTOMER(CID),
    FSUBJECT    VARCHAR2(250)   NOT NULL,
    FCONTENT    VARCHAR2(4000),
    FFILENAME   VARCHAR2(50),               --첨부파일명
    FPW         VARCHAR2(50)    NOT NULL,
    FHIT        NUMBER(7)       DEFAULT 0 NOT NULL ,
    FREF        NUMBER(7)       NOT NULL,
    FRE_STEP    NUMBER(7)       NOT NULL,
    FRE_LEVEL   NUMBER(7)       NOT NULL,
    FIP         VARCHAR2(50)    NOT NULL,
    FRDATE      DATE DEFAULT SYSDATE NOT NULL
);

