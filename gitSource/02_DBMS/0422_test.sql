

-- ==============================문제 1번======================


--1. 생성된 테이블의 목록을 출력하는 SQL문을 작성하시오(5점).
SELECT * FROM TAB;

--2. TO_DATE 단일행함수를 이용하여 EMP 테이블에서 HIREDATE가 1981년 2월 20일부터 1981년 5월 1일 사이에 입사한 사원의
-- 사원명, 직책, 입사일을 최초입사일부터 최근입사일 순으로 정렬하여 출력하는 SQL문을 작성하시오(5점).
SELECT ENAME, JOB, HIREDATE 
FROM EMP 
WHERE TO_CHAR(HIREDATE, 'YYYY/MM/DD') BETWEEN '1981/02/20' AND '1981/05/01'
ORDER BY HIREDATE;


--3. EMP테이블과 DEPT테이블의 self join과 outer join을 이용하여 사원명, 급여, 부서번호, 부서명, 근무지, 직속상사명을 상사가 없는 직원까지 전체 직원 다 출력하는 SQL문을 작성하시오. 
--단, 상사가 없는 경우 상사명 대신 ‘없음’을 출력한다(5점).
SELECT W.ENAME WORKER, W.SAL, W.DEPTNO, DNAME, LOC, NVL(M.ENAME,'없음')MANAGER 
FROM EMP W, EMP M, DEPT D
WHERE W.MGR = M.EMPNO(+) AND W.DEPTNO = D.DEPTNO;

--4. SALGRADE 테이블의 LOSAL을 등급최저 급여, HISAL을 등급 최고 급여로 이용하여, EMP 테이블의 사원을 사번, 사원명, 직책, 급여, 급여등급을 급여 기준 내림차순으로 정렬하여 출력하는 SQL문을 작성하시오(5점).
SELECT EMPNO, ENAME, JOB, SAL, GRADE||'등급'SALGRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL
ORDER BY SAL DESC;

--5. EMP 테이블에서 부서번호가 20번인 사원의 사번, 사원명, 급여를 출력하되 급여 앞에는 $를 붙이고, 숫자는 3자리마다 콤마( , )를 추가하여 출력하는 SQL문을 작성하시오. ------------------------------------------------
-- 단 급여(SAL)의 타입은 NUMBER(7,2)로 한다(5점).
SELECT EMPNO, ENAME, TRIM(TO_CHAR(SAL, '$999,999'))SAL
FROM EMP 
WHERE DEPTNO = 20;

--6. EMP 테이블에서 직책별 급여 평균이 3000이상인 직책에 대하여 직잭명, 평균급여, 금여의 합을 출력하는 SQL문을 작성하시오(5점).
SELECT JOB, AVG(SAL),SUM(SAL) 
FROM EMP 
GROUP BY JOB 
HAVING AVG(SAL)>=3000;

--7. EMP테이블에서 사원명이 ‘FORD’인 직원과 직책(JOB)과 급여(SAL)이 같은 사원의 모든 정보를 출력하는 SQL문을 작성하시오(5점).
SELECT * FROM EMP
WHERE (JOB, SAL) = (SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD') AND ENAME != 'FORD';

--8. EMP 테이블에서 사원명이 ‘FORD’인 사원을 삭제하는 SQL문을 작성하시오(5점).
DELETE FROM EMP WHERE ENAME = 'FORD';

--9. 데이터베이스에서 트랜잭션은 데이터 처리의 한 단위를 말한다. 데이터를 조작하기 위한 INSERT, UPDATE, DELETE 등의 명령들이 실행됨과 동시에 트랜잭션이 진행되는데, 
--  이들 INSERT, UPDATE, DELETE작업이 성공적으로 데이터베이스에 반영·처리되도록 명령어를 작성하시오(5점).
COMMIT;

--10. EMP테이블에서 사원명으로 조회하는 시간을 단축하기 위해 사용되는 인덱스 생성 명령어를 작성하시오. 생성된 인덱스의 이름은 IDX_EMP_ENAME으로 한다(10점).
CREATE INDEX IDX_EMP_ENAME ON EMP (ENAME);

--11. 현재 계정 소유한 테이블에 대한 정보를 저장한 데이터 딕셔너리뷰를 살펴보는 SQL문을 작성하시오(5점).
SELECT * FROM USER_TABLES;  










