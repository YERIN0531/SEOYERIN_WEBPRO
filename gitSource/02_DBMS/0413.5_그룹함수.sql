--[V] 그룹함수 : SUM,AVG,MIN,MAX,COUNT,STDDEV(표준편차),VARIANCE(분산)


SELECT ENAME,SAL, ROUND(SAL, -3) FROM EMP;        -- SAL을 100의 자리에서 반올림
                                                  -- 단일행함수(4장)                                           
SELECT MAX(SAL) FROM EMP;                         -- 그룹함수                                            
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- 그룹함수(5)장 -- 부서별 SAL 맥스 

SELECT ENAME, MAX(SAL) FROM EMP GROUP BY ENAME;   -- 그룹바이절로 묶어야 됨 
                                                  -- 이름은 중복된 사람이 없어서 이렇게 하면 안됨                  
                                                  -- 최대급여를 받는 사람의 이름 (6장)에서 할 것 
                                                  -- 에러(단일행과 다중행을 같이 써서) 

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------★① 그룹함수들 실습---------------------
 
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT COUNT(*) FROM EMP; -- EMP 테이블의 행(로우ROW)수
                          -- 괄호 안에는 뭐든 넣어야 함 
SELECT AVG(SAL), (SUM(SAL)/ COUNT(SAL)) FROM EMP; 
SELECT COMM FROM EMP;     -- 300+500+1400+0(2200) 
                          -- 1. 2200/14=157.XX(그룹함수에서는 2200/4 함.. NULL을 제외시키니까)  
                          -- 2. 2200/4 = 550 (2번으로 계산됨) 
                      
SELECT SUM(COMM) FROM EMP; --NULL은 빼놓고 계산
SELECT SUM(COMM), AVG(COMM), COUNT(COMM), MIN(COMM), MAX(COMM) FROM EMP;--NULL은 빼놓고 계산
-- 모든 그룹함수는 NULL값을 제외 

--SAL의 평균, 합, 최소급여, 최대급여, 급여분산, 급여표준편차, 갯수 
SELECT ROUND(AVG(SAL),2),SUM(SAL),MIN(SAL),MAX(SAL),ROUND(VARIANCE(SAL),2),ROUND(STDDEV(SAL),2) FROM EMP; 
SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL)FROM EMP; --SQRT는 루트 씌우는 함수 

-- 그룹함수 MIN, MAX, COUNT는 숫자형, 문자형, 날짜형 모두 사용 가능 
SELECT MIN(HIREDATE)"최초입사자", MAX(HIREDATE)"신입입사자" FROM EMP; --80/12/17 , 83/01/12
SELECT MIN(ENAME), MAX(ENAME), COUNT(ENAME) FROM EMP;             -- ADAMS , WARD -- 아스키코드가 가장 작은애, 가장큰애  

------------------------------------------------------------------------------------------------------------VVVVVVVVVVVVVV

--탄탄1. 가장 최근에 입사한 사원의 입사일과 가장 최초 입사한 사원의 입사일 
SELECT MAX(HIREDATE)"최근 입사일", MIN(HIREDATE)"최초입사자" FROM EMP;

--탄탄2. 83/01/12 최근입사일 : XX,XXX일 근무 
SELECT MAX(HIREDATE)||' 최근입사일 : '|| TO_CHAR(TRUNC(MIN(SYSDATE-HIREDATE)),'99,999') ||'일 근무, '
|| MIN(HIREDATE) || ' 최초입사일 : ' || TO_CHAR(TRUNC(MAX(SYSDATE-HIREDATE)),'99,999') ||'일 근무'
FROM EMP;

--선생님이 하신 방법
--1)
SELECT MAX(HIREDATE)||' 최근입사일 : '|| TO_CHAR(SYSDATE-MAX(HIREDATE),'99,999') || '일 근무, ' ||
MIN(HIREDATE) || ' 최초입사일 : ' || TO_CHAR(SYSDATE-MIN(HIREDATE),'99,999') ||'일 근무' FROM EMP;
--2) 내가 한 방법 이랑 동일 (어차피 TO_CHAR로 만들어 줄거면 TRUNC필요 없음)

--탄탄3. 10번부서 소속의 사원 급여 평균
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10;

--탄탄4. 10번부서 소속의 사원중에서 커미션을 받는 사원의 수를 구해보시오
SELECT COUNT(COMM)||'명'"사원의 수" FROM EMP WHERE DEPTNO =10;
SELECT DEPTNO, COMM FROM EMP;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------★② GRUP BY 절---------------------  
        
--부서번호별 최대 급여, 최소급여, 급여평균, 급여합
    --GROUP BY 별칭 사용 금지
