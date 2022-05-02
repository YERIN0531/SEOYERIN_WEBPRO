-- [VI] SUB QUERY : QUERY 안에 QUERY가 내포
-- SELECT 필드1, (SELECT 필드 FROM 테이블 WHERE 조건)  -- 테이블, 조건에도 들어갈 수 있음
--  FROM 테이블 
--  WHERE 조건
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

         ------------------- ★1.서브 쿼리 개념 -------------------

-- 서브쿼리 필요성 

    -- ex. 급여를 제일 많이 받는 사람의 사번, 이름, 직책, 급여
    
SELECT MAX(SAL) FROM EMP;                           -- 제일 높은 급여(서브쿼리)
SELECT EMPNO, MAX(SAL) FROM EMP GROUP BY EMPNO;     -- 모든 사번이 다 나옴
SELECT EMPNO, ENAME, JOB, SAL                       -- 메인 쿼리(서브쿼리 섞인)
    FROM EMP                                        
    WHERE SAL=(SELECT MAX(SAL) FROM EMP);           -- 서브쿼리는 괄호로 묶여 있어야 함
                                                                
-- 서브쿼리 종류 ① 단일행 서브쿼리 : 서브쿼리 결과가 단일행( =,>,>=,<,<=,!=...)
    
    --ex. SCOTT이 근무하는 부서이름 출력 (얘는 JOIN이 더 낫긴 함)
    SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';                     -- 서브쿼리 
    SELECT DNAME FROM DEPT
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');-- 메인쿼리
    
    --조인을 이용한 풀이  
    SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT';    
    

-- 서브쿼리 종류 ② 다중행 서브쿼리 : 서브쿼리 결과가 2행이상 (=못씀)
    
    --ex. JOB이 MANAGER인 사람의 부서이름
    SELECT DEPTNO FROM EMP WHERE JOB='MANAGER';                       -- 서브쿼리
    SELECT DNAME FROM DEPT
        WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');
        
    
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ★2. 단일행 서브쿼리 -------------------
    -- 아래 문제 전 처리 
    SELECT E.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
    INSERT INTO DEPT VALUES (50,'IT','DALLAS');
    INSERT INTO EMP (EMPNO, ENAME, DEPTNO)VALUES (9999, '홍길동', 50);
    SELECT * FROM DEPT;
    SELECT * FROM EMP;
    
    --ex. SCOTT과 같은 부서인 사람의 이름과 급여
    SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';           --서브쿼리
    SELECT ENAME, SAL
        FROM EMP
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME != 'SCOTT';
        
    --ex. SCOTT과 같은 근무지인 사람의 이름과 급여
    SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
    SELECT ENAME, SAL, LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO 
        AND LOC = (SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT')
        AND ENAME != 'SCOTT';
    
    ROLLBACK; -- 데이터 추가 취소( DML-데이터 추가, 수정, 삭제)
    SELECT * FROM DEPT;
    SELECT * FROM EMP WHERE EMPNO=9999;
    
    --ex1. 최초입사일과 최초입사한사람,
    SELECT MIN(HIREDATE) FROM EMP;                          --서브쿼리
    SELECT HIREDATE, ENAME FROM EMP                         --메인쿼리
        WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);   
        
    --ex2. 최근입사일과 최근입사한사람이름
    SELECT MAX(HIREDATE) FROM EMP;                          --서브쿼리
    SELECT HIREDATE, ENAME FROM EMP                         --메인쿼리
        WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
    
    --ex3. 최소입사일과 최소입사한사람, 최근입사일과 최근입사한사람 이름 
    SELECT MIN(HIREDATE), MAX(HIREDATE) FROM EMP;
    SELECT E.HIREDATE 최소입사일, E.ENAME 최소입사인, E2.HIREDATE 최근입사일, E2.ENAME 최근입사인
    FROM EMP E, EMP E2
    WHERE E.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)
    AND E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
    
    --ex. SCOTT과 같은 부서에 근무하는 사람들의 급여합
    SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'; -- 서브쿼리(단일행)
    SELECT SUM(SAL) FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
    
    --ex. SCOTT 과 동일한 직책(JOB)을 가진 사원의 모든 필드
    SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'; -- 서브쿼리(단일행) 
    SELECT * FROM EMPM WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'); -- 메인쿼리
    

    --ex. DALLAS에서 근무하는 사원의 이름, 부서번호  ---------------------------------------------------다시
    SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS';
    SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
     
    --ex. 'KING'이 직속상사인 사원의 이름과 급여 
    SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
    SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING'); 
    
    SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
    SELECT ENAME, SAL FROM EMP WHERE MGR = ( SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
    
    
    SELECT W.ENAME, W.SAL
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME='KING'; --SELF JOIN 이용 
     
    --ex1. 평균 급여 이하로 받는 사원의 이름과 급여를 출력 
    SELECT ENAME, SAL FROM EMP WHERE SAL <= (SELECT AVG(SAL) FROM EMP); 
    
    SELECT ROUND(AVG(SAL),2) FROM EMP ;
    SELECT ENAME, SAL FROM EMP WHERE SAL <=(SELECT ROUND(AVG(SAL),2) FROM EMP);
    
    --ex2. 평균 급여 이하로 받는 사원의 이름, 급여, 평균급여 출력 
    SELECT ENAME, SAL, (SELECT AVG(SAL)FROM EMP) FROM EMP WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
     
    SELECT AVG(SAL) FROM EMP; 
    SELECT ENAME,SAL, (SELECT ROUND(AVG(SAL))FROM EMP)평균급여 
        FROM EMP 
        WHERE SAL<=(SELECT AVG(SAL) FROM EMP); 
    
    --ex3. 평균급여 이하로 받는 사원의 이름, 급여, 평균과 차이를 출력 
    SELECT ROUND(AVG(SAL),2) FROM EMP;
    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)-SAL,1) 평균과차이 
        FROM EMP 
        WHERE SAL <=( SELECT ROUND(AVG(SAL),2) FROM EMP);
     

