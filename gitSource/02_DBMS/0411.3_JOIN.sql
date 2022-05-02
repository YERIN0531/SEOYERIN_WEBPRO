--[III] JOIN : ���̺� 2�� �̻��� �����Ͽ� �˻� 
SELECT * FROM EMP WHERE ENAME ='SCOTT'; -- �μ���ȣ(DEPTNO 20)
SELECT * FROM DEPT;
-- CROSS JOIN (FROM���� TABLE �ΰ� �̻� �ִ� ��) 
SELECT * FROM EMP,DEPT WHERE ENAME ='SCOTT';
--------------1  * 4  -------�����ϸ� EMP�� DEPT���̺��� �� �޶�پ ���� �ǹ̰� ����
SELECT * FROM EMP, DEPT; -- 14*4 = 56��


-- �� 1. EQUI JOIN (�������� : ���� �ʵ��� DEPTNO���� ��ġ�Ǵ� ���� JOIN)
SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO; 
SELECT * FROM EMP,DEPT WHERE ENAME ='SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO; 
SELECT * FROM EMP,DEPT WHERE  EMP.DEPTNO = DEPT.DEPTNO AND ENAME ='SCOTT' ; 

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, EMP.DEPTNO , DNAME, LOC 
FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO;

-- ���̺��� ��Ī (���̺��� ��Ī�� ������ ��Ī���θ� ���̺��� ������ �� �� �ֽ��ϴ�)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;

    --EX. �޿��� 2000�̻��� ������ �̸�, ��ì(JOB), �޿�, �μ���(DNAME), �ٹ���(LOC) ��� 
SELECT ENAME, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND SAL>=2000;

    --EX. �ٹ����� (LOC) 'CHICAGO'�� ����� �̸�, ����, �޿�, �μ���ȣ , �ٹ���(LOC) ���
SELECT ENAME, JOB, SAL, D.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC='CHICAGO';

    --EX. �μ���ȣ�� 10�̰ų� 20���� ����� �̸�, ����, �ٹ���, �޿�
SELECT ENAME, JOB, LOC, SAL 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN(10,20) ORDER BY SAL;

    --EX. JOB�� SALESMAN�̰ų� MANAGER�� ����� �̸�, �޿�, ��, ����((SAL+COMM)*12), �μ���(DNAME) , �ٹ���(LOC) ������ ū �� 
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0)*12) "����", DNAME, LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND JOB IN('SALESMAN','MANAGER') ORDER BY "����" DESC;

    --EX. COMM�� NULL�̰� �޿��� 1200�̻��� ����� �̸�, �޿�, �Ի���, �μ���ȣ, �μ��� ��� -- �μŸ��, �޿�ū�� ����
SELECT ENAME, SAL, HIREDATE, E.DEPTNO, DNAME FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO AND SAL>=1200 AND COMM IS NULL ORDER BY DNAME,SAL DESC;

    --EX. 'NEW YORK'���� �ٹ��ϴ� ����� �̸��� �޿� ��� 
SELECT ENAME, SAL FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC = 'NEW YORK';
SELECT * FROM EMP,DEPT;

    --EX. 'ACCOUNTING' �μ� �Ҽ��� ����̸��� �Ի��� ��� 
SELECT ENAME, HIREDATE FROM EMP E, DEPT D WHERE DNAME = 'ACCOUNTING';

    --EX. ����(JOB)�� MANAGER�� ����� �̸� �μ����� ����϶� 
SELECT ENAME, DNAME FROM EMP E, DEPT D WHERE JOB = 'MANAGER';

    --EX. COMM�� NULL�� �ƴ� ����� �̸�, �޿�, �μ���ȣ, �ٹ��� ��� 
SELECT ENAME, SAL, E.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND NOT COMM IS NULL;

-- �� 2. NON-EQUI JOIN (�������� ���� JOIN)  
SELECT * FROM EMP WHERE ENAME = 'SCOTT'; --EMP TABLE�� ������� 
SELECT * FROM SALGRADE; --�޿� ��� ���� 

-- CROSS JOIN = EMP�� 1�� * SALGRADE�� 5�� 
SELECT * FROM EMP,SALGRADE WHERE ENAME='SCOTT';

-- JOIN ���ǿ� BETWEEN�� ������ �� 
SELECT * FROM EMP, SALGRADE WHERE ENAME = 'SCOTT' AND SAL BETWEEN LOSAL AND HISAL;
SELECT * FROM EMP, SALGRADE WHERE ENAME = 'SCOTT' AND SAL >= LOSAL AND SAL<=HISAL; --�̷��� �� �Ⱦ�

    --EX. ��� ����� ���, �̸�, JOB, �����, �޿�, �޿����(1���,2���..) --'���'�ڿ� ALIAS ���ָ� Ư������ �� �� ���� 
SELECT * FROM SALGRADE;
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'���' GRADE
FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;