SELECT DEPTNO 부서, MAX(SAL), MIN(SAL), ROUND(AVG(SAL)), SUM(SAL) FROM EMP GROUP BY DEPTNO;
------------------------------------------------------------------------------------------------------------VVVVVVVVVVV
    --ex1. SAL이 5000미만인 사원에 대해서만 부서번호별 사원수, 최대급여, 최소급여, 평균급여(부서번호순 정렬)
    SELECT DEPTNO 부서, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL)) --SELECT절에서는 별칭 가능   
        FROM EMP 
        WHERE SAL<5000      -- WHERE 절에서는 필드 별칭 불가
        GROUP BY DEPTNO     -- GROUP BY 절에서는 필드 별칭 불가
        ORDER BY DEPTNO;    -- ORDER BY 절에서는 필드 별칭 가능 

    --ex2. 부서명별 사원수, 최대급여, 최소급여, 평균급여(소수점2자리), 사원수가 많은 순으로 정렬 
    SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2)    
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO      
        GROUP BY DNAME
        ORDER BY COUNT(*) DESC;     

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------★③ HAVING 절---------------------  
        -- 그룹함수 결과의 조건 
        -- HAVING 절은 GROUP BY 앞에 쓸수는 있으나, 웬만하면 뒤에 써라 
        
--부서번호별 평균 급여( 평균급여가 2000이상인 부서만 출력, 평균급여 순으로 정렬 )
--WHERE절에는 GROUP함수를 못씀, SELECT 절에만 가능 
SELECT DEPTNO, ROUND(AVG(SAL),2)"AVG"
    FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL) >= 2000        -- HAVING 절에는 필드 별칭 사용 불가 
    ORDER BY AVG;                  -- ORDER BY 절에는 필드 별칭 사용 가능 


------------------------------------------------------------------------------------------------------------VVVVVVVVVVV
    --ex1. SAL이 5000 미만인 사원에 대해(WHERE) 부서명별(WHERE) 최소급여, 최대급여, 평균급여 출력 (평균급여가 2000이상인 부서명 HAVING) 평균급여 순으로 정렬
    SELECT DNAME, MIN(SAL), MAX(SAL), AVG(SAL)평균급여
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND SAL<5000 
        GROUP BY DNAME
        HAVING AVG(SAL) >=1800
        ORDER BY 평균급여;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     ---------------------★④ 결과 집계합 내 집계값 생성 --------------------- 
--  10  2500
--  20  3500
--  30  7500
--전체합 0000
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);
      
--부서별, JOB별 급여합
    SELECT DEPTNO, JOB, SUM(SAL) FROM EMP GROUP BY DEPTNO,JOB ORDER BY DEPTNO;
 
--부서별, JOB별 급여합 (소계와 전체합 포함)
    SELECT DEPTNO, NVL(JOB,'계'), SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO,JOB)ORDER BY DEPTNO;
 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        ---------------------★ 총 연습 문제 ★--------------------- 

-- 1. 인원수,최대 급여,최소 급여,급여의 합을 출력
SELECT COUNT(*)||'명' 인원수, MAX(SAL)최대급여, MIN(SAL)최소급여, SUM(SAL)총급여 FROM EMP;

-- 2. 업무별 인원수를 구하여 출력
SELECT JOB, COUNT(*)||'명'인원수 FROM EMP GROUP BY JOB;

--- 3. 최고 급여와 최소 급여의 차이는 얼마인가 출력
SELECT MAX(SAL)-MIN(SAL)"최고급여-최소급여" FROM EMP;

-- 4. 각 부서별로 인원수, 급여 평균, 최저 급여, 최고 급여, 급여의 합을 출력(급여의 합이 많은 순으로)
SELECT DEPTNO, COUNT(*)||'명'"인원수", ROUND(AVG(SAL),2), MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC;

-- 5. 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 출력(부서번호, 업무순으로 오름차순 정렬)
SELECT DEPTNO, JOB, COUNT(*), AVG(SAL), SUM(SAL) 
FROM EMP
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB;

-- 6. 업무별, 부서별 그룹하여 결과를  업무, 부서번호, 인원수, 급여의 평균, 급여의 합을 출력(출력결과는 업무순, 부서번호 순 오름차순 정렬)
SELECT JOB, DEPTNO, COUNT(*), AVG(SAL), SUM(SAL) 
FROM EMP
GROUP BY JOB, DEPTNO
ORDER BY JOB, DEPTNO;

--7. 사원수가 5명이상 넘는 부서번호와 사원수를 출력
SELECT DEPTNO 부서번호, COUNT(*)사원수
FROM EMP
HAVING COUNT(*) >=5
GROUP BY DEPTNO;

-- 8. 사원수가 5명이상 넘는 부서명과 사원수를 출력
SELECT DNAME 부서명 , COUNT(*) 사원수
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO
HAVING COUNT(*) >= 5
GROUP BY DNAME;

