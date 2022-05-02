--DROP TABLE & SEQUENCE
DROP TABLE CUSTOMER;
DROP SEQUENCE CUS_SEQ;

-- CREATE TABLE & SEQUENCE
CREATE SEQUENCE CUS_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    NOCYCLE
    NOCACHE;
    
CREATE TABLE CUSTOMER (
    CNO     NUMBER(5) PRIMARY KEY,
    CTEL    VARCHAR2(20) NOT NULL,
    CNAME   VARCHAR2(30) NOT NULL,
    POINT   NUMBER(10) DEFAULT 1000
);    

SELECT * FROM CUSTOMER;

-- 더미데이터 집어 넣기 
INSERT INTO CUSTOMER (CNO, CTEL,CNAME) VALUES (CUS_SEQ.NEXTVAL,'010-1111-1111','홍길동');
INSERT INTO CUSTOMER VALUES (CUS_SEQ.NEXTVAL,'010-2222-2222','김길동',0);
INSERT INTO CUSTOMER VALUES (CUS_SEQ.NEXTVAL,'010-3333-2222','박길동',0);


-- 요구사항 
-- 1. 가입버튼 (회원가입을 눌러 INSERT)
-- pulbic int insertCustomer (String ctel, String cname)
INSERT INTO CUSTOMER (CNO, CTEL, CNAME) VALUES (CUS_SEQ.NEXTVAL,'010-4444-4444','홍길동');

-- 2. 폰조회 (폰 뒤자리 4자리로 전체 조회되고 조회된 결과는 뿌리기, 동명이인일 경우 모두 출력된다)
-- public ArrayList<CustomerDto> ctelGetCustomer(String ctel);
SELECT * FROM CUSTOMER WHERE CTEL LIKE '%'||'4444';
COMMIT;
-- 3. 출력버튼을 클릭하면 가입된 모든 회원 정보를 뿌린다
-- public ArrayList<CustomerDto> getCustomer()
SELECT * FROM CUSTOMER;
DELETE FROM CUSTOMER WHERE CNO=13;
COMMIT;
-- 4. 종료버튼을 누르기 

-- 이름은 두자리 이상 
-- 9999 가 없으면 없다고 
-- 9999가 한명이면 위에
-- 밑에 



