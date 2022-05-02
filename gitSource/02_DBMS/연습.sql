--1. 서브 쿼리 개념 

--ex. 급여를 제일 많이 받는 사람의 사번, 이름, 직책, 급여
SELECT EMPNO, ENAME, JOB, SAL FROM EMP ;
SELECT EMPNO, MAX(SAL) FROM EMP GROUP BY EMPNO; -- 단일함수와 그룹함수가 함께 쓰일땐, GROUP BY 해주자 
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP );

--서브쿼리 종류 1) 단일행 서브쿼리 : 서브쿼리 결과가 단일행 

--ex. SCOTT이 근무하는 부서 이름 출력 
--조인
SELECT DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
--서브쿼리
SELECT DNAME 
FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--서브쿼리 종류 2) 다중행 서브쿼리 : 서브쿼리 결과가 2행이상 
--ex. JOB이 MANAGER인 사람의 부서이름 
SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER';
SELECT DNAME 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ★2. 단일행 서브쿼리 -------------------
--ex. SCOTT 과 같은 부서인 사람의 이름과 급여 
SELECT ENAME, SAL FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME, SAL 
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--ex. SCOTT과 같은 근무지인 사람의 이름과 급여 
SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
SELECT ENAME, SAL
FROM EMP E1, DEPT D2 
WHERE E1.DEPTNO = D2.DEPTNO 
AND LOC = (SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.ENAME = 'SCOTT');

--ex. 최초입사일과 최초입사한 사람
SELECT MIN(HIREDATE) FROM EMP;
SELECT HIREDATE, ENAME
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);

--ex. 최근입사일과 최근입사한 사람
SELECT MAX(HIREDATE) FROM EMP;
SELECT HIREDATE, ENAME
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

--ex. 최초입사일과 최초 입사한 사람, 최근입사일과 최근입사한 사람 
SELECT E.HIREDATE , E.ENAME, F.HIREDATE , F.ENAME 
FROM EMP E, EMP F 
WHERE E.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)
AND F.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

-- 선생님 코드 
 SELECT 
        (SELECT MAX(HIREDATE) FROM EMP) LAST,
        (SELECT ENAME FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP)) LASTMAN,
        (SELECT MIN(HIREDATE) FROM EMP) FIRST,
        (SELECT ENAME "FIRSTMAN" FROM EMP WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)) FIRSTMAN
    FROM DUAL;

--ex. SCOTT와 같은 부서에 근무하는 사람들의 급여합
SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
SELECT SUM(SAL) 
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--ex. SCOTT과 동일한 직책을 가진 사원의 모든 필드 
SELECT JOB FROM EMP WHERE ENAME='SCOTT';
SELECT * FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME='SCOTT');

--ex. DALLAS에서 근무하는 사원의 이름, 부서번호
SELECT LOC FROM DEPT WHERE LOC = 'DALLAS';
SELECT ENAME, DEPTNO
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');

--ex. 'KING'이 직속 상사인 사원의 이름과 급여
SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
SELECT ENAME, SAL
FROM EMP 
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

--조인
SELECT W.ENAME, W.SAL
FROM EMP W, EMP M
WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING';

--ex. 평균급여 이하로 받는 사원의 이름과 급여를 출력
SELECT AVG(SAL) FROM EMP;
SELECT ENAME, SAL
FROM EMP
WHERE SAL<=(SELECT AVG(SAL) FROM EMP);

--ex. 평균급여 이하로 받는 사원의 이름, 급여, 평균급여 출력 
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP) )AVG
FROM EMP
WHERE SAL<=(SELECT AVG(SAL) FROM EMP);

--ex. 평균급여 이하로 받는 사원의 이름, 급여, 평균과 차이를 출력
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)-SAL )DIFF
FROM EMP
WHERE SAL<=(SELECT AVG(SAL) FROM EMP);

-- 단일행 다중열 서브쿼리 
-- ex. SCOTT이랑 JOB과 DEPTNO가 같은 직원의 모든 필드를 출력
--단일행 단일열
SELECT * FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT')
AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
--단일행 다중열 
-- 단일행 다중열
    SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
    SELECT * FROM EMP
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME != 'SCOTT';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ★3. 다중행 서브쿼리 -------------------        
            -- IN, ALLL, ANY, EXISTS
-- ① IN : 서브쿼리 결과 중 하나라도 일치하면 '참'

--EX. 부서별로 입사일이 가장 늦은 사람의 이름, 입사일, 부서번호 
SELECT MAX(HIREDATE) FROM EMP GROUP BY DEPTNO;
SELECT ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE (HIREDATE) IN (SELECT MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);

--EX. 급여 3000이상 받는 사원이 소속된 부서에서 근무하는 사원의 모든 필드 
SELECT DEPTNO FROM EMP WHERE SAL>=3000;
SELECT * FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);

--EX. JOB(직책별)로 가장 낮은 연봉을 받는 사람의 이름, 직책, 연봉을 출력 
SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB; 
SELECT ENAME, JOB, SAL
FROM EMP
WHERE (JOB,SAL) IN (SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB);

-- ② ALL : 서브쿼리 결과가 모두 만족해야 참 
    
    --ex. (1)30번 부서 급여들 각각 보다 큰 경우 = (2)30번 부서 최대급여 보다 큰 경우
    --(1) 다중행으로 했을 경우 
    SELECT SAL FROM EMP WHERE DEPTNO = 30;
    SELECT * FROM EMP
    WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);
    --(2) 단일행으로 바꿔서 한 경우 
    SELECT * FROM EMP
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30 GROUP BY DEPTNO );

