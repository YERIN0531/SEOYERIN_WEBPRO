--[X] VIEW, INLINE VIEW, TOP-N����
-- ������ ���� ���� �����鼭 EMP���̺��� �Ϻθ� ��� �� �� �ְ� �ϴ� �� �� �� 

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

    -----------------------1. VIEW : ������ ���̺� --------------------------
    -- �� �ܼ��� (�޸� ���� ���� X)
    -- �� ���պ� (�޸� ���� ���� X)
    
-- �� �ܼ��� (�޸� ���� ���� X) : �ϳ��� ���̺�� ������ �� 
-- EMPv0 �̶�� VIEW ���� �Ǵ� ���� = EMP ���̺� �Ϻ� �ʵ带 �޴� ���� ������ ���̺� 

-- VIEW�� �����ϰ�, �����ϴ� �� ����� 
SELECT * FROM USER_VIEWS; --������ ��ųʸ� �� Ȯ�� 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO FROM EMP; --DDL�� �����ϸ� �����͵�ųʸ� �ڵ� ���� 
    
-- VIEW �� ��ųʸ� Ȯ���ϰ� ���̺� Ȯ���ϱ� 
SELECT * FROM USER_VIEWS;
SELECT * FROM EMPv0; -- ������ �������� �ʴ� ������ ���̺� (��¥ ���̺�ó�� �Ȱ��� �� �� ����)

-- VIEW INSERT �غ��� 
INSERT INTO EMPv0 VALUES (1111,'ȫ','ITMANAGER',7369,SYSDATE,40); --�信 INSERT 
SELECT * FROM EMP; -- EMP���� �μ�Ʈ ���� �� ��, SAL�� COMM�� �翬�� NULL 

-- VIEW UPDATE �غ��� 
UPDATE EMPv0 SET JOB = 'MANAGER' WHERE EMPNO=1111; -- EMP�� ���� ������Ʈ �� 

-- VIEW DELETE �غ��� 
DELETE FROM EMPv0 WHERE EMPNO =1111; -- �� DELETE �ϸ� EMP ���̺� DELETE 

-- EMPv0�̶�� VIEW : EMP ���̺��� 30�� �μ��ุ ���̰� �ϱ� 
-- EMPv0 �̶�� VIEW ����. ������ �����ϴ� EMPv0�� �ִٸ� �ڵ����� ���ο� ������ ���� 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO=30;
DESC EMPv0;
SELECT * FROM EMPv0;

-- ���� ���� EMPv0�� 30���μ��� INSERT �ϱ� 
INSERT INTO EMPv0 VALUES (1111,'ȫ',NULL,NULL,SYSDATE,9000,900,30); --30�� �μ� INSERT 

-- 30���μ��� EMPv0�� ������ �ο�����. �ٵ� ���� 40�� �μ��� �μ�Ʈ �ϰڴٸ� ? 
INSERT INTO EMPv0 VALUES (1112,'��',NULL,NULL, SYSDATE, 8000,800,40); --�μ�Ʈ�� ���� 
SELECT * FROM EMPv0; -- EMPv0�� �����̺��� �ƴϰ�, ������ ���̺��̱� ������ 30�� �μ��� �������. 40�� �Ⱥ��� 
SELECT * FROM EMP; -- �ٵ� EMP������ �Է°��� 

-- ���������� EMPv0�� 30�� �μ��� �ִٰ� �����ϱ� ������ 1111�� ������ 
DELETE FROM EMPv0 WHERE EMPNO IN(1111,1112); -- 1112�� ������ EMPv0�� ���� , 1112�� �������� ���� 
                                             -- 30�� �μ��� ������.
DELETE FROM EMP WHERE EMPNO=1112;            -- 1112�� 40���μ��� �ִ� EMP���� ������ߵ� 

-- EMPv0 �� ���� : ENAME, JOB, HIREDATE ������ �並 ���� �� ������? --������ ���� 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT ENAME, JOB, HIREDATE FROM EMP;

-- INSERT�� �����ұ�..? 
-- �Ұ��� .. �̷��� �ϸ� �ٸ� �ʵ忡 NULL ���Ե�. �ٵ� EMPNO���� NULL �̵��� �ȵ� 
-- NOT NULL �ʵ带 ������ �ϸ� INSERT �Ұ� 
INSERT INTO EMPv0 VALUES ('ȫ','SALESMAN',SYSDATE);

