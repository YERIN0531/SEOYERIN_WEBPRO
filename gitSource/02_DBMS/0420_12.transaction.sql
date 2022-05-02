-- [XII] TRANSACTON ��ɾ� : COMMIT(Ʈ����ǹݿ�); ROLLBACK (Ʈ����� ���); SAVEPOINT(Ʈ����� ����);
-- COMMIT,ROLLBACK�� ���� ������ SAVEPOINT�� ���� �Ⱦ����� ���迣 ���� 
-- DDL �۾��� Ʈ����ǿ� �ݿ� �ȵ� 
-- DCL �۾��� Ʈ����ǿ� �ݿ� �ȵ� 
-- DML �۾��� Ʈ����ǿ� �ݿ� �� ( �� �߿����� SELECT�� �ش� X ������ �ݿ��ϴ°� �ƴϱ� ������ )
DROP TABLE DEPT01;
-- 1. DEPT01 ���� 
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
SELECT * FROM DEPT01;   -- 10,20,30,40

-- 2. DEPT01 DELETE �ϱ�  (Ʈ����ǿ� ����) 
DELETE FROM DEPT01;     
SELECT * FROM DEPT01;

-- 3. ROLLBACK �ϱ� (Ʈ����ǿ� ������� ������ ROLLBACK �Ѵ�) 
-- COMMIT, ROLLBACK : ���ο� Ʈ����� ���� �ϰڴٴ� �� 
ROLLBACK;

-- 4. DELETE �ٽ� �غ��� - > Ʈ����ǿ� ���� 
DELETE FROM DEPT01 WHERE DEPTNO=40;

-- 5. COMMIT �ϴ� ���� ���󺹱� �Ұ�. ���ο� Ʈ����� ���� 
COMMIT;

-- 6. ���ο� Ʈ����� ���� 
SELECT * FROM DEPT01;   -- 10,20,30

-- SAVEPOINT
-- 30���μ� DELETE 20���μ� DELETE 10���μ� DELETE 
-- ��� �ϰ� ������ 20���μ�,10���μ� DELETE�� ����ϰ� ���� 
-- 30���μ� DELETE - COMMIT - 20��,10���μ� DELETE - ROLLBACK �ϸ� ������ ������ �� ����
-- Ʈ������� �����ϴ� SAVEPOINT����غ��� 

-- 1. 30�� DELETE �غ��� �ϱ�
DELETE FROM DEPT01 WHERE DEPTNO=30;
SELECT * FROM DEPT01;

-- 2. SACEPOINT ����ֱ� 
-- C1 ���� : 10, 20�� �μ��� �ִ� ���� (30���� ������ ����) 
SAVEPOINT C1;

-- 3. 20�� DELETE & SAVEPOINT C2����
-- C2 ���� : 10�� �μ��� �ִ� ���� 
DELETE FROM DEPT01 WHERE DEPTNO=20;
SELECT * FROM DEPT01;
SAVEPOINT C2;

-- 4. 10�� DELETE
DELETE FROM DEPT01 WHERE DEPTNO=10;
SELECT * FROM DEPT01; -- ������ ���� (�� �������ϱ�) 

-- 5. ROLLBACK �ϱ� 
-- ROLLBBACK �ϸ� ��ü�� �� ����. 
-- ROLLBACK TO C1 �ϸ� �Ʒ� 10��, 20�� �μ��� ��� ���� 
-- ROLLBACK TO C2 �ϸ� �Ʒ� 10���μ��� �������
ROLLBACK TO C2; -- 10�� �μ�  ( Ʈ����ǿ� 20,30�μ��� �������� -> �̺κ��� ����Ǵ� 20,30 DELETE �Ǵ� ��)
ROLLBACK TO C1; -- 10�� 20�� �μ� ( Ʈ����ǿ� 30 �μ��� �������� -> �̺κ��� ����Ǵ� 30 DELETE �Ǵ� �� ) 
COMMIT;
SELECT * FROM DEPT01;



