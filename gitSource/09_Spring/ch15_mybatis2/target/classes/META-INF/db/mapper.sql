-- ★Dept.xml id=deptList(컴버박스안에 들어갈 value값들)
SELECT * FROM DEPT;
-- SELECT DEPTNO, DNAME FROM DEPT ; 이렇게 해도 됨 


-- ☆ Emp.xml id=empList
-- 페이징처리 할거라 STARTROW랑 ENDROW 해줘야됨  (XML은 JSP와 달리 매개변수로 STARTROW랑 ENDROW 한번에 못받음) -> 따라서 DTO에 STARTROW랑 ENDROW 넣어놓는 방법 밖에 없음
SELECT * FROM EMP ORDER BY EMPNO; -- 출력조건 
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM EMP ORDER BY EMPNO) A)
    WHERE RN BETWEEN 6 AND 10;

-- ☆ Emp.xml id=empDeptList
SELECT E.*, DNAME, LOC  FROM EMP E , DEPT D 
            WHERE E.DEPTNO=D.DEPTNO ORDER BY EMPNO; -- 출력조건

SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT E.*, DNAME, LOC  FROM EMP E , DEPT D 
            WHERE E.DEPTNO=D.DEPTNO ORDER BY EMPNO)A)
            WHERE RN BETWEEN 6 AND 10;

-- ☆ Emp.xml id=totCnt (return타입 int)
SELECT COUNT(*) FROM EMP;

-- ☆ Emp.xml id=detail(상세보기) (파라미터 타입이 int return 타입 emp) 
SELECT * FROM EMP WHERE EMPNO=7902;

-- ☆ Emp.xml id=managerList(매니저 리스트))여기서 필요한 아이는 MGR과 사번)
-- 
SELECT * FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);

-- ☆ Emp.xml id=insert
INSERT INTO EMP VALUES (9000,'홍길동','IT', 7902, '22/07/20',6000,800,40);
ROLLBACK;

-- ☆ Emp.xml id=update
UPDATE EMP SET ENAME='홍홍홍',
               JOB='MANAGER',
               MGR=7839,
               HIREDATE='21/07/20',
               SAL = 7000,
               COMM = 1000,
               DEPTNO=20
               WHERE EMPNO=9000;

-- ☆ Emp.xml id=delete
DELETE FROM EMP WHERE EMPNO=9000;











