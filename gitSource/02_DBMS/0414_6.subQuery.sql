-- [VI] SUB QUERY : QUERY �ȿ� QUERY�� ����
-- SELECT �ʵ�1, (SELECT �ʵ� FROM ���̺� WHERE ����)  -- ���̺�, ���ǿ��� �� �� ����
--  FROM ���̺� 
--  WHERE ����
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

         ------------------- ��1.���� ���� ���� -------------------

-- �������� �ʿ伺 

    -- ex. �޿��� ���� ���� �޴� ����� ���, �̸�, ��å, �޿�
    
SELECT MAX(SAL) FROM EMP;                           -- ���� ���� �޿�(��������)
SELECT EMPNO, MAX(SAL) FROM EMP GROUP BY EMPNO;     -- ��� ����� �� ����
SELECT EMPNO, ENAME, JOB, SAL                       -- ���� ����(�������� ����)
    FROM EMP                                        
    WHERE SAL=(SELECT MAX(SAL) FROM EMP);           -- ���������� ��ȣ�� ���� �־�� ��
                                                                
-- �������� ���� �� ������ �������� : �������� ����� ������( =,>,>=,<,<=,!=...)
    
    --ex. SCOTT�� �ٹ��ϴ� �μ��̸� ��� (��� JOIN�� �� ���� ��)
    SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';                     -- �������� 
    SELECT DNAME FROM DEPT
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');-- ��������
    
    --������ �̿��� Ǯ��  
    SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT';    
    

-- �������� ���� �� ������ �������� : �������� ����� 2���̻� (=����)
    
    --ex. JOB�� MANAGER�� ����� �μ��̸�
    SELECT DEPTNO FROM EMP WHERE JOB='MANAGER';                       -- ��������
    SELECT DNAME FROM DEPT
        WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');
        
    
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ��2. ������ �������� -------------------
    -- �Ʒ� ���� �� ó�� 
    SELECT E.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
    INSERT INTO DEPT VALUES (50,'IT','DALLAS');
    INSERT INTO EMP (EMPNO, ENAME, DEPTNO)VALUES (9999, 'ȫ�浿', 50);
    SELECT * FROM DEPT;
    SELECT * FROM EMP;
    
    --ex. SCOTT�� ���� �μ��� ����� �̸��� �޿�
    SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';           --��������
    SELECT ENAME, SAL
        FROM EMP
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME != 'SCOTT';
        
    --ex. SCOTT�� ���� �ٹ����� ����� �̸��� �޿�
    SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
    SELECT ENAME, SAL, LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO 
        AND LOC = (SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT')
        AND ENAME != 'SCOTT';
    
    ROLLBACK; -- ������ �߰� ���( DML-������ �߰�, ����, ����)
    SELECT * FROM DEPT;
    SELECT * FROM EMP WHERE EMPNO=9999;
    
    --ex1. �����Ի��ϰ� �����Ի��ѻ��,
    SELECT MIN(HIREDATE) FROM EMP;                          --��������
    SELECT HIREDATE, ENAME FROM EMP                         --��������
        WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);   
        
    --ex2. �ֱ��Ի��ϰ� �ֱ��Ի��ѻ���̸�
    SELECT MAX(HIREDATE) FROM EMP;                          --��������
    SELECT HIREDATE, ENAME FROM EMP                         --��������
        WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
    
    --ex3. �ּ��Ի��ϰ� �ּ��Ի��ѻ��, �ֱ��Ի��ϰ� �ֱ��Ի��ѻ�� �̸� 
    SELECT MIN(HIREDATE), MAX(HIREDATE) FROM EMP;
    SELECT E.HIREDATE �ּ��Ի���, E.ENAME �ּ��Ի���, E2.HIREDATE �ֱ��Ի���, E2.ENAME �ֱ��Ի���
    FROM EMP E, EMP E2
    WHERE E.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)
    AND E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
    
    --ex. SCOTT�� ���� �μ��� �ٹ��ϴ� ������� �޿���
    SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'; -- ��������(������)
    SELECT SUM(SAL) FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
    
    --ex. SCOTT �� ������ ��å(JOB)�� ���� ����� ��� �ʵ�
    SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'; -- ��������(������) 
    SELECT * FROM EMPM WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'); -- ��������
    

    --ex. DALLAS���� �ٹ��ϴ� ����� �̸�, �μ���ȣ  ---------------------------------------------------�ٽ�
    SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS';
    SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
     
    --ex. 'KING'�� ���ӻ���� ����� �̸��� �޿� 
    SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
    SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING'); 
    
    SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
    SELECT ENAME, SAL FROM EMP WHERE MGR = ( SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
    
    
    SELECT W.ENAME, W.SAL
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME='KING'; --SELF JOIN �̿� 
     
    --ex1. ��� �޿� ���Ϸ� �޴� ����� �̸��� �޿��� ��� 
    SELECT ENAME, SAL FROM EMP WHERE SAL <= (SELECT AVG(SAL) FROM EMP); 
    
    SELECT ROUND(AVG(SAL),2) FROM EMP ;
    SELECT ENAME, SAL FROM EMP WHERE SAL <=(SELECT ROUND(AVG(SAL),2) FROM EMP);
    
    --ex2. ��� �޿� ���Ϸ� �޴� ����� �̸�, �޿�, ��ձ޿� ��� 
    SELECT ENAME, SAL, (SELECT AVG(SAL)FROM EMP) FROM EMP WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
     
    SELECT AVG(SAL) FROM EMP; 
    SELECT ENAME,SAL, (SELECT ROUND(AVG(SAL))FROM EMP)��ձ޿� 
        FROM EMP 
        WHERE SAL<=(SELECT AVG(SAL) FROM EMP); 
    
    --ex3. ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿�, ��հ� ���̸� ��� 
    SELECT ROUND(AVG(SAL),2) FROM EMP;
    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)-SAL,1) ��հ����� 
        FROM EMP 
        WHERE SAL <=( SELECT ROUND(AVG(SAL),2) FROM EMP);
     

