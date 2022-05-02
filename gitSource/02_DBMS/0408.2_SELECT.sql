--[II}SELECT 문 - 가장 많이 쓰이는 DML(Data manipulation language); 검색 기능
--1. SQL SELECT 문장 작성법
--DDL: 테이블 생성
--DML: 입력, 수정, 삭제, 검색
--DCL: 권한부여, 트랜젝션명령
-- SHOW USER; 은 현재 계정을 알려주는 문장 (실행 : ctrl + Enter)
SHOW USER; 
--*은 모든 것 이라는 뜻 
SELECT * FROM TAB; --현 계정(scott)이 가지고 있는 테이블을 뽑아라 
SELECT * FROM EMP; --EMP 테이블의 모든 열(필드), 모든 행을 출력해라
SELECT * FROM DEPT; --DEPT테이블의 모든 열, 모든 행 
-- EMP 테이블의 구조 
DESC EMP;
DESC DEPT;

-- 2. SELECT 문 실행 (특정 열만 출력)
SELECT EMPNO,ENAME,SAL,JOB FROM EMP;
-------이름 바꾸고 싶으면 AS사용해서 밑에처럼 작성하기 (alias 사용 하지만 웬만하면 영어,숫자로만)
SELECT EMPNO AS "사번", ENAME AS "이름", SAL AS "급여", JOB AS "직책" FROM EMP; --별칭
SELECT EMPNO AS 사번, ENAME AS 이름, SAL AS 급여, JOB AS 직책 FROM EMP; --별칭/ ""를 안써도 가능. alias에 스페이스 들어가면 꼭 ""써줘야됨
SELECT EMPNO 사번, ENAME 이름, SAL 급여, JOB 직책 FROM EMP; -- 별칭 /as도 빼는 것 가능/스페이스 들어가면 ""은 꼭 써주기 
SELECT EMPNO NO, ENAME NAME, SAL SALARY, JOB JOBB FROM EMP;--TITLE : NO,NAME,SALARY,JOBB

-- 3. 특정행 출력 : WHERE 절(조건) /SELECT와 FROM만 쓰면 행이 다 나오니 
-- 비교연산자 : 같다(=) 크거나 같다(>=) 다르다(!=,^=,<>)
SELECT EMPNO "사번",ENAME "이름",SAL"급여" FROM EMP WHERE SAL = 3000; --같다
SELECT EMPNO "사번",ENAME "이름",SAL"급여" FROM EMP WHERE SAL !=3000; --다르다
SELECT EMPNO "사번",ENAME "이름",SAL"급여" FROM EMP WHERE SAL ^=3000; --다르다
SELECT EMPNO "사번",ENAME "이름",SAL"급여" FROM EMP WHERE SAL <>3000; --다르다
-- 비교연산자는 숫자, 문자, 날짜형 모두 가능 

-- EX. 사원이름(ENAME)이 'A','B','C'로 시작하는 사원의 모든 필드를 출력해라 
SELECT * FROM EMP WHERE ENAME < 'D';
-- 오라클에서 ""은 문자열이 아닌, 별칭을 뜻함 ..필드에 별칭을 쓸 때만 사용.. 문자,문자열 모두 혿따옴표 씀

-- EX. 81년도 이전에 입사한 사원의 모든 필드 
SELECT * FROM EMP WHERE HIREDATE < '81/01/01';

-- EX. 10번 부서번호(DEPTNO)인 사원의 모든 필드를 출력
SELECT * FROM EMP WHERE DEPTNO=10;

-- EX. 이름(ENAME)이 FORD 인 직원의 EMPNO,ENAME,MGR(상사의 사번)을 출력
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'FORD';
select empno,ename,mgr from emp where ename = 'FORD';   --데이터는 대소문자 구분 

--4. 논리연산자 : AND, OR ,NOT
-- EX. 급여(SAL)가 2000 이상 3000이하인 직원의 모든 필드를 출력하시오
SELECT * FROM EMP WHERE SAL>=2000 AND SAL<=3000;

