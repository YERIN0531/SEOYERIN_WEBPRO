---[VII] DDL, DML, DCL 
-- SQL = DDL (���̺� ����, ���̺� ����, ���̺� ��������, ���̺� ��� ������ ����) -ROLLBACK �ȵ� 
--       DML (�˻� : SELECT, �߰� : INSERT, ���� : UPDATE, ���� : DELETE)
--       DCL (����ڰ�������, ����ڱ��Ѻο�, ���ѹ�Ż, ����ڰ�������, Ʈ����� ��ɾ� : ROLLBACK, COMMIT)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- �ڡڡ�DDL�ڡڡ� -------------------- 
        
        -- 1. ���̺� ���� (CREATE TABLE)
CREATE TABLE BOOK(
        BOOKID      NUMBER(4),            -- ������ȣ BOOKID �ʵ� Ÿ���� ���� 4�ڸ� 
        BOOKNAME    VARCHAR2(300),        -- �ѱ� 10����(�����̽� ����)���� 300BYTE
        PUBLISHER   VARCHAR2(300),        -- ���ǻ� PUBLISHER �ʵ�� ���� 300BYTE
        RDATE       DATE,                 -- ������ RDATE �ʵ�� DATE��
        PRICE       NUMBER(8),            -- ���� PRICE �ʵ�� ���� 8�ڸ� 
        PRIMARY KEY(BOOKID) );            -- ���̺� �� ��Ű(PRIMARY KEY) ���� 
                                          -- NOT NULL, ������ �� �Է� 
SELECT * FROM BOOK; 
DROP TABLE BOOK;                          -- ���̺� ����� �� 

CREATE TABLE BOOK (
        BOOKID      NUMBER(4) PRIMARY KEY , 
        BOOKNAME    VARCHAR2(20),
        PUBLISHER   VARCHAR2(20),
        RDATE       DATE,
        PRICE       NUMBER(8));
SELECT * FROM BOOK;
DESC EMP;
SELECT ROWNUM, EMPNO, ENAME FROM EMP;       -- ROWNUM : ���̺��� �о�帰 ���� ����
SELECT ROWNUM, EMPNO, ENAME FROM EMP WHERE DEPTNO=20 ORDER BY ENAME;
SELECT * FROM EMP;

--ex 1. EMP ���̺�� ������ ������ EMP01 : EMPNO(����4), ENAME(����20), SAL(����7,2)
-- �������� ���� ���̺� ����� �� 
CREATE TABLE EMP01 (
        EMPNO       NUMBER(4),
        ENAME       VARCHAR2(20),
        SAL         NUMBER(7,2) );

--ex 2. DEPT ���̺�� ������ ������ DEPT01 : DEPTNO(����2), DNAME(����14), LOC(���� 13) 
CREATE TABLE DEPT01 (
        DEPTNO      NUMBER(2),
        DNAME       VARCHAR2(14),
        LOC         VARCHAR2(13),
        PRIMARY KEY (DEPTNO) );
DESC DEPT01;
DESC DEPT;

--ex 3. ���������� �̿��� ���̺� ���� (���� OR ���� �Ȱ��� ���̺��� ����� ���� �� )
CREATE TABLE EMP02 AS SELECT * FROM EMP; -- �������� ����� EMP02 ���̺� ���� �� ��
                                         -- ��, ���������� ������  
DESC EMP02;
SELECT * FROM EMP02; -- �������� ������
SELECT * FROM EMP;

--ex 4. EMP03 : EMP ���̺��� EMPNO, ENAME, DPTNO�� ������ �����ͷ� ���̺� ����
CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP;
SELECT * FROM EMP03;

--ex 5. EMP04 : EMP ���̺��� 10�� �μ��� ������ �����ͷ� ���̺� ����
CREATE TABLE EMP04 AS SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP04;

