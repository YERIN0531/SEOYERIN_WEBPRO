--[IV] ������ �Լ� (=�����Լ� =SQL �ֿ��Լ�)
--�Լ� = �������Լ� + �׷��Լ�(�����Լ�)

------------------------------------------------------------------------------------

    --������ �Լ� (INPUT 1�� -> OUTPUT 1��) : 4��
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY"��"MM"��"DD"��"')FROM EMP; ---������ �Լ� 
SELECT ENAME, INITCAP(ENAME) FROM EMP; --INITCAP (�տ��� ���ڸ� �����. �ձ��ڸ� ����ڷ�)    
    --�׷��Լ� (INPUT N�� -> OUTPUT 1��) : 5�� 
SELECT SUM(SAL), AVG(SAL) FROM EMP;
SELECT SUM(SAL)"�ѱ޿�", AVG(SAL) "�޿����" FROM EMP; --��ü SAL�� 
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO; --�μ��� SAL �� 

-------------------------------------------------------------------------------------

------�ڴ����� �Լ� ���� : �����Լ�, ����ó���Լ�, ��¥�Լ�(�����), ����ȯ�Լ�, NVL()....��-------

--DUAL ���̺� : OACLE���� �����ϴ� 1�� 1���ڸ� DUMMY TALBE (CF)DUMMY
--DUAL ���� ����
DESC DUAL; 
SELECT * FROM DUAL; -- �׽�Ʈ������ �� ���̺� 
DESC DUMMY;
SELECT * FROM DUMMY;

-------------------------------------------------------------------------------------

             -----------------1. ���ڰ����Լ�----------------- 
--FLOOR & TRUNC
SELECT -9, ABS(-9) FROM DUAL;            -- ABS(N)���밪
SELECT FLOOR(34.5678) FROM DUAL;         -- �Ҽ������� ���� 
SELECT FLOOR(34.5678*100)/100 FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� ���� 
SELECT TRUNC(34.5678, 2) FROM DUAL;      -- �Ҽ��� �ι�° �ڸ����� ����
SELECT TRUNC(34.5678) FROM DUAL;         -- �Ҽ������� ���� 
SELECT TRUNC(34,-1) FROM DUAL;           -- ���� �ڸ����� ���� 
--ex. EMP���̺��� �̸�, �޿�(���� �ڸ����� ����)
SELECT ENAME,SAL,TRUNC(SAL,-2) FROM EMP; -- ���� �ڸ����� ����

--CEIL
SELECT CEIL(34.5678) FROM DUAL;          -- �Ҽ������� �ø� 
SELECT CEIL(34.5678*100)/100 FROM DUAL;  -- �Ҽ��� �ι�° �ڸ����� �ø� 
SELECT CEIL(1) FROM DUAL;
SELECT CEIL(2) FROM DUAL;
--ROUND
SELECT ROUND(34.5678)FROM DUAL;          -- �Ҽ������� �ݿø�
SELECT ROUND(34.5678,2)FROM DUAL;        -- �Ҽ��� �ι�° �ڸ����� �ݿø� 
SELECT ROUND(34.5678,-1)FROM DUAL;       -- ���� �ڸ����� �ݿø� 

--MOD
SELECT MOD(9,2) FROM DUAL;               -- ������ ������ (9/2�� ������ 1)
--ex. ����� Ȧ���� ����� ��� �ʵ� ���
SELECT * FROM EMP WHERE MOD(EMPNO,2)=1;
--ex. Ȧ���޿� �Ի��� ����� ��� �ʵ� ��� 
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE,'MM'),2)=1; 
--

-------------------------------------------------------------------------------------

             -----------------2. ���ڰ����Լ�-----------------
--���ҹ��ڰ���
SELECT UPPER('abcABC')FROM DUAL;             -- �빮�ڷ� �ٲٴ� UPEER
SELECT LOWER('abcABC')FROM DUAL;             -- �ҹ��ڷ� �ٲٴ� LOWER
SELECT INITCAP('WELCOM TO ORACLE')FROM DUAL; -- �ܾ� �� ù ���ڸ� �빮�ڷ� 
--ex. JOB�� 'manager'�� ������ ��� �ʵ� ��� 
SELECT * FROM EMP WHERE UPPER(JOB) = 'MANAGER';
SELECT * FROM EMP WHERE LOWER(JOB) = 'manager';
SELECT * FROM EMP WHERE INITCAP(JOB) = 'Manager';