-- EX. 82년도에 입사한 사원의 모든 필드 
SELECT * FROM EMP WHERE HIREDATE >= '82/01/01' AND HIREDATE <='82/12/31';
-- 날짜 표기법 셋팅(현재: YY/MM/DD OR RR/MM/DD)  
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- 한글 윈도우즈 위에 INSTALL 
SELECT ENAME, HIREDATE FROM EMP;

--연봉이 2400 이상인 직원의 ENAME, SAL, 연봉 출력(연봉= SAL*12)
SELECT ENAME, SAL, SAL*12 FROM EMP WHERE SAL*12 >2400;
SELECT ENAME, SAL, SAL*12 "연봉" FROM EMP WHERE 연봉 >2400; --WHERE절에는 별칭을 쓸 수 없다
SELECT ENAME, SAL, SAL*12 "연봉" FROM EMP WHERE SAL*12 >2400; -- SELECT 절에 바로 ALIAS해줘도 됨
SELECT ENAME, SAL, SAL*12 "연봉" FROM EMP WHERE SAL*12 >2400 ORDER BY 연봉; -- ORDER BY 절은 별칭 사용 가능 
SELECT ENAME, SAL, SAL*12 "연봉"
FROM EMP
WHERE SAL*12 >2400
ORDER BY 연봉; -- ORDER BY 절에는 별칭 사용 가능 
--10번 부서(DEPTNO)이거나 직책(JOB)이 MANAGER인 사람의 모든 필드
SELECT * FROM EMP WHERE DEPTNO = 10 OR JOB = 'MANAGER';
-- 부서 번호가 10번이 아닌 사람의 모든 필드 
SELECT * FROM EMP WHERE DEPTNO != 10;
SELECT * FROM EMP WHERE NOT DEPTNO=10;

--5. 산술 표현식 
SELECT ENAME, SAL "현재급여", SAL+100 "올릴급여" FROM EMP WHERE DEPTNO=10;

-- EX. 모든 사원의 이름 (ENAME), 월급(SAL), 상여(COMM), 연봉(SAL*12+COMM)
-- 산술 연산의 결과는 NULL을 포함하면 결과도 NULL 이됨 
-- NVL(NULL일 수도 있는 필드명, 대치값) 반드시 매개변수 둘은 타입이 같아야됨 
SELECT ENAME, SAL, COMM, SAL*12+COMM "연봉" FROM EMP; 
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM,0) "연봉" FROM EMP; 
SELECT * FROM EMP;

-- EX. 모든 사원의 사원명(ENAME), 상사의 사번(MGR)을 출력(상사가 없으면 '없음'출력 안됨. 0으로 출력) //'없음'은 문자고, 사번은 정수기 때문에 형변환 해야됨
SELECT ENAME, NVL(MGR,0) FROM EMP;
SELECT ENAME, NVL(MGR,'없음')FROM EMP; -- NVL 매개변수 타입 불일치 에러 

--6. 연결연산자(||) : 열이나 문자를 연결
SELECT ENAME || '은' || JOB "EMPLOYEES" FROM EMP;

-- EX. "SMITH : 연봉 = XXX"과 같이 모든 행 출력 (연봉은 SAL * 12 + COMM)
SELECT ENAME || ': 연봉 = ' || (SAL *12 +NVL(COMM,0)) FROM EMP;

--7. 중복제거 (DISTINCT) 
SELECT JOB FROM EMP;
SELECT DEPTNO FROM EMP;
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;


--★★★ 연습문제 꼭 풀기 ★★★ 
--1. emp 테이블의 구조 출력
DESC EMP;
--2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;
--3. 현 scott 계정에서 사용가능한 테이블 출력
SHOW USER;
SELECT * FROM TAB; ------------------------------------현재 계정이 가지고 있는 테이블 
--4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
--5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<2000;