-- ������ ���߿� �������� 
-- ex. SCOTT�̶� JOB�� DEPTNO�� ���� ������ ��� �ʵ带 ���
-- ������ ���Ͽ� 
    SELECT * FROM EMP 
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT') 
    AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
-- ������ ���߿�
    SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
    SELECT * FROM EMP
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME != 'SCOTT';     
    
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

                ------------  �� �� ��������(������) --------------
                
--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���

SELECT ENAME, SAL, HIREDATE FROM EMP 
WHERE HIREDATE = ( SELECT MIN(HIREDATE) FROM EMP);

-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME , SAL FROM EMP
WHERE SAL = (SELECT MIN(SAL) FROM EMP);

-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO FROM EMP 
WHERE SAL >= ( SELECT AVG(SAL) FROM EMP); 

--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO
AND SAL <= (SELECT AVG(SAL) FROM EMP);

--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL , HIREDATE, GRADE 
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL 
AND HIREDATE <= (SELECT HIREDATE FROM EMP WHERE ENAME ='SCOTT') AND ENAME != 'SCOTT';

--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� �޿��� ū �� ����
SELECT E.ENAME, E.SAL , E.HIREDATE, GRADE ,DNAME
FROM EMP E, DEPT D, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO 
AND HIREDATE <= (SELECT HIREDATE FROM EMP WHERE ENAME ='SCOTT') AND ENAME != 'SCOTT'
ORDER BY SAL DESC;

--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL >= (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE') AND ENAME != 'BLAKE';

--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER') AND ENAME != 'MILLER';


--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�    
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME ='CLARK') 
AND SAL> (SELECT SAL FROM EMP WHERE EMPNO = 7698);

--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL 
FROM EMP E, DEPT D1
WHERE E.DEPTNO = D1.DEPTNO 
AND SAL>= (SELECT SAL FROM EMP WHERE EMPNO = 7698)
AND D1.DNAME = 
(SELECT D2.DNAME FROM EMP E2, DEPT D2 WHERE E2.DEPTNO = D2.DEPTNO AND  E2.ENAME ='CLARK') ;

SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO ; -- CLARK�� ���� �μ��� : ��ī���� ( ŷ, �з� )

--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');

--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL DESC;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ��3. ������ �������� -------------------        
            -- IN, ALL, ANY=SOME, EXISTS 
            