-- ③ ANY = SOME : 서브쿼리 결과가 하나라도 만족 했을 경우

    --ex. 30번 부서 각각의 급여에서 그 중 하나라도 그 급여 보다 큰 경우 (=30번 부서 최소 급여보다 큰 경우) 직원의 모든 필드
    SELECT SAL FROM EMP WHERE DEPTNO=30;
    SELECT * FROM EMP
    WHERE SAL > ANY ( SELECT SAL FROM EMP WHERE DEPTNO=30);
    -- 위의 QUERY를 단일행 서브쿼리로
    
-- ④ EXISTS : 서브쿼리 결과가 존재하면 '참'(EXISTS는 서브쿼리가 실행 안될수도 있음)
-- 힘들면 SELF JOIN 해도 됨    
    --ex. 직속부하가 있는 직원들의 사번, 이름, 급여
    --서브쿼리이용
   SELECT EMPNO, ENAME, SAL
   FROM EMP MANAGER
   WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR); 
        
    --SELF JOIN 이용 
    

    --ex. 말단 사원의 모든 필드 출력 
    SELECT * FROM EMP WORKER
    WHERE EXISTS(SELECT * FROM EMP WHERE WORKER.EMPNO != MGR);
    -- 이렇게 하면 WOKER의 EMPNO와 MGR이 일치 하지 않은 애를 뽑아버림 EXISTS를 썻기 때문 아래처럼 존재하지 않을 경우 뽑아라 라고 해줘야됨 
    
    SELECT * FROM EMP MANAGER
   WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);

    --SELF JOIN 이용
   
-----------------------------------------------------------------------------------------------------------
--탄탄 1. 부서별로 가장 급여를 많이 받는 사원의 정보(사원 번호, 사원이름, 급여, 부서번호)를 출력(IN 연산자 이용)
SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- 서브쿼리
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);
    
--탄탄 2. 직급(JOB)이 MANAGER인 사람의 속한 부서의 부서 번호와 부서명과 지역을 출력(IN)
SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER';
SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER');

SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'; -- 서브쿼리(다중행)
SELECT DEPTNO, DNAME, LOC 
    FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');

--탄탄 3.연봉이 3000이상인 사람들 중 연봉 등급을 나누어서 해당 등급별 최고 연봉을 받는 사람들의 
-- 사번, 이름, 직업, 입사일, 급여, 급여등급을 출력



SELECT GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000;
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
FROM EMP , SALGRADE 
WHERE SAL BETWEEN LOSAL AND HISAL 
AND (SAL, GRADE) IN (SELECT MAX(SAL), GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE) ;

SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
    FROM SALGRADE, EMP
    WHERE SAL BETWEEN LOSAL AND HISAL
        AND (GRADE, SAL) IN (SELECT GRADE, MAX(SAL) 
                                FROM SALGRADE, EMP 
                                WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000
                                GROUP BY GRADE); -- 메인 쿼리


-- 탄탄 4.입사일 분기별로 가장 높은 급여 받는 사람들의 분기, 사번, 이름, JOB, 상사사번, 입사일, 급여, 상여를 출력하세요
-- 1,2,3 -> 1 / 4,5,6->2 / 7,8,9->3/ 10,11,12->4
SELECT CEIL(TO_CHAR(HIREDATE,'MM')/3)"분기", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP 
WHERE (CEIL(TO_CHAR(HIREDATE,'MM')/3),SAL) IN(SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) , MAX(SAL) FROM EMP GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3))
ORDER BY "분기"; 


--------------------------------------------------------------------------------선생님이랑 답 낸 부분.... 

------------------------    다른방식  ----------------------------------
SELECT TO_CHAR(HIREDATE,'Q')||'분기' FROM EMP;
SELECT TO_CHAR(HIREDATE,'Q')||'분기' , EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP
WHERE (SAL) IN (SELECT MAX(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'Q'))
ORDER BY TO_CHAR(HIREDATE,'Q');

--탄탄 5. SALESMAN 모든 사원들 보다 급여를 많이 받는 사원들의 이름과 급여와 직급(담당 업무)를 출력하되 
        --영업 사원은 출력하지 않는다.(ALL이용)
SELECT ENAME , SAL, JOB
FROM EMP 
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN') AND JOB != 'SALESMAN';
SELECT JOB, ENAME, SAL FROM EMP WHERE JOB = 'SALESMAN';

--탄탄 6. SALESMAN 일부 어떤 한 사원보다 급여를 많이 받는 사원들의 이름과 급여와 직급(담당 업무)를 출력하되 영업 사원도 출력(ANY)
SELECT ENAME , SAL, JOB
FROM EMP 
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');
SELECT JOB, ENAME, SAL FROM EMP WHERE JOB = 'SALESMAN';

--탄탄 7. 연봉이 3000미만인 사람 중에 가장 최근에 입사한 사람의 사원번호와 이름, 연봉, 입사일을 출력
SELECT ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000);

--탄탄 8. ?	직급이 ‘SALESMAN’인 사원이 받는 급여의 최소 급여보다 많이 받는 사원들의 
--이름, 급여, 직급, 부서번호를 출력하되 부서번호가 20번인 사원은 제외한다(ANY 연산자 이용)