-------------------------NON-EQUI JOIN źź����----------------------------------------
--źź1. Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL , GRADE, E.DEPTNO, DNAME, LOC 
FROM EMP E, DEPT D, SALGRADE  
WHERE E.DEPTNO = D.DEPTNO 
AND SAL BETWEEN LOSAL AND HISAL 
AND NOT COMM IS NULL;
--źź2. �̸�, �޿�, �Ի���, �޿����
SELECT ENAME, SAL, HIREDATE, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;
--źź3. �̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--źź4. �̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���
SELECT ENAME, SAL, GRADE, E.DEPTNO, LOC 
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND NOT COMM IS NULL;
--źź5. �̸�, �޿�, �޿����, ����, �μ��� (�μ��� ���, �μ��� ������ ������) ����=(sal+comm)*12 comm�� null�̸� 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 "����", DNAME
FROM EMP E, DEPT D, SALGRADE 
WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
ORDER BY DNAME,(SAL+NVL(COMM,0))*12;

--źź6. �̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. �������� : �μ���, �μ������� ������, ���������� �޿� ū��
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
AND SAL BETWEEN 1000 AND 3000
ORDER BY DNAME, JOB, SAL DESC;


--źź7. �̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
AND HIREDATE LIKE '%81%'
ORDER BY GRADE DESC;

-- �� 3. SELF JOIN
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'SMITH';  -- ���̽��� ��� �̸����� ���ϸ� SELF JOIN 
                                                          -- SMITH ��� ��� : 7902
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO=7902;
SELECT EMPNO, ENAME, MGR, EMPNO, ENAME FROM EMP WORKER, EMP MANAGER WHERE WORKER.ENAME ='SMITH'; --�׳� �̷��� ���� ������ 

SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MANAGER.EMPNO, MANAGER.ENAME 
FROM EMP WORKER, EMP MANAGER 
WHERE WORKER.ENAME ='SMITH' AND WORKER.MGR = MANAGER.EMPNO;

    --EX. ��� ����� ���, �̸�, �����, ����̸�(13��) 
SELECT W.EMPNO ���, W.ENAME �̸�, W.MGR �����, M.ENAME ����̸�
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO; -- ��簡 ���� (NULL) ���� KING�� �ֱ� ������ 14���� �ƴ϶� 13���� ������ ��

    --EX. 'SMITH�� ���� FORD��' �������� ������� ��� 
SELECT W.ENAME || '�� ����' || M.ENAME || '��'
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO;

-- źź1. SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� ����Ͻÿ� 
SELECT * FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME FROM EMP WHERE DEPTNO = 20 AND ENAME != 'SCOTT';

---SELFJOIN �� �ٽ� Ǯ��� -------------------------------------------------------�ٽ� Ǯ��� 
SELECT WORKER.ENAME 
FROM EMP WORKER , EMP MANAGER 
WHERE WORKER.DEPTNO = MANAGER.DEPTNO AND MANAGER.ENAME = 'SCOTT' AND WORKER.ENAME != 'SCOTT';

-----------------������ Ǯ�� 
--1�ܰ�
SELECT E1.ENAME, E1.DEPTNO, E2.ENAME, E2.DEPTNO
FROM EMP E1, EMP E2
WHERE E1.ENAME = 'SCOTT' AND E1.DEPTNO = E2.DEPTNO AND E2.ENAME != 'SCOTT';
--2�ܰ� ���� 
SELECT E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.ENAME = 'SCOTT' AND E1.DEPTNO = E2.DEPTNO AND E2.ENAME != 'SCOTT';





-- źź2. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�(2�ܰ� ��������) 
SELECT * FROM DEPT;
-- ���������� DALLAS �ٹ��� �μ��� �ϳ� �߰� 
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
SELECT * FROM DEPT;
-- ���������� 50�� �μ��� �ٹ��ϴ� ����� �߰� 
SELECT * FROM EMP;
INSERT INTO EMP VALUES (9999,'ȫ�浿',NULL,NULL,NULL,9000,900,50);
SELECT * FROM EMP;

SELECT * FROM DEPT;
SELECT W.ENAME 
FROM  EMP E, DEPT D, EMP W, EMP M
WHERE E.DEPTNO = D.DEPTNO  AND  AND M.ENAME = 'SCOTT';

--------------------------������ Ǯ�� 
----------1�ܰ� 
SELECT E1.ENAME, D1.LOC, E2.ENAME, D2.LOC
FROM EMP E1, DEPT D1, EMP E2, DEPT D2
WHERE E1.DEPTNO = D1.DEPTNO AND E2.DEPTNO = D2.DEPTNO AND D1.LOC = D2.LOC 
AND E1.ENAME = 'SCOTT';

----------2�ܰ�
SELECT E2.ENAME
FROM EMP E1, DEPT D1, EMP E2, DEPT D2
WHERE E1.DEPTNO = D1.DEPTNO AND E2.DEPTNO = D2.DEPTNO AND D1.LOC = D2.LOC 
AND E1.ENAME = 'SCOTT';

