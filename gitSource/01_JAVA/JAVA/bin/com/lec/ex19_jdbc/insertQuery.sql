-- InsertDept 1 ���� 
INSERT INTO DEPT VALUES (70,'IT','SEOUL');
ROLLBACK;
COMMIT;
SELECT * FROM DEPT;

-- InsertDept 2 ���� 
    -- 1) �μ���ȣ �ߺ�üũ [�� �� �ϳ� ����] 
SELECT * FROM DEPT WHERE DEPTNO=70; -- rs.next()����� true/false
                                    -- true  : �ߺ��� �˸��� �޽��� ��� 
                                    -- false : �μ���/�μ���ġ �Է¹ޱ� 
SELECT COUNT(*)CNT FROM DEPT WHERE DEPTNO=70; -- Ÿ��Ʋ�� Ư������ �ȵ��� ����(ALIAS����)                                     
                                              -- rs.next()����� 1/0
                                              -- 1 : �ߺ��� �˸��� �޽��� ��� 
                                              -- 0 : �μ���/�μ���ġ �Է¹ޱ� 
    -- 2) ����Ʈ ����� ���� INSERT ���� ���� ����ϱ�                                           
INSERT INTO DEPT VALUES (70,'IT','SEOUL');    

------------------------------------update
--�Է�
INSERT INTO DEPT VALUES (55,'IT','SEOUL');
UPDATE DEPT SET DNAME = 'ABC' WHERE DEPTNO = 55;
DELETE FROM DEPT WHERE DEPTNO=55;

-- ���� 
UPDATE DEPT SET DNAME = 'ABC', LOC ='SEOUL' WHERE DEPTNO =55;
COMMIT;

--���� 
DELETE FROM DEPT WHERE DEPTNO=55;
COMMIT;
SELECT * FROM DEPT;


--------------------------------------prepared
--(�μ����� �Է¹޾�) ����� ���, �̸�, ��å, �޿��� ����Ͻÿ� 
SELECT EMPNO, ENAME, JOB, SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND DNAME = UPPER('sales');








