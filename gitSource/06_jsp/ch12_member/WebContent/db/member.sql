-- TABLE DROP & CREATE
DROP TABLE MEMBER CASCADE CONSTRAINTS; -- 제약조건을 무시하고 지우는 것 

CREATE TABLE MEMBER (
    ID      VARCHAR2(30) PRIMARY KEY,
    PW      VARCHAR2(30) NOT NULL,
    NAME    VARCHAR2(30) NOT NULL,
    PHONE1  VARCHAR2(5),
    PHONE2  VARCHAR2(5),
    PHONE3  VARCHAR2(5),
    GENDER  VARCHAR2(1),
    EMAIL   VARCHAR2(30),
    BIRTH   DATE ,
    RDATE   DATE NOT NULL, -- 가입일
    ADDRESS VARCHAR2(200)
);
SELECT * FROM MEMBER;
--1. 회원가입시 ID 중복 체크를 위한 SQL : public int confirmID(String id)
SELECT * FROM MEMBER WHERE ID='aaa';

--2. 회원가입 SQL : public int joinMember(MemberDto dto)
INSERT INTO MEMBER (ID, PW, NAME, PHONE1, PHONE2, PHONE3, GENDER, EMAIL, BIRTH, RDATE, ADDRESS)
 VALUES('aaa','111','홍길동','02','1111','1111','m','hong@h.com','1995-12-12',SYSDATE,'서울');

--3. 로그인(id/pw) SQL : public int loginCheck (String id, String pw) 
SELECT ID, PW FROM MEMBER WHERE ID='aaa';

--4. ID로 dto 가져오기  : public MemberDto getMember(String id)
SELECT * FROM MEMBER WHERE ID='aaa';

--5. 회원정보 수정 (modify) : public MemberDto modifyMember (MemberDto dto)
UPDATE MEMBER SET PW='111',
                  NAME ='신길동',
                  PHONE1 ='010',
                  PHONE2 ='9999',
                  PHONE3 ='8888',
                  GENDER ='m',
                  EMAIL ='a@a.com',
                  BIRTH ='1990-01-01',
                  ADDRESS ='서울시 용산구'
                  WHERE ID='aaa';

COMMIT;

SELECT * FROM MEMBER;