--�蹮�ڿ���(CONCAT,||������)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;     -- ���Ῥ���ڴ� ���Ѵ�� ���� ����
SELECT CONCAT('AB','CD')FROM DUAL;           -- CONCAT�� �ݵ�� �Ű����� 2���� ����
SELECT CONCAT(CONCAT('AB','CD'),CONCAT('EF','GH'))FROM DUAL; --CONCAT ������ �Ἥ ���� ���� 
--ex. "�ƹ���(ENAME)�� XX(JOB)�̴�"(CONCAT�� �̿�)
SELECT CONCAT(CONCAT(ENAME,'��(��)'), CONCAT(JOB,'�̴�')) FROM EMP;
SELECT ENAME||'�� '|| JOB||'�̴�' FROM EMP;

--��SUBSTR(STR,������ġ,�������� ���ڰ���) ù��° ��ġ�� 1, ������ġ ��������, 
--��-2)SUBSTRB(STR,���۹���Ʈ��ġ, ���ڹ���Ʈ��)
--  O R A C L E
--  1 2 3 4 5 6
-- -6-5-4-3-2-1
SELECT SUBSTR('ORACLE',3,2)FROM DUAL;          -- 3��° ���ں��� 2���� ����
SELECT SUBSTRB('ORACLE',3,2)FROM DUAL;         -- 3��° ����Ʈ���� 2����Ʈ ����
SELECT SUBSTR('�����ͺ��̽�',4,3)FROM DUAL;       -- 4��° ���ں��� 3���� ���� 
SELECT SUBSTRB('�����ͺ��̽�',4,3)FROM DUAL;      -- 4��° ����Ʈ���� 3����Ʈ ����(XE�������� �ѱ� 3BYTE)
SELECT SUBSTRB('ȫ�浿',3,2)FROM DUAL;           -- �ѱ��� �ȳ���. �� ���ߵ�
SELECT SUBSTR('ABCDXD',-1,1)FROM DUAL;         -- �ڿ��� ù��° ����
SELECT SUBSTR(123,2,1)FROM DUAL;               -- ���ڵ� ����
--ex. 9���� �Ի��� ��� �ʵ�(��, DATE ��� FORMAT 'RR/MM/DD')
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'),4,2)=09;
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,4,2)='09';
--ex. 9�Ͽ� �Ի��� ��� �ʵ�
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,-2,2)='09';

--����ڼ�(LENGTH) VS ����Ʈ��(LENGTHB)
SELECT LENGTH('ABC')FROM DUAL;                  -- ���ڼ� 3
SELECT LENGTHB('ABC')FROM DUAL;                 -- ����Ʈ 3
SELECT LENGTH('����Ŭ')FROM DUAL;                -- ���ڼ� 3
SELECT LENGTHB('����Ŭ')FROM DUAL;               -- ����Ʈ 9

--��INSTR(STR,ã������) : STR���� ã�� ������ ��ġ (ù��° ��ġ 1), ������ 0, ��ġ�� ���� ���� �� ���� 
--��-2)INSTR(STR,ã������,������ġ) : STR���� ������ġ���� ã�� ������ ��ġ  
SELECT INSTR('ABCABC','B')FROM DUAL;            -- ó������ ã�Ƽ� ó�� ������ B�� ��ġ : 2
SELECT INSTR('ABCABC','B',3)FROM DUAL;          -- ��3��°���� ã�Ƽ� ó�� ������ B�� ��ġ : 5
SELECT INSTR('ABCABC','B',-3)FROM DUAL;         -- ��3��°���� ã�Ƽ� ó�� ������ B�� ��ġ : 2(������)
SELECT INSTR('ABCABC','B',-1)FROM DUAL;         -- ��1��°���� ã�Ƽ� ó�� ������ B�� ��ġ : 5(������)
--ex. 9���� �Ի��� ����� ��� �ʵ�(INSTR)��� 09/09/09
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09',4) = 4;
--ex. 9���� �Ի��� ����� ��� �ʵ�(INSTR)��� 09/09/09
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09',-1)=7;
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09', 7)=7;
--ex. 9���� �ƴѳ� �Ի��� ����� ��� �ʵ�(INSTR) 09/09/09
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09', 7)=0;
SELECT * FROM EMP WHERE NOT INSTR(HIREDATE,'09', 7)=7;

