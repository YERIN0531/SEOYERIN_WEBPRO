--[X] VIEW, INLINE VIEW, TOP-N구문
-- 공간을 차지 하지 않으면서 EMP테이블의 일부만 어세스 할 수 있게 하는 것 이 뷰 

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

    -----------------------1. VIEW : 가상의 테이블 --------------------------
    -- ① 단순뷰 (메모리 공간 차지 X)
    -- ② 복합뷰 (메모리 공간 차지 X)
    
-- ① 단순뷰 (메모리 공간 차지 X) : 하나의 테이블로 구성한 뷰 
-- EMPv0 이라는 VIEW 생성 또는 수정 = EMP 테이블 일부 필드를 받는 갖는 가상의 테이블 

-- VIEW를 생성하고, 수정하는 뷰 만들기 
SELECT * FROM USER_VIEWS; --데이터 딕셔너리 뷰 확인 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO FROM EMP; --DDL을 수행하면 데이터딕셔너리 자동 수정 
    
-- VIEW 의 딕셔너리 확인하고 테이블 확인하기 
SELECT * FROM USER_VIEWS;
SELECT * FROM EMPv0; -- 공간을 차지하지 않는 가상의 테이블 (진짜 테이블처럼 똑같이 쓸 수 있음)

-- VIEW INSERT 해보기 
INSERT INTO EMPv0 VALUES (1111,'홍','ITMANAGER',7369,SYSDATE,40); --뷰에 INSERT 
SELECT * FROM EMP; -- EMP에도 인서트 같이 됨 단, SAL과 COMM은 당연히 NULL 

-- VIEW UPDATE 해보기 
UPDATE EMPv0 SET JOB = 'MANAGER' WHERE EMPNO=1111; -- EMP도 같이 업데이트 됨 

-- VIEW DELETE 해보기 
DELETE FROM EMPv0 WHERE EMPNO =1111; -- 뷰 DELETE 하면 EMP 테이블도 DELETE 

-- EMPv0이라는 VIEW : EMP 테이블의 30번 부서행만 보이게 하기 
-- EMPv0 이라는 VIEW 생성. 기존에 존재하는 EMPv0이 있다면 자동으로 새로운 것으로 변경 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO=30;
DESC EMPv0;
SELECT * FROM EMPv0;

-- 새로 만든 EMPv0의 30번부서로 INSERT 하기 
INSERT INTO EMPv0 VALUES (1111,'홍',NULL,NULL,SYSDATE,9000,900,30); --30번 부서 INSERT 

-- 30번부서가 EMPv0에 권한을 부여받음. 근데 만약 40번 부서를 인서트 하겠다면 ? 
INSERT INTO EMPv0 VALUES (1112,'박',NULL,NULL, SYSDATE, 8000,800,40); --인서트는 가능 
SELECT * FROM EMPv0; -- EMPv0은 찐테이블이 아니고, 가상의 테이블이기 때문에 30번 부서만 보기로함. 40번 안보임 
SELECT * FROM EMP; -- 근데 EMP에서는 입력가능 

-- 문법적으로 EMPv0에 30번 부서만 있다고 생각하기 때문에 1111만 지워짐 
DELETE FROM EMPv0 WHERE EMPNO IN(1111,1112); -- 1112는 어차피 EMPv0에 없음 , 1112는 안지워진 상태 
                                             -- 30번 부서만 삭제됨.
DELETE FROM EMP WHERE EMPNO=1112;            -- 1112는 40번부서가 있는 EMP에서 지워줘야됨 

-- EMPv0 뷰 생성 : ENAME, JOB, HIREDATE 만으로 뷰를 만들 수 있을까? --생성은 가능 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT ENAME, JOB, HIREDATE FROM EMP;

-- INSERT는 가능할까..? 
-- 불가능 .. 이렇게 하면 다른 필드에 NULL 들어가게됨. 근데 EMPNO에는 NULL 이들어가면 안됨 
-- NOT NULL 필드를 미포함 하면 INSERT 불가 
INSERT INTO EMPv0 VALUES ('홍','SALESMAN',SYSDATE);

-- SELECT는 자유롭게 가능
SELECT * FROM EMPv0;
COMMIT;