ROLLBACK;

--źź3. ����� �̸��� 'KING'�� ������� �̸��� JOB�� ��� 
SELECT W.ENAME, W.JOB
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING';

-- �� 4. OUTER JOIN : ���ν� ���ǿ� �������� ���� ����� ��Ÿ���� �ϰ� ���� �� // ���� �ʿ��ٰ� (+)���̱� 
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO(+);--MGR�� �ְ�(�������� ��ȣ��) , ������� ���¾���

SELECT ENAME, D.DEPTNO, DNAME
FROM EMP E, DEPT D -- 40�� �μ� ���� / ������ �ϸ� 40�� �μ��� �ȳ���.. 
WHERE E.DEPTNO(+) = D.DEPTNO; -- E.DEPTNO���� 40�� �μ� ���� 
SELECT * FROM DEPT;

SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME --�ѻ�簡 �ƴϸ� MGR�� ���� (������ ���ܻ���ϰ��) //MGR���� ����, ����� �ִ¾� 
FROM EMP W, EMP M
WHERE W.MGR(+) = M.EMPNO;


-- �� <��������> PART1
--SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
--SELECT * FROM EMP;
--1. �̸�, ���ӻ��
SELECT W.ENAME , M.ENAME "MANAGER"
FROM EMP W, EMP M 
WHERE W.MGR = M.EMPNO;

--2. �̸�, �޿�, ����, ���ӻ��
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME"MANAGER"
FROM EMP W, EMP M 
WHERE W.MGR = M.EMPNO;

--3. �̸�, �޿�, ����, ���ӻ��. (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)
SELECT W.ENAME, W.SAL, W.JOB, NVL(M.ENAME,'����')"MANAGER"
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO(+);

--4. �̸�, �޿�, �μ���, ���ӻ��� 
SELECT W.ENAME, W.SAL, DNAME, M.ENAME"MANAGER"
FROM EMP W, EMP M, DEPT D1
WHERE W.DEPTNO = D1.DEPTNO AND W.MGR = M.EMPNO;

--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)
SELECT W.ENAME , W.SAL, W.DEPTNO, DNAME, LOC , M.ENAME"MANAGER"
FROM EMP W, DEPT D1, EMP M 
WHERE W.DEPTNO=D1.DEPTNO AND W.MGR = M.EMPNO(+);

--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���
SELECT W.ENAME, W.SAL, GRADE ,DNAME, M.ENAME "MANAGER"
FROM EMP W, EMP M, DEPT D1, SALGRADE
WHERE W.DEPTNO = D1.DEPTNO AND W.MGR = M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL
AND W.SAL>=2000;

--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME"MANAGER"
FROM EMP W, EMP M, DEPT D1, SALGRADE
WHERE W.DEPTNO = D1.DEPTNO AND W.MGR = M.EMPNO(+) AND W.SAL BETWEEN LOSAL AND HISAL
ORDER BY DNAME;

--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0
SELECT W.ENAME, W.SAL, GRADE, DNAME , (W.SAL+NVL(W.COMM,0))*12 "����", M.ENAME"MANAGER"
FROM EMP W, EMP M, DEPT D, SALGRADE
WHERE W.DEPTNO=D.DEPTNO AND W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL;

--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT W.ENAME, W.SAL, GRADE, DNAME , (W.SAL+NVL(W.COMM,0))*12 "����", M.ENAME"MANAGER"
FROM EMP W, EMP M, DEPT D, SALGRADE
WHERE W.DEPTNO=D.DEPTNO AND W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL 
ORDER BY DNAME, W.SAL DESC;

--  PART2
--1.EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ���
SELECT ENAME, JOB, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ��� 
SELECT ENAME, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND NOT COMM IS NULL AND COMM !=0  ;
SELECT ENAME, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND COMM>=1  ;

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME, JOB, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%L%';

--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT EMPNO, ENAME, E.DEPTNO, DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO ORDER BY ENAME;

--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, SAL, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000 ORDER BY SAL DESC;

--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND JOB = 'MANAGER' AND SAL>=2500 ORDER BY EMPNO;

--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE 
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL ORDER BY SAL DESC;

--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)
SELECT W.ENAME , M.ENAME "MANAGER"
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO(+);

--10. �����, ����, ����� ������ �˻��Ͻÿ�
SELECT W.ENAME , M.ENAME"MANAGER", S.ENAME"MANAGER�� ���"
FROM EMP W, EMP M, EMP S
WHERE W.MGR = M.EMPNO AND M.MGR = S.EMPNO;

--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT W.ENAME , M.ENAME"MANAGER", S.ENAME"MANAGER�� ���"
FROM EMP W, EMP M, EMP S
WHERE W.MGR = M.EMPNO(+) AND M.MGR = S.EMPNO(+);






