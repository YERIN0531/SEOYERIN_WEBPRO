--[IV] 단일행 함수 (=내장함수 =SQL 주요함수)
--함수 = 단일행함수 + 그룹함수(집계함수)

------------------------------------------------------------------------------------

    --단일행 함수 (INPUT 1행 -> OUTPUT 1행) : 4장
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY"년"MM"월"DD"일"')FROM EMP; ---단일행 함수 
SELECT ENAME, INITCAP(ENAME) FROM EMP; --INITCAP (앞에만 모자를 씌운다. 앞글자만 대글자로)    
    --그룹함수 (INPUT N행 -> OUTPUT 1행) : 5장 
SELECT SUM(SAL), AVG(SAL) FROM EMP;
SELECT SUM(SAL)"총급여", AVG(SAL) "급여평균" FROM EMP; --전체 SAL합 
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO; --부서별 SAL 합 

-------------------------------------------------------------------------------------

------★단일행 함수 종류 : 숫자함수, 문자처리함수, 날짜함수(예약어), 형변환함수, NVL()....★-------

--DUAL 테이블 : OACLE에서 제공하는 1행 1열자리 DUMMY TALBE (CF)DUMMY
--DUAL 구조 보기
DESC DUAL; 
SELECT * FROM DUAL; -- 테스트용으로 쓸 테이블 
DESC DUMMY;
SELECT * FROM DUMMY;

-------------------------------------------------------------------------------------

             -----------------1. 숫자관련함수----------------- 
--FLOOR & TRUNC
SELECT -9, ABS(-9) FROM DUAL;            -- ABS(N)절대값
SELECT FLOOR(34.5678) FROM DUAL;         -- 소수점에서 내림 
SELECT FLOOR(34.5678*100)/100 FROM DUAL; -- 소수점 두번째 자리에서 내림 
SELECT TRUNC(34.5678, 2) FROM DUAL;      -- 소수점 두번째 자리에서 내림
SELECT TRUNC(34.5678) FROM DUAL;         -- 소수점에서 내림 
SELECT TRUNC(34,-1) FROM DUAL;           -- 일의 자리에서 내림 
--ex. EMP테이블에서 이름, 급여(십의 자리에서 내림)
SELECT ENAME,SAL,TRUNC(SAL,-2) FROM EMP; -- 십의 자리에서 내림

--CEIL
SELECT CEIL(34.5678) FROM DUAL;          -- 소수점에서 올림 
SELECT CEIL(34.5678*100)/100 FROM DUAL;  -- 소수점 두번째 자리에서 올림 
SELECT CEIL(1) FROM DUAL;
SELECT CEIL(2) FROM DUAL;
--ROUND
SELECT ROUND(34.5678)FROM DUAL;          -- 소수점에서 반올림
SELECT ROUND(34.5678,2)FROM DUAL;        -- 소수점 두번째 자리에서 반올림 
SELECT ROUND(34.5678,-1)FROM DUAL;       -- 일의 자리에서 반올림 

--MOD
SELECT MOD(9,2) FROM DUAL;               -- 나머지 연산자 (9/2의 나머지 1)
--ex. 사번이 홀수인 사원의 모든 필드 출력
SELECT * FROM EMP WHERE MOD(EMPNO,2)=1;
--ex. 홀수달에 입사한 사원의 모든 필드 출력 
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE,'MM'),2)=1; 
--

-------------------------------------------------------------------------------------

             -----------------2. 문자관련함수-----------------
--①대소문자관련
SELECT UPPER('abcABC')FROM DUAL;             -- 대문자로 바꾸는 UPEER
SELECT LOWER('abcABC')FROM DUAL;             -- 소문자로 바꾸는 LOWER
SELECT INITCAP('WELCOM TO ORACLE')FROM DUAL; -- 단어 맨 첫 글자만 대문자로 
--ex. JOB이 'manager'인 직원의 모든 필드 출력 
SELECT * FROM EMP WHERE UPPER(JOB) = 'MANAGER';
SELECT * FROM EMP WHERE LOWER(JOB) = 'manager';
SELECT * FROM EMP WHERE INITCAP(JOB) = 'Manager';