-- 단일행 다중열 서브쿼리 
-- ex. SCOTT이랑 JOB과 DEPTNO가 같은 직원의 모든 필드를 출력
-- 단일행 단일열 
    SELECT * FROM EMP 
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT') 
    AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
-- 단일행 다중열
    SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
    SELECT * FROM EMP
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME != 'SCOTT';     
    
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

                ------------  ★ 총 연습문제(단일행) --------------
                
--1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일

SELECT ENAME, SAL, HIREDATE FROM EMP 
WHERE HIREDATE = ( SELECT MIN(HIREDATE) FROM EMP);

-- 2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT ENAME , SAL FROM EMP
WHERE SAL = (SELECT MIN(SAL) FROM EMP);

-- 3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT ENAME, SAL, DEPTNO FROM EMP 
WHERE SAL >= ( SELECT AVG(SAL) FROM EMP); 

--4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO
AND SAL <= (SELECT AVG(SAL) FROM EMP);

--5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT ENAME, SAL , HIREDATE, GRADE 
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL 
AND HIREDATE <= (SELECT HIREDATE FROM EMP WHERE ENAME ='SCOTT') AND ENAME != 'SCOTT';

--6. 5번(SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급)에 부서명 추가하고 급여가 큰 순 정렬
SELECT E.ENAME, E.SAL , E.HIREDATE, GRADE ,DNAME
FROM EMP E, DEPT D, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO 
AND HIREDATE <= (SELECT HIREDATE FROM EMP WHERE ENAME ='SCOTT') AND ENAME != 'SCOTT'
ORDER BY SAL DESC;

--7. BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL >= (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE') AND ENAME != 'BLAKE';

--8. MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER') AND ENAME != 'MILLER';


--9. 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--10. CLARK와 같은 부서번호이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여    
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME ='CLARK') 
AND SAL> (SELECT SAL FROM EMP WHERE EMPNO = 7698);

--11.  응용심화. CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
FROM EMP E, DEPT D1
WHERE E.DEPTNO = D1.DEPTNO 
AND SAL>= (SELECT SAL FROM EMP WHERE EMPNO = 7698)
AND D1.DNAME = 
(SELECT D2.DNAME FROM EMP E2, DEPT D2 WHERE E2.DEPTNO = D2.DEPTNO AND  E2.ENAME ='CLARK') ;

SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO ; -- CLARK과 같은 부서명 : 어카운팅 ( 킹, 밀러 )

--12. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');

--13. 평균 급여 이상을 받는 모든 종업원에 대해서 사원번호와 이름 단 급여가 많은 순으로 출력)
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL DESC;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

            ------------------- ★3. 다중행 서브쿼리 -------------------        
            -- IN, ALL, ANY=SOME, EXISTS 
            
