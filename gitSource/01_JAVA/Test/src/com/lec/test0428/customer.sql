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

-- ���̵����� ���� �ֱ� 
INSERT INTO CUSTOMER (CNO, CTEL,CNAME) VALUES (CUS_SEQ.NEXTVAL,'010-1111-1111','ȫ�浿');
INSERT INTO CUSTOMER VALUES (CUS_SEQ.NEXTVAL,'010-2222-2222','��浿',0);
INSERT INTO CUSTOMER VALUES (CUS_SEQ.NEXTVAL,'010-3333-2222','�ڱ浿',0);


-- �䱸���� 
-- 1. ���Թ�ư (ȸ�������� ���� INSERT)
-- pulbic int insertCustomer (String ctel, String cname)
INSERT INTO CUSTOMER (CNO, CTEL, CNAME) VALUES (CUS_SEQ.NEXTVAL,'010-4444-4444','ȫ�浿');

-- 2. ����ȸ (�� ���ڸ� 4�ڸ��� ��ü ��ȸ�ǰ� ��ȸ�� ����� �Ѹ���, ���������� ��� ��� ��µȴ�)
-- public ArrayList<CustomerDto> ctelGetCustomer(String ctel);
SELECT * FROM CUSTOMER WHERE CTEL LIKE '%'||'4444';
COMMIT;
-- 3. ��¹�ư�� Ŭ���ϸ� ���Ե� ��� ȸ�� ������ �Ѹ���
-- public ArrayList<CustomerDto> getCustomer()
SELECT * FROM CUSTOMER;
DELETE FROM CUSTOMER WHERE CNO=13;
COMMIT;
-- 4. �����ư�� ������ 

-- �̸��� ���ڸ� �̻� 
-- 9999 �� ������ ���ٰ� 
-- 9999�� �Ѹ��̸� ����
-- �ؿ� 