--②문자연결(CONCAT,||연산자)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;     -- 연결연산자는 무한대로 연결 가능
SELECT CONCAT('AB','CD')FROM DUAL;           -- CONCAT은 반드시 매개변수 2개만 가능
SELECT CONCAT(CONCAT('AB','CD'),CONCAT('EF','GH'))FROM DUAL; --CONCAT 여러번 써서 연결 가능 
--ex. "아무개(ENAME)는 XX(JOB)이다"(CONCAT을 이용)
SELECT CONCAT(CONCAT(ENAME,'은(는)'), CONCAT(JOB,'이다')) FROM EMP;
SELECT ENAME||'은 '|| JOB||'이다' FROM EMP;

--③SUBSTR(STR,시작위치,뽑으려는 문자갯수) 첫번째 위치가 1, 시작위치 음수가능, 
--③-2)SUBSTRB(STR,시작바이트위치, 문자바이트수)
--  O R A C L E
--  1 2 3 4 5 6
-- -6-5-4-3-2-1
SELECT SUBSTR('ORACLE',3,2)FROM DUAL;          -- 3번째 글자부터 2글자 추출
SELECT SUBSTRB('ORACLE',3,2)FROM DUAL;         -- 3번째 바이트부터 2바이트 추출
SELECT SUBSTR('데이터베이스',4,3)FROM DUAL;       -- 4번째 글자부터 3글자 추출 
SELECT SUBSTRB('데이터베이스',4,3)FROM DUAL;      -- 4번째 바이트부터 3바이트 추출(XE버전에서 한글 3BYTE)
SELECT SUBSTRB('홍길동',3,2)FROM DUAL;           -- 한글은 안나옴. 잘 봐야됨
SELECT SUBSTR('ABCDXD',-1,1)FROM DUAL;         -- 뒤에서 첫번째 글자
SELECT SUBSTR(123,2,1)FROM DUAL;               -- 숫자도 가능
--ex. 9월에 입사한 모든 필드(단, DATE 출력 FORMAT 'RR/MM/DD')
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'),4,2)=09;
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,4,2)='09';
--ex. 9일에 입사한 모든 필드
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,-2,2)='09';

--④글자수(LENGTH) VS 바이트수(LENGTHB)
SELECT LENGTH('ABC')FROM DUAL;                  -- 글자수 3
SELECT LENGTHB('ABC')FROM DUAL;                 -- 바이트 3
SELECT LENGTH('오라클')FROM DUAL;                -- 글자수 3
SELECT LENGTHB('오라클')FROM DUAL;               -- 바이트 9

--⑤INSTR(STR,찾을글자) : STR에서 찾은 글자의 위치 (첫번째 위치 1), 없으면 0, 위치에 음수 들어가는 거 가능 
--⑤-2)INSTR(STR,찾을글자,시작위치) : STR에서 시작위치부터 찾은 글자의 위치  
SELECT INSTR('ABCABC','B')FROM DUAL;            -- 처음부터 찾아서 처음 나오는 B의 위치 : 2
SELECT INSTR('ABCABC','B',3)FROM DUAL;          -- 앞3번째부터 찾아서 처음 나오는 B의 위치 : 5
SELECT INSTR('ABCABC','B',-3)FROM DUAL;         -- 뒤3번째부터 찾아서 처음 나오는 B의 위치 : 2(역방향)
SELECT INSTR('ABCABC','B',-1)FROM DUAL;         -- 뒤1번째부터 찾아서 처음 나오는 B의 위치 : 5(역방향)
--ex. 9월에 입사한 사원의 모든 필드(INSTR)사용 09/09/09
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09',4) = 4;
--ex. 9월에 입사한 사원의 모든 필드(INSTR)사용 09/09/09
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09',-1)=7;
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09', 7)=7;
--ex. 9일이 아닌날 입사한 사원의 모든 필드(INSTR) 09/09/09
SELECT * FROM EMP WHERE INSTR(HIREDATE,'09', 7)=0;
SELECT * FROM EMP WHERE NOT INSTR(HIREDATE,'09', 7)=7;

--⑥LPAD(STR,자리수,채울문자)STR을 자리수만큼 확보하고 왼쪽 빈자리에 채울 문자를 출력
--⑥-2)RPAD(STR,리수,채울문자)STR을 자리수만큼 확보하고 오른쪽 빈자리에 채울 문자를 출력 
SELECT LPAD('ORACLE',10,'#')FROM DUAL;
SELECT RPAD('ORACLE',10,'#')FROM DUAL;
SELECT ENAME, SAL, LPAD(SAL,6,'*') FROM EMP;

