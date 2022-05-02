--[II}SELECT �� - ���� ���� ���̴� DML(Data manipulation language); �˻� ���
--1. SQL SELECT ���� �ۼ���
--DDL: ���̺� ����
--DML: �Է�, ����, ����, �˻�
--DCL: ���Ѻο�, Ʈ�����Ǹ��
-- SHOW USER; �� ���� ������ �˷��ִ� ���� (���� : ctrl + Enter)
SHOW USER; 
--*�� ��� �� �̶�� �� 
SELECT * FROM TAB; --�� ����(scott)�� ������ �ִ� ���̺��� �̾ƶ� 
SELECT * FROM EMP; --EMP ���̺��� ��� ��(�ʵ�), ��� ���� ����ض�
SELECT * FROM DEPT; --DEPT���̺��� ��� ��, ��� �� 
-- EMP ���̺��� ���� 
DESC EMP;
DESC DEPT;

-- 2. SELECT �� ���� (Ư�� ���� ���)
SELECT EMPNO,ENAME,SAL,JOB FROM EMP;
-------�̸� �ٲٰ� ������ AS����ؼ� �ؿ�ó�� �ۼ��ϱ� (alias ��� ������ �����ϸ� ����,���ڷθ�)
SELECT EMPNO AS "���", ENAME AS "�̸�", SAL AS "�޿�", JOB AS "��å" FROM EMP; --��Ī
SELECT EMPNO AS ���, ENAME AS �̸�, SAL AS �޿�, JOB AS ��å FROM EMP; --��Ī/ ""�� �Ƚᵵ ����. alias�� �����̽� ���� �� ""����ߵ�
SELECT EMPNO ���, ENAME �̸�, SAL �޿�, JOB ��å FROM EMP; -- ��Ī /as�� ���� �� ����/�����̽� ���� ""�� �� ���ֱ� 
SELECT EMPNO NO, ENAME NAME, SAL SALARY, JOB JOBB FROM EMP;--TITLE : NO,NAME,SALARY,JOBB

-- 3. Ư���� ��� : WHERE ��(����) /SELECT�� FROM�� ���� ���� �� ������ 
-- �񱳿����� : ����(=) ũ�ų� ����(>=) �ٸ���(!=,^=,<>)
SELECT EMPNO "���",ENAME "�̸�",SAL"�޿�" FROM EMP WHERE SAL = 3000; --����
SELECT EMPNO "���",ENAME "�̸�",SAL"�޿�" FROM EMP WHERE SAL !=3000; --�ٸ���
SELECT EMPNO "���",ENAME "�̸�",SAL"�޿�" FROM EMP WHERE SAL ^=3000; --�ٸ���
SELECT EMPNO "���",ENAME "�̸�",SAL"�޿�" FROM EMP WHERE SAL <>3000; --�ٸ���
-- �񱳿����ڴ� ����, ����, ��¥�� ��� ���� 

-- EX. ����̸�(ENAME)�� 'A','B','C'�� �����ϴ� ����� ��� �ʵ带 ����ض� 
SELECT * FROM EMP WHERE ENAME < 'D';
-- ����Ŭ���� ""�� ���ڿ��� �ƴ�, ��Ī�� ���� ..�ʵ忡 ��Ī�� �� ���� ���.. ����,���ڿ� ��� �C����ǥ ��

-- EX. 81�⵵ ������ �Ի��� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE HIREDATE < '81/01/01';

-- EX. 10�� �μ���ȣ(DEPTNO)�� ����� ��� �ʵ带 ���
SELECT * FROM EMP WHERE DEPTNO=10;

-- EX. �̸�(ENAME)�� FORD �� ������ EMPNO,ENAME,MGR(����� ���)�� ���
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'FORD';
select empno,ename,mgr from emp where ename = 'FORD';   --�����ʹ� ��ҹ��� ���� 

--4. �������� : AND, OR ,NOT
-- EX. �޿�(SAL)�� 2000 �̻� 3000������ ������ ��� �ʵ带 ����Ͻÿ�
SELECT * FROM EMP WHERE SAL>=2000 AND SAL<=3000;

-- EX. 82�⵵�� �Ի��� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE HIREDATE >= '82/01/01' AND HIREDATE <='82/12/31';
-- ��¥ ǥ��� ����(����: YY/MM/DD OR RR/MM/DD)  
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- �ѱ� �������� ���� INSTALL 
SELECT ENAME, HIREDATE FROM EMP;

