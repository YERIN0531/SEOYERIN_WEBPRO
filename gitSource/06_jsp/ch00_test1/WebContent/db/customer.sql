DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    cID         VARCHAR2(50) PRIMARY KEY,
    CPW         VARCHAR2(50) NOT NULL,
    cNAME       VARCHAR2(50) NOT NULL,
    cTEL        VARCHAR2(50) NOT NULL,
    cMAIL       VARCHAR2(50),
    cADDRESS    VARCHAR2(250),
    cGENDER     VARCHAR2(10) NOT NULL,
    cBIRTH      DATE NOT NULL,
    cRDATE      DATE NOT NULL
);

SELECT * FROM CUSTOMER;

--1. 회원가입시 ID 중복 체크를 위한 SQL : public int confirmID(String cid)
SELECT * FROM CUSTOMER WHERE cID='aaa';

--2. 회원가입 SQL : public int joinCustomer(CustomerDto dto)
INSERT INTO CUSTOMER (cID, CPW, cNAME, cTEL, cMAIL, cADDRESS, cGENDER, cBIRTH, cRDATE)
 VALUES('aaa','1','홍길동','010-111-111','hong@ho.co','구로구','m','1995-05-31',SYSDATE);

--3. 로그인(id/pw) SQL : public int loginCheck (String cid, String cpw) 
SELECT cID, CPW FROM CUSTOMER WHERE cID='aaa';

--4. ID로 dto 가져오기  : public CustomerDto getMember(String cid)
SELECT * FROM CUSTOMER WHERE cID='aaa';

--5. 회원정보 수정 (modify) : public CustomerDto modifyCustomer (CustomerDto dto)
UPDATE CUSTOMER SET CPW='111',
                  cNAME ='신길동',
                  cTEL = '010-222-222',
                  cGENDER ='m',
                  cMAIL ='a@a.com',
                  cBIRTH ='1990-01-01',
                  cADDRESS ='서울시 용산구'
                  WHERE cID='aaa';
COMMIT;