-- SELECT�� �����Ӱ� ����
SELECT * FROM EMPv0;
COMMIT;

-- VIEW�� �������� (1) ���� ���� (2) �б� ���� 
-- WITH CHECK OPTION�� ������ ��� ���� ���ǿ� �ش�Ǵ� �����͸� ����, ����, ���� ���� 
-- WITH READ ONLY�� ������ ��� �б� ���� �� (����Ʈ�� ����)

-- EMPv0 : EMP���̺��� 30�� �μ���  (WITH CHECK OPTION ����)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO = 30 
    WITH CHECK OPTION;
    
-- INSERT �غ���     
INSERT INTO EMPv0 VALUES (1111,'ȫ',NULL,NULL,SYSDATE,9000,900,30);
INSERT INTO EMPv0 VALUES (1112,'ȫ',NULL,NULL,SYSDATE,9000,900,40); -- WITH CHECK OPTION ������ �� ������ �ȵ�.
                                                                    -- ��������, EMP ���̺� �߰� ��.(�信�� �߰� �ȵ�����) 
                                                                    
-- DELETE �غ���                                                                     
DELETE FROM EMPv0 WHERE ENAME = 'SMITH'; --20�� �μ� SMITH ���� �Ϸ��� �������� ���� ������ ������ �ȵ�                                                                     
DELETE FROM EMPv0 WHERE EMPNO = 1111;  --30�� �μ� DELETE 

-- EMPv0 : �б����� �� (WITH READ ONLY ����)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, MGR, DEPTNO FROM EMP
    WITH READ ONLY;
SELECT * FROM EMPv0;

-- INSERT �غ��� 
INSERT INTO EMPv0 VALUES (1111,'ȫ',NULL,NULL,40); --���� (�б����� ��) 






--------------------------------------------------------------------------------
-- �� ���պ� (�޸� ���� ���� X) : �ΰ��̻��� ���̺��� �̿��� ���� OR ������ �ʵ�� �並 ���� . DML������ ��� (SELECT�� ����)

-- (1) 2�� �̻��� ���̺�� �� ����
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DNAME, LOC FROM EMP E , DEPT D 
    WHERE E.DEPTNO=D.DEPTNO;

SELECT * FROM EMPv0; -- �̹� �����Ҷ� ������ �߱� ������, ���ε� ����� ��� ����     

-- INSERT �غ��� (UPDATE, DELETE ���� �Ұ���) 
-- ���պ�� ���� �Ұ��� 
INSERT INTO EMPv0 VALUES (1111,'HONG','MANAGER','RESEARCH','DALLAS');


-- (2) �ϳ��� ���̺�� ����� ������ �ʵ�� �� ����(�÷��� ��Ī�� �̿��Ͽ� �� ����)

-- SAL*12 ��� �ʵ尡 ����, �ʵ忣 Ư������ ���� �ȵ� (������ �ʵ忣 Ư������ ���� ��) 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, SAL*12 FROM EMP WHERE DEPTNO = 10; -- ������. SAL*12��� �ʵ尡 ���� ������ 
    
-- �굵 ROUND �� () ������ �ȸ������ 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, ROUND(SAL,-2) FROM EMP WHERE DEPTNO = 10;