--��LPAD(STR,�ڸ���,ä�﹮��)STR�� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� ä�� ���ڸ� ���
--��-2)RPAD(STR,����,ä�﹮��)STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ä�� ���ڸ� ��� 
SELECT LPAD('ORACLE',10,'#')FROM DUAL;
SELECT RPAD('ORACLE',10,'#')FROM DUAL;
SELECT ENAME, SAL, LPAD(SAL,6,'*') FROM EMP;

-------------------------------------------------------------------------------------

    --EX. ���, �̸� (7788 S****), (7894 S****), �̸��� �� �ѱ��ڸ� ����ϰ� �������� *    
    --SUBSTR(ENAME, 1, 1) / RPAD(ENAME,10,'*')
    
SELECT EMPNO"���", RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*')"�̸�" FROM EMP;

    --EX. ���, �̸�, �Ի��� (�̸��� 10�ڸ��� Ȯ���ϸ鼭 �̸� ���ڼ���ŭ *�� ä������ �� ������ ���ڸ� ���, �������� �����̽�, )
    -- 7892____****H 80/12/**
    -- 7792____****T 80/12/**
    --LPAD, LENGT, SUBSTR

SELECT EMPNO,LPAD(LPAD(SUBSTR(ENAME,-1,1),LENGTH(ENAME),'*'),10,' ')"NAME", RPAD(SUBSTR(HIREDATE,1,6),8,'*')"HIREDATE" FROM EMP;
SELECT EMPNO,LPAD(LPAD(SUBSTR(ENAME,-1,1),LENGTH(ENAME),'*'),10,' ')"NAME", RPAD(SUBSTR(HIREDATE,1,6),LENGTH(HIREDATE),'*')"HIREDATE" FROM EMP;

    --EX. �̸��� ����° �ڸ��� R�� ����� ��� �ʵ�(LIKE���, INSTR���, SUBSTR���)
    
SELECT * FROM EMP WHERE ENAME LIKE '__R%';    
SELECT * FROM EMP WHERE INSTR(ENAME, 'R')=3; -- RARA�������� 1�� �����ϱ� ������ ����� �ȵ� �� ���� 
SELECT * FROM EMP WHERE INSTR(ENAME, 'R',3)=3; -- 3��° ������ 'R'���Ͷ� 
SELECT * FROM EMP WHERE SUBSTR(ENAME, 3, 1)='R';

-------------------------------------------------------------------------------------

--��������
SELECT TRIM('     ORACLE DB   ') FROM DUAL;
SELECT RTRIM('     ORACLE DB   ') FROM DUAL;
SELECT LTRIM('     ORACLE DB   ') FROM DUAL;

--��REPLACE
SELECT REPLACE(ENAME, 'A', 'XX') FROM EMP; --A��� ���̸� XX�� �ٲ�� 
SELECT REPLACE(HIREDATE,'0',' ') FROM EMP;
SELECT REPLACE (HIREDATE, SUBSTR(HIREDATE,7,2),'**') FROM EMP; -- ȥ�� �غ��� 

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

            -----------------3. ��¥�����Լ�-----------------
--��SYSDATE : ����
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD DY HH24:MI:SS';
SELECT SYSDATE FROM DUAL;
SELECT ENAME, HIREDATE FROM EMP;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD DY HH24:MI:SS')FROM DUAL;
SELECT SYSDATE-1 "���� �� �ð�", SYSDATE "����", SYSDATE+1"���� �� �ð�" FROM DUAL;

--�賯¥ ��� : 14�� �� 
SELECT SYSDATE + 14 "�ݳ�������" FROM DUAL;
--ex. �̸�, �Ի���, �ٹ��ϼ� 
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) "�ٹ��ϼ�" FROM EMP; -- TRUNC OR FLOOR ���� �ϳ� ���� 
--ex. �̸�, �Ի���, �ٹ��ּ�, �ٹ���� 
SELECT ENAME, HIREDATE, TRUNC((SYSDATE-HIREDATE)/7 )"�ٹ��ּ�" , TRUNC((SYSDATE-HIREDATE)/365) "�ٹ����" FROM EMP;

--��MONTHS_BETWEEN(��¥, ��¥) : �� ��¥���� ������ (�տ� �ֽ�)
--ex. �̸�, �Ի���, �ٹ����� 
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))"�ٹ�����" FROM EMP;
--ex. �̸�, �Ի��� ���� ���� �޿��� �� (�޿��� �Ŵ� �ް�, �󿩴� 1�⿡ 2ȸ ����) -- �ٽ� �ϱ� 
SELECT ENAME, 
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL + TRUNC((SYSDATE-HIREDATE)/365)*2*NVL(COMM,0) COST FROM EMP;

--��ADD_MONTHS(��¥, ������) : Ư���������� ��� ���� ��¥ 
--ex. �̸�, �Ի���, ���������� (�����Ⱓ�� �Ի��Ϸκ��� 6������ �Ѵ�)
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) FROM EMP;

--��LAST_DAY(��¥) : Ư����¥�� ���� ���� 
SELECT LAST_DAY(SYSDATE) FROM DUAL;
--ex. �̸�, �Ի���, ù ���޳�(���޳��� ����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)"ù���޳�" FROM EMP;

--��ROUND(��¥, XX) : ��¥ �ݿø� //���� ����� �������� �޶���� / ������ ������ TRUNC(��¥,XX) 
SELECT ROUND(34.5678,2) FROM DUAL;
SELECT ROUND(SYSDATE, 'YEAR')FROM DUAL;     --��� : ����� 1�� 1�� (�����ϼ��� �ְ� �����ϼ��� ����) 
SELECT ROUND(SYSDATE, 'MONTH')FROM DUAL;    --��� : ����� ���� 1�� (1~15���� �̹��� 1��, 16�� ���Ĵ� ������ 1��)
SELECT ROUND(SYSDATE, 'DAY')FROM DUAL;      --��� : ����� �Ͽ��� 
SELECT ROUND(SYSDATE) FROM DUAL;            --��� : ����� 0�� 
SELECT TO_CHAR(ROUND(SYSDATE),'RR/MM/DD HH24:MI') FROM DUAL;

SELECT TRUNC(SYSDATE, 'YEAR')FROM DUAL;     --��� : ���� 1�� 1��  
SELECT TRUNC(SYSDATE, 'MONTH')FROM DUAL;    --��� : �̹��� ���� 1�� (1~15���� �̹��� 1��, 16�� ���Ĵ� ������ 1��)
SELECT TRUNC(SYSDATE, 'DAY')FROM DUAL;      --��� : ���� �Ͽ��� 
SELECT TRUNC(SYSDATE) FROM DUAL;            --��� : ���� 0�� 

--��NEXT_DAY(��¥, '��') : Ư����¥�κ��� ó�� �����ϴ� ������ 
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��')FROM DUAL;

---------TRUNC(HIREDATE+N=16�� �����(���޳���)) , + N �� 1+N=���޳�
--ex1. �̸�, �Ի���, �Ի��� ���� 5��
SELECT ENAME, HIREDATE, TRUNC(HIREDATE, 'MONTH')+4 FROM EMP;
--ex2.(ROUND) �̸�, �Ի���, ���޳�(���޳��� �Ŵ�16��) 
SELECT ENAME, HIREDATE , ROUND(HIREDATE,'MONTH')+15"���޳�" FROM EMP;
--ex3.�̸�, �Ի���, ���޳�(���޳��� �Ŵ� 15��) 
SELECT ENAME, HIREDATE, ROUND(HIREDATE+1,'MONTH')+14"���޳�"FROM EMP; --HIREDATE+1�� �ϸ�, 15���� 16�Ϸ� ��ȯ�Ǽ� �����޷� �� 
--ex3.�̸�, �Ի���, ���޳�(���޳��� �Ŵ� 5��) 
SELECT ENAME, HIREDATE, ROUND(HIREDATE+11,'MONTH')+4"���޳�"FROM EMP;
--ex3.�̸�, �Ի���, ���޳�(���޳��� �Ŵ� 20��) --19�ϱ����� �̹���, 20�Ϻ��ʹ� ������ 
SELECT ENAME, HIREDATE, ROUND(HIREDATE-4,'MONTH')+19"���޳�"FROM EMP;
--//�Ի����� 5���� ũ�� �������� 5�� (ADD_MONTHS(HIREDATE))

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

        -----------------4. ����ȯ�Լ�(����, ����, ��¥)-----------------
        --���ڸ� ��¥�� �ٲ� ���ΰ�, ��¥�� ���ڷ� �ٲ� ���ΰ�(����<->��¥)
        --���ڸ� ���ڷ� �ٲ� ���ΰ�, ���ڸ� ���ڷ� �ٲ� ���ΰ�(����<->����)
        --��¥�� ���ڴ� ���� ���ٲ� 
        
--��TO_CHAR(��¥��������,'�������')
    --YYYY(�⵵4�ڸ�) YY(�⵵2�ڸ�) RR(�⵵2�ڸ�) MM(��) DD(��) /DAY(����) DY(���Ͽ��ǥ��)
    --AM/PM(����/����) HH12(12�ð�) HH24(24�ð�) MI(��) SS(��) 
    
SELECT TO_CHAR(SYSDATE, 'YY"��"MM"��"DD"��" DY"����" HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY"��"MM"��"DD"��" DY"����" AM HH12:MI:SS') FROM DUAL; --PM�־ ���� �ð����� ����

--��TO_CHAR(������������,'�������')
    -- 0 : �ڸ���. '�������'�� �ڸ����� ������ 0���� ä��
    -- 9 : �ڸ���. '�������'�� �ڸ����� ���Ƶ� ���ڸ�ŭ�� ���(�Ҽ��� �� /�Ҽ��� �ڴ� ����)
    -- , : ���ڸ����� ',' ���� 
    -- . : �Ҽ���
    -- $ : ��ȭ���� $�� �տ� ���� �� ����
    -- L : ������ȭ������ �տ� ���� �� ����  
    
SELECT TO_CHAR(123456,'9,999,999.99') FROM DUAL; -- 9 ',' '.' ���
SELECT TO_CHAR(123456,'0,000,000.00') FROM DUAL; -- 0 ',' '.' ���
SELECT TO_CHAR(10000,'L999,999')FROM DUAL;
SELECT ENAME, TO_CHAR(SAL, '$99,999')FROM EMP;
SELECT ENAME, TO_CHAR(SAL, '$00,000')FROM EMP;

--��TO_DATE(���ڵ�����,'����') 
SELECT TO_DATE('20220412','YYYYMMDD') FROM DUAL;

--ex.81/5/1~83/5/1 ���̿� �Ի��� ������ ��� �ʵ�(TO_DATE ���)
SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/05/01','RR/MM/DD') AND TO_DATE('830501','RR/MM/DD');

--��TO_NUMBER(���ڵ�����,'����') 
    -- 0 : �ڸ���. '�������'�� �ڸ����� ������ 0���� ä��
    -- 9 : �ڸ���. '�������'�� �ڸ����� ���Ƶ� ���ڸ�ŭ�� ���(�Ҽ��� �� /�Ҽ��� �ڴ� ����)
    -- , : ���ڸ����� ',' ���� 
    -- . : �Ҽ���
    -- $ : ��ȭ���� $�� �տ� ���� �� ����
    -- L : ������ȭ������ �տ� ���� �� ���� 
    
SELECT '1234'+1 FROM DUAL;
SELECT TO_NUMBER('1,234','9,999')+1 FROM DUAL;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                -----------------5.NVL--------------------
                
--NVL(���ϼ��� �ִ� ������, ���̸� ����Ұ�) - �Ű����� �ΰ��� Ÿ���� ���ƾ� �� 
SELECT ENAME, NVL(COMM,0) FROM EMP;
--ex. �̸�, ����� ���(MGR), ����� ����� NULL�� ��� 'CEO'��� ��� 
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') FROM EMP;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                -----------------6.ETC(��Ÿ)-----------------

--��EXTRACT : ������ ���̳� ��¥�� ���ڷ� �����ϰ��� �� �� 
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;        -- ���ڷ� ����(�������)
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;          -- ���ڷ� ����(�������)
SELECT EXTRACT(MONTH FROM HIREDATE) FROM EMP;
SELECT EXTRACT(DAY FROM HIREDATE)FROM EMP;

--ex. 2���� �Ի��� ������ ��� �ʵ� 
SELECT * FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE) = 2;
SELECT * FROM EMP WHERE HIREDATE LIKE'__/02/__';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'MM')='02';

--ex. 81�⵵�� �Ի��� ������ ��� �ʵ�
SELECT * FROM EMP WHERE EXTRACT(YEAR FROM HIREDATE)=1981;
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR')='81';

--������� ���(������ ���) : LEVEL, START WITH ����(MGR IS NULL), CONNECT BY PRIOR ���� (EMPNO=MGR)
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO=MGR;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                ---------------- <�� ��������> ----------------
                
-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "CURRENT DATE" FROM DUAL;

-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, SAL, (SAL+(SAL*0.15))"New Salary", (SAL*0.15)"Increase" FROM EMP;

--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.          
SELECT ENAME, HIREDATE , NEXT_DAY((ADD_MONTHS(HIREDATE, 6)),'��')"6���� �� ������" FROM EMP;

--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE , FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))"��������� ����", SAL, FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)*SAL)"�ѱ޿�" FROM EMP;

--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT LPAD(ENAME,15,'*')"�̸�", LPAD(SAL,15,'*')"�޿�" FROM EMP;

--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY')"�Ի����" FROM EMP;

--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME)"�̸����ڼ�", JOB FROM EMP WHERE LENGTH(ENAME)>=6;

--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT ENAME, SUBSTR(ENAME,2,3) FROM EMP; 

--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'RR/MM/DD') FROM EMP ;

--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		    ******1250
--����. 
SELECT EMPNO, ENAME, LPAD(SAL,10,'*') FROM EMP;

-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME      	�Ի���
-- 7369	 	 SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD') FROM EMP;

--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL,'$99,999')"�޿�" FROM EMP WHERE DEPTNO=20;
--------------------------------------------------------------------------------
-------------------------------������ �ٽ� �Ѱ�------------------------------------

-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "Current Date" FROM DUAL;
SELECT SYSDATE , INITCAP('CURRENT DATE')"TITEL" FROM DUAL;

-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, SAL, TRUNC((SAL+(SAL*0.15)))"New Salary", TRUNC((SAL*0.15))"Increase" FROM EMP;

--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.          
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'��')"6���� �� ��" FROM EMP;

--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE , TRUNC(MONTHS_BETWEEN(SYSDATE ,HIREDATE))"�ѱٹ�����",SAL,  
ROUND(MONTHS_BETWEEN(SYSDATE ,HIREDATE)*SAL,2) "�ѱ޿�" FROM EMP;

--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME , LPAD(SAL,15,'*') FROM EMP;
SELECT LPAD(ENAME,15,'*') , LPAD(SAL,15,'*') FROM EMP;

--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY')"�Ի����" FROM EMP;

--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME)>=6;

--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT SUBSTR(ENAME, 2,3)FROM EMP;

--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
--�� ��� ��õ--
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE)=12;
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'MM')=12;

--�Ʒ��� ����õ--
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE HIREDATE LIKE '__/12/__';
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE INSTR(HIREDATE,'12',4)=4;
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE SUBSTR(HIREDATE,4,2)=12;;

--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO      ENAME      �޿�
--7369             SMITH      *******800
--7499             ALLEN      ******1600
--7521             WARD          ******1250
--����.

SELECT EMPNO, ENAME, LPAD(SAL,10,'*')"�޿�" FROM EMP;

-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO    ENAME         �Ի���
-- 7369        SMITH      1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD')"�Ի���"FROM EMP;

--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$99,999')"�޿�" FROM EMP WHERE DEPTNO=20;