--6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
-- # 날짜설정 (YYYY년도 4자리, RR년도 2자리, M월, D일)-연도에 YY써도 되긴하지만, 보통 2자리인지 4자리인지 구분하긴함
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR';
-- # 날짜형 -> 문자형으로 변환하는 함수 (3,4장에서함) : TO_CHAT(날짜형, 패턴)--문자로
-- # 문자형 -> 날짜형으로 변환하는 함수 : TO_DATE(문자형데이터, 패턴) --날짜로
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE >='02-01-81'; 
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') >='81/02/01'; --출력은 'MM-DD-RR'형태로 됨 
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE >=TO_DATE('81/02/01', 'RR/MM/DD'); 
DESC EMP; --를 통해 HIREDATE를 날짜(DATE)형인지 숫자형인지 확인 먼저 해보기 
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; 

--7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB = 'SALESMAN';
--8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB <> 'CLERK';
SELECT * FROM EMP WHERE JOB != 'CLERK'; --------많이 쓰는애 
SELECT * FROM EMP WHERE JOB ^= 'CLERK';
SELECT * FROM EMP WHERE NOT JOB = 'CLERK';------얘도 많이 쓰는 애

--9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;

--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=10 OR DEPTNO=30;

--11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB = 'SALESMAN' OR SAL>=3000;

--12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB = 'MANAGER';

--13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
SELECT ENAME ||'은 '|| JOB || ' 업무이고 연봉은 ' || (SAL*12+NVL(COMM,0))||'다' FROM EMP;


----------------------------------------------------------------------------------------
-- 8. SQL 연산자(BETWEEN, IN, LIKE, IS NULL)
    --(1)BETWEEN [데이터 BETWEEN A AND B (A<=B) // 포함하는 숫자만 가능. 즉 이상이아니라 초과할땐 BETWEEN 안써
        --EX. SAL이 1500이상 3000이하인 사번 이름 급여
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000; -- AND 연산자를 쓸 때
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000; -- 반드시 작은 수가 A자리에 위치해야함 
        
        --EX. 1500미만 3000 초과하는 모든 필드를 출력하라 -- BETWEEN 앞에 NOT 붙여주면 됨 
SELECT * FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;

        --EX. 82년도에 입사한 사람을 뿌려라 
SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') BETWEEN '82/01/01' AND '82/12/31'; -- 문자형으로 바꾸는것도 포함할때 
        
        --EX. 사원 이름이 'A','B'로 시작하는 사원의 모든 필드 //문자는 아스키코드로 비교를 하기 때문에 이렇게 쳐줘야됨 
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'C' AND ENAME != 'C'; --A보다 크거나 같고, C보다 같거나 작은 아이 
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'B'; -- B가 안나옴 //문자는 아스키코드로 비교를 하기 때문에 이렇게 쳐줘야됨 

        --EX. 사원 이름이 'B','C'로 시작하는 사원의 모든 필드 
SELECT * FROM EMP WHERE ENAME BETWEEN 'B' AND 'D' AND ENAME !='D';

    --(2) IN [데이터 IN(A,B,C...)]
        --EX. 부서번호가 10,20,40 부서 사원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO IN (10,20,40);
    
        --EX. 부서번호가 10,20,40번 부서를 제외한 사원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO NOT IN(10,20,40);
SELECT * FROM EMP WHERE DEPTNO !=10 AND DEPTNO!=20 AND DEPTNO!=40;

        --EX. 사번이 7902, 7788, 7566인 사원의 모든 필드
SELECT * FROM EMP WHERE EMPNO IN(7902,7788,7566);
        
        --EX. 월급이 1500인 사원의 모든필드 
SELECT * FROM EMP WHERE SAL IN 1500;

    --(3) LIKE[데이터 LIKE연산자 - (문법) : 데이터 LIKE 패턴에 와일드 카드 넣기 (%:0글자 이상, _ : 1글자)
        --EX. 이름이 M이 들어간 사원의 모든 필드 
SELECT * FROM EMP WHERE ENAME LIKE '%M%'; --M앞에 0글자 이상 들어감,M뒤에 0글자 이상 들어감 

        --EX. 이름이 M으로 시작하는 사원의 모든 필드 
SELECT * FROM EMP WHERE ENAME LIKE 'M%';

        --EX. 이름이 S로 끝나는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE '%S';

        --EX. SAL이 5로 끝나는 사원의 모든 필드
SELECT * FROM EMP WHERE SAL LIKE '%5'; ---숫자를 LIKE에 넣으면 문자 비교하듯이 해줌 
SELECT * FROM EMP WHERE SAL = '2975'; -- 숫자형과 문자형 비교 가능 

        --EX. 82년도에 입사한 사원의 모든 필드 -- TO_CHAR 써서 비교하는걸 추천.  ------------between을 쓸 수도 있고, like를 쓸 수도 있음 
SELECT * FROM EMP WHERE HIREDATE LIKE '%82%'; -- OR '82/%'
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR') = '82';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR') = 82;

        --EX. 2010년도에 입사한 사원의 모든 필드 
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') LIKE '10/%';

        --EX. 1월에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE LIKE '%/01/%';
SELECT * FROM EMP WHERE HIREDATE LIKE '__/01/__';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'RR/MM/DD') LIKE '__/01/__';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'RR/MM') LIKE '%01';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'MM') LIKE '01';
SELECT * FROM EMP WHERE TO_CHAR (HIREDATE,'MM') = '01';

        --EX. 82년도가 아닌 년도에 입사한 사원의 모든 필드 
