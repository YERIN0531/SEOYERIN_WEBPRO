--1. ���� ���� ���� 

--ex. �޿��� ���� ���� �޴� ����� ���, �̸�, ��å, �޿�
SELECT EMPNO, ENAME, JOB, SAL FROM EMP ;
SELECT EMPNO, MAX(SAL) FROM EMP GROUP BY EMPNO; -- �����Լ��� �׷��Լ��� �Բ� ���϶�, GROUP BY ������ 
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP );

--�������� ���� 1) ������ �������� : �������� ����� ������ 

--ex. SCOTT�� �ٹ��ϴ� �μ� �̸� ��� 
--����
SELECT DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
--��������
SELECT DNAME 
FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--�������� ���� 2) ������ �������� : �������� ����� 2���̻� 
--ex. JOB�� MANAGER�� ����� �μ��̸� 
SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER';
SELECT DNAME 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ��2. ������ �������� -------------------
--ex. SCOTT �� ���� �μ��� ����� �̸��� �޿� 
SELECT ENAME, SAL FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME, SAL 
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--ex. SCOTT�� ���� �ٹ����� ����� �̸��� �޿� 
SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
SELECT ENAME, SAL
FROM EMP E1, DEPT D2 
WHERE E1.DEPTNO = D2.DEPTNO 
AND LOC = (SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.ENAME = 'SCOTT');

--ex. �����Ի��ϰ� �����Ի��� ���
SELECT MIN(HIREDATE) FROM EMP;
SELECT HIREDATE, ENAME
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);

--ex. �ֱ��Ի��ϰ� �ֱ��Ի��� ���
SELECT MAX(HIREDATE) FROM EMP;
SELECT HIREDATE, ENAME
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

--ex. �����Ի��ϰ� ���� �Ի��� ���, �ֱ��Ի��ϰ� �ֱ��Ի��� ��� 
SELECT E.HIREDATE , E.ENAME, F.HIREDATE , F.ENAME 
FROM EMP E, EMP F 
WHERE E.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)
AND F.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

-- ������ �ڵ� 
 SELECT 
        (SELECT MAX(HIREDATE) FROM EMP) LAST,
        (SELECT ENAME FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP)) LASTMAN,
        (SELECT MIN(HIREDATE) FROM EMP) FIRST,
        (SELECT ENAME "FIRSTMAN" FROM EMP WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)) FIRSTMAN
    FROM DUAL;

--ex. SCOTT�� ���� �μ��� �ٹ��ϴ� ������� �޿���
SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
SELECT SUM(SAL) 
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--ex. SCOTT�� ������ ��å�� ���� ����� ��� �ʵ� 
SELECT JOB FROM EMP WHERE ENAME='SCOTT';
SELECT * FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME='SCOTT');

--ex. DALLAS���� �ٹ��ϴ� ����� �̸�, �μ���ȣ
SELECT LOC FROM DEPT WHERE LOC = 'DALLAS';
SELECT ENAME, DEPTNO
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');

--ex. 'KING'�� ���� ����� ����� �̸��� �޿�
SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
SELECT ENAME, SAL
FROM EMP 
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

--����
SELECT W.ENAME, W.SAL
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING';

--ex. ��ձ޿� ���Ϸ� �޴� ����� �̸��� �޿��� ���
SELECT AVG(SAL) FROM EMP;
SELECT ENAME, SAL
FROM EMP
WHERE SAL<=(SELECT AVG(SAL) FROM EMP);

--ex. ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿�, ��ձ޿� ��� 
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP) )AVG
FROM EMP
WHERE SAL<=(SELECT AVG(SAL) FROM EMP);

--ex. ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿�, ��հ� ���̸� ���
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)-SAL )DIFF
FROM EMP
WHERE SAL<=(SELECT AVG(SAL) FROM EMP);

-- ������ ���߿� �������� 
-- ex. SCOTT�̶� JOB�� DEPTNO�� ���� ������ ��� �ʵ带 ���
--������ ���Ͽ�
SELECT * FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT')
AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
--������ ���߿� 
-- ������ ���߿�
    SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
    SELECT * FROM EMP
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME != 'SCOTT';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ��3. ������ �������� -------------------        
            -- IN, ALLL, ANY, EXISTS
-- �� IN : �������� ��� �� �ϳ��� ��ġ�ϸ� '��'

--EX. �μ����� �Ի����� ���� ���� ����� �̸�, �Ի���, �μ���ȣ 
SELECT MAX(HIREDATE) FROM EMP GROUP BY DEPTNO;
SELECT ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE (HIREDATE) IN (SELECT MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);

--EX. �޿� 3000�̻� �޴� ����� �Ҽӵ� �μ����� �ٹ��ϴ� ����� ��� �ʵ� 
SELECT DEPTNO FROM EMP WHERE SAL>=3000;
SELECT * FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);

--EX. JOB(��å��)�� ���� ���� ������ �޴� ����� �̸�, ��å, ������ ��� 
SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB; 
SELECT ENAME, JOB, SAL
FROM EMP
WHERE (JOB,SAL) IN (SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB);