-- �� IN : �������� ��� �� �ϳ��� ��ġ�ϸ� '��'
    
    --ex. �μ����� �Ի����� ���� ���� ����� �̸�, �Ի���, �μ���ȣ
    SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; --(������, ���߿�)
    SELECT ENAME, HIREDATE , DEPTNO
    FROM EMP 
    WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);
    
    --ex. �޿� 3000 �̻� �޴� ����� �Ҽӵ� �μ����� �ٹ��ϴ� ����� ��� �ʵ�
    SELECT DEPTNO FROM EMP WHERE SAL>=3000;
    SELECT * FROM EMP 
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);
    
    --ex. JOB(��å��)�� ���� ���� ������ �޴� ����� �̸�, ��å, ������ ���
    SELECT JOB, MIN((SAL+NVL(COMM,0))*12) FROM EMP GROUP BY JOB;
    SELECT ENAME, JOB, (SAL+NVL(COMM,0))*12
    FROM EMP
    WHERE (JOB, (SAL+NVL(COMM,0))*12) IN (SELECT JOB, MIN((SAL+NVL(COMM,0))*12) FROM EMP GROUP BY JOB);
    
-- �� ALL : �������� ����� ��� �����ؾ� �� 
    
    --ex. (1)30�� �μ� �޿��� ��κ��� ū ��� = (2)30�� �μ� �ִ�޿� ���� ū ���
    --(1) ���������� ���� ��� 
    SELECT SAL FROM EMP WHERE DEPTNO=30; --30�� �μ� �޿� (������) 
    SELECT * FROM EMP WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);
    
    --(2) ���������� �ٲ㼭 �� ��� 
    SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30 GROUP BY DEPTNO; --30�� �μ� �޿� �ִ밪 -- ���⼭ GROUP BY ���ص� ����� 
    SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30 GROUP BY DEPTNO);
     
-- �� ANY = SOME : �������� ����� �ϳ��� ���� ���� ���

    --ex. 30�� �μ� ������ �޿����� �� �� �ϳ��� �� �޿� ���� ū ��� (=30�� �μ� �ּ� �޿����� ū ���) ������ ��� �ʵ�
    SELECT SAL FROM EMP WHERE DEPTNO=30; --��������(������)
    SELECT * FROM EMP 
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);
   
    -- ���� QUERY�� ������ ����������
    SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30;
    SELECT * FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);
    
        
-- �� EXISTS : �������� ����� �����ϸ� '��'(EXISTS�� ���������� ���� �ȵɼ��� ����)
-- ����� SELF JOIN �ص� ��    
    --ex. ���Ӻ��ϰ� �ִ� �������� ���, �̸�, �޿�
    --���������̿�
    SELECT EMPNO FROM EMP WHERE MGR=EMPNO;
    SELECT EMPNO, ENAME, SAL
        FROM EMP MANAGER
        WHERE EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);
        
    --SELF JOIN �̿� 
    SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;

    --ex. ���� ����� ��� �ʵ� ��� 
    --�������� �̿�
    SELECT * FROM EMP MANAGER
    WHERE NOT EXiSTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);

    --SELF JOIN �̿�
    SELECT M.*
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;

-----------------------------------------------------------------------------------------------------------
--źź 1. �μ����� ���� �޿��� ���� �޴� ����� ����(��� ��ȣ, ����̸�, �޿�, �μ���ȣ)�� ���(IN ������ �̿�)
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

--źź 2. ����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ���(IN)
SELECT DEPTNO FROM EMP WHERE JOB='MANAGER';
SELECT DEPTNO, DNAME, LOC 
FROM  DEPT 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');

--źź 3.������ 3000�̻��� ����� �� ���� ����� ����� �ش� ��޺� �ְ� ������ �޴� ������� 
-- ���, �̸�, ����, �Ի���, �޿�, �޿������ ���
SELECT MAX(SAL) , GRADE FROM EMP , SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE;

SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL 
AND (SAL, GRADE) IN (SELECT MAX(SAL) , GRADE FROM EMP , SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE)
ORDER BY GRADE;