--ex 6. EMP05 : EMP ���̺��� ����(�ʵ�� ���� Ÿ��)�� ����  -- ������ FALSE�� �ǵ��� 
--ex) DEPTNO�� 50 �� �μ��� ����. DEPTNO�� 50�� �μ��� �����Ͷ� �ϸ� ������ ������ �� 
CREATE TABLE EMP05 AS SELECT * FROM EMP WHERE 1=0;
SELECT * FROM EMP05;
DESC EMP05; --DESC ���� �ּ� ���� ����� ������ �ȵ� 



        --2. ���̺� ���� ���� (ALTER TABLE) : �ʵ� �߰� OR ���� OR ����
        -- ALTER TABLE ���̺�� ADD OR DROP OR MODIFY

-- �� �ʵ� �߰�(ADD) : �߰��� �ʵ��� �����Ϳ��� NULL�� �� (�����Ϳ� �� �������� �ϳ� �ϳ� �� ������ ��)
SELECT * FROM EMP03;    -- EMPNO, ENAME, DEPTNO
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2));
SELECT * FROM EMP03;    
ALTER TABLE EMP03 ADD(COMM NUMBER(7,2));

-- �� �ʵ� ����(MODIFY) : 
SELECT * FROM EMP03;    -- EMPNO(��4),ENAME(��10),DPTNO(��2),JOB(��20),SAL&COMM(��7,2)
                        -- EMPNO, ENAME, DEPTNO / JOB, SAL, COMM 
                        -- �����Ͱ� �ȵ� �ִ� �ֵ�(NULL)�� ������ ���� �� �� ���� 
                        -- �����Ͱ� �� �ִ� �ֵ��� �׳� �����ϸ� ���������� 
                        -- EX)������ ����(10)->20 ����, ����(10)->2 �Ұ��� 
DESC EMP03;
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR2(4)); -- ������ ��� �ֱ� ������ �Ұ���
                                              -- ���� �����ʹ� ���ڷθ� ���� ���� 
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(3));   -- ���� �����ͺ��� ū ���� ����
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(5));   -- ���� 

ALTER TABLE EMP03 MODIFY (ENAME NUMBER(4));   -- ���� �����ʹ� ���ڷθ� ���� ���� 
SELECT MAX(LENGTH(ENAME)) FROM EMP;           -- ���� �� ���ڰ� ������ �ñ��ؼ� �Ѹ���
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(3000));
DESC EMP03;

ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(6)); -- 6���ڰ� �ִ�� �̰� ���� (�ٽ����̱�)
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(5)); -- �Ұ��� (6BYTE ���ڰ� �ֱ� ������)

ALTER TABLE EMP03 MODIFY (JOB VARCHAR2(2));   -- JOB�� NULL���̶� �����Ӱ� ���� ����
ALTER TABLE EMP03 MODIFY (JOB NUMBER(4));


        -- �ʵ� ���� (DROP) : ROLLBACK �� �ȵǱ� ������ ������ �ؾ��� (�����͵� ����)
        -- DROP�� �ϴ� ���� ROCKó���� �Ǽ� �ܺο��� ������ �ȵ� 
        -- '�ý����������Դϴ�' �̷� �κ� �� ���� �� ó�� �ϰ� ���� �� 
        -- ������� ������ ���� ���� 3�� �̷��� ó���Ҷ��� ���� 
        
ALTER TABLE EMP03 DROP COLUMN JOB;            -- JOB �ʵ� ���� 
SELECT * FROM EMP03;
        -- �������� Ư�� �ʵ带 ���� ���ϵ��� ó�� (��) 
ALTER TABLE EMP03 SET UNUSED (DEPTNO);        
        -- �������� ���� �Ұ��ߴ� �ʵ带 ���������� ����(����)_DROP
ALTER TABLE EMP03 DROP UNUSED COLUMNS;        


        --3. ���̺� ���� (DROP TABLE)         
DROP TABLE EMP01;
DROP TABLE DEPT; -- PARENTTABLE�� �ֱ� ������ ������ �ȵ�. EMP�� DEPTNO�ֱ� ������ 
                 -- �����ϰ� ������ EMP���̺� �����, DEPT �����ߵ�
                 -- �ٸ� ���̺��� �����ϴ� ���̺� ���� ��� DROP�� �ȵ� (�ٸ� ������� �ؾ���)

        --4. ���̺��� ��� ���� ���� (TRUNCATE)