--������ 2400 �̻��� ������ ENAME, SAL, ���� ���(����= SAL*12)
SELECT ENAME, SAL, SAL*12 FROM EMP WHERE SAL*12 >2400;
SELECT ENAME, SAL, SAL*12 "����" FROM EMP WHERE ���� >2400; --WHERE������ ��Ī�� �� �� ����
SELECT ENAME, SAL, SAL*12 "����" FROM EMP WHERE SAL*12 >2400; -- SELECT ���� �ٷ� ALIAS���൵ ��
SELECT ENAME, SAL, SAL*12 "����" FROM EMP WHERE SAL*12 >2400 ORDER BY ����; -- ORDER BY ���� ��Ī ��� ���� 
SELECT ENAME, SAL, SAL*12 "����"
FROM EMP
WHERE SAL*12 >2400
ORDER BY ����; -- ORDER BY ������ ��Ī ��� ���� 
--10�� �μ�(DEPTNO)�̰ų� ��å(JOB)�� MANAGER�� ����� ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO = 10 OR JOB = 'MANAGER';
-- �μ� ��ȣ�� 10���� �ƴ� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE DEPTNO != 10;
SELECT * FROM EMP WHERE NOT DEPTNO=10;

--5. ��� ǥ���� 
SELECT ENAME, SAL "����޿�", SAL+100 "�ø��޿�" FROM EMP WHERE DEPTNO=10;

-- EX. ��� ����� �̸� (ENAME), ����(SAL), ��(COMM), ����(SAL*12+COMM)
-- ��� ������ ����� NULL�� �����ϸ� ����� NULL �̵� 
-- NVL(NULL�� ���� �ִ� �ʵ��, ��ġ��) �ݵ�� �Ű����� ���� Ÿ���� ���ƾߵ� 
SELECT ENAME, SAL, COMM, SAL*12+COMM "����" FROM EMP; 
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM,0) "����" FROM EMP; 
SELECT * FROM EMP;

-- EX. ��� ����� �����(ENAME), ����� ���(MGR)�� ���(��簡 ������ '����'��� �ȵ�. 0���� ���) //'����'�� ���ڰ�, ����� ������ ������ ����ȯ �ؾߵ�
SELECT ENAME, NVL(MGR,0) FROM EMP;
SELECT ENAME, NVL(MGR,'����')FROM EMP; -- NVL �Ű����� Ÿ�� ����ġ ���� 

--6. ���Ῥ����(||) : ���̳� ���ڸ� ����
SELECT ENAME || '��' || JOB "EMPLOYEES" FROM EMP;

-- EX. "SMITH : ���� = XXX"�� ���� ��� �� ��� (������ SAL * 12 + COMM)
SELECT ENAME || ': ���� = ' || (SAL *12 +NVL(COMM,0)) FROM EMP;

--7. �ߺ����� (DISTINCT) 
SELECT JOB FROM EMP;
SELECT DEPTNO FROM EMP;
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;


--�ڡڡ� �������� �� Ǯ�� �ڡڡ� 
--1. emp ���̺��� ���� ���
DESC EMP;
--2. emp ���̺��� ��� ������ ��� 
SELECT * FROM EMP;
--3. �� scott �������� ��밡���� ���̺� ���
SHOW USER;
SELECT * FROM TAB; ------------------------------------���� ������ ������ �ִ� ���̺� 
--4. emp ���̺��� ���, �̸�, �޿�, ����, �Ի��� ���
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
--5. emp ���̺��� �޿��� 2000�̸��� ����� ���, �̸�, �޿� ���
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<2000;

--6. �Ի����� 81/02���Ŀ� �Ի��� ����� ���, �̸�, ����, �Ի��� ���
-- # ��¥���� (YYYY�⵵ 4�ڸ�, RR�⵵ 2�ڸ�, M��, D��)-������ YY�ᵵ �Ǳ�������, ���� 2�ڸ����� 4�ڸ����� �����ϱ���
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR';
-- # ��¥�� -> ���������� ��ȯ�ϴ� �Լ� (3,4�忡����) : TO_CHAT(��¥��, ����)--���ڷ�
-- # ������ -> ��¥������ ��ȯ�ϴ� �Լ� : TO_DATE(������������, ����) --��¥��
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE >='02-01-81'; 
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') >='81/02/01'; --����� 'MM-DD-RR'���·� �� 
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE >=TO_DATE('81/02/01', 'RR/MM/DD'); 
DESC EMP; --�� ���� HIREDATE�� ��¥(DATE)������ ���������� Ȯ�� ���� �غ��� 
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; 