-- źź 4.�Ի��� �б⺰�� ���� ���� �޿� �޴� ������� �б�, ���, �̸�, JOB, �����, �Ի���, �޿�, �󿩸� ����ϼ���
-- 1,2,3 -> 1 / 4,5,6->2 / 7,8,9->3/ 10,11,12->4
SELECT HIREDATE, CEIL(EXTRACT(MONTH FROM HIREDATE)/3)||'�б�'"�б�" FROM EMP ORDER BY "�б�";  
SELECT HIREDATE, CEIL(TO_CHAR(HIREDATE,'MM')/3)||'�б�'"�б�" FROM EMP ORDER BY "�б�";
--------------------------------------------------------------------------------�������̶� �� �� �κ�.... 
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3)||'�б�'"�б�" , MAX(SAL) FROM EMP GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3); --��������
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3)||'�б�'"�б�", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP
WHERE (CEIL(EXTRACT(MONTH FROM HIREDATE)/3),SAL) 
IN(SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) , MAX(SAL) FROM EMP GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3))
ORDER BY "�б�";
------------------------    �ٸ����  ----------------------------------
SELECT TO_CHAR(HIREDATE,'q')||'�б�' FROM EMP;
SELECT TO_CHAR(HIREDATE,'q')||'�б�' , EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP
WHERE (SAL) IN (SELECT MAX(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'q'))
ORDER BY TO_CHAR(HIREDATE,'q');

--źź 5. SALESMAN ��� ����� ���� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� 
        --���� ����� ������� �ʴ´�.(ALL�̿�)
SELECT ENAME, SAL, JOB 
FROM EMP 
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')AND JOB != 'SALESMAN';

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN') AND JOB !='SALESMAN'; 

--źź 6. SALESMAN �Ϻ� � �� ������� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ���(ANY)
SELECT ENAME, SAL, JOB 
FROM EMP 
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')AND JOB != 'SALESMAN';

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN') AND JOB !='SALESMAN'; 

--źź 7. ������ 3000�̸��� ��� �߿� ���� �ֱٿ� �Ի��� ����� �����ȣ�� �̸�, ����, �Ի����� ���
SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000;
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000);

--źź 8. ?	������ ��SALESMAN���� ����� �޴� �޿��� �ּ� �޿����� ���� �޴� ������� 
--�̸�, �޿�, ����, �μ���ȣ�� ����ϵ� �μ���ȣ�� 20���� ����� �����Ѵ�(ANY ������ �̿�)
SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN';
SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN')AND DEPTNO != 20;

SELECT SAL FROM EMP WHERE JOB = 'SALESMAN';
SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN') AND DEPTNO != 20;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                ------------  �� �� ��������(������) --------------

-- 14.  �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ��� ��ȣ,�̸�,�޿�(�� ��� �� ���)
SELECT DEPTNO , ENAME FROM EMP WHERE ENAME LIKE '%T%';
SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE (DEPTNO, ENAME) IN (SELECT DEPTNO, ENAME FROM EMP WHERE ENAME LIKE '%T%')
ORDER BY EMPNO;

-- 15. �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿�
SELECT LOC FROM DEPT WHERE LOC = 'DALLAS'; 
SELECT ENAME, JOB, SAL
FROM EMP E , DEPT D
WHERE E.DEPTNO = D.DEPTNO AND LOC = (SELECT LOC FROM DEPT WHERE LOC = 'DALLAS');

-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿�(ŷ�� �����ȣ�� MGR�� ������ �ִ� ���)
--JOIN
SELECT W.ENAME FROM EMP W, EMP M WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING';
--��������
SELECT ENAME, SAL
FROM EMP
WHERE MGR = ( SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

-- 17. SALES�μ� ����� �̸�, ����
SELECT ENAME, JOB 
FROM EMP E, DEPT D1
WHERE E.DEPTNO = D1.DEPTNO 
AND (D1.DNAME) IN 
(SELECT D2.DNAME FROM EMP E2, DEPT D2 WHERE E2.DEPTNO = D2.DEPTNO AND  D2.DNAME ='SALES') ;

-- 18. ������ �μ� 30�� ���� ���޺��� ���� ����� ��� �ʵ�
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30;
SELECT * FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);


-- 19. �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ����
--JOIN
SELECT E.ENAME, E.JOB FROM EMP E, EMP M WHERE E.JOB=M.JOB AND M.DEPTNO=30 AND E.DEPTNO=10;

--�������� 
SELECT ENAME, JOB
FROM EMP 
WHERE (JOB) IN (SELECT JOB FROM EMP WHERE DEPTNO = 30) AND DEPTNO = 10;

-- 20.  FORD�� ������ ���޵� ���� ����� ��� �ʵ�
SELECT JOB, SAL FROM EMP WHERE ENAME ='FORD';

SELECT *
FROM EMP
WHERE (JOB, SAL) IN ( SELECT JOB, SAL FROM EMP WHERE ENAME ='FORD');