-- VIEW의 제한조건 (1) 뷰의 조건 (2) 읽기 전용 
-- WITH CHECK OPTION을 설정한 뷰는 뷰의 조건에 해당되는 데이터만 삽입, 수정, 삭제 가능 
-- WITH READ ONLY을 설정한 뷰는 읽기 전용 뷰 (셀렉트만 가능)

-- EMPv0 : EMP테이블에서 30번 부서만  (WITH CHECK OPTION 설정)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO = 30 
    WITH CHECK OPTION;
    
-- INSERT 해보기     
INSERT INTO EMPv0 VALUES (1111,'홍',NULL,NULL,SYSDATE,9000,900,30);
INSERT INTO EMPv0 VALUES (1112,'홍',NULL,NULL,SYSDATE,9000,900,40); -- WITH CHECK OPTION 때문에 행 삽입이 안됨.
                                                                    -- 안했을땐, EMP 테이블에 추가 됨.(뷰에는 추가 안되지만) 
                                                                    
-- DELETE 해보기                                                                     
DELETE FROM EMPv0 WHERE ENAME = 'SMITH'; --20번 부서 SMITH 삭제 하려면 만족되지 않은 조건임 삭제가 안됨                                                                     
DELETE FROM EMPv0 WHERE EMPNO = 1111;  --30번 부서 DELETE 

-- EMPv0 : 읽기전용 뷰 (WITH READ ONLY 설정)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, MGR, DEPTNO FROM EMP
    WITH READ ONLY;
SELECT * FROM EMPv0;

-- INSERT 해보기 
INSERT INTO EMPv0 VALUES (1111,'홍',NULL,NULL,40); --에러 (읽기전용 뷰) 






--------------------------------------------------------------------------------
-- ② 복합뷰 (메모리 공간 차지 X) : 두개이상의 테이블을 이용해 만듦 OR 가상의 필드로 뷰를 생성 . DML제한적 사용 (SELECT만 가능)

-- (1) 2개 이상의 테이블로 뷰 생성
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DNAME, LOC FROM EMP E , DEPT D 
    WHERE E.DEPTNO=D.DEPTNO;

SELECT * FROM EMPv0; -- 이미 생성할때 조인을 했기 때문에, 조인된 결과가 뷰로 나옴     

-- INSERT 해보기 (UPDATE, DELETE 또한 불가능) 
-- 복합뷰는 갱신 불가능 
INSERT INTO EMPv0 VALUES (1111,'HONG','MANAGER','RESEARCH','DALLAS');


-- (2) 하나의 테이블로 만들되 가상의 필드로 뷰 생성(컬럼에 별칭을 이용하여 뷰 생성)

-- SAL*12 라는 필드가 없고, 필드엔 특수문자 들어가면 안됨 (가상의 필드엔 특수문자 들어가도 됨) 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, SAL*12 FROM EMP WHERE DEPTNO = 10; -- 에러남. SAL*12라는 필드가 없기 때문에 
    
-- 얘도 ROUND 옆 () 때문에 안만들어짐 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, ROUND(SAL,-2) FROM EMP WHERE DEPTNO = 10;