-- ① IN : 서브쿼리 결과 중 하나라도 일치하면 '참'
    
    --ex. 부서별로 입사일이 가장 늦은 사람의 이름, 입사일, 부서번호
    SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; --(다중행, 다중열)
    SELECT ENAME, HIREDATE , DEPTNO
    FROM EMP 
    WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);
    
    --ex. 급여 3000 이상 받는 사원이 소속된 부서에서 근무하는 사원의 모든 필드
    SELECT DEPTNO FROM EMP WHERE SAL>=3000;
    SELECT * FROM EMP 
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);
    
    --ex. JOB(직책별)로 가장 낮은 연봉을 받는 사람의 이름, 직책, 연봉을 출력
    SELECT JOB, MIN((SAL+NVL(COMM,0))*12) FROM EMP GROUP BY JOB;
    SELECT ENAME, JOB, (SAL+NVL(COMM,0))*12
    FROM EMP
    WHERE (JOB, (SAL+NVL(COMM,0))*12) IN (SELECT JOB, MIN((SAL+NVL(COMM,0))*12) FROM EMP GROUP BY JOB);
    
-- ② ALL : 서브쿼리 결과가 모두 만족해야 참 
    
    --ex. (1)30번 부서 급여들 모두보다 큰 경우 = (2)30번 부서 최대급여 보다 큰 경우
    --(1) 다중행으로 했을 경우 
    SELECT SAL FROM EMP WHERE DEPTNO=30; --30번 부서 급여 (다중행) 
    SELECT * FROM EMP WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);
    
    --(2) 단일행으로 바꿔서 한 경우 
    SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30 GROUP BY DEPTNO; --30번 부서 급여 최대값 -- 여기서 GROUP BY 안해도 실행됨 
    SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30 GROUP BY DEPTNO);
     
-- ③ ANY = SOME : 서브쿼리 결과가 하나라도 만족 했을 경우

    --ex. 30번 부서 각각의 급여에서 그 중 하나라도 그 급여 보다 큰 경우 (=30번 부서 최소 급여보다 큰 경우) 직원의 모든 필드
    SELECT SAL FROM EMP WHERE DEPTNO=30; --서브쿼리(다중행)
    SELECT * FROM EMP 
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);
   
    -- 위의 QUERY를 단일행 서브쿼리로
    SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30;
    SELECT * FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);
    
        
-- ④ EXISTS : 서브쿼리 결과가 존재하면 '참'(EXISTS는 서브쿼리가 실행 안될수도 있음)
-- 힘들면 SELF JOIN 해도 됨    
    --ex. 직속부하가 있는 직원들의 사번, 이름, 급여
    --서브쿼리이용
    SELECT EMPNO FROM EMP WHERE MGR=EMPNO;
    SELECT EMPNO, ENAME, SAL
        FROM EMP MANAGER
        WHERE EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);
        
    --SELF JOIN 이용 
    SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;

    --ex. 말단 사원의 모든 필드 출력 
    --서브쿼리 이용
    SELECT * FROM EMP MANAGER
    WHERE NOT EXiSTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);

    --SELF JOIN 이용
    SELECT M.*
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;

-----------------------------------------------------------------------------------------------------------
--탄탄 1. 부서별로 가장 급여를 많이 받는 사원의 정보(사원 번호, 사원이름, 급여, 부서번호)를 출력(IN 연산자 이용)
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

--탄탄 2. 직급(JOB)이 MANAGER인 사람의 속한 부서의 부서 번호와 부서명과 지역을 출력(IN)
SELECT DEPTNO FROM EMP WHERE JOB='MANAGER';
SELECT DEPTNO, DNAME, LOC 
FROM  DEPT 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');

--탄탄 3.연봉이 3000이상인 사람들 중 연봉 등급을 나누어서 해당 등급별 최고 연봉을 받는 사람들의 
-- 사번, 이름, 직업, 입사일, 급여, 급여등급을 출력
SELECT MAX(SAL) , GRADE FROM EMP , SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE;

SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL 
AND (SAL, GRADE) IN (SELECT MAX(SAL) , GRADE FROM EMP , SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE)
ORDER BY GRADE;

-- 탄탄 4.입사일 분기별로 가장 높은 급여 받는 사람들의 분기, 사번, 이름, JOB, 상사사번, 입사일, 급여, 상여를 출력하세요
-- 1,2,3 -> 1 / 4,5,6->2 / 7,8,9->3/ 10,11,12->4
SELECT HIREDATE, CEIL(EXTRACT(MONTH FROM HIREDATE)/3)||'분기'"분기" FROM EMP ORDER BY "분기";  
SELECT HIREDATE, CEIL(TO_CHAR(HIREDATE,'MM')/3)||'분기'"분기" FROM EMP ORDER BY "분기";
--------------------------------------------------------------------------------선생님이랑 답 낸 부분.... 
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3)||'분기'"분기" , MAX(SAL) FROM EMP GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3); --서브쿼리
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3)||'분기'"분기", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP
WHERE (CEIL(EXTRACT(MONTH FROM HIREDATE)/3),SAL) 
IN(SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) , MAX(SAL) FROM EMP GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3))
ORDER BY "분기";
------------------------    다른방식  ----------------------------------
SELECT TO_CHAR(HIREDATE,'q')||'분기' FROM EMP;
SELECT TO_CHAR(HIREDATE,'q')||'분기' , EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
FROM EMP
WHERE (SAL) IN (SELECT MAX(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'q'))
ORDER BY TO_CHAR(HIREDATE,'q');