-- 21. �̸��� JONES�� ������ JOB�� ���ų� FORD�� SAL �̻��� �޴� ����� ������ �̸�, ����, �μ���ȣ, �޿�
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ���
SELECT JOB FROM EMP WHERE ENAME = 'JONES';
SELECT SAL FROM EMP WHERE ENAME = 'FORD';

SELECT ENAME, JOB, DEPTNO, SAL
FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES')
OR SAL >=(SELECT SAL FROM EMP WHERE ENAME = 'FORD');


-- 22. SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿�
SELECT SAL FROM EMP WHERE ENAME = 'SCOTT' OR ENAME = 'WARD';

SELECT ENAME, JOB, SAL
FROM EMP
WHERE (SAL) IN (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT' OR ENAME = 'WARD');

-- 23. CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,����
SELECT LOC FROM DEPT WHERE LOC = 'CHICAGO';

SELECT ENAME, JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND LOC = (SELECT LOC FROM DEPT WHERE LOC = 'CHICAGO');

-- 24. �μ����� // ������ ��� ���޺��� ���� ����� ���, �̸�, �޿�, �μ���ȣ
--�μ��� ��� ������ ��ü ��� ���޺��� ������ ���϶�� �ž� �ƴϸ� 
--�μ��� ������ ��� ������ �μ��� ������ ��� ���� ������ ���϶�°�? 
-- �μ��� ��� ���޺��� 

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP E
WHERE SAL > ALL(SELECT AVG(SAL) FROM EMP WHERE E.DEPTNO = DEPTNO GROUP BY DEPTNO)ORDER BY DEPTNO;
SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO ;

--��� ���޺��� ū ��� 
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP); 

--
SELECT EMPNO, ENAME, SAL FROM EMP E 
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO); 

SELECT EMPNO, ENAME, SAL
FROM EMP E , (SELECT DEPTNO, AVG(SAL) "AVG" FROM EMP GROUP BY DEPTNO) A
WHERE E.DEPTNO = A.DEPTNO AND SAL>AVG; -- INLINE VIEW �̿�

-- �߰����� : �ش�μ���պ��� ���� ����� ���� : ��� , �̸�, �޿�, �μ���ȣ, �ش�μ��� ���(�Ҽ��� 2�ڸ�) 
-- 1.  EMP ��ü ��պ��� ���� ��� 
SELECT EMPNO, ENAME, SAL, DEPTNO 
FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- 2. �μ��� ��� ���� ���� ��� -- ������. �� ? GROUP BY �� ���� ���� ������ ��� ���� ���� ���� 
SELECT EMPNO, ENAME, SAL, DEPTNO , (SELECT AVG(SAL) FROM EMP WHERE E.DEPTNO = DEPTNO)
FROM EMP E
WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE E.DEPTNO = DEPTNO);

-- 3.


SELECT EMPNO, ENAME, SAL, DEPTNO ,ROUND((SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO),2)"�ش�μ��� ���"
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);

SELECT EMPNO, ENAME, SAL, E.DEPTNO
    FROM EMP E, (SELECT DEPTNO, ROUND(AVG(SAL),2) AVG FROM EMP GROUP BY DEPTNO) A
    WHERE E.DEPTNO = A.DEPTNO AND SAL>AVG; -- INLINE VIEW �̿� 
--(�� FROM EMP�� �ִ� DEPTNO�� SELECT ���� DEPTNO�� ������ Ȯ��)

-- 25. �������� ��� ���޺��� ���� ������ �޴� ����� �μ���ȣ, �̸�, �޿�
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB;

SELECT JOB, DEPTNO, ENAME, SAL
FROM EMP E
WHERE SAL < ALL (SELECT  AVG(SAL) FROM EMP WHERE E.JOB = JOB GROUP BY JOB ) ORDER BY JOB;


-- 26. ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����, �̸�, ���, �μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)
-- MGR�� ���� �ִ� ���� 
SELECT JOB, ENAME, EMPNO, DEPTNO
FROM EMP MANAGER
WHERE EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR) ORDER BY DEPTNO;


-- 27.  ���� ����� ���, �̸�, ����, �μ���ȣ EMPNO �� ������ , MGR�� ���� 
SELECT EMPNO, MGR FROM EMP; 
SELECT JOB, ENAME, EMPNO, DEPTNO
FROM EMP MANAGER
WHERE NOT EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);




