--[V] �׷��Լ� : SUM,AVG,MIN,MAX,COUNT,STDDEV(ǥ������),VARIANCE(�л�)


SELECT ENAME,SAL, ROUND(SAL, -3) FROM EMP;        -- SAL�� 100�� �ڸ����� �ݿø�
                                                  -- �������Լ�(4��)                                           
SELECT MAX(SAL) FROM EMP;                         -- �׷��Լ�                                            
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- �׷��Լ�(5)�� -- �μ��� SAL �ƽ� 

SELECT ENAME, MAX(SAL) FROM EMP GROUP BY ENAME;   -- �׷�������� ����� �� 
                                                  -- �̸��� �ߺ��� ����� ��� �̷��� �ϸ� �ȵ�                  
                                                  -- �ִ�޿��� �޴� ����� �̸� (6��)���� �� �� 
                                                  -- ����(������� �������� ���� �Ἥ) 

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------�ڨ� �׷��Լ��� �ǽ�---------------------
 
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT COUNT(*) FROM EMP; -- EMP ���̺��� ��(�ο�ROW)��
                          -- ��ȣ �ȿ��� ���� �־�� �� 
SELECT AVG(SAL), (SUM(SAL)/ COUNT(SAL)) FROM EMP; 
SELECT COMM FROM EMP;     -- 300+500+1400+0(2200) 
                          -- 1. 2200/14=157.XX(�׷��Լ������� 2200/4 ��.. NULL�� ���ܽ�Ű�ϱ�)  
                          -- 2. 2200/4 = 550 (2������ ����) 
                      
SELECT SUM(COMM) FROM EMP; --NULL�� ������ ���
SELECT SUM(COMM), AVG(COMM), COUNT(COMM), MIN(COMM), MAX(COMM) FROM EMP;--NULL�� ������ ���
-- ��� �׷��Լ��� NULL���� ���� 

--SAL�� ���, ��, �ּұ޿�, �ִ�޿�, �޿��л�, �޿�ǥ������, ���� 
SELECT ROUND(AVG(SAL),2),SUM(SAL),MIN(SAL),MAX(SAL),ROUND(VARIANCE(SAL),2),ROUND(STDDEV(SAL),2) FROM EMP; 
SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL)FROM EMP; --SQRT�� ��Ʈ ����� �Լ� 

-- �׷��Լ� MIN, MAX, COUNT�� ������, ������, ��¥�� ��� ��� ���� 
SELECT MIN(HIREDATE)"�����Ի���", MAX(HIREDATE)"�����Ի���" FROM EMP; --80/12/17 , 83/01/12
SELECT MIN(ENAME), MAX(ENAME), COUNT(ENAME) FROM EMP;             -- ADAMS , WARD -- �ƽ�Ű�ڵ尡 ���� ������, ����ū��  

------------------------------------------------------------------------------------------------------------VVVVVVVVVVVVVV

--źź1. ���� �ֱٿ� �Ի��� ����� �Ի��ϰ� ���� ���� �Ի��� ����� �Ի��� 
SELECT MAX(HIREDATE)"�ֱ� �Ի���", MIN(HIREDATE)"�����Ի���" FROM EMP;

--źź2. 83/01/12 �ֱ��Ի��� : XX,XXX�� �ٹ� 
SELECT MAX(HIREDATE)||' �ֱ��Ի��� : '|| TO_CHAR(TRUNC(MIN(SYSDATE-HIREDATE)),'99,999') ||'�� �ٹ�, '
|| MIN(HIREDATE) || ' �����Ի��� : ' || TO_CHAR(TRUNC(MAX(SYSDATE-HIREDATE)),'99,999') ||'�� �ٹ�'
FROM EMP;

--�������� �Ͻ� ���
--1)
SELECT MAX(HIREDATE)||' �ֱ��Ի��� : '|| TO_CHAR(SYSDATE-MAX(HIREDATE),'99,999') || '�� �ٹ�, ' ||
MIN(HIREDATE) || ' �����Ի��� : ' || TO_CHAR(SYSDATE-MIN(HIREDATE),'99,999') ||'�� �ٹ�' FROM EMP;
--2) ���� �� ��� �̶� ���� (������ TO_CHAR�� ����� �ٰŸ� TRUNC�ʿ� ����)

--źź3. 10���μ� �Ҽ��� ��� �޿� ���
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10;

--źź4. 10���μ� �Ҽ��� ����߿��� Ŀ�̼��� �޴� ����� ���� ���غ��ÿ�
SELECT COUNT(COMM)||'��'"����� ��" FROM EMP WHERE DEPTNO =10;
SELECT DEPTNO, COMM FROM EMP;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------�ڨ� GRUP BY ��---------------------  
        
--�μ���ȣ�� �ִ� �޿�, �ּұ޿�, �޿����, �޿���
    --GROUP BY ��Ī ��� ����
SELECT DEPTNO �μ�, MAX(SAL), MIN(SAL), ROUND(AVG(SAL)), SUM(SAL) FROM EMP GROUP BY DEPTNO;
------------------------------------------------------------------------------------------------------------VVVVVVVVVVV
    --ex1. SAL�� 5000�̸��� ����� ���ؼ��� �μ���ȣ�� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�(�μ���ȣ�� ����)
    SELECT DEPTNO �μ�, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL)) --SELECT�������� ��Ī ����   
        FROM EMP 
        WHERE SAL<5000      -- WHERE �������� �ʵ� ��Ī �Ұ�
        GROUP BY DEPTNO     -- GROUP BY �������� �ʵ� ��Ī �Ұ�
        ORDER BY DEPTNO;    -- ORDER BY �������� �ʵ� ��Ī ���� 

    --ex2. �μ��� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�(�Ҽ���2�ڸ�), ������� ���� ������ ���� 
    SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2)    
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO      
        GROUP BY DNAME
        ORDER BY COUNT(*) DESC;     

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------�ڨ� HAVING ��---------------------  
        -- �׷��Լ� ����� ���� 
        -- HAVING ���� GROUP BY �տ� ������ ������, �����ϸ� �ڿ� ��� 
        
--�μ���ȣ�� ��� �޿�( ��ձ޿��� 2000�̻��� �μ��� ���, ��ձ޿� ������ ���� )
--WHERE������ GROUP�Լ��� ����, SELECT ������ ���� 
SELECT DEPTNO, ROUND(AVG(SAL),2)"AVG"
    FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL) >= 2000        -- HAVING ������ �ʵ� ��Ī ��� �Ұ� 
    ORDER BY AVG;                  -- ORDER BY ������ �ʵ� ��Ī ��� ���� 


------------------------------------------------------------------------------------------------------------VVVVVVVVVVV
    --ex1. SAL�� 5000 �̸��� ����� ����(WHERE) �μ���(WHERE) �ּұ޿�, �ִ�޿�, ��ձ޿� ��� (��ձ޿��� 2000�̻��� �μ��� HAVING) ��ձ޿� ������ ����
    SELECT DNAME, MIN(SAL), MAX(SAL), AVG(SAL)��ձ޿�
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND SAL<5000 
        GROUP BY DNAME
        HAVING AVG(SAL) >=1800
        ORDER BY ��ձ޿�;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     ---------------------�ڨ� ��� ������ �� ���谪 ���� --------------------- 
--  10  2500
--  20  3500
--  30  7500
--��ü�� 0000
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);
      
--�μ���, JOB�� �޿���
    SELECT DEPTNO, JOB, SUM(SAL) FROM EMP GROUP BY DEPTNO,JOB ORDER BY DEPTNO;
 
--�μ���, JOB�� �޿��� (�Ұ�� ��ü�� ����)
    SELECT DEPTNO, NVL(JOB,'��'), SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO,JOB)ORDER BY DEPTNO;
 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------�� �� ���� ���� ��--------------------- 

-- 1. �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ���
SELECT COUNT(*)||'��' �ο���, MAX(SAL)�ִ�޿�, MIN(SAL)�ּұ޿�, SUM(SAL)�ѱ޿� FROM EMP;

-- 2. ������ �ο����� ���Ͽ� ���
SELECT JOB, COUNT(*)||'��'�ο��� FROM EMP GROUP BY JOB;

--- 3. �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ���
SELECT MAX(SAL)-MIN(SAL)"�ְ�޿�-�ּұ޿�" FROM EMP;

-- 4. �� �μ����� �ο���, �޿� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ���(�޿��� ���� ���� ������)
SELECT DEPTNO, COUNT(*)||'��'"�ο���", ROUND(AVG(SAL),2), MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC;

-- 5. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���(�μ���ȣ, ���������� �������� ����)
SELECT DEPTNO, JOB, COUNT(*), AVG(SAL), SUM(SAL) 
FROM EMP
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB;

-- 6. ������, �μ��� �׷��Ͽ� �����  ����, �μ���ȣ, �ο���, �޿��� ���, �޿��� ���� ���(��°���� ������, �μ���ȣ �� �������� ����)
SELECT JOB, DEPTNO, COUNT(*), AVG(SAL), SUM(SAL) 
FROM EMP
GROUP BY JOB, DEPTNO
ORDER BY JOB, DEPTNO;

--7. ������� 5���̻� �Ѵ� �μ���ȣ�� ������� ���
SELECT DEPTNO �μ���ȣ, COUNT(*)�����
FROM EMP
HAVING COUNT(*) >=5
GROUP BY DEPTNO;

-- 8. ������� 5���̻� �Ѵ� �μ���� ������� ���
SELECT DNAME �μ��� , COUNT(*) �����
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO
HAVING COUNT(*) >= 5
GROUP BY DNAME;