--탄탄 5. SALESMAN 모든 사원들 보다 급여를 많이 받는 사원들의 이름과 급여와 직급(담당 업무)를 출력하되 
        --영업 사원은 출력하지 않는다.(ALL이용)
SELECT ENAME, SAL, JOB 
FROM EMP 
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')AND JOB != 'SALESMAN';

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN') AND JOB !='SALESMAN'; 

--탄탄 6. SALESMAN 일부 어떤 한 사원보다 급여를 많이 받는 사원들의 이름과 급여와 직급(담당 업무)를 출력하되 영업 사원도 출력(ANY)
SELECT ENAME, SAL, JOB 
FROM EMP 
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')AND JOB != 'SALESMAN';

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN') AND JOB !='SALESMAN'; 

--탄탄 7. 연봉이 3000미만인 사람 중에 가장 최근에 입사한 사람의 사원번호와 이름, 연봉, 입사일을 출력
SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000;
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000);

--탄탄 8. ?	직급이 ‘SALESMAN’인 사원이 받는 급여의 최소 급여보다 많이 받는 사원들의 
--이름, 급여, 직급, 부서번호를 출력하되 부서번호가 20번인 사원은 제외한다(ANY 연산자 이용)
SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN';
SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN')AND DEPTNO != 20;

SELECT SAL FROM EMP WHERE JOB = 'SALESMAN';
SELECT ENAME, SAL, JOB, DEPTNO
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN') AND DEPTNO != 20;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                ------------  ★ 총 연습문제(다중행) --------------

-- 14.  이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 직원의 사원 번호,이름,급여(단 사번 순 출력)
SELECT DEPTNO , ENAME FROM EMP WHERE ENAME LIKE '%T%';
SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE (DEPTNO, ENAME) IN (SELECT DEPTNO, ENAME FROM EMP WHERE ENAME LIKE '%T%')
ORDER BY EMPNO;

-- 15. 부서 위치가 Dallas인 모든 종업원에 대해 이름,업무,급여
SELECT LOC FROM DEPT WHERE LOC = 'DALLAS'; 
SELECT ENAME, JOB, SAL
FROM EMP E , DEPT D
WHERE E.DEPTNO = D.DEPTNO AND LOC = (SELECT LOC FROM DEPT WHERE LOC = 'DALLAS');

-- 16. EMP 테이블에서 King에게 보고하는 모든 사원의 이름과 급여(킹의 사원번호를 MGR로 가지고 있는 사원)
--JOIN
SELECT W.ENAME FROM EMP W, EMP M WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING';
--서브쿼리
SELECT ENAME, SAL
FROM EMP
WHERE MGR = ( SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

-- 17. SALES부서 사원의 이름, 업무
SELECT ENAME, JOB 
FROM EMP E, DEPT D1
WHERE E.DEPTNO = D1.DEPTNO 
AND (D1.DNAME) IN 
(SELECT D2.DNAME FROM EMP E2, DEPT D2 WHERE E2.DEPTNO = D2.DEPTNO AND  D2.DNAME ='SALES') ;

-- 18. 월급이 부서 30의 최저 월급보다 높은 사원의 모든 필드
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30;
SELECT * FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);


-- 19. 부서 10에서 부서 30의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무
--JOIN
SELECT E.ENAME, E.JOB FROM EMP E, EMP M WHERE E.JOB=M.JOB AND M.DEPTNO=30 AND E.DEPTNO=10;

--서브쿼리 
SELECT ENAME, JOB
FROM EMP 
WHERE (JOB) IN (SELECT JOB FROM EMP WHERE DEPTNO = 30) AND DEPTNO = 10;

-- 20.  FORD와 업무도 월급도 같은 사원의 모든 필드
SELECT JOB, SAL FROM EMP WHERE ENAME ='FORD';

SELECT *
FROM EMP
WHERE (JOB, SAL) IN ( SELECT JOB, SAL FROM EMP WHERE ENAME ='FORD');

