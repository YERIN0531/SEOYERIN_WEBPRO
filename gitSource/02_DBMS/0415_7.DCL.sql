-- scott2�� ���� ��ųʸ� �� Ȯ��
SHOW USER;
SELECT * FROM USER_TABLES; -- SCOTT2�� ������ �ִ� ���̺� 
SELECT * FROM ALL_TABLES;  -- SCOTT2�� ���ٰ����� ���̺� 
SELECT * FROM ALL_TABLES WHERE TABLE_NAME IN ('DEPT','EMP');

--DB�� ������ ���� ���(SCOTT)�� SCOTT2���� ������ �ο� ����� ������ ���� 
SELECT * FROM SCOTT.EMP;
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.EMP E, SCOTT.DEPT D WHERE E.DEPTNO=D.DEPTNO;
EXIT;