--9. ������ �޿��� ����� 3000�̻��� ������ ���ؼ� ������, ��� �޿�, �޿��� ���� ���
SELECT JOB, AVG(SAL), SUM(SAL)
FROM EMP 
HAVING AVG(SAL)>=3000
GROUP BY JOB;

--10. �޿� ���� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿����� ���(�޿� �հ�� �������� ����)
SELECT JOB, SUM(SAL)
FROM EMP
HAVING SUM(SAL)>5000
GROUP BY JOB
ORDER BY SUM(SAL) DESC;

--11. �μ��� �޿����, �μ��� �޿��հ�, �μ��� �ּұ޿��� ���
SELECT ROUND(AVG(SAL),2)�޿����, SUM(SAL)"�޿��հ�", MIN(SAL)"�ּұ޿�"
FROM EMP
GROUP BY DEPTNO;

--12. ���� 11���� �����Ͽ�, �μ��� �޿���� �ִ�ġ, �μ��� �޿����� �ִ�ġ, �μ��� �ּұ޿��� �ִ�ġ�� ���
SELECT MAX(ROUND(AVG(SAL),2))"�޿���� �ִ�ġ", MAX(SUM(SAL))"�޿��հ� �ִ�ġ", MAX(MIN(SAL))"�ּұ޿� �ִ�ġ"
FROM EMP
GROUP BY DEPTNO;

--13. ��� ���̺��� �Ʒ��� ����� ���
--   H_YEAR	COUNT(*)	MIN(SAL)	MAX(SAL)	AVG(SAL)	SUM(SAL)
--  80	  1		    800		    800		    800		    800
--	81	 10		    950		    5000	    2282.5	  22825
--	82	  2		    1300	    3000	   2150		   4300
--	83	  1		    1100	    1100	    1100	   1100
SELECT TO_CHAR(HIREDATE, 'RR')"H_YEAR" , COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'RR')
ORDER BY TO_CHAR(HIREDATE, 'RR');

-- 14.  �Ʒ��� ����� ���(�Ի�⵵�� �����)
--  1980     1	
--  1981     10
--  1982     2
--  1983     1
--  total    14	

SELECT NVL(TO_CHAR(HIREDATE,'YYYY'),'total')"����", COUNT(*)
FROM EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE,'YYYY'))
ORDER BY TO_CHAR(HIREDATE,'YYYY');


--15. �ִ�޿�, �ּұ޿�, ��ü�޿���, ����� ���
SELECT MAX(SAL), MIN(SAL), SUM(SAL),ROUND( AVG(SAL),2)
FROM EMP;

--16. �μ��� �ο��� ���
SELECT DEPTNO, COUNT(*)||'��'
FROM EMP 
GROUP BY DEPTNO;

--17. �μ��� �ο����� 6���̻��� �μ���ȣ ���
SELECT DEPTNO, COUNT(*)||'��'
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>=6;

-- �����ҋ�, ���� SAL���� ũ�ų� �����ָ� �����ض� 
--18. �޿��� ���� ������� ����� �ο��Ͽ� ������ ���� ����� ������ �Ͻÿ�. 
-- (��Ʈ self join, group by, count���)

--ENAME	    ���
--________________________
--KING		1
--SCOTT		2
--����

SELECT E1.ENAME, E2.ENAME
FROM EMP E1 , EMP E2
WHERE E1.SAL<E2.SAL(+) AND E1.ENAME='KING';

SELECT E1.ENAME, COUNT(E2.ENAME) RANK
FROM EMP E1 , EMP E2
WHERE E1.SAL<=E2.SAL(+)
GROUP BY E1.ENAME
ORDER BY RANK;
----����----
SELECT E1.ENAME,COUNT(E2.ENAME) +1  RANK
FROM EMP E1 , EMP E2
WHERE E1.SAL<E2.SAL(+)
GROUP BY E1.ENAME
ORDER BY RANK;

--����Ǯ�� [RANK �Լ��� ����]BUT �����Ͱ� ������ RANK �ӵ� ������ 
--1�ܰ� : SELF JOIN / OUTER JOIN
SELECT E1.ENAME, E1.SAL, E2.ENAME, E2.SAL 
FROM EMP E1, EMP E2
WHERE E1.SAL<E2.SAL(+) ;

--�ϼ��ܰ� : GROUP BY , COUNT
SELECT E1.ENAME, COUNT(E2.ENAME)+1 RANK
FROM EMP E1, EMP E2
WHERE E1.SAL<E2.SAL(+)
GROUP BY E1.ENAME
ORDER BY RANK;

SELECT ENAME, RANK() OVER(ORDER BY SAL DESC)"RANK",
              DENSE_RANK() OVER(ORDER BY SAL DESC)"DENSE_RANK",
              ROW_NUMBER() OVER(ORDER BY SAL DESC)"LOW_NUMBER" FROM EMP;

         