SELECT * FROM EMP WHERE HIREDATE NOT LIKE '82/%';

        --EX. 이름에 S가 들어간 사원의 모든 필드 
SELECT *FROM EMP WHERE ENAME LIKE '%S%'; -- 앞에 들어가도 되고, 뒤에 들어가도 되고 
SELECT *FROM EMP WHERE ENAME LIKE '%%%'; -- 모든 필드 다 나오라는 거나 마찬가지 
SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE'\'; --이름에 퍼센트 들어간 아이를 뽑아내기 위함.. 기능의 %가 아님을 증명하기 위해 역슬래쉬 사용 
INSERT INTO EMP VALUES (9999,'홍%',NULL,NULL,NULL,9000,900,40); --데이터 입력하는 것 
SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE'\';
ROLLBACK; -- DML(데이터 추가, 삭제, 수정)로 수정된 데이터 원상복구 

     --(4)IS NULL [데이터 IS NULL : SMITH의 상여금이 NULL이라는 건 데이터를 안넣었음을 의미함 
SELECT * FROM EMP;
        --EX. 상여금이 NULL인 사원의 모든 필드
SELECT * FROM EMP WHERE COMM IS NULL; -- NULL을 비교시 반드시 IS NULL로 

        --EX. MGR이 NULL인 사원의 모든 필드 
SELECT * FROM EMP WHERE MGR IS NULL;

        --EX. 상여금이 없는 사원의 모든 필드 -- NULL도 상여금이 없는거지만 0도 없는거임 (COMM이 NULL이거나 0)
SELECT * FROM EMP WHERE COMM IS NULL OR COMM = 0;

        --EX. 상여금이 있는 사원의 모든 필드(COMM이 NULL도 아니고 0도 아니고) -- ISNULL의 NOT은 데이터값 앞에 붙여주자  
SELECT * FROM EMP WHERE NOT COMM IS NULL AND COMM != 0; ----추천 방식 
SELECT * FROM EMP WHERE NOT(COMM IS NULL OR COMM=0); 

    --(9).정렬[오름차순, 내림차순]
SELECT ENAME, SAL FROM EMP ORDER BY SAL; --급여 오름차순
SELECT ENAME, SAL FROM EMP ORDER BY SAL ASC; --급여 오름차순
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC; --급여 내림차순 
SELECT ENAME, SAL FROM EMP ORDER BY ENAME; -- 이름 ABCD순으로
SELECT ENAME, SAL FROM EMP ORDER BY ENAME DESC; --이름 알파벳 반대로 
SELECT ENAME, SAL FROM EMP ORDER BY HIREDATE; -- 날짜 순서대로 정렬 (오래된 사람대로 정렬) 
SELECT ENAME, SAL FROM EMP ORDER BY HIREDATE DESC; --최신 입사한 사람대로 정렬 

        --EX. 이름, 연봉(SAL*12+COMM)을 출력(연봉이 높은 순으로,연봉이 같은 경우는 이름순으로)
SELECT ENAME, SAL*12+NVL(COMM,0) ANNUAL_SAL FROM EMP ORDER BY SAL*12+NVL(COMM,0)DESC,ENAME; 
SELECT ENAME, SAL*12+NVL(COMM,0) ANNUAL_SAL FROM EMP ORDER BY ANNUAL_SAL DESC,ENAME;
        
        --EX. 사번, 이름, 입사일, 급여, 부서번호( 부서번호순, 부서가 같으면 입사일 오름차순으로 출력) --입사일 최신부터 
SELECT EMPNO, ENAME, HIREDATE, SAL, DEPTNO FROM EMP ORDER BY DEPTNO, HIREDATE DESC;




-------------★★★시험 연습문제★★★(꼭 구현하기)-------------------
--1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL>=3000; 

--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO IN 7788;
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7788; 

--3.	연봉이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO, ENAME, SAL  FROM EMP WHERE (SAL*12+NVL(COMM,0))>=24000 ORDER BY SAL;

--4.	입사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 사원명, 직책, 입사일을 출력 (단 hiredate 순으로 출력) ----TO_CHAR바꿔보기
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01' ORDER BY HIREDATE;
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') BETWEEN '81/02/20' AND '81/05/01' ORDER BY HIREDATE;

SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/02/20','YY/MM/DD') AND TO_DATE('81/05/01','YY/MM/DD') ORDER BY HIREDATE;

--5.	deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * FROM EMP WHERE DEPTNO IN(10,20) ORDER BY ENAME;

--6.	sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 HEADING을 employee과 Monthly Salary로 출력)
SELECT ENAME "employee", SAL "Monthly Salary" FROM EMP WHERE SAL>=1500 AND DEPTNO IN(10,30);