-- 21. 이름이 JONES인 직원의 JOB과 같거나 FORD의 SAL 이상을 받는 사원의 정보를 이름, 업무, 부서번호, 급여
    -- 단, 업무별 알파벳 순, 월급이 많은 순으로 출력
SELECT JOB FROM EMP WHERE ENAME = 'JONES';
SELECT SAL FROM EMP WHERE ENAME = 'FORD';

SELECT ENAME, JOB, DEPTNO, SAL
FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES')
OR SAL >=(SELECT SAL FROM EMP WHERE ENAME = 'FORD');


-- 22. SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여
SELECT SAL FROM EMP WHERE ENAME = 'SCOTT' OR ENAME = 'WARD';

SELECT ENAME, JOB, SAL
FROM EMP
WHERE (SAL) IN (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT' OR ENAME = 'WARD');

-- 23. CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원들의 이름,업무
SELECT LOC FROM DEPT WHERE LOC = 'CHICAGO';

SELECT ENAME, JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND LOC = (SELECT LOC FROM DEPT WHERE LOC = 'CHICAGO');

-- 24. 부서별로 // 월급이 평균 월급보다 높은 사원을 사번, 이름, 급여, 부서번호
--부서별 평균 원급이 전체 평균 월급보다 높은걸 구하라는 거야 아니면 
--부서별 각각의 사람 월급이 부서별 월급의 평균 보다 높은걸 구하라는거? 
-- 부서별 평균 월급보다 

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP E
WHERE SAL > ALL(SELECT AVG(SAL) FROM EMP WHERE E.DEPTNO = DEPTNO GROUP BY DEPTNO)ORDER BY DEPTNO;
SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO ;

--평균 월급보다 큰 사원 
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP); 

--
SELECT EMPNO, ENAME, SAL FROM EMP E 
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO); 

SELECT EMPNO, ENAME, SAL
FROM EMP E , (SELECT DEPTNO, AVG(SAL) "AVG" FROM EMP GROUP BY DEPTNO) A
WHERE E.DEPTNO = A.DEPTNO AND SAL>AVG; -- INLINE VIEW 이용

-- 추가문제 : 해당부서평균보다 높은 사원의 정보 : 사번 , 이름, 급여, 부서번호, 해당부서의 평균(소수점 2자리) 
-- 1.  EMP 전체 평균보다 높은 사원 
SELECT EMPNO, ENAME, SAL, DEPTNO 
FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- 2. 부서별 평균 보다 높은 사람 -- 에러남. 왜 ? GROUP BY 로 묶어 놓은 각각의 행과 비교할 수가 없음 
SELECT EMPNO, ENAME, SAL, DEPTNO , (SELECT AVG(SAL) FROM EMP WHERE E.DEPTNO = DEPTNO)
FROM EMP E
WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE E.DEPTNO = DEPTNO);

-- 3.


SELECT EMPNO, ENAME, SAL, DEPTNO ,ROUND((SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO),2)"해당부서의 평균"
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);

SELECT EMPNO, ENAME, SAL, E.DEPTNO
    FROM EMP E, (SELECT DEPTNO, ROUND(AVG(SAL),2) AVG FROM EMP GROUP BY DEPTNO) A
    WHERE E.DEPTNO = A.DEPTNO AND SAL>AVG; -- INLINE VIEW 이용 
--(앞 FROM EMP에 있는 DEPTNO와 SELECT 절의 DEPTNO가 같은지 확인)

-- 25. 업무별로 평균 월급보다 적은 월급을 받는 사원을 부서번호, 이름, 급여
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB;

SELECT JOB, DEPTNO, ENAME, SAL
FROM EMP E
WHERE SAL < ALL (SELECT  AVG(SAL) FROM EMP WHERE E.JOB = JOB GROUP BY JOB ) ORDER BY JOB;


-- 26. 적어도 한 명 이상으로부터 보고를 받을 수 있는 사원을 업무, 이름, 사번, 부서번호를 출력(단, 부서번호 순으로 오름차순 정렬)
-- MGR을 갖고 있는 아이 
SELECT JOB, ENAME, EMPNO, DEPTNO
FROM EMP MANAGER
WHERE EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR) ORDER BY DEPTNO;


-- 27.  말단 사원의 사번, 이름, 업무, 부서번호 EMPNO 는 있지만 , MGR이 없음 
SELECT EMPNO, MGR FROM EMP; 
SELECT JOB, ENAME, EMPNO, DEPTNO
FROM EMP MANAGER
WHERE NOT EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);