--7. ������ SALESMAN�� ����� ��� �ڷ� ���
SELECT * FROM EMP WHERE JOB = 'SALESMAN';
--8. ������ CLERK�� �ƴ� ����� ��� �ڷ� ���
SELECT * FROM EMP WHERE JOB <> 'CLERK';
SELECT * FROM EMP WHERE JOB != 'CLERK'; --------���� ���¾� 
SELECT * FROM EMP WHERE JOB ^= 'CLERK';
SELECT * FROM EMP WHERE NOT JOB = 'CLERK';------�굵 ���� ���� ��

--9. �޿��� 1500�̻��̰� 3000������ ����� ���, �̸�, �޿� ���
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;

--10. �μ��ڵ尡 10���̰ų� 30�� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=10 OR DEPTNO=30;

--11. ������ SALESMAN�̰ų� �޿��� 3000�̻��� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB = 'SALESMAN' OR SAL>=3000;

--12. �޿��� 2500�̻��̰� ������ MANAGER�� ����� ���, �̸�, ����, �޿� ���
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB = 'MANAGER';

--13.��ename�� XXX �����̰� ������ XX�١� ��Ÿ�Ϸ� ��� ���(������ SAL*12+COMM)
SELECT ENAME ||'�� '|| JOB || ' �����̰� ������ ' || (SAL*12+NVL(COMM,0))||'��' FROM EMP;


----------------------------------------------------------------------------------------
-- 8. SQL ������(BETWEEN, IN, LIKE, IS NULL)
    --(1)BETWEEN [������ BETWEEN A AND B (A<=B) // �����ϴ� ���ڸ� ����. �� �̻��̾ƴ϶� �ʰ��Ҷ� BETWEEN �Ƚ�
        --EX. SAL�� 1500�̻� 3000������ ��� �̸� �޿�
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000; -- AND �����ڸ� �� ��
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000; -- �ݵ�� ���� ���� A�ڸ��� ��ġ�ؾ��� 
        
        --EX. 1500�̸� 3000 �ʰ��ϴ� ��� �ʵ带 ����϶� -- BETWEEN �տ� NOT �ٿ��ָ� �� 
SELECT * FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;

        --EX. 82�⵵�� �Ի��� ����� �ѷ��� 
SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') BETWEEN '82/01/01' AND '82/12/31'; -- ���������� �ٲٴ°͵� �����Ҷ� 
        
        --EX. ��� �̸��� 'A','B'�� �����ϴ� ����� ��� �ʵ� //���ڴ� �ƽ�Ű�ڵ�� �񱳸� �ϱ� ������ �̷��� ����ߵ� 
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'C' AND ENAME != 'C'; --A���� ũ�ų� ����, C���� ���ų� ���� ���� 
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'B'; -- B�� �ȳ��� //���ڴ� �ƽ�Ű�ڵ�� �񱳸� �ϱ� ������ �̷��� ����ߵ� 

        --EX. ��� �̸��� 'B','C'�� �����ϴ� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE ENAME BETWEEN 'B' AND 'D' AND ENAME !='D';

    --(2) IN [������ IN(A,B,C...)]
        --EX. �μ���ȣ�� 10,20,40 �μ� ����� ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO IN (10,20,40);
    
        --EX. �μ���ȣ�� 10,20,40�� �μ��� ������ ����� ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO NOT IN(10,20,40);
SELECT * FROM EMP WHERE DEPTNO !=10 AND DEPTNO!=20 AND DEPTNO!=40;

        --EX. ����� 7902, 7788, 7566�� ����� ��� �ʵ�
SELECT * FROM EMP WHERE EMPNO IN(7902,7788,7566);
        
        --EX. ������ 1500�� ����� ����ʵ� 
SELECT * FROM EMP WHERE SAL IN 1500;

    --(3) LIKE[������ LIKE������ - (����) : ������ LIKE ���Ͽ� ���ϵ� ī�� �ֱ� (%:0���� �̻�, _ : 1����)
        --EX. �̸��� M�� �� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE ENAME LIKE '%M%'; --M�տ� 0���� �̻� ��,M�ڿ� 0���� �̻� �� 

        --EX. �̸��� M���� �����ϴ� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE ENAME LIKE 'M%';

        --EX. �̸��� S�� ������ ����� ��� �ʵ�
SELECT * FROM EMP WHERE ENAME LIKE '%S';

        --EX. SAL�� 5�� ������ ����� ��� �ʵ�
SELECT * FROM EMP WHERE SAL LIKE '%5'; ---���ڸ� LIKE�� ������ ���� ���ϵ��� ���� 
SELECT * FROM EMP WHERE SAL = '2975'; -- �������� ������ �� ���� 

        --EX. 82�⵵�� �Ի��� ����� ��� �ʵ� -- TO_CHAR �Ἥ ���ϴ°� ��õ.  ------------between�� �� ���� �ְ�, like�� �� ���� ���� 
SELECT * FROM EMP WHERE HIREDATE LIKE '%82%'; -- OR '82/%'
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR') = '82';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR') = 82;

        --EX. 2010�⵵�� �Ի��� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') LIKE '10/%';

        --EX. 1���� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE LIKE '%/01/%';
SELECT * FROM EMP WHERE HIREDATE LIKE '__/01/__';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'RR/MM/DD') LIKE '__/01/__';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'RR/MM') LIKE '%01';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'MM') LIKE '01';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'MM') = '01';

        --EX. 82�⵵�� �ƴ� �⵵�� �Ի��� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE HIREDATE NOT LIKE '82/%';

        --EX. �̸��� S�� �� ����� ��� �ʵ� 