SELECT * FROM EMP03;
TRUNCATE TABLE EMP03;       --EMP03���� ��� ������ ���� (��� �Ұ�)
SELECT * FROM EMP03;

        --5. ���̺�� ���� (RENAME �����̸� TO ���̸�)
SELECT * FROM EMP02;
RENAME EMP02 TO EMP2;
SELECT * FROM EMP2;
SELECT * FROM EMP;

        --6. ������ DICTIONARY (���� �Ұ�) VS ������ DITIONARY VIEW (����� ���ٿ�)
                                --------- ���� ---------
        -- USER_XXX : �� ������ �����ϰ� �ִ� ��ü(���̺�, �ε���, ��������, ��)
            -- ex. USER_TABLES, USER_INDEXES, USER_CONSTRAINTS, USER_VIEWS
        -- ALL_XXX  : �� ������ ���� ������ ��ü(���̺�, �ε���, ��������, ��)
            -- ex. ALL_TABLES, ALL_INDEXES, ALL_CONSTRAINTS, ALL_VIEWS
        -- DBA_XXX  : DBA�����ڸ� ���ٰ���. DBMS�� ��� ��ü
            -- ex. DBA_TABLES, DBA_INDEXES, DBA_CONSTRAINTS, DBA_VIEWS

--USER_XXX        
SELECT * FROM USER_TABLES;      -- �� ������ ������ ���̺� ��ü ����
SELECT * FROM USER_INDEXES;     -- �� ������ ������ �ε��� ���� 
SELECT * FROM USER_CONSTRAINTS; -- �� ������ ������ �������ǵ� 
SELECT * FROM USER_VIEWS;       -- �� ������ ������ �� ���� 
--ALL_XXX
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_INDEXES;
SELECT * FROM ALL_CONSTRAINTS;
SELECT * FROM ALL_VIEWS;
--DBA_XXX
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_INDEXES;
SELECT * FROM DBA_CONSTRAINTS;
SELECT * FROM DBA_VIEWS;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- �ڡڡ�DCL�ڡڡ� -------------------- 
        -- ����ڰ�������, ����ڱ��Ѻο�, ���ѹ�Ż, ����ڰ�������

-- scott2 ���� ���� 
CREATE USER scott2 IDENTIFIED BY 1234;      

-- ���� �ο�(���Ǳ���, scott.EMP, scott.DEPT ���̺� ���� ��� ���� �ο�)
GRANT CREATE SESSION TO scott2;     -- EMP�� DEPT ���̺� ���� ���Ѹ� �ο�
                                    -- ���̺� ����� ������ SESSION ��� TABLE 
                                    -- ���̺� ���� �۾� �ƹ��͵� ���� 
GRANT ALL ON EMP TO scott2;         -- EMP ���̺� ���� ��� ����(�˻�,�߰�,����,����)
                                    -- ���̺��� �Ϻο� ���ؼ��� ���� ����� ������, VIEW�� ���� �� �� VIEW�� ���� �ο��ϸ� ��
GRANT ALL ON DEPT TO scott2;        -- DEPT ���̺� ���� ��� ���� 

SHOW USER;

-- ���� ��Ż (���ѹ�Ż�� ����ڰ����� �������� �� ��Ȳ�̿��� ������ ��Ż ����)
REVOKE ALL ON EMP FROM scott2;      -- ���� SCOTT2�� EMP ���̺� �� �� ���� 
                                    -- scott2�� EMP ���̺� ���� ��� ���� ��Ż
REVOKE ALL ON DEPT FROM scott2;
SHOW USER;

-- ����� ���� ���� (���� ���� ���� ���� �Ұ�)
DROP USER scott2 CASCADE;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- �ڡڡ�DML�ڡڡ� -------------------- 
        -- SELECT , INSERT, UPDATE, DELETE
        
        -- 1. INSERT INTO ���̺�� VALUES(��1,��2,��3....)
        --    INSERT INTO ���̺�� (�ʵ��1, �ʵ��2,..) VALUES (��1, ��2, ..);      
        
