-- Ex1. ����ڿ��� �μ���ȣ �Է¹޾� �μ� ���� �Ѹ��� 
SELECT * FROM DEPT WHERE DEPTNO=30;
INSERT INTO DEPT VALUES (50,'IT','SEOUL');
SELECT * FROM DEPT;
ROLLBACK;

-- Ex2. 
    -- 1�� ������ �ڹٿ� �ٷ� �ִ� �� ���� 
SELECT * FROM DEPT WHERE DEPTNO=30;
    --�ش�μ���ȣ ����� ����(���, �̸�, �޿�, ����)
    -- 2�� ������ �״�� �ڹٿ� ������ �ȵ� (ENAME�� �ΰ��ϱ�)
    -- ALIAS �� �ְ� �ڹٿ� ���� 
SELECT W.EMPNO, W.ENAME, W.SAL, M.ENAME MANAGER FROM EMP W, EMP M 
WHERE W.MGR = M.EMPNO AND W.DEPTNO=30;

--Ex3. 
    -- ����ڿ��� DNAME �� �޾Ƽ� ������ ��� (SCANNER �κ�)
SELECT * FROM DEPT WHERE DNAME = UPPER('SALES'); -- �ڹٿ� �ű涧 �ҹ��ڷ� ����, UPPER �� ���ֱ� 

    -- ���, �̸�, �޿�, �޿���� (��� �κ�) 
SELECT EMPNO, ENAME, SAL, GRADE 
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND DNAME = UPPER('SALES') ;

SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL 
AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME = UPPER('SALES'));










