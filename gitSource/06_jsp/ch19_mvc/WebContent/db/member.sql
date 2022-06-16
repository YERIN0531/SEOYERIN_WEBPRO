DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
    ID      VARCHAR2(30) PRIMARY KEY,
    PW      VARCHAR2(30) NOT NULL,
    NAME    VARCHAR2(30) NOT NULL,
    BIRTH   DATE,
    RDATE   DATE DEFAULT SYSDATE NOT NULL);
-- 회원가입 
INSERT INTO MEMBER(ID, PW, NAME, BIRTH)
    VALUES ('aaa','1','홍길동','1995-05-31');
-- 회원리스트
SELECT * FROM MEMBER;
 COMMIT;