SELECT * FROM DEPT01;
INSERT INTO DEPT01 VALUES(50,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (60, 'IT', 'SEOUL');
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (70,'OPERATION');     -- ���������� LOC�� NULL �߰�
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (80,'HR',NULL);  -- ��������� LOC�� NULL �߰� 
INSERT INTO DEPT01 VALUES (90, 'SALES', NULL); --��������� NULL �߰�

--���������� �̿��� INSERT
INSERT INTO DEPT01 SELECT * FROM DEPT;

-- Ʈ����� ��ɾ�(DML ��ɾ) 
-- INSERT �Ѵٰ� �ٷ� �����Ϳ� �ö󰡴°� �ƴ϶�, Ʈ������ ����(������) ���� ���� �ö� 
-- Ŀ�� �ϸ� Ʈ����ǿ� �ִ� ���� ������ ���̽��� �ö� 
-- ���Ŀ� �ѹ��� �ϸ� ������ Ʈ����ǿ� �ִ� ������ �̹� �� �����̴� �ǹ̰� ���� 
COMMIT;

        -- 2. UPDATE ���̺�� SET �ʵ��1 = ��1 [, �ʵ��2 = ��2, ...] [WHERE ����] ;
CREATE TABLE EMP01 AS SELECT * FROM EMP; 

--EMP01 ���̺��� �μ���ȣ�� 30���� ���� (WHERE ���� ������ ��� ���� ����) 
UPDATE EMP01 SET DEPTNO=30;
ROLLBACK;                   --DML��ɾ� ��� [Ʈ����� ���] DML�� ���� 
SELECT * FROM EMP01;
--EMP01 ���̺��� ��� ����� �޿��� 10% �λ� 
UPDATE EMP01 
    SET SAL = SAL*1.1;
SELECT * FROM EMP01;
--EMP01 ���̺��� 10�� �μ� ������ �Ի����� ���÷�, �μ���ȣ�� 30������ ���� 
UPDATE EMP01
    SET HIREDATE = SYSDATE, 
        DEPTNO = 30 
    WHERE DEPTNO = 10;
SELECT * FROM EMP01;        

--SAL�� 3000 �̻��� ����� SAL�� 10% �λ�
UPDATE EMP01
    SET SAL = SAL*1.1
    WHERE SAL >=3000;
SELECT * FROM EMP01;    
    
-- 'DALLAS'�� �ٹ��ϴ� ������ �޿��� 1000$�� �λ�(�������� ���)
UPDATE EMP01 SET SAL = SAL + 1000
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');

-- SCOTT �� �μ���ȣ�� 20����, JOB�� MANAGER��, SAL�� COMM�� 500�� �λ�, ��縦 KING���� ���� 
UPDATE EMP01
    SET DEPTNO = 20,
        JOB = 'MANAGER',
        SAL = SAL + 500,
        COMM = NVL(COMM,0)+500,
        MGR =(SELECT EMPNO FROM EMP WHERE ENAME = 'KING') 
    WHERE ENAME = 'SCOTT';
SELECT * FROM EMP01 WHERE ENAME = 'SCOTT';    

-- DEPT01���� 20������ �������� DEPT ���̺��� 60�������� ���������� ����         
SELECT * FROM DEPT01;   
UPDATE DEPT01 
    SET LOC = (SELECT LOC FROM DEPT WHERE DEPTNO=60)
    WHERE DEPTNO >= 20; -- DEPT���̺����� 60���μ��� ��� NULL������ ���� 

-- EMP01 ���̺��� ��� ����� �޿��� �Ի����� 'KING'�� �޿��� �Ի��Ϸ� ���� 
COMMIT;
UPDATE EMP01 
    SET (SAL , HIREDATE) = (SELECT SAL, HIREDATE FROM EMP WHERE ENAME = 'KING');
SELECT * FROM EMP01;        
        
-- DEPT01 ���̺��� 20�� �μ��� ������� �μ����� 40�� �μ��� ������� �μ������� ����
UPDATE DEPT01
    SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT01 WHERE DEPTNO = 40)
    WHERE DEPTNO = 20;