-------------------------------------------------------------------------------------

    --EX. 사번, 이름 (7788 S****), (7894 S****), 이름은 앞 한글자만 출력하고 나머지는 *    
    --SUBSTR(ENAME, 1, 1) / RPAD(ENAME,10,'*')
    
SELECT EMPNO"사번", RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*')"이름" FROM EMP;

    --EX. 사번, 이름, 입사일 (이름은 10자리를 확보하면서 이름 글자수만큼 *로 채워지고 맨 마지막 글자만 출력, 나머지는 스페이스, )
    -- 7892____****H 80/12/**
    -- 7792____****T 80/12/**
    --LPAD, LENGT, SUBSTR

SELECT EMPNO,LPAD(LPAD(SUBSTR(ENAME,-1,1),LENGTH(ENAME),'*'),10,' ')"NAME", RPAD(SUBSTR(HIREDATE,1,6),8,'*')"HIREDATE" FROM EMP;
SELECT EMPNO,LPAD(LPAD(SUBSTR(ENAME,-1,1),LENGTH(ENAME),'*'),10,' ')"NAME", RPAD(SUBSTR(HIREDATE,1,6),LENGTH(HIREDATE),'*')"HIREDATE" FROM EMP;

    --EX. 이름의 세번째 자리가 R인 사원의 모든 필드(LIKE사용, INSTR사용, SUBSTR사용)
    
SELECT * FROM EMP WHERE ENAME LIKE '__R%';    
SELECT * FROM EMP WHERE INSTR(ENAME, 'R')=3; -- RARA같은경우는 1을 리턴하기 때문에 출력이 안될 수 있음 
SELECT * FROM EMP WHERE INSTR(ENAME, 'R',3)=3; -- 3번째 나오는 'R'나와라 
SELECT * FROM EMP WHERE SUBSTR(ENAME, 3, 1)='R';

-------------------------------------------------------------------------------------

--⑦여백제거
SELECT TRIM('     ORACLE DB   ') FROM DUAL;
SELECT RTRIM('     ORACLE DB   ') FROM DUAL;
SELECT LTRIM('     ORACLE DB   ') FROM DUAL;

--⑧REPLACE
SELECT REPLACE(ENAME, 'A', 'XX') FROM EMP; --A라는 아이를 XX로 바꿔라 
SELECT REPLACE(HIREDATE,'0',' ') FROM EMP;
SELECT REPLACE (HIREDATE, SUBSTR(HIREDATE,7,2),'**') FROM EMP; -- 혼자 해본거 

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

            -----------------3. 날짜관련함수-----------------
--①SYSDATE : 지금
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD DY HH24:MI:SS';
SELECT SYSDATE FROM DUAL;
SELECT ENAME, HIREDATE FROM EMP;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD DY HH24:MI:SS')FROM DUAL;
SELECT SYSDATE-1 "어제 이 시간", SYSDATE "지금", SYSDATE+1"내일 이 시간" FROM DUAL;

--②날짜 계산 : 14일 후 
SELECT SYSDATE + 14 "반납예정일" FROM DUAL;
--ex. 이름, 입사일, 근무일수 
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) "근무일수" FROM EMP; -- TRUNC OR FLOOR 둘중 하나 쓰기 
--ex. 이름, 입사일, 근무주수, 근무년수 
SELECT ENAME, HIREDATE, TRUNC((SYSDATE-HIREDATE)/7 )"근무주수" , TRUNC((SYSDATE-HIREDATE)/365) "근무년수" FROM EMP;

--③MONTHS_BETWEEN(날짜, 날짜) : 두 날짜간의 개월수 (앞에 최신)
--ex. 이름, 입사일, 근무월수 
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))"근무월수" FROM EMP;
--ex. 이름, 입사한 이후 받은 급여와 상여 (급여는 매달 받고, 상여는 1년에 2회 받음) -- 다시 하기 
SELECT ENAME, 
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL + TRUNC((SYSDATE-HIREDATE)/365)*2*NVL(COMM,0) COST FROM EMP;

--④ADD_MONTHS(날짜, 개월수) : 특정시점부터 몇개월 후의 날짜 
--ex. 이름, 입사일, 수습종료일 (수습기간은 입사일로부터 6개월로 한다)
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) FROM EMP;

--⑤LAST_DAY(날짜) : 특정날짜의 달의 말일 
SELECT LAST_DAY(SYSDATE) FROM DUAL;
--ex. 이름, 입사일, 첫 월급날(월급날은 말일)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)"첫월급날" FROM EMP;

--⑥ROUND(날짜, XX) : 날짜 반올림 //제일 가까운 아이한테 달라붙음 / 버리고 싶으면 TRUNC(날짜,XX) 
SELECT ROUND(34.5678,2) FROM DUAL;
SELECT ROUND(SYSDATE, 'YEAR')FROM DUAL;     --결과 : 가까운 1월 1일 (올해일수도 있고 내년일수도 있음) 
SELECT ROUND(SYSDATE, 'MONTH')FROM DUAL;    --결과 : 가까운 월의 1일 (1~15일은 이번달 1일, 16일 이후는 다음달 1일)
SELECT ROUND(SYSDATE, 'DAY')FROM DUAL;      --결과 : 가까운 일요일 
SELECT ROUND(SYSDATE) FROM DUAL;            --결과 : 가까운 0시 
SELECT TO_CHAR(ROUND(SYSDATE),'RR/MM/DD HH24:MI') FROM DUAL;

SELECT TRUNC(SYSDATE, 'YEAR')FROM DUAL;     --결과 : 올해 1월 1일  
SELECT TRUNC(SYSDATE, 'MONTH')FROM DUAL;    --결과 : 이번달 월의 1일 (1~15일은 이번달 1일, 16일 이후는 다음달 1일)
SELECT TRUNC(SYSDATE, 'DAY')FROM DUAL;      --결과 : 지난 일요일 
SELECT TRUNC(SYSDATE) FROM DUAL;            --결과 : 오늘 0시 

--⑦NEXT_DAY(날짜, '수') : 특정날짜로부터 처음 도래하는 수요일 
SELECT SYSDATE, NEXT_DAY(SYSDATE,'토')FROM DUAL;

---------TRUNC(HIREDATE+N=16을 만들어(월급날로)) , + N 은 1+N=월급날
--ex1. 이름, 입사일, 입사한 달의 5일
SELECT ENAME, HIREDATE, TRUNC(HIREDATE, 'MONTH')+4 FROM EMP;
--ex2.(ROUND) 이름, 입사일, 월급날(월급날은 매달16일) 
SELECT ENAME, HIREDATE , ROUND(HIREDATE,'MONTH')+15"월급날" FROM EMP;
--ex3.이름, 입사일, 월급날(월급날은 매달 15일) 
SELECT ENAME, HIREDATE, ROUND(HIREDATE+1,'MONTH')+14"월급날"FROM EMP; --HIREDATE+1을 하면, 15일이 16일로 변환되서 다음달로 감 
--ex3.이름, 입사일, 월급날(월급날은 매달 5일) 
SELECT ENAME, HIREDATE, ROUND(HIREDATE+11,'MONTH')+4"월급날"FROM EMP;
--ex3.이름, 입사일, 월급날(월급날은 매달 20일) --19일까지는 이번달, 20일부터는 다음달 
SELECT ENAME, HIREDATE, ROUND(HIREDATE-4,'MONTH')+19"월급날"FROM EMP;
--//입사일이 5보다 크면 다음달의 5일 (ADD_MONTHS(HIREDATE))

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

        -----------------4. 형변환함수(문자, 숫자, 날짜)-----------------
        --문자를 날짜로 바꿀 것인가, 날짜를 문자로 바꿀 것인가(문자<->날짜)
        --문자를 숫자로 바꿀 것인가, 숫자를 문자로 바꿀 것인가(문자<->숫자)
        --날짜와 숫자는 서로 못바꿈 
        
--①TO_CHAR(날짜형데이터,'출력형식')
    --YYYY(년도4자리) YY(년도2자리) RR(년도2자리) MM(월) DD(일) /DAY(요일) DY(요일요약표현)
    --AM/PM(오전/오후) HH12(12시간) HH24(24시간) MI(분) SS(초) 
    
SELECT TO_CHAR(SYSDATE, 'YY"년"MM"월"DD"일" DY"요일" HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY"년"MM"월"DD"일" DY"요일" AM HH12:MI:SS') FROM DUAL; --PM넣어도 지금 시간으로 나옴

--②TO_CHAR(숫자형데이터,'출력형식')
    -- 0 : 자릿수. '출력형식'의 자릿수가 많으면 0으로 채움
    -- 9 : 자릿수. '출력형식'의 자릿수가 많아도 숫자만큼만 출력(소수점 앞 /소수점 뒤는 나옴)
    -- , : 세자리마다 ',' 가능 
    -- . : 소수점
    -- $ : 통화단위 $를 앞에 붙을 수 있음
    -- L : 지역통화단위가 앞에 붙을 수 있음  
    
SELECT TO_CHAR(123456,'9,999,999.99') FROM DUAL; -- 9 ',' '.' 사용
SELECT TO_CHAR(123456,'0,000,000.00') FROM DUAL; -- 0 ',' '.' 사용
SELECT TO_CHAR(10000,'L999,999')FROM DUAL;
SELECT ENAME, TO_CHAR(SAL, '$99,999')FROM EMP;
SELECT ENAME, TO_CHAR(SAL, '$00,000')FROM EMP;

--③TO_DATE(문자데이터,'패턴') 
SELECT TO_DATE('20220412','YYYYMMDD') FROM DUAL;

--ex.81/5/1~83/5/1 사이에 입사한 직원의 모든 필드(TO_DATE 사용)
SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/05/01','RR/MM/DD') AND TO_DATE('830501','RR/MM/DD');

--④TO_NUMBER(문자데이터,'패턴') 
    -- 0 : 자릿수. '출력형식'의 자릿수가 많으면 0으로 채움
    -- 9 : 자릿수. '출력형식'의 자릿수가 많아도 숫자만큼만 출력(소수점 앞 /소수점 뒤는 나옴)
    -- , : 세자리마다 ',' 가능 
    -- . : 소수점
    -- $ : 통화단위 $를 앞에 붙을 수 있음
    -- L : 지역통화단위가 앞에 붙을 수 있음 
    
SELECT '1234'+1 FROM DUAL;
SELECT TO_NUMBER('1,234','9,999')+1 FROM DUAL;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                -----------------5.NVL--------------------
                
--NVL(널일수도 있는 데이터, 널이면 대신할값) - 매개변수 두개가 타입이 같아야 됨 
SELECT ENAME, NVL(COMM,0) FROM EMP;
--ex. 이름, 상사의 사번(MGR), 상사의 사번이 NULL일 경우 'CEO'라고 출력 
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') FROM EMP;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                -----------------6.ETC(기타)-----------------

--①EXTRACT : 연도나 월이나 날짜만 숫자로 추출하고자 할 때 
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;        -- 숫자로 뽑음(같은결과)
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;          -- 문자로 뽑음(같은결과)
SELECT EXTRACT(MONTH FROM HIREDATE) FROM EMP;
SELECT EXTRACT(DAY FROM HIREDATE)FROM EMP;

--ex. 2월에 입사한 직원의 모든 필드 
SELECT * FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE) = 2;
SELECT * FROM EMP WHERE HIREDATE LIKE'__/02/__';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'MM')='02';

--ex. 81년도에 입사한 직원의 모든 필드
SELECT * FROM EMP WHERE EXTRACT(YEAR FROM HIREDATE)=1981;
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR')='81';

--②계층적 출력(레벨별 출력) : LEVEL, START WITH 조건(MGR IS NULL), CONNECT BY PRIOR 조건 (EMPNO=MGR)
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO=MGR;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                ---------------- <총 연습문제> ----------------
                
-- 1. 현재 날짜를 출력하고 TITLE에 “Current Date”로 출력하는 SELECT 문장을 기술하시오.
SELECT SYSDATE "CURRENT DATE" FROM DUAL;

-- 2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 계산하여,
-- 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장
SELECT EMPNO, ENAME, JOB, SAL, (SAL+(SAL*0.15))"New Salary", (SAL*0.15)"Increase" FROM EMP;

--3. 이름, 입사일, 입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.          
SELECT ENAME, HIREDATE , NEXT_DAY((ADD_MONTHS(HIREDATE, 6)),'월')"6개월 후 월요일" FROM EMP;

--4. 이름, 입사일, 입사일로부터 현재까지의 개월수, 급여, 입사일부터 현재까지의 받은 급여의 총계를 출력
SELECT ENAME, HIREDATE , FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))"현재까지의 개월", SAL, FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)*SAL)"총급여" FROM EMP;

--5. 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈 곳은 “*”로 대치)를 출력
SELECT LPAD(ENAME,15,'*')"이름", LPAD(SAL,15,'*')"급여" FROM EMP;

--6. 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY')"입사요일" FROM EMP;

--7. 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력
SELECT ENAME, LENGTH(ENAME)"이름글자수", JOB FROM EMP WHERE LENGTH(ENAME)>=6;

--8. 모든 사원의 정보를 이름, 업무, 급여, 보너스, 급여+보너스를 출력
SELECT ENAME, JOB, SAL, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

-- 9.사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하시오. 
SELECT ENAME, SUBSTR(ENAME,2,3) FROM EMP; 

--10. 사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하시오. 
--  시스템에 따라 DATEFORMAT 다를 수 있으므로 아래의 방법도 알아보자
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'RR/MM/DD') FROM EMP ;

--11. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO		ENAME		급여
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		    ******1250
--……. 
SELECT EMPNO, ENAME, LPAD(SAL,10,'*') FROM EMP;

-- 12. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
-- EMPNO	 ENAME      	입사일
-- 7369	 	 SMITH		1980-12-17
-- ….
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD') FROM EMP;

--13. 사원 테이블에서 부서 번호가 20인 사원의 사번, 이름, 직무, 급여를 출력하시오.
    --(급여는 앞에 $를 삽입하고3자리마다 ,를 출력한다)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL,'$99,999')"급여" FROM EMP WHERE DEPTNO=20;
--------------------------------------------------------------------------------
-------------------------------집에서 다시 한거------------------------------------

-- 1. 현재 날짜를 출력하고 TITLE에 “Current Date”로 출력하는 SELECT 문장을 기술하시오.
SELECT SYSDATE "Current Date" FROM DUAL;
SELECT SYSDATE , INITCAP('CURRENT DATE')"TITEL" FROM DUAL;

-- 2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 계산하여,
-- 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장
SELECT EMPNO, ENAME, JOB, SAL, TRUNC((SAL+(SAL*0.15)))"New Salary", TRUNC((SAL*0.15))"Increase" FROM EMP;

--3. 이름, 입사일, 입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.          
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'월')"6개월 후 월" FROM EMP;

--4. 이름, 입사일, 입사일로부터 현재까지의 개월수, 급여, 입사일부터 현재까지의 받은 급여의 총계를 출력
SELECT ENAME, HIREDATE , TRUNC(MONTHS_BETWEEN(SYSDATE ,HIREDATE))"총근무개월",SAL,  
ROUND(MONTHS_BETWEEN(SYSDATE ,HIREDATE)*SAL,2) "총급여" FROM EMP;

--5. 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈 곳은 “*”로 대치)를 출력
SELECT ENAME , LPAD(SAL,15,'*') FROM EMP;
SELECT LPAD(ENAME,15,'*') , LPAD(SAL,15,'*') FROM EMP;

--6. 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY')"입사요일" FROM EMP;

--7. 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME)>=6;

--8. 모든 사원의 정보를 이름, 업무, 급여, 보너스, 급여+보너스를 출력
SELECT ENAME, JOB, SAL, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

-- 9.사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하시오. 
SELECT SUBSTR(ENAME, 2,3)FROM EMP;

--10. 사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하시오. 
--  시스템에 따라 DATEFORMAT 다를 수 있으므로 아래의 방법도 알아보자
--이 방법 추천--
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE)=12;
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'MM')=12;

--아래는 비추천--
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE HIREDATE LIKE '__/12/__';
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE INSTR(HIREDATE,'12',4)=4;
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE SUBSTR(HIREDATE,4,2)=12;;

--11. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO      ENAME      급여
--7369             SMITH      *******800
--7499             ALLEN      ******1600
--7521             WARD          ******1250
--…….

SELECT EMPNO, ENAME, LPAD(SAL,10,'*')"급여" FROM EMP;

-- 12. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
-- EMPNO    ENAME         입사일
-- 7369        SMITH      1980-12-17
-- ….
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD')"입사일"FROM EMP;

--13. 사원 테이블에서 부서 번호가 20인 사원의 사번, 이름, 직무, 급여를 출력하시오.
    --(급여는 앞에 $를 삽입하고3자리마다 ,를 출력한다)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$99,999')"급여" FROM EMP WHERE DEPTNO=20;