-- �̷���쿣 �ݵ�� �÷��� ��Ī�� �̿��Ͽ� �並 ���� [��Ī�� �� �� ���ĺ��� ���� Ȱ�� ��õ] 
-- ��Ī�� �ݵ�� (�����ڷ� ����, ������, ����, _ , $, # )��밡��. ���̰� 30�� �̳�. ������ $���°� ���� 
-- ������ ��Ī ����� ��� 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, SAL*12 "YEAR_SAL" FROM EMP WHERE DEPTNO = 10;

-- ��Ī ����� �ٸ� ��Ÿ�� (��Ī�鸸 ���� �����ϴ� ��� ) ��, ��� �ʵ带 �� ����ߵ� 
CREATE OR REPLACE VIEW EMPv0 (EMPNO, ENAME, YEAR_SAL)
    AS SELECT EMPNO, ENAME, SAL*12 "YEAR_SAL" FROM EMP WHERE DEPTNO = 10;
SELECT * FROM EMPv0;

-- INSERT �غ��� 
-- ���պ�� ���� �Ұ� 
INSERT INTO EMPv0 VALUES (1111,'ȫ',2400);

--------------------------------------------------------------------------------
-- ex. �μ���ȣ, �ּұ޿�, �ִ�޿� , �μ���ձ޿��� ������ �� ���� DEPTv1 �� ���� 
CREATE OR REPLACE VIEW DEPTv1
    AS SELECT DEPTNO, MIN(SAL)"MIN_SAL", MAX(SAL)"MAX_SAL", ROUND(AVG(SAL),2)"AVG_SAL" FROM EMP GROUP BY DEPTNO;
SELECT * FROM DEPTv1;

-- ex. ��å, �μ��� ������ EMPv0 �並 ����
-- �߸��� �� 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT JOB, DEPTNO FROM EMP ORDER BY DEPTNO;
SELECT * FROM EMPv0;    

-- �������� �� (�ߺ��Ǵ� ���̰� �ֱ� ������ DISTINCT ���ָ� ��) 
-- DISTINCT�� �����ϸ� INSERT�� �ȵ�  (DISTINCT �� ������ ��� �б� ����) 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY DEPTNO;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -----------------------2. INLINE VIEW --------------------------
        -- FROM �� ���� ���������� INLINE VIEW�� �ϸ�, FROM���� ���� ���������� VIEW ó�� �۵� 
        
-- ex. �޿��� 2000�� �ʰ��ϴ� ����� ��ձ޿� (INLINE VIEW ���)
-- �ζ��� �並 Ȱ������ ���� �� 
SELECT AVG(SAL) FROM EMP WHERE SAL>2000;
-- �ζ��� �並 Ȱ���� �� (FROM�� �ڿ� ������ SELECT���� INLINE VIEW)
SELECT AVG(SAL) FROM (SELECT SAL FROM EMP WHERE SAL>2000);

-- ex. �μ����� ������ ��� ���޺��� ���� ����� ���, �̸�, �޿�, �μ���ȣ [SUBQUERY �������� 24��,25��]
--(�������� �������� �����) 
SELECT EMPNO, ENAME, SAL, DEPTNO 
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO =E.DEPTNO);

--(�ζ��� ��)
SELECT EMPNO, ENAME, SAL, E.DEPTNO, AVGSAL
    FROM EMP E, (SELECT DEPTNO, AVG(SAL)AVGSAL FROM EMP GROUP BY DEPTNO) A
    WHERE E.DEPTNO = A.DEPTNO AND SAL>AVGSAL;    


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -----------------------3. TOP-N���� --------------------------
        -- TOP 1~10�� / TOP 11~20�� / TOP 6~10�� 
        -- ��ŷ �ű�� ����̶� �ٸ�. ��ŷ�� 2���� �θ��� �� ���� 
        -- ���� ��ŷ�� �ִٸ� (10���� 2���̸� �ϳ��� �߶�)
        -- ����¡ �ϴ� �ʵ�� NOT NULL �̾�ߵ�. NULL�ΰ�쿣 NULL�� 1������ ���� 
        
-- �� ROWNUM : FROM �� ���̺�κ��� ������ ���� 
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20;

-- ORDER BY �ϸ� �翬�� ROWNUM�� ���׹��� �� 
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20 ORDER BY ENAME;

-- ex. ���, �̸� ,SAL(��� ���� : SAL) [��ü�࿡ ����]

-- ����� ��¾��ҰŸ� ORDER BY �ϸ� �� 
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;

-- ROWNUM �� ����� �ƴ϶� ���� (���̺�κ��� ������ ������ ������ �翬�� ����� �ƴ�) 
SELECT ROWNUM, ENAME, SAL FROM EMP ORDER BY SAL DESC;

-- ���ʿ� SAL �������� ���ĵ� EMP�κ��� ������� ROWNUM�� �����´ٸ� ? ����� �� 
SELECT ROWNUM RANK, ENAME, SAL FROM (SELECT * FROM EMP ORDER BY SAL DESC);

-- �Լ��� �̿��� RANK ��� ( �ӵ� ���� ) _ TOPN���� �ƴ�  ����õ 
SELECT RANK() OVER(ORDER BY SAL DESC) RANK,
    DENSE_RANK() OVER(ORDER BY SAL DESC) DENSE_RANK,
    ROW_NUMBER() OVER(ORDER BY SAL DESC) ROW_ROW_NUMBER,
    ENAME, SAL FROM EMP;

-- �� TOP-N����
-- ex. SAL �������� 1~5�� 
-- ROWNUM�� Ȱ�������� 
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)
    WHERE ROWNUM<=5;