ROLLBACK;
SELECT DNAME, LOC FROM DEPT01;
COMMIT;  
        -- 3. DELETE FROM ���̺�� [WHERE ����];
        -- WHERE ���� �� �� ��� ��ü ���� ��� ���� 
SELECT * FROM EMP01;
DELETE FROM EMP01;
ROLLBACK;

-- EMP01 ���̺��� 'FORD'�� ����� ���� 
DELETE FROM EMP01
WHERE ENAME = 'FORD';

SELECT * FROM EMP01;

-- EMP01 ���̺��� 30�� �μ� ������ ���� 
DELETE FROM EMP01
WHERE DEPTNO = 30;
SELECT * FROM EMP01;

-- EMP01 ���̺��� �μ����� RESEARCH �μ�
DELETE FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
SELECT * FROM EMP01;

-- SAM01 ���̺��� JOB�� �������� ���� ����� �����Ͻÿ� (JOB�� NULL�� ����)
SELECT * FROM SAM01;
DELETE FROM SAM01
WHERE JOB IS NULL;

-- SAM01 ���̺��� ENAME �� ORANGE �� ����� �����Ͻÿ� 
DELETE FROM SAM01
WHERE ENAME = 'ORANGE';
SELECT * FROM SAM01;
COMMIT;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
        -------------------- �ڡڡڿ������� 1�ڡڡ� -------------------- 
        --INSERT INTO SAM01 VALUES(1000,'APPLE','POLICE',10000);
-- 1. MY_DATA ���̺� ���� (��, ID �� PRIMARY KEY)
CREATE TABLE MY_DATA (
        ID          NUMBER(4) PRIMARY KEY,
        NAME        VARCHAR2(10),
        USERID      VARCHAR2(30),
        SALARY      NUMBER(10,2));
SELECT * FROM MY_DATA;
--2. ������ ���̺� ���� ��ǥ�� ���� ���� �Է��ϴ� SQL���� �ۼ� 
INSERT INTO MY_DATA VALUES(1,'Scott','sscott',10000);
INSERT INTO MY_DATA VALUES(2,'Ford','fford',13000);
INSERT INTO MY_DATA VALUES(3,'patel','ppatel',33000);
INSERT INTO MY_DATA VALUES(4,'Report','rreport',23500);
INSERT INTO MY_DATA VALUES(5,'Good','ggood',44450);

--3. TO_CHAR �����Լ��� �̿��Ͽ� �Է��� �ڷḦ ���� ��ǥ�� ���� �������� ����ϴ� SQL���� �ۼ��Ͻÿ�       
SELECT ID, NAME, USERID, TO_CHAR(SALARY,'99,999.99') FROM MY_DATA ;       

--4. �ڷḦ ���������� �����ͺ��̽��� ����ϴ� ��ɾ �ۼ��Ͻÿ� 
COMMIT;

--5. ID�� 3���� ����� �޿��� 65000.00���� �����ϰ� ���������� ������ ���̽��� �ݿ��϶� 
UPDATE MY_DATA 
    SET SALARY = 65000 
    WHERE ID = 3;
SELECT * FROM MY_DATA;       

-- 6. NAME�� FORD�� ����� �����ϰ� ���������� ������ ���̽��� �ݿ��϶� 
DELETE FROM MY_DATA WHERE NAME = 'Ford';       
SELECT * FROM MY_DATA;
COMMIT;

--7. SAYARY�� 15,000 ������ ����� �޿��� 15,000���� �����϶� 
UPDATE MY_DATA
    SET SALARY = 15000
    WHERE SALARY <=15000;
SELECT * FROM MY_DATA;

--8. ������ ������ ���̺��� �����ض�.
DROP TABLE MY_DATA;


        -------------------- �ڡڡڿ������� 2�ڡڡ� -------------------- 
---INSERT INTO DEPT01 VALUES(50,'ACCOUNTING','NEW YORK');
-- CONSTRAINS SAM_PK �� �������� �̸��� ����� �� (�ȸ��� �Ǳ� ��)
CREATE TABLE SAM01(
        EMPNO       NUMBER(4)CONSTRAINTS SAM_PK PRIMARY KEY,
        ENAME       VARCHAR2(10),
        JOB         VARCHAR2(9),
        SAL         NUMBER(7,2));