SELECT *FROM EMP WHERE ENAME LIKE '%S%'; -- �տ� ���� �ǰ�, �ڿ� ���� �ǰ� 
SELECT *FROM EMP WHERE ENAME LIKE '%%%'; -- ��� �ʵ� �� ������� �ų� �������� 
SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE'\'; --�̸��� �ۼ�Ʈ �� ���̸� �̾Ƴ��� ����.. ����� %�� �ƴ��� �����ϱ� ���� �������� ��� 
INSERT INTO EMP VALUES (9999,'ȫ%',NULL,NULL,NULL,9000,900,40); --������ �Է��ϴ� �� 
SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE'\';
ROLLBACK; -- DML(������ �߰�, ����, ����)�� ������ ������ ���󺹱� 

     --(4)IS NULL [������ IS NULL : SMITH�� �󿩱��� NULL�̶�� �� �����͸� �ȳ־����� �ǹ��� 
SELECT * FROM EMP;
        --EX. �󿩱��� NULL�� ����� ��� �ʵ�
SELECT * FROM EMP WHERE COMM IS NULL; -- NULL�� �񱳽� �ݵ�� IS NULL�� 

        --EX. MGR�� NULL�� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE MGR IS NULL;

        --EX. �󿩱��� ���� ����� ��� �ʵ� -- NULL�� �󿩱��� ���°����� 0�� ���°��� (COMM�� NULL�̰ų� 0)
SELECT * FROM EMP WHERE COMM IS NULL OR COMM = 0;

        --EX. �󿩱��� �ִ� ����� ��� �ʵ�(COMM�� NULL�� �ƴϰ� 0�� �ƴϰ�) -- ISNULL�� NOT�� �����Ͱ� �տ� �ٿ�����  
SELECT * FROM EMP WHERE NOT COMM IS NULL AND COMM != 0; ----��õ ��� 
SELECT * FROM EMP WHERE NOT(COMM IS NULL OR COMM=0); 

    --(9).����[��������, ��������]
SELECT ENAME, SAL FROM EMP ORDER BY SAL; --�޿� ��������
SELECT ENAME, SAL FROM EMP ORDER BY SAL ASC; --�޿� ��������
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC; --�޿� �������� 
SELECT ENAME, SAL FROM EMP ORDER BY ENAME; -- �̸� ABCD������
SELECT ENAME, SAL FROM EMP ORDER BY ENAME DESC; --�̸� ���ĺ� �ݴ�� 
SELECT ENAME, SAL FROM EMP ORDER BY HIREDATE; -- ��¥ ������� ���� (������ ������ ����) 
SELECT ENAME, SAL FROM EMP ORDER BY HIREDATE DESC; --�ֽ� �Ի��� ������ ���� 

        --EX. �̸�, ����(SAL*12+COMM)�� ���(������ ���� ������,������ ���� ���� �̸�������)
SELECT ENAME, SAL*12+NVL(COMM,0) ANNUAL_SAL FROM EMP ORDER BY SAL*12+NVL(COMM,0)DESC,ENAME; 
SELECT ENAME, SAL*12+NVL(COMM,0) ANNUAL_SAL FROM EMP ORDER BY ANNUAL_SAL DESC,ENAME;
        
        --EX. ���, �̸�, �Ի���, �޿�, �μ���ȣ( �μ���ȣ��, �μ��� ������ �Ի��� ������������ ���) --�Ի��� �ֽź��� 
SELECT EMPNO, ENAME, HIREDATE, SAL, DEPTNO FROM EMP ORDER BY DEPTNO, HIREDATE DESC;




-------------�ڡڡڽ��� ���������ڡڡ�(�� �����ϱ�)-------------------
--1.	EMP ���̺��� sal�� 3000�̻��� ����� empno, ename, job, sal�� ���
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL>=3000; 

--2.	EMP ���̺��� empno�� 7788�� ����� ename�� deptno�� ���
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO IN 7788;
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7788; 

--3.	������ 24000�̻��� ���, �̸�, �޿� ��� (�޿�������)
SELECT EMPNO, ENAME, SAL  FROM EMP WHERE (SAL*12+NVL(COMM,0))>=24000 ORDER BY SAL;

--4.	�Ի����� 1981�� 2�� 20�� 1981�� 5�� 1�� ���̿� �Ի��� ����� �����, ��å, �Ի����� ��� (�� hiredate ������ ���) ----TO_CHAR�ٲ㺸��
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01' ORDER BY HIREDATE;
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') BETWEEN '81/02/20' AND '81/05/01' ORDER BY HIREDATE;

SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/02/20','YY/MM/DD') AND TO_DATE('81/05/01','YY/MM/DD') ORDER BY HIREDATE;

--5.	deptno�� 10,20�� ����� ��� ������ ��� (�� ename������ ����)
SELECT * FROM EMP WHERE DEPTNO IN(10,20) ORDER BY ENAME;

--6.	sal�� 1500�̻��̰� deptno�� 10,30�� ����� ename�� sal�� ���
-- (�� HEADING�� employee�� Monthly Salary�� ���)
SELECT ENAME "employee", SAL "Monthly Salary" FROM EMP WHERE SAL>=1500 AND DEPTNO IN(10,30);

--7.	hiredate�� 1982���� ����� ��� ������ ��� --between, like �Ѵ� ���� 
SELECT * FROM EMP WHERE HIREDATE LIKE '82%';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR') = '82';

--8.	�̸��� ù�ڰ� C����  P�� �����ϴ� ����� �̸�, �޿� �̸�,�޿��� ����
SELECT ENAME, SAL FROM EMP WHERE ENAME BETWEEN 'C' AND 'Q' AND ENAME !='Q' ORDER BY SAL,ENAME;

--9.	comm�� sal���� 10% �̻��϶� ���� ��� ����� ���Ͽ� �̸�, �޿�, �󿩱��� 
--����ϴ� SELECT ���� �ۼ�
SELECT ENAME, SAL, COMM FROM EMP WHERE (COMM-SAL) = SAL*0.1;
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM>SAL*1.1;

--10.	job�� CLERK�̰ų� ANALYST�̰� sal�� 1000,3000,5000�� �ƴ� ��� ����� ������ ���
SELECT * FROM EMP WHERE JOB IN ('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000); ----------�ȵ� 

--11.	ename�� L�� �� �ڰ� �ְ� deptno�� 30�̰ų� �Ǵ� mgr�� 7782�� ����� 
--��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND DEPTNO IN 30 OR MGR IN 7782;
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND DEPTNO = 30 OR MGR = 7782;

--12.	�Ի����� 81�⵵�� ������ ���,�����, �Ի���, ����, �޿��� ���
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP WHERE TO_CHAR(HIREDATE,'RR') = '81';

--13.	�Ի�����81���̰� ������ 'SALESMAN'�� �ƴ� ������ ���, �����, �Ի���, 
-- ����, �޿��� �˻��Ͻÿ�.
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP WHERE TO_CHAR(HIREDATE,'RR')='81' AND JOB NOT IN 'SALESMAN';

--14.	���, �����, �Ի���, ����, �޿��� �޿��� ���� ������ �����ϰ�, 
-- �޿��� ������ �Ի����� ���� ������� �����Ͻÿ�.
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP ORDER BY SAL DESC, HIREDATE;

--15.	������� �� ��° ���ĺ��� 'N'�� ����� ���, ������� �˻��Ͻÿ�
SELECT EMPNO,ENAME FROM EMP WHERE ENAME LIKE '__N%';
SELECT * FROM EMP;

--16.	����� 'A'�� �� ����� ���, ������� ���
SELECT * FROM EMP WHERE ENAME LIKE '%A%';

--17.	����(SAL*12)�� 35000 �̻��� ���, �����, ������ �˻� �Ͻÿ�.
SELECT EMPNO ,ENAME,SAL*12 "����" FROM EMP WHERE SAL*12 >=35000; 

SELECT * FROM EMP,DEPT;

