-- 이런경우엔 반드시 컬럼에 별칭을 이용하여 뷰를 생성 [별칭을 달 땐 알파벳과 숫자 활용 추천] 
-- 별칭은 반드시 (영문자로 시작, 영문자, 숫자, _ , $, # )사용가능. 길이가 30자 이내. 하지만 $쓰는건 비추 
-- 기존의 별칭 만드는 방식 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, SAL*12 "YEAR_SAL" FROM EMP WHERE DEPTNO = 10;

-- 별칭 만드는 다른 스타일 (별칭들만 따로 나열하는 방식 ) 단, 모든 필드를 다 써줘야됨 
CREATE OR REPLACE VIEW EMPv0 (EMPNO, ENAME, YEAR_SAL)
    AS SELECT EMPNO, ENAME, SAL*12 "YEAR_SAL" FROM EMP WHERE DEPTNO = 10;
SELECT * FROM EMPv0;

-- INSERT 해보기 
-- 복합뷰는 갱신 불가 
INSERT INTO EMPv0 VALUES (1111,'홍',2400);

--------------------------------------------------------------------------------
-- ex. 부서번호, 최소급여, 최대급여 , 부서평균급여를 포함한 뷰 생성 DEPTv1 뷰 생성 
CREATE OR REPLACE VIEW DEPTv1
    AS SELECT DEPTNO, MIN(SAL)"MIN_SAL", MAX(SAL)"MAX_SAL", ROUND(AVG(SAL),2)"AVG_SAL" FROM EMP GROUP BY DEPTNO;
SELECT * FROM DEPTv1;

-- ex. 직책, 부서를 포함한 EMPv0 뷰를 생성
-- 잘못된 답 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT JOB, DEPTNO FROM EMP ORDER BY DEPTNO;
SELECT * FROM EMPv0;    

-- 정상적인 답 (중복되는 아이가 있기 때문에 DISTINCT 해주면 됨) 
-- DISTINCT를 포함하면 INSERT가 안됨  (DISTINCT 를 포함한 뷰는 읽기 전용) 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY DEPTNO;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -----------------------2. INLINE VIEW --------------------------
        -- FROM 절 상의 서브쿼리를 INLINE VIEW라 하며, FROM절에 오는 서브쿼리는 VIEW 처럼 작동 
        
-- ex. 급여가 2000을 초과하는 사원의 평균급여 (INLINE VIEW 사용)
-- 인라인 뷰를 활용하지 않은 답 
SELECT AVG(SAL) FROM EMP WHERE SAL>2000;
-- 인라인 뷰를 활용한 답 (FROM절 뒤에 생성된 SELECT문이 INLINE VIEW)
SELECT AVG(SAL) FROM (SELECT SAL FROM EMP WHERE SAL>2000);

-- ex. 부서별로 월급이 평균 월급보다 높은 사원을 사번, 이름, 급여, 부서번호 [SUBQUERY 연습문제 24번,25번]
--(서브쿼리 연습문제 썼던거) 
SELECT EMPNO, ENAME, SAL, DEPTNO 
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO =E.DEPTNO);

--(인라인 뷰)
SELECT EMPNO, ENAME, SAL, E.DEPTNO, AVGSAL
    FROM EMP E, (SELECT DEPTNO, AVG(SAL)AVGSAL FROM EMP GROUP BY DEPTNO) A
    WHERE E.DEPTNO = A.DEPTNO AND SAL>AVGSAL;    


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -----------------------3. TOP-N구문 --------------------------
        -- TOP 1~10등 / TOP 11~20등 / TOP 6~10등 
        -- 랭킹 매기는 방법이랑 다름. 랭킹은 2등이 두명일 수 있음 
        -- 동일 랭킹이 있다면 (10등이 2명이면 하나는 잘라)
        -- 페이징 하는 필드는 NOT NULL 이어야됨. NULL인경우엔 NULL이 1등으로 나옴 
        
-- ★ ROWNUM : FROM 의 테이블로부터 가져온 순서 
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20;

-- ORDER BY 하면 당연히 ROWNUM이 뒤죽박죽 됨 
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20 ORDER BY ENAME;

-- ex. 등수, 이름 ,SAL(등수 기준 : SAL) [전체행에 대해]

-- 등수를 출력안할거면 ORDER BY 하면 됨 
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;

-- ROWNUM 은 등수가 아니라 못써 (테이블로부터 가져온 순서기 때문에 당연히 등수가 아님) 
SELECT ROWNUM, ENAME, SAL FROM EMP ORDER BY SAL DESC;

-- 애초에 SAL 기준으로 정렬된 EMP로부터 순서대로 ROWNUM을 가져온다면 ? 등수가 됨 
SELECT ROWNUM RANK, ENAME, SAL FROM (SELECT * FROM EMP ORDER BY SAL DESC);

-- 함수를 이용한 RANK 출력 ( 속도 느림 ) _ TOPN구문 아님  비추천 
SELECT RANK() OVER(ORDER BY SAL DESC) RANK,
    DENSE_RANK() OVER(ORDER BY SAL DESC) DENSE_RANK,
    ROW_NUMBER() OVER(ORDER BY SAL DESC) ROW_ROW_NUMBER,
    ENAME, SAL FROM EMP;

-- ★ TOP-N구문
-- ex. SAL 기준으로 1~5등 
-- ROWNUM만 활용했을때 
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)
    WHERE ROWNUM<=5;