--7.	hiredate가 1982년인 사원의 모든 정보를 출력 --between, like 둘다 가능 
SELECT * FROM EMP WHERE HIREDATE LIKE '82%';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR') = '82';

--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름,급여순 정렬
SELECT ENAME, SAL FROM EMP WHERE ENAME BETWEEN 'C' AND 'Q' AND ENAME !='Q' ORDER BY SAL,ENAME;

--9.	comm이 sal보다 10% 이상일때 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME, SAL, COMM FROM EMP WHERE (COMM-SAL) = SAL*0.1;
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM>SAL*1.1;

--10.	job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * FROM EMP WHERE JOB IN ('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000); ----------안됨 

--11.	ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND DEPTNO IN 30 OR MGR IN 7782;
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND DEPTNO = 30 OR MGR = 7782;

--12.	입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP WHERE TO_CHAR(HIREDATE,'RR') = '81';

--13.	입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP WHERE TO_CHAR(HIREDATE,'RR')='81' AND JOB NOT IN 'SALESMAN';

--14.	사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP ORDER BY SAL DESC, HIREDATE;

--15.	사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO,ENAME FROM EMP WHERE ENAME LIKE '__N%';
SELECT * FROM EMP;

--16.	사원명에 'A'가 들어간 사원의 사번, 사원명을 출력
SELECT * FROM EMP WHERE ENAME LIKE '%A%';

--17.	연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO ,ENAME,SAL*12 "연봉" FROM EMP WHERE SAL*12 >=35000; 

SELECT * FROM EMP,DEPT;

