-- ex. SAL �������� 6����� 10��
-- ROWNUM�� Ȱ�������� ����� �� �൵ �ȳ��� 
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)
    WHERE ROWNUM BETWEEN 6 AND 10;

-- �� TOP - N ���� 1�ܰ�
-- RN�� ��� �ϴ� ��ü���� ��µǵ��� ����� ���� 
SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC);

-- �� TOP - N ���� 2�ܰ�(�ϼ��� TOP-N ����)
-- FROM ���� ROWNUM�� �� ALIAS�� �༭ ������ ���� 
SELECT RN, ENAME, SAL 
    FROM (SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)) 
    WHERE RN BETWEEN 6 AND 10;

--ex. �̸��� ���ĺ� ������� �����ؼ� 6~10��° ���� ��� (���, �̸�, ���, JOB, MGR, HIREDATE) 
SELECT ROWNUM RN,ENAME, EMPNO, JOB, MGR, HIREDATE FROM (SELECT ENAME, EMPNO, JOB, MGR, HIREDATE FROM EMP ORDER BY ENAME);

SELECT RN, ENAME, EMPNO, JOB, MGR, HIREDATE
    FROM (SELECT ROWNUM RN, ENAME, EMPNO, JOB, MGR, HIREDATE 
    FROM (SELECT ENAME, EMPNO, JOB, MGR, HIREDATE FROM EMP ORDER BY ENAME))
    WHERE RN BETWEEN 6 AND 10;
    
-- ������ �� 
SELECT RN, ENAME, EMPNO, JOB, MGR, HIREDATE
    FROM (SELECT ROWNUM RN, ENAME, EMPNO, JOB, MGR, HIREDATE 
    FROM (SELECT * FROM EMP ORDER BY ENAME))
    WHERE RN BETWEEN 6 AND 10;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

    ----------------------- �� �������� �� --------------------------

-- 1. �μ���� ������� ����ϴ� �뵵�� ��, DNAME_ENAME_VU �� �ۼ��Ͻÿ�
CREATE OR REPLACE VIEW DNAME_ENAME_VU
    AS SELECT DNAME, ENAME FROM EMP E , DEPT D WHERE E.DEPTNO=D.DEPTNO;
    
    SELECT * FROM DNAME_ENAME_VU;

-- 2. ������ ���ӻ������ ����ϴ� �뵵�� ��,  WORKER_MANAGER_VU�� �ۼ��Ͻÿ�
CREATE OR REPLACE VIEW WORKER_MANAGER_VU
    AS SELECT W.ENAME WORKKER, M.ENAME MANAGER FROM EMP W, EMP M WHERE W.MGR = M.EMPNO;

    SELECT * FROM WORKER_MANAGER_VU;
    
-- 3. �μ��� �޿��հ� ����� ����Ͻÿ�(�μ���ȣ, �޿��հ�, ���). -- �л� ����
SELECT SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC;

SELECT  DEPTNO, "SUM_SAL",ROWNUM  RN 
FROM (SELECT DEPTNO, SUM(SAL)"SUM_SAL" FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC);

-- 3-1. �μ��� �޿��հ� ����� 2~3���� �μ���ȣ, �޿��հ�, ����� ����Ͻÿ�.
SELECT DEPTNO, "SUM_SAL" , RN
FROM (SELECT ROWNUM RN, DEPTNO, "SUM_SAL" 
FROM (SELECT DEPTNO, SUM(SAL)"SUM_SAL" FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC))
WHERE RN BETWEEN 2 AND 3;

-- 4. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� ������ �����Ͻÿ� (6���� Ǯ�� ���� �ܰ�)
SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC;

-- 5. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� 5���� ����Ͻÿ� (6���� Ǯ�� ���� �ܰ�)
SELECT ROWNUM RN, EMPNO, ENAME, HIREDATE 
FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC) 
WHERE ROWNUM <6;

-- 6. ��� ���̺��� ���, �����, �Ի����� �ֽź��� ������ ������ 6��°�� ���� ������� 10��° ������� ��� (HIREDATE �ֽſ��� ������ ������ DESC)
SELECT RN, EMPNO, ENAME, HIREDATE
FROM (SELECT ROWNUM RN, EMPNO, ENAME, HIREDATE 
FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC))
WHERE RN BETWEEN 6 AND 10;












