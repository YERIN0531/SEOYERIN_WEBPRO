-- [XI] �ε��� : ��ȸ�� ������ �ϴ� �ε��� 
-- Q. ���� ���� ������ �ʾƵ� �ε����� ������ ���� 
-- A. ���̺� ������ PRIMARY KEY ����� ��פİ� �ڵ����� �ε��� ���� 
SELECT * FROM USER_INDEXES; -- ��ųʸ��信�� SCOTT�� ������ �ε��� ����
DESC EMP;

DROP TABLE EMP01;
-- 1. EMP ����� ���� EMP01 ���� (�̷��� �����Ѵٰ� �ؼ� �������ǵ鵵 ���� ���� �Ǵ� ���� �ƴ�) 
CREATE TABLE EMP01 AS SELECT * FROM EMP; -- EMP����� ���� EMP01 ����
SELECT * FROM EMP01; --14��

-- 2. �� �߰� �ϱ� 2�� �����ϱ� 
INSERT INTO EMP01 SELECT * FROM EMP01; -- 1�� �����(28��) 2��(56��) 

-- 3. �������� ���� Ȯ���ϱ� 
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;

-- 4. 11�� ���� �ϱ� (11��4õ��)
INSERT INTO EMP01 SELECT * FROM EMP01;

-- 5. ������ �� �ϳ� �߰� �ϱ� (ȫ�̶�� ��� �ϳ� �߰�)
INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO) VALUES (1111,'HONG',40);

-- 6. ȫ ������ ���� �ִ� �۾�  (3������-91����) 
-- ������ ȫ�� �߰��߱� ������ EMP01�� INSERT �ϸ� ȫ�� ���� �߰��� �� �� ���� �� 
INSERT INTO EMP01 SELECT * FROM EMP01; 

-- 7. �ε��� ���� �� ��ȸ
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- �ε��� ���� �� : 0.018��

-- 8. �ε��� ���� �� ��ȸ 
--    �ε��� ���� ( EMP01 ���̺��� ENAME)
CREATE INDEX IDX_EMP01_ENAME ON EMP01 (ENAME); -- �ε��� ���� : 0.364��
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- �ε��� ���� �� : 0.001�� 

-- 9. ������ ��ųʸ����� �ε��� �̸� �� �����ִ��� Ȯ���غ��� 
SELECT * FROM USER_INDEXES WHERE INDEX_NAME = 'IDX_EMP01_ENAME';
COMMIT; --91���� �� 

-- 10. �ε��� ���� �� INSERT �ӵ� ���� 
INSERT INTO EMP01 SELECT * FROM EMP01; -- �ε��� ���� �� INSERT �ӵ� : 21.3��

-- 11. 'HONG'���� ROLLBACK �ؼ� �ٽ� 91���� �����  
ROLLBACK; -- ��� �ӵ� : 8.981~10.3�� 

-- 12. �ε��� ���� �ϱ� 
DROP INDEX IDX_EMP01_ENAME;
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;

-- 13. �ε��� ���� �� INSERT �ӵ� ���� 
INSERT INTO EMP01 SELECT * FROM EMP01; -- �ε��� ���� �� INSERT �ӵ� : 1.269�� 

-- EMP01 ���� ���̺��� DROP �ϸ� �ε����� ���� ����� 