-- �� ALL : �������� ����� ��� �����ؾ� �� 
    
    --ex. (1)30�� �μ� �޿��� ���� ���� ū ��� = (2)30�� �μ� �ִ�޿� ���� ū ���
    --(1) ���������� ���� ��� 
    SELECT SAL FROM EMP WHERE DEPTNO = 30;
    SELECT * FROM EMP
    WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);
    --(2) ���������� �ٲ㼭 �� ��� 
    SELECT * FROM EMP
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30 GROUP BY DEPTNO );

-- �� ANY = SOME : �������� ����� �ϳ��� ���� ���� ���

    --ex. 30�� �μ� ������ �޿����� �� �� �ϳ��� �� �޿� ���� ū ��� (=30�� �μ� �ּ� �޿����� ū ���) ������ ��� �ʵ�
    SELECT SAL FROM EMP WHERE DEPTNO=30;
    SELECT * FROM EMP
    WHERE SAL > ANY ( SELECT SAL FROM EMP WHERE DEPTNO=30);
    -- ���� QUERY�� ������ ����������
    
-- �� EXISTS : �������� ����� �����ϸ� '��'(EXISTS�� ���������� ���� �ȵɼ��� ����)
-- ����� SELF JOIN �ص� ��    
    --ex. ���Ӻ��ϰ� �ִ� �������� ���, �̸�, �޿�
    --���������̿�
   SELECT EMPNO, ENAME, SAL
   FROM EMP MANAGER
   WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR); 
        
    --SELF JOIN �̿� 
    

    --ex. ���� ����� ��� �ʵ� ��� 
    SELECT * FROM EMP WORKER
    WHERE EXISTS(SELECT * FROM EMP WHERE WORKER.EMPNO != MGR);
    -- �̷��� �ϸ� WOKER�� EMPNO�� MGR�� ��ġ ���� ���� �ָ� �̾ƹ��� EXISTS�� ���� ���� �Ʒ�ó�� �������� ���� ��� �̾ƶ� ��� ����ߵ� 
    
    SELECT * FROM EMP MANAGER
   WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);

    --SELF JOIN �̿�
   
-----------------------------------------------------------------------------------------------------------
--źź 1. �μ����� ���� �޿��� ���� �޴� ����� ����(��� ��ȣ, ����̸�, �޿�, �μ���ȣ)�� ���(IN ������ �̿�)
SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- ��������
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);
    
--źź 2. ����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ���(IN)
SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER';
SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER');

SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'; -- ��������(������)
SELECT DEPTNO, DNAME, LOC 
    FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');

--źź 3.������ 3000�̻��� ����� �� ���� ����� ����� �ش� ��޺� �ְ� ������ �޴� ������� 
-- ���, �̸�, ����, �Ի���, �޿�, �޿������ ���



SELECT GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000;
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
FROM EMP , SALGRADE 
WHERE SAL BETWEEN LOSAL AND HISAL 
AND (SAL, GRADE) IN (SELECT MAX(SAL), GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE) ;

SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
    FROM SALGRADE, EMP
    WHERE SAL BETWEEN LOSAL AND HISAL
        AND (GRADE, SAL) IN (SELECT GRADE, MAX(SAL) 
                                FROM SALGRADE, EMP 
                                WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000
                                GROUP BY GRADE); -- ���� ����


-- źź 4.�Ի��� �б⺰�� ���� ���� �޿� �޴� ������� �б�, ���, �̸�, JOB, �����, �Ի���, �޿�, �󿩸� ����ϼ���
-- 1,2,3 -> 1 / 4,5,6->2 / 7,8,9->3/ 10,11,12->4
SELECT CEIL(TO_CHAR(HIREDATE,'MM')/3)"�б�", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP 
WHERE (CEIL(TO_CHAR(HIREDATE,'MM')/3),SAL) IN(SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) , MAX(SAL) FROM EMP GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3))
ORDER BY "�б�"; 


--------------------------------------------------------------------------------�������̶� �� �� �κ�.... 

------------------------    �ٸ����  ----------------------------------
SELECT TO_CHAR(HIREDATE,'Q')||'�б�' FROM EMP;
SELECT TO_CHAR(HIREDATE,'Q')||'�б�' , EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP
WHERE (SAL) IN (SELECT MAX(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'Q'))
ORDER BY TO_CHAR(HIREDATE,'Q');

--źź 5. SALESMAN ��� ����� ���� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� 
        --���� ����� ������� �ʴ´�.(ALL�̿�)
SELECT ENAME , SAL, JOB
FROM EMP 
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN') AND JOB != 'SALESMAN';
SELECT JOB, ENAME, SAL FROM EMP WHERE JOB = 'SALESMAN';

--źź 6. SALESMAN �Ϻ� � �� ������� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ���(ANY)
SELECT ENAME , SAL, JOB
FROM EMP 
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');
SELECT JOB, ENAME, SAL FROM EMP WHERE JOB = 'SALESMAN';

--źź 7. ������ 3000�̸��� ��� �߿� ���� �ֱٿ� �Ի��� ����� �����ȣ�� �̸�, ����, �Ի����� ���
SELECT ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000);

--źź 8. ?	������ ��SALESMAN���� ����� �޴� �޿��� �ּ� �޿����� ���� �޴� ������� 
--�̸�, �޿�, ����, �μ���ȣ�� ����ϵ� �μ���ȣ�� 20���� ����� �����Ѵ�(ANY ������ �̿�)