--9. 업무별 급여의 평균이 3000이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 출력
SELECT JOB, AVG(SAL), SUM(SAL)
FROM EMP 
HAVING AVG(SAL)>=3000
GROUP BY JOB;

--10. 급여 합이 5000을 초과하는 각 업무에 대해서 업무와 급여합을 출력(급여 합계순 내림차순 정렬)
SELECT JOB, SUM(SAL)
FROM EMP
HAVING SUM(SAL)>5000
GROUP BY JOB
ORDER BY SUM(SAL) DESC;

--11. 부서별 급여평균, 부서별 급여합계, 부서별 최소급여를 출력
SELECT ROUND(AVG(SAL),2)급여평균, SUM(SAL)"급여합계", MIN(SAL)"최소급여"
FROM EMP
GROUP BY DEPTNO;

--12. 위의 11번을 수정하여, 부서별 급여평균 최대치, 부서별 급여합의 최대치, 부서별 최소급여의 최대치를 출력
SELECT MAX(ROUND(AVG(SAL),2))"급여평균 최대치", MAX(SUM(SAL))"급여합계 최대치", MAX(MIN(SAL))"최소급여 최대치"
FROM EMP
GROUP BY DEPTNO;

--13. 사원 테이블에서 아래의 결과를 출력
--   H_YEAR	COUNT(*)	MIN(SAL)	MAX(SAL)	AVG(SAL)	SUM(SAL)
--  80	  1		    800		    800		    800		    800
--	81	 10		    950		    5000	    2282.5	  22825
--	82	  2		    1300	    3000	   2150		   4300
--	83	  1		    1100	    1100	    1100	   1100
SELECT TO_CHAR(HIREDATE, 'RR')"H_YEAR" , COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'RR')
ORDER BY TO_CHAR(HIREDATE, 'RR');

-- 14.  아래의 결과를 출력(입사년도별 사원수)
--  1980     1	
--  1981     10
--  1982     2
--  1983     1
--  total    14	

SELECT NVL(TO_CHAR(HIREDATE,'YYYY'),'total')"연도", COUNT(*)
FROM EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE,'YYYY'))
ORDER BY TO_CHAR(HIREDATE,'YYYY');


--15. 최대급여, 최소급여, 전체급여합, 평균을 출력
SELECT MAX(SAL), MIN(SAL), SUM(SAL),ROUND( AVG(SAL),2)
FROM EMP;

--16. 부서별 인원수 출력
SELECT DEPTNO, COUNT(*)||'명'
FROM EMP 
GROUP BY DEPTNO;

--17. 부서별 인원수가 6명이상인 부서번호 출력
SELECT DEPTNO, COUNT(*)||'명'
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>=6;

-- 조인할떄, 나의 SAL보다 크거나 같은애만 조인해라 
--18. 급여가 높은 순서대로 등수를 부여하여 다음과 같은 결과가 나오게 하시오. 
-- (힌트 self join, group by, count사용)

--ENAME	    등수
--________________________
--KING		1
--SCOTT		2
--……

SELECT E1.ENAME, E2.ENAME
FROM EMP E1 , EMP E2
WHERE E1.SAL<E2.SAL(+) AND E1.ENAME='KING';

SELECT E1.ENAME, COUNT(E2.ENAME) RANK
FROM EMP E1 , EMP E2
WHERE E1.SAL<=E2.SAL(+)
GROUP BY E1.ENAME
ORDER BY RANK;
----정답----
SELECT E1.ENAME,COUNT(E2.ENAME) +1  RANK
FROM EMP E1 , EMP E2
WHERE E1.SAL<E2.SAL(+)
GROUP BY E1.ENAME
ORDER BY RANK;

--정답풀이 [RANK 함수가 있음]BUT 데이터가 많으면 RANK 속도 느려짐 
--1단계 : SELF JOIN / OUTER JOIN
SELECT E1.ENAME, E1.SAL, E2.ENAME, E2.SAL 
FROM EMP E1, EMP E2
WHERE E1.SAL<E2.SAL(+) ;

--완성단계 : GROUP BY , COUNT
SELECT E1.ENAME, COUNT(E2.ENAME)+1 RANK
FROM EMP E1, EMP E2
WHERE E1.SAL<E2.SAL(+)
GROUP BY E1.ENAME
ORDER BY RANK;

SELECT ENAME, RANK() OVER(ORDER BY SAL DESC)"RANK",
              DENSE_RANK() OVER(ORDER BY SAL DESC)"DENSE_RANK",
              ROW_NUMBER() OVER(ORDER BY SAL DESC)"LOW_NUMBER" FROM EMP;

         