SELECT * FROM SAM01;
SELECT * FROM USER_CONSTRAINTS;
DROP TABLE SAM01;
INSERT INTO SAM01 VALUES(1000,'APPLE','POLICE',10000);
INSERT INTO SAM01 VALUES(1010,'BANANA','NURSE',15000);
INSERT INTO SAM01 VALUES(1020,'ORANGE','DOCTOR',25000);
INSERT INTO SAM01 VALUES(1030,'VERY',NULL,25000);
INSERT INTO SAM01 VALUES(1040,'CAT',NULL,2000);
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;

-- Ʈ����� ��ɾ�
COMMIT;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- �ڡڡ��������ǡڡڡ� -------------------- 
        -- �������� �����Ͱ� ���̺� ����, ���� �Ǵ� ���� �����ϱ� ���� 

SELECT * FROM EMP;
INSERT INTO EMP VALUES (7369,'ȫ',NULL,NULL,SYSDATE,NULL,NULL,40); -- ������ ���������� EMPNO�� �ɾ���� ������ ������ ������ ���� �Ұ���
                                                                   -- SMITH ����� �ߺ� ���� 
UPDATE EMP SET EMPNO = 7369 WHERE ENAME='ALLEN';                   -- SMITH ����� �ߺ� ���� 

        -- �� �� PRIMARY KEY : �����ϰ� ���̺��� �� ���� �ĺ� . NOT NULL (NULL �� �Է��ϸ� �ȵ�)
        
    INSERT INTO EMP(EMPNO, ENAME, DEPTNO) VALUES (7369,'ȫ',40);        
    
        -- ��    NOT NULL : NULL ���� �������� ���� 
        
        -- ��    UNIQUE : ��� �࿡ ���� �����ؾ���. NULL���� ��� (NULL�� ������ �Է� ����)
        
        -- �� �� FOREIGN KEY : ���̺��� ���� �ٸ� ���̺��� ���� ����
            -- ��ĺ����� : �θ����̺��� ��Ű�� �ڽ����̺��� �ϹݼӼ��� ���� �ʵ�� ���踦 �δ� �� (exERD���� ��������ȭ��ǥ)
            -- �ĺ�����   : �θ����̺��� ��Ű�� �ڽ����̺��� ��Ű�� ���� �ʵ�� ���踦 �δ� �� (exERD���� �ʷ�����ȭ��ǥ)
            
    INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (1111,'ȫ',90); -- DEPT ���̺� 90�� �μ��� ��� ����
                                                                  -- �ܷ�Ű�� 90�� �Է� �Ұ�               
 
        -- ex. EMP���̺��� DEPTNO�� DEPT ���̺��� DEPTNO�� ���� 
        -- ��    CHECK(����) : �ش� ������ ���� (NULL�� ���) 
        -- �� DEFAULT : �⺻�� ���� (�ش� ���� ������ �Է°��� ������ NULL�� ��)  

    DROP TABLE DEPT1;
    CREATE TABLE DEPT1(
        DEPTNO NUMBER(2) PRIMARY KEY,
        DNAME  VARCHAR2(14) UNIQUE,
        LOC    VARCHAR2(14) NOT NULL);
        
    
    DROP TABLE EMP1;
    CREATE TABLE EMP1(
        EMPNO    NUMBER(4)    PRIMARY KEY,
        ENAME    VARCHAR2(10) NOT NULL,
        JOB      VARCHAR2(9)  NOT NULL,
        MGR      NUMBER(4),
        HIREDATE DATE         DEFAULT SYSDATE,
        SAL      NUMBER(7,2)  CHECK(SAL>0),
        COMM     NUMBER(7,2),
        DEPTNO   NUMBER(2)    REFERENCES DEPT1(DEPTNO));
    
    DROP TABLE EMP1;  -- �ڽ����̺�(�����ϴ� ���̺�) �� ���� DROP 
    DROP TABLE DEPT1; -- PARENT ���̺��� ����� ������ �ڽ� ���̺��� ���� ������
                      -- �ٸ� ���̺��� �����ϴ� �ʵ尡 ������ (�θ����̺���) ���� DROP �� ��
    DROP TABLE DEPT1 CASCADE CONSTRAINTS; --���� (�����ϴ� ���̺��� �־ �����ϰ� DROP) - ȸ�翡�� �̷� �� ���� �ϸ� �ȵ� 
    
    ---���赵�� ���� �ٽ� ������ 
    CREATE TABLE DEPT1(
        DEPTNO      NUMBER(2),
        DNAME       VARCHAR2(14),
        LOC         VARCHAR2(13) NOT NULL,
        PRIMARY KEY(DEPTNO),
        UNIQUE(DNAME));
    CREATE TABLE EMP1(
        EMPNO       NUMBER(4),
        ENAME       VARCHAR2(10) NOT NULL,
        JOB         VARCHAR2(9),
        MGR         NUMBER(4),
        HIREDATE    DATE DEFAULT SYSDATE,
        SAL         NUMBER(7,2),
        COMM        NUMBER(7,2),
        DEPTNO      NUMBER(2),
        PRIMARY KEY(EMPNO),
        CHECK (SAL>0),
        FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO));
        -- NOT NULL �� DEFAULT�� �����ʿ� ����� �� 
        -- PRIMARY KEY �� NOT NULL�̸鼭 UNIQUE �� ����� ȿ�� . �� PRIMARY KEY �� �����Ұ� 
        -- ���������� ������Ÿ�� ���� �� �� FOREIGN �Ƚᵵ ������, �Ʒ��� ���� FOREIGN ���� ����ߵ� 

    SELECT * FROM DEPT1;
    SELECT * FROM EMP1;
    INSERT INTO DEPT1 SELECT * FROM DEPT;
    INSERT INTO DEPT1 VALUES (40,'IT','SEOUL'); -- PK ���� ���� 
    INSERT INTO DEPT1 VALUES (40,'IT',NULL); -- ��������� ��������, ������ ���������� �Ѹ� 
    INSERT INTO DEPT1 VALUES (50,'SALES','SEOUL'); --UNIQUE ����
    INSERT INTO DEPT1 VALUES (50,'IT',NULL); --NOT NULL ���� 
    
    INSERT INTO EMP1 (EMPNO, ENAME, DEPTNO)
        VALUES (1001, 'ȫ', 10);
    -- �ٸ� ���� NULL�� ���� �ϴµ� HIREDATE�� NULL�� �ȵ� ������ �⺻��(DEFAULT) ����� ������ 
    -- ȸ�������Ҷ� ������ �Է� ���ϴ� ���� : �̷������� �⺻���� ���Բ� �����߱� ������ 
    
    INSERT INTO EMP1 (EMPNO, ENAME, DEPTNO)
        VALUES (1001, '��', 10); -- PK ���� 
    INSERT INTO EMP1 (EMPNO,DEPTNO)
        VALUES (1002,20);        --NOT NULL ����  
    INSERT INTO EMP1 (EMPNO, ENAME, SAL)
        VALUES (1002, '��', -1); -- SAL>0 ���� (CHECK ����)
    INSERT INTO EMP1 VALUES (1002,'��',NULL,NULL,TO_DATE('95/01/01','YY/MM/DD'), 900, NULL, 99);
    -- FK ���� 
    
    
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- �ڡڡڿ��������ڡڡ� -------------------- 
    CREATE SEQUENCE BOOK_SEQ
    START WITH 100
    INCREMENT BY 100
    MAXVALUE 999
    NOCACHE
    NOCYCLE;

    DROP SEQUENCE BOOK_SEQ;    
    CREATE TABLE BOOKCATEGORY(
    CATEGORY_CODE   NUMBER(3) PRIMARY KEY,
    CATEGORY_NAME   VARCHAR2(50) UNIQUE,
    OFFICE_LOC      VARCHAR2(50) NOT NULL
    );
    SELECT * FROM BOOKCATEGORY;
    DROP TABLE BOOKCATEGORY;
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, 'ö��', '3�� �ι���'); 
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, '�ι�', '3�� �ι���'); 
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, '�ڿ�����', '4�� ���н�'); 
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, 'IT', '4�� ���н�'); 
    
    SELECT * FROM BOOK;
    DROP TABLE BOOK;
    CREATE TABLE BOOK(
    CATEGORY_CODE   NUMBER(3) REFERENCES BOOKCATEGORY(CATEGORY_CODE),
    BOOKNO      VARCHAR2(10) PRIMARY KEY,
    BOOKNAME    VARCHAR(50),
    PUBLISHER   VARCHAR(50),
    PUBYEAR     NUMBER(4) DEFAULT EXTRACT(YEAR FROM SYSDATE)
    );
    SELECT * FROM BOOK;
    DROP TABLE BOOK;
    
    INSERT INTO BOOK VALUES (100,'100A01','ö������ ��','��������',2021);
    INSERT INTO BOOK VALUES (400,'400A01','�̰��� DB��','��������',2018);
    
    
