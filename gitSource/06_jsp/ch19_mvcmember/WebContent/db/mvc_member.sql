-- DROP & CREATE
DROP TABLE MVC_MEMBER;
CREATE TABLE MVC_MEMBER(
    MID      VARCHAR2(30) PRIMARY KEY,
    MPW      VARCHAR2(30) NOT NULL,
    MNAME    VARCHAR2(30) NOT NULL,
    MEMAIL   VARCHAR2(30) ,
    MPHOTO   VARCHAR2(30) NOT NULL,     -- 회원가입시 사진 업로드를 안할시 기본 이미지로(NOIMG.JPG)
    MBIRTH   DATE,
    MADDRESS VARCHAR2(300),
    MRDATE   DATE DEFAULT SYSDATE NOT NULL
);

SELECT * FROM MVC_MEMBER;

-- 1. 회원가입 중복 확인 
-- 2. 회원가입
-- 3. 로그인(ID,PW)
-- 4. 회원목록LIST
-- 5. ID로 DTO 가져오기 
-- 6. 회원정보 수정 
-- 7. 등록된 회원수



-- 1. 회원가입 중복 확인 
SELECT * FROM MVC_MEMBER WHERE MID='aaa';
-- 2. 회원가입
INSERT INTO MVC_MEMBER(MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES('aaa', '111', '서예린', 'seo@naver.com','ham.jpg','1995-05-31','서울시 구로구');
INSERT INTO MVC_MEMBER(MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES('bbb', '111', '김예린', 'kim@naver.com','ham.jpg','1995-04-25','서울시 강남구');
INSERT INTO MVC_MEMBER(MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES('bbb', '111', '이예린', 'kim@naver.com','ham.jpg','1995-04-25','서울시 강남구');
    INSERT INTO MVC_MEMBER(MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES('bbb', '111', '김예린', 'kim@naver.com','ham.jpg','1995-04-25','서울시 강남구');
    INSERT INTO MVC_MEMBER(MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES('bbb', '111', '김예린', 'kim@naver.com','ham.jpg','1995-04-25','서울시 강남구');
    




-- 3. 로그인(ID,PW)
SELECT * FROM MVC_MEMBER WHERE MID='aaa' AND MPW='111';
-- 4. 회원목록LIST

 SELECT * FROM (SELECT ROWNUM RN, A.* 
 FROM (SELECT * FROM MVC_MEMBER ORDER BY MRDATE DESC)A) 
 WHERE RN BETWEEN 1 AND 2;
-- 5. ID로 DTO 가져오기 
SELECT * FROM MVC_MEMBER WHERE MID='bbb';
-- 6. 회원정보 수정 
UPDATE MVC_MEMBER SET MPW='111',
                      MNAME='강예린',
                      MEMAIL='kang@com',
                      MBIRTH='1999-12-12',
                      MADDRESS='부산'
                      WHERE MID = 'bbb';
                      
                      

-- 7. 등록된 회원수
SELECT COUNT(*) CNT FROM MVC_MEMBER;

-----------------------------------------------------------------------
-- 밑에는 선생님꺼 
-- DROP & CREATE
DROP TABLE MVC_MEMBER;
CREATE TABLE MVC_MEMBER(
    mID VARCHAR2(30) PRIMARY KEY,
    mPW VARCHAR2(30) NOT NULL,
    mNAME VARCHAR2(30) NOT NULL,
    mEMAIL VARCHAR2(30),
    mPHOTO VARCHAR2(30) NOT NULL, -- 회원가입시 사진업로드를 안 할시 기본 이미지로(NOIMG.JPG)
    mBIRTH DATE,
    mADDRESS VARCHAR2(300),
    mRDATE DATE DEFAULT SYSDATE NOT NULL    
);
-- DUMMY DATA
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('gayun','1','김가연','gayun@naver.com','gayun.jpg','1972/09/09','광주광역시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('gico','1','지코','gico@naver.com','gico.jpg','1992/09/14','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('go','1','고소영','go@naver.com','go.jpg','1972/10/06','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('ham','1','함소원','ham@naver.com','ham.jpg','1976/06/16','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('han','1','한지민','han@naver.com','han.jpg','1982/11/05','서울시');
-- dao에 들어갈 query
-- (1) 로그인
SELECT * FROM MVC_MEMBER WHERE mID='ham' and mPW='1';
-- (2) mid로 dto가져오기(로그인 성공시 session에 넣기 위함)
SELECT * FROM MVC_MEMBER WHERE mId='ham';
-- (3) 회원id 중복체크
SELECT * FROM MVC_MEMBER WHERE mId='ham';
-- (4) 회원가입
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('aaa','1','홍길동','hong@naver.com','NOIMG.JPG','1998/12/12','강남');
-- (5) 회원정보 수정
UPDATE MVC_MEMBER SET mPw = '1',
                    mName = 'HONG',
                    mEmail = 'yi@naver.com',
                    mPhoto = 'NOIMG.JPG',
                    mBirth = '1991/12/12',
                    mAddress = '서울'
        WHERE mId='ham';
        
-- (6) 회원리스트(top-N구문)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
                        (SELECT * FROM MVC_MEMBER ORDER BY mRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10;
-- (7) 회원수
SELECT COUNT(*) cnt FROM MVC_MEMBER;
COMMIT;