-- ex. SAL 기준으로 6등부터 10등
-- ROWNUM만 활용했을때 결과가 한 행도 안나옴 
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)
    WHERE ROWNUM BETWEEN 6 AND 10;

-- ★ TOP - N 구문 1단계
-- RN이 등수 일단 전체행이 출력되도록 만들어 놓기 
SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC);

-- ★ TOP - N 구문 2단계(완성된 TOP-N 구문)
-- FROM 절에 ROWNUM에 꼭 ALIAS를 줘서 구분을 하자 
SELECT RN, ENAME, SAL 
    FROM (SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)) 
    WHERE RN BETWEEN 6 AND 10;

--ex. 이름을 알파벳 순서대로 정렬해서 6~10번째 까지 출력 (등수, 이름, 사번, JOB, MGR, HIREDATE) 
SELECT ROWNUM RN,ENAME, EMPNO, JOB, MGR, HIREDATE FROM (SELECT ENAME, EMPNO, JOB, MGR, HIREDATE FROM EMP ORDER BY ENAME);

SELECT RN, ENAME, EMPNO, JOB, MGR, HIREDATE
    FROM (SELECT ROWNUM RN, ENAME, EMPNO, JOB, MGR, HIREDATE 
    FROM (SELECT ENAME, EMPNO, JOB, MGR, HIREDATE FROM EMP ORDER BY ENAME))
    WHERE RN BETWEEN 6 AND 10;
    
-- 선생님 답 
SELECT RN, ENAME, EMPNO, JOB, MGR, HIREDATE
    FROM (SELECT ROWNUM RN, ENAME, EMPNO, JOB, MGR, HIREDATE 
    FROM (SELECT * FROM EMP ORDER BY ENAME))
    WHERE RN BETWEEN 6 AND 10;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

    ----------------------- ★ 연습문제 ★ --------------------------

-- 1. 부서명과 사원명을 출력하는 용도의 뷰, DNAME_ENAME_VU 를 작성하시오
CREATE OR REPLACE VIEW DNAME_ENAME_VU
    AS SELECT DNAME, ENAME FROM EMP E , DEPT D WHERE E.DEPTNO=D.DEPTNO;
    
    SELECT * FROM DNAME_ENAME_VU;

-- 2. 사원명과 직속상관명을 출력하는 용도의 뷰,  WORKER_MANAGER_VU를 작성하시오
CREATE OR REPLACE VIEW WORKER_MANAGER_VU
    AS SELECT W.ENAME WORKKER, M.ENAME MANAGER FROM EMP W, EMP M WHERE W.MGR = M.EMPNO;

    SELECT * FROM WORKER_MANAGER_VU;
    
-- 3. 부서별 급여합계 등수를 출력하시오(부서번호, 급여합계, 등수). -- 학생 질문
SELECT SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC;

SELECT  DEPTNO, "SUM_SAL",ROWNUM  RN 
FROM (SELECT DEPTNO, SUM(SAL)"SUM_SAL" FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC);

-- 3-1. 부서별 급여합계 등수가 2~3등인 부서번호, 급여합계, 등수를 출력하시오.
SELECT DEPTNO, "SUM_SAL" , RN
FROM (SELECT ROWNUM RN, DEPTNO, "SUM_SAL" 
FROM (SELECT DEPTNO, SUM(SAL)"SUM_SAL" FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC))
WHERE RN BETWEEN 2 AND 3;

-- 4. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사원 순으로 정렬하시오 (6번을 풀기 위한 단계)
SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC;

-- 5. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사원 5명을 출력하시오 (6번을 풀기 위한 단계)
SELECT ROWNUM RN, EMPNO, ENAME, HIREDATE 
FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC) 
WHERE ROWNUM <6;

-- 6. 사원 테이블에서 사번, 사원명, 입사일을 최신부터 오래된 순으로 6번째로 늦은 사원부터 10번째 사원까지 출력 (HIREDATE 최신에서 오래된 순으로 DESC)
SELECT RN, EMPNO, ENAME, HIREDATE
FROM (SELECT ROWNUM RN, EMPNO, ENAME, HIREDATE 
FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC))
WHERE RN BETWEEN 6 AND 10;