-------------------------------------------------------------------------------
CREATE SEQUENCE STUDENT_SEQ
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;
  
  CREATE TABLE MAJOR (
    MAJOR_CODE      NUMBER(4) PRIMARY KEY,
    MAJOR_NAME      VARCHAR2(50) UNIQUE,
    MAJOR_OFFICE_LOC VARCHAR2(50) NOT NULL
    );
    SELECT * FROM MAJOR;
    
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '�濵����', '�濵�� 305ȣ');
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '����Ʈ�������', '������ 808ȣ');
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '������', '������ 606ȣ');
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '����', '���� 202ȣ');
    
    
  
  CREATE TABLE STUDENT(
    STUDENT_CODE       VARCHAR2(10) PRIMARY KEY,
    STUDENT_NAME       VARCHAR2(50) NOT NULL,
    SCORE              NUMBER(10) CHECK (0<=SCORE AND SCORE<=100),
    MAJOR_CODE         NUMBER(4) REFERENCES MAJOR(MAJOR_CODE)
    );
  
  SELECT * FROM STUDENT;
    
    INSERT INTO STUDENT VALUES ('AO1', '��浿', 100,1);
    INSERT INTO STUDENT VALUES ('AO2', '���浿', 90,2);
    INSERT INTO STUDENT VALUES ('AO3', 'ȫ�浿', 95,1);
    
-------------------------------------------------------------------------------

CREATE SEQUENCE MEMBER_MNO_SQ
    START WITH -1
    MINVALUE -1
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;
    


CREATE TABLE MEMBER_LEVEL (
    LEVELNO     NUMBER(4) PRIMARY KEY ,
    LEVELNAME   VARCHAR2(50) NOT NULL );
SELECT * FROM MEMBER_LEVEL;
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'BLACK');
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'�Ϲ�');
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'�ǹ�');
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'���');


CREATE TABLE MEMBER(
    MNO     NUMBER(4) PRIMARY KEY,
    MNAME   VARCHAR2(50) NOT NULL,
    MPW     VARCHAR2(50) CHECK (LENGTH(MPW)<9),
    MEMAIL  VARCHAR2(50) UNIQUE,
    MPOINT  NUMBER(10) CHECK (0<=MPOINT),
    MRDATE  DATE    DEFAULT SYSDATE,
    LEVELNO NUMBER(4)   REFERENCES MEMBER_LEVEL(LEVELNO)
);
SELECT * FROM MEMBER;
DROP TABLE MEMBER;
    INSERT INTO MEMBER VALUES (1,'ȫ�浿','aa','hong@hong.com',0,'22/03/10',0);
    INSERT INTO MEMBER VALUES (2,'�ű浿','bb','ain@ain.com',1000,'22/04/01',1);

--�ؽ�Ʈ ��� 
SELECT MNO, MNAME, MRDATE, MEMAIL, MPOINT , LEVELNAME||'��'
FROM MEMBER_LEVEL M , MEMBER W
WHERE M.LEVELNO = W.LEVELNO;











