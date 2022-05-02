---[VII] DDL, DML, DCL 
-- SQL = DDL (테이블 생성, 테이블 삭제, 테이블 구조변경, 테이블 모든 데이터 제거) -ROLLBACK 안됨 
--       DML (검색 : SELECT, 추가 : INSERT, 수정 : UPDATE, 삭제 : DELETE)
--       DCL (사용자계정생성, 사용자권한부여, 권한박탈, 사용자계정삭제, 트랜잭션 명령어 : ROLLBACK, COMMIT)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- ★★★DDL★★★ -------------------- 
        
        -- 1. 테이블 생성 (CREATE TABLE)
CREATE TABLE BOOK(
        BOOKID      NUMBER(4),            -- 도서번호 BOOKID 필드 타입은 숫자 4자리 
        BOOKNAME    VARCHAR2(300),        -- 한글 10글자(스페이스 포함)문자 300BYTE
        PUBLISHER   VARCHAR2(300),        -- 출판사 PUBLISHER 필드는 문자 300BYTE
        RDATE       DATE,                 -- 출판일 RDATE 필드는 DATE형
        PRICE       NUMBER(8),            -- 가격 PRICE 필드는 숫자 8자리 
        PRIMARY KEY(BOOKID) );            -- 테이블 내 주키(PRIMARY KEY) 설정 
                                          -- NOT NULL, 유일한 값 입력 
SELECT * FROM BOOK; 
DROP TABLE BOOK;                          -- 테이블 지우는 것 

CREATE TABLE BOOK (
        BOOKID      NUMBER(4) PRIMARY KEY , 
        BOOKNAME    VARCHAR2(20),
        PUBLISHER   VARCHAR2(20),
        RDATE       DATE,
        PRICE       NUMBER(8));
SELECT * FROM BOOK;
DESC EMP;
SELECT ROWNUM, EMPNO, ENAME FROM EMP;       -- ROWNUM : 테이블에서 읽어드린 논리적 순서
SELECT ROWNUM, EMPNO, ENAME FROM EMP WHERE DEPTNO=20 ORDER BY ENAME;
SELECT * FROM EMP;

--ex 1. EMP 테이블과 유사한 구조의 EMP01 : EMPNO(숫자4), ENAME(문자20), SAL(숫자7,2)
-- 제약조건 없는 테이블 만들어 봄 
CREATE TABLE EMP01 (
        EMPNO       NUMBER(4),
        ENAME       VARCHAR2(20),
        SAL         NUMBER(7,2) );

--ex 2. DEPT 테이블과 유사한 구조의 DEPT01 : DEPTNO(숫자2), DNAME(문자14), LOC(문자 13) 
CREATE TABLE DEPT01 (
        DEPTNO      NUMBER(2),
        DNAME       VARCHAR2(14),
        LOC         VARCHAR2(13),
        PRIMARY KEY (DEPTNO) );
DESC DEPT01;
DESC DEPT;

--ex 3. 서브쿼리를 이용한 테이블 생성 (구조 OR 내용 똑같은 테이블을 만들고 싶을 때 )
CREATE TABLE EMP02 AS SELECT * FROM EMP; -- 서브쿼리 결과만 EMP02 테이블 생성 후 들어감
                                         -- 단, 제약조건은 미포함  
DESC EMP02;
SELECT * FROM EMP02; -- 제약조건 미포함
SELECT * FROM EMP;

--ex 4. EMP03 : EMP 테이블에서 EMPNO, ENAME, DPTNO만 추출한 데이터로 테이블 생성
CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP;
SELECT * FROM EMP03;

--ex 5. EMP04 : EMP 테이블에서 10번 부서만 추출한 데이터로 테이블 생성
CREATE TABLE EMP04 AS SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP04;

--ex 6. EMP05 : EMP 테이블에서 구조(필드와 그의 타입)만 추출  -- 무조건 FALSE가 되도록 
--ex) DEPTNO가 50 인 부서는 없음. DEPTNO가 50인 부서를 가져와라 하면 구조만 따오게 됨 
CREATE TABLE EMP05 AS SELECT * FROM EMP WHERE 1=0;
SELECT * FROM EMP05;
DESC EMP05; --DESC 옆에 주석 쓰면 명령이 실행이 안됨 



        --2. 테이블 구조 변경 (ALTER TABLE) : 필드 추가 OR 삭제 OR 수정
        -- ALTER TABLE 테이블명 ADD OR DROP OR MODIFY

-- ① 필드 추가(ADD) : 추가된 필드의 데이터에는 NULL이 들어감 (데이터에 값 넣으려면 하나 하나 다 넣으면 됨)
SELECT * FROM EMP03;    -- EMPNO, ENAME, DEPTNO
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2));
SELECT * FROM EMP03;    
ALTER TABLE EMP03 ADD(COMM NUMBER(7,2));

-- ② 필드 수정(MODIFY) : 
SELECT * FROM EMP03;    -- EMPNO(숫4),ENAME(문10),DPTNO(숫2),JOB(문20),SAL&COMM(숫7,2)
                        -- EMPNO, ENAME, DEPTNO / JOB, SAL, COMM 
                        -- 데이터가 안들어가 있는 애들(NULL)은 수정을 쉽게 할 수 있음 
                        -- 데이터가 들어가 있는 애들은 그냥 수정하면 에러나버림 
                        -- EX)데이터 문자(10)->20 가능, 문자(10)->2 불가능 
DESC EMP03;
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR2(4)); -- 데이터 들어 있기 때문에 불가능
                                              -- 숫자 데이터는 숫자로만 변경 가능 
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(3));   -- 기존 데이터보다 큰 값만 가능
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(5));   -- 가능 

ALTER TABLE EMP03 MODIFY (ENAME NUMBER(4));   -- 문자 데이터는 문자로만 변경 가능 
SELECT MAX(LENGTH(ENAME)) FROM EMP;           -- 가장 긴 문자가 몇인지 궁금해서 뿌린것
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(3000));
DESC EMP03;

ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(6)); -- 6글자가 최대니 이건 가능 (다시줄이기)
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(5)); -- 불가능 (6BYTE 문자가 있기 때문에)

ALTER TABLE EMP03 MODIFY (JOB VARCHAR2(2));   -- JOB은 NULL값이라 자유롭게 변경 가능
ALTER TABLE EMP03 MODIFY (JOB NUMBER(4));


        -- 필드 삭제 (DROP) : ROLLBACK 이 안되기 때문에 조심히 해야해 (데이터도 날라감)
        -- DROP을 하는 순간 ROCK처리가 되서 외부에서 접근이 안됨 
        -- '시스템점검중입니다' 이런 부분 뜰 때가 이 처리 하고 있을 때 
        -- 사람들의 접근이 낮은 새벽 3시 이럴때 처리할때가 많음 
        
ALTER TABLE EMP03 DROP COLUMN JOB;            -- JOB 필드 삭제 
SELECT * FROM EMP03;
        -- 논리적으로 특정 필드를 접근 못하도록 처리 (낮) 
ALTER TABLE EMP03 SET UNUSED (DEPTNO);        
        -- 논리적으로 접근 불가했던 필드를 물리적으로 삭제(새벽)_DROP
ALTER TABLE EMP03 DROP UNUSED COLUMNS;        


        --3. 테이블 삭제 (DROP TABLE)         
DROP TABLE EMP01;
DROP TABLE DEPT; -- PARENTTABLE이 있기 때문에 삭제가 안됨. EMP에 DEPTNO있기 때문에 
                 -- 삭제하고 싶으면 EMP테이블 지우고, DEPT 지워야됨
                 -- 다른 테이블에서 참조하는 테이블 있을 경우 DROP이 안됨 (다른 방법으로 해야함)

        --4. 테이블의 모든 행을 제거 (TRUNCATE)
SELECT * FROM EMP03;
TRUNCATE TABLE EMP03;       --EMP03안의 모든 데이터 제거 (취소 불가)
SELECT * FROM EMP03;

        --5. 테이블명 변경 (RENAME 기존이름 TO 새이름)
SELECT * FROM EMP02;
RENAME EMP02 TO EMP2;
SELECT * FROM EMP2;
SELECT * FROM EMP;

        --6. 데이터 DICTIONARY (접근 불가) VS 데이터 DITIONARY VIEW (사용자 접근용)
                                --------- 종류 ---------
        -- USER_XXX : 현 계정이 소유하고 있는 객체(테이블, 인덱스, 제약조건, 뷰)
            -- ex. USER_TABLES, USER_INDEXES, USER_CONSTRAINTS, USER_VIEWS
        -- ALL_XXX  : 현 계정이 접근 가능한 객체(테이블, 인덱스, 제약조건, 뷰)
            -- ex. ALL_TABLES, ALL_INDEXES, ALL_CONSTRAINTS, ALL_VIEWS
        -- DBA_XXX  : DBA권한자만 접근가능. DBMS의 모든 객체
            -- ex. DBA_TABLES, DBA_INDEXES, DBA_CONSTRAINTS, DBA_VIEWS

--USER_XXX        
SELECT * FROM USER_TABLES;      -- 내 계정이 소유한 테이블 객체 정보
SELECT * FROM USER_INDEXES;     -- 내 계정이 소유한 인덱스 정보 
SELECT * FROM USER_CONSTRAINTS; -- 내 계정이 소유한 제약조건들 
SELECT * FROM USER_VIEWS;       -- 내 계정이 소유한 뷰 정보 
--ALL_XXX
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_INDEXES;
SELECT * FROM ALL_CONSTRAINTS;
SELECT * FROM ALL_VIEWS;
--DBA_XXX
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_INDEXES;
SELECT * FROM DBA_CONSTRAINTS;
SELECT * FROM DBA_VIEWS;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- ★★★DCL★★★ -------------------- 
        -- 사용자계정생성, 사용자권한부여, 권한박탈, 사용자계정삭제

-- scott2 계정 생성 
CREATE USER scott2 IDENTIFIED BY 1234;      

-- 권한 부여(세션권한, scott.EMP, scott.DEPT 테이블에 대해 모든 권한 부여)
GRANT CREATE SESSION TO scott2;     -- EMP와 DEPT 테이블에 대한 권한만 부여
                                    -- 테이블 만들고 싶으면 SESSION 대신 TABLE 
                                    -- 테이블 관련 작업 아무것도 못함 
GRANT ALL ON EMP TO scott2;         -- EMP 테이블에 대한 모든 권한(검색,추가,수정,삭제)
                                    -- 테이블의 일부에 대해서만 권한 만들고 싶으면, VIEW를 만든 후 그 VIEW에 권한 부여하면 됨
GRANT ALL ON DEPT TO scott2;        -- DEPT 테이블에 대한 모든 권한 

SHOW USER;

-- 권한 박탈 (권한박탈할 사용자계정이 접속해제 된 상황이여야 권한이 박탈 가능)
REVOKE ALL ON EMP FROM scott2;      -- 이제 SCOTT2의 EMP 테이블 볼 수 없음 
                                    -- scott2의 EMP 테이블에 대한 모든 권한 박탈
REVOKE ALL ON DEPT FROM scott2;
SHOW USER;

-- 사용자 계정 삭제 (접속 중인 계정 삭제 불가)
DROP USER scott2 CASCADE;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- ★★★DML★★★ -------------------- 
        -- SELECT , INSERT, UPDATE, DELETE
        
        -- 1. INSERT INTO 테이블명 VALUES(값1,값2,값3....)
        --    INSERT INTO 테이블명 (필드명1, 필드명2,..) VALUES (값1, 값2, ..);      
        
SELECT * FROM DEPT01;
INSERT INTO DEPT01 VALUES(50,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (60, 'IT', 'SEOUL');
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (70,'OPERATION');     -- 묵시적으로 LOC에 NULL 추가
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (80,'HR',NULL);  -- 명시적으로 LOC에 NULL 추가 
INSERT INTO DEPT01 VALUES (90, 'SALES', NULL); --명시적으로 NULL 추가

--서브쿼리를 이용한 INSERT
INSERT INTO DEPT01 SELECT * FROM DEPT;

-- 트랜잭션 명령어(DML 명령어만) 
-- INSERT 한다고 바로 데이터에 올라가는게 아니라, 트렌지션 공간(연습장) 같은 곳에 올라감 
-- 커밋 하면 트랜잭션에 있는 것이 데이터 베이스에 올라감 
-- 이후에 롤백을 하면 어차피 트랜잭션에 있는 내용이 이미 빈 공간이니 의미가 없음 
COMMIT;

        -- 2. UPDATE 테이블명 SET 필드명1 = 값1 [, 필드명2 = 값2, ...] [WHERE 조건] ;
CREATE TABLE EMP01 AS SELECT * FROM EMP; 

--EMP01 테이블의 부서번호를 30으로 수정 (WHERE 절이 없으면 모든 행이 수정) 
UPDATE EMP01 SET DEPTNO=30;
ROLLBACK;                   --DML명령어 취소 [트랜잭션 취소] DML만 가능 
SELECT * FROM EMP01;
--EMP01 테이블의 모든 사원의 급여를 10% 인상 
UPDATE EMP01 
    SET SAL = SAL*1.1;
SELECT * FROM EMP01;
--EMP01 테이블의 10번 부서 직원의 입사일을 오늘로, 부서번호는 30번으로 수정 
UPDATE EMP01
    SET HIREDATE = SYSDATE, 
        DEPTNO = 30 
    WHERE DEPTNO = 10;
SELECT * FROM EMP01;        

--SAL이 3000 이상인 사원만 SAL을 10% 인상
UPDATE EMP01
    SET SAL = SAL*1.1
    WHERE SAL >=3000;
SELECT * FROM EMP01;    
    
-- 'DALLAS'에 근무하는 직원의 급여를 1000$씩 인상(서브쿼리 사용)
UPDATE EMP01 SET SAL = SAL + 1000
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');

-- SCOTT 의 부서번호를 20으로, JOB을 MANAGER로, SAL과 COMM을 500씩 인상, 상사를 KING으로 수정 
UPDATE EMP01
    SET DEPTNO = 20,
        JOB = 'MANAGER',
        SAL = SAL + 500,
        COMM = NVL(COMM,0)+500,
        MGR =(SELECT EMPNO FROM EMP WHERE ENAME = 'KING') 
    WHERE ENAME = 'SCOTT';
SELECT * FROM EMP01 WHERE ENAME = 'SCOTT';    

-- DEPT01에서 20부터의 지역명을 DEPT 테이블의 60번부터의 지역명으로 변경         
SELECT * FROM DEPT01;   
UPDATE DEPT01 
    SET LOC = (SELECT LOC FROM DEPT WHERE DEPTNO=60)
    WHERE DEPTNO >= 20; -- DEPT테이블으리 60번부서가 없어서 NULL값으로 수정 

-- EMP01 테이블의 모든 사원의 급여와 입사일을 'KING'의 급여와 입사일로 수정 
COMMIT;
UPDATE EMP01 
    SET (SAL , HIREDATE) = (SELECT SAL, HIREDATE FROM EMP WHERE ENAME = 'KING');
SELECT * FROM EMP01;        
        
-- DEPT01 테이블의 20번 부서의 지역명과 부서명을 40번 부서의 지역명과 부서명으로 변경
UPDATE DEPT01
    SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT01 WHERE DEPTNO = 40)
    WHERE DEPTNO = 20;
ROLLBACK;
SELECT DNAME, LOC FROM DEPT01;
COMMIT;  
        -- 3. DELETE FROM 테이블명 [WHERE 조건];
        -- WHERE 절을 안 쓸 경우 전체 행이 모두 삭제 
SELECT * FROM EMP01;
DELETE FROM EMP01;
ROLLBACK;

-- EMP01 테이블에서 'FORD'인 사원을 삭제 
DELETE FROM EMP01
WHERE ENAME = 'FORD';

SELECT * FROM EMP01;

-- EMP01 테이블에서 30번 부서 직원을 삭제 
DELETE FROM EMP01
WHERE DEPTNO = 30;
SELECT * FROM EMP01;

-- EMP01 테이블에서 부서명이 RESEARCH 부서
DELETE FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
SELECT * FROM EMP01;

-- SAM01 테이블에서 JOB이 정해지지 않은 사원을 삭제하시오 (JOB이 NULL인 아이)
SELECT * FROM SAM01;
DELETE FROM SAM01
WHERE JOB IS NULL;

-- SAM01 테이블에서 ENAME 이 ORANGE 인 사원을 삭제하시오 
DELETE FROM SAM01
WHERE ENAME = 'ORANGE';
SELECT * FROM SAM01;
COMMIT;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
        -------------------- ★★★연습문제 1★★★ -------------------- 
        --INSERT INTO SAM01 VALUES(1000,'APPLE','POLICE',10000);
-- 1. MY_DATA 테이블 생성 (단, ID 가 PRIMARY KEY)
CREATE TABLE MY_DATA (
        ID          NUMBER(4) PRIMARY KEY,
        NAME        VARCHAR2(10),
        USERID      VARCHAR2(30),
        SALARY      NUMBER(10,2));
SELECT * FROM MY_DATA;
--2. 생성된 테이블 위의 도표와 같은 값을 입력하는 SQL문을 작성 
INSERT INTO MY_DATA VALUES(1,'Scott','sscott',10000);
INSERT INTO MY_DATA VALUES(2,'Ford','fford',13000);
INSERT INTO MY_DATA VALUES(3,'patel','ppatel',33000);
INSERT INTO MY_DATA VALUES(4,'Report','rreport',23500);
INSERT INTO MY_DATA VALUES(5,'Good','ggood',44450);

--3. TO_CHAR 내장함수를 이용하여 입력한 자료를 위의 도표와 같은 형식으로 출력하는 SQL문을 작성하시오       
SELECT ID, NAME, USERID, TO_CHAR(SALARY,'99,999.99') FROM MY_DATA ;       

--4. 자료를 영구적으로 데이터베이스에 등록하는 명령어를 작성하시오 
COMMIT;

--5. ID가 3번인 사람의 급여를 65000.00으로 갱신하고 영구적으로 데이터 베이스에 반영하라 
UPDATE MY_DATA 
    SET SALARY = 65000 
    WHERE ID = 3;
SELECT * FROM MY_DATA;       

-- 6. NAME이 FORD인 사람을 삭제하고 영구적으로 데이터 베이스에 반영하라 
DELETE FROM MY_DATA WHERE NAME = 'Ford';       
SELECT * FROM MY_DATA;
COMMIT;

--7. SAYARY가 15,000 이하인 사람의 급여를 15,000으로 변경하라 
UPDATE MY_DATA
    SET SALARY = 15000
    WHERE SALARY <=15000;
SELECT * FROM MY_DATA;

--8. 위에서 생성한 테이블을 삭제해라.
DROP TABLE MY_DATA;


        -------------------- ★★★연습문제 2★★★ -------------------- 
---INSERT INTO DEPT01 VALUES(50,'ACCOUNTING','NEW YORK');
-- CONSTRAINS SAM_PK 는 제약조건 이름을 만드는 것 (안만들어도 되긴 함)
CREATE TABLE SAM01(
        EMPNO       NUMBER(4)CONSTRAINTS SAM_PK PRIMARY KEY,
        ENAME       VARCHAR2(10),
        JOB         VARCHAR2(9),
        SAL         NUMBER(7,2));
SELECT * FROM SAM01;
SELECT * FROM USER_CONSTRAINTS;
DROP TABLE SAM01;
INSERT INTO SAM01 VALUES(1000,'APPLE','POLICE',10000);
INSERT INTO SAM01 VALUES(1010,'BANANA','NURSE',15000);
INSERT INTO SAM01 VALUES(1020,'ORANGE','DOCTOR',25000);
INSERT INTO SAM01 VALUES(1030,'VERY',NULL,25000);
INSERT INTO SAM01 VALUES(1040,'CAT',NULL,2000);
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;

-- 트랜잭션 명령어
COMMIT;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- ★★★제약조건★★★ -------------------- 
        -- 부적합한 데이터가 테이블에 삽입, 수정 되는 것을 방지하기 위해 

SELECT * FROM EMP;
INSERT INTO EMP VALUES (7369,'홍',NULL,NULL,SYSDATE,NULL,NULL,40); -- 에러남 제약조건을 EMPNO에 걸어놨기 때문에 동일한 데이터 삽입 불가능
                                                                   -- SMITH 사번과 중복 에러 
UPDATE EMP SET EMPNO = 7369 WHERE ENAME='ALLEN';                   -- SMITH 사번과 중복 에러 

        -- ① ★ PRIMARY KEY : 유일하게 테이블의 각 행을 식별 . NOT NULL (NULL 값 입력하면 안됨)
        
    INSERT INTO EMP(EMPNO, ENAME, DEPTNO) VALUES (7369,'홍',40);        
    
        -- ②    NOT NULL : NULL 값을 포함하지 않음 
        
        -- ③    UNIQUE : 모든 행에 대해 유일해야함. NULL값을 허용 (NULL은 여러행 입력 가능)
        
        -- ④ ★ FOREIGN KEY : 테이블의 열은 다른 테이블의 열을 참조
            -- 비식별관계 : 부모테이블의 주키가 자식테이블의 일반속성에 속한 필드로 관계를 맺는 것 (exERD에서 빨간점선화살표)
            -- 식별관계   : 부모테이블의 주키가 자식테이블의 주키에 속한 필드로 관계를 맺는 것 (exERD에서 초록점선화살표)
            
    INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (1111,'홍',90); -- DEPT 테이블에 90번 부서가 없어서 에러
                                                                  -- 외래키로 90번 입력 불가               
 
        -- ex. EMP테이블의 DEPTNO는 DEPT 테이블의 DEPTNO를 참조 
        -- ⑤    CHECK(조건) : 해당 조건이 만족 (NULL값 허용) 
        -- ★ DEFAULT : 기본값 설정 (해당 열의 데이터 입력값이 없으면 NULL이 들어감)  

    DROP TABLE DEPT1;
    CREATE TABLE DEPT1(
        DEPTNO NUMBER(2) PRIMARY KEY,
        DNAME  VARCHAR2(14) UNIQUE,
        LOC    VARCHAR2(14) NOT NULL);
        
    
    DROP TABLE EMP1;
    CREATE TABLE EMP1(
        EMPNO    NUMBER(4)    PRIMARY KEY,
        ENAME    VARCHAR2(10) NOT NULL,
        JOB      VARCHAR2(9)  NOT NULL,
        MGR      NUMBER(4),
        HIREDATE DATE         DEFAULT SYSDATE,
        SAL      NUMBER(7,2)  CHECK(SAL>0),
        COMM     NUMBER(7,2),
        DEPTNO   NUMBER(2)    REFERENCES DEPT1(DEPTNO));
    
    DROP TABLE EMP1;  -- 자식테이블(참조하는 테이블) 을 먼저 DROP 
    DROP TABLE DEPT1; -- PARENT 테이블을 지우고 싶으면 자식 테이블을 먼저 지워라
                      -- 다른 테이블에서 참조하는 필드가 있을때 (부모테이블은) 먼저 DROP 안 됨
    DROP TABLE DEPT1 CASCADE CONSTRAINTS; --비추 (참조하는 테이블이 있어도 무시하고 DROP) - 회사에서 이런 거 절대 하면 안됨 
    
    ---설계도면 보고 다시 만들어보기 
    CREATE TABLE DEPT1(
        DEPTNO      NUMBER(2),
        DNAME       VARCHAR2(14),
        LOC         VARCHAR2(13) NOT NULL,
        PRIMARY KEY(DEPTNO),
        UNIQUE(DNAME));
    CREATE TABLE EMP1(
        EMPNO       NUMBER(4),
        ENAME       VARCHAR2(10) NOT NULL,
        JOB         VARCHAR2(9),
        MGR         NUMBER(4),
        HIREDATE    DATE DEFAULT SYSDATE,
        SAL         NUMBER(7,2),
        COMM        NUMBER(7,2),
        DEPTNO      NUMBER(2),
        PRIMARY KEY(EMPNO),
        CHECK (SAL>0),
        FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO));
        -- NOT NULL 과 DEFAULT는 오른쪽에 써야해 꼭 
        -- PRIMARY KEY 는 NOT NULL이면서 UNIQUE 랑 비슷한 효과 . 단 PRIMARY KEY 는 수정불가 
        -- 제약조건을 데이터타입 옆에 쓸 땐 FOREIGN 안써도 되지만, 아래에 쓸땐 FOREIGN 먼저 써줘야됨 

    SELECT * FROM DEPT1;
    SELECT * FROM EMP1;
    INSERT INTO DEPT1 SELECT * FROM DEPT;
    INSERT INTO DEPT1 VALUES (40,'IT','SEOUL'); -- PK 위배 에러 
    INSERT INTO DEPT1 VALUES (40,'IT',NULL); -- 위배사항이 여러개면, 오류를 마지막꺼만 뿌림 
    INSERT INTO DEPT1 VALUES (50,'SALES','SEOUL'); --UNIQUE 위배
    INSERT INTO DEPT1 VALUES (50,'IT',NULL); --NOT NULL 위배 
    
    INSERT INTO EMP1 (EMPNO, ENAME, DEPTNO)
        VALUES (1001, '홍', 10);
    -- 다른 곳에 NULL이 들어가야 하는데 HIREDATE에 NULL이 안들어간 이유는 기본값(DEFAULT) 해줬기 때문에 
    -- 회원가입할때 가입일 입력 안하는 이유 : 이런식으로 기본값이 들어가게끔 설정했기 때문에 
    
    INSERT INTO EMP1 (EMPNO, ENAME, DEPTNO)
        VALUES (1001, '김', 10); -- PK 위배 
    INSERT INTO EMP1 (EMPNO,DEPTNO)
        VALUES (1002,20);        --NOT NULL 위배  
    INSERT INTO EMP1 (EMPNO, ENAME, SAL)
        VALUES (1002, '박', -1); -- SAL>0 위배 (CHECK 위배)
    INSERT INTO EMP1 VALUES (1002,'윤',NULL,NULL,TO_DATE('95/01/01','YY/MM/DD'), 900, NULL, 99);
    -- FK 위배 
    
    
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- ★★★연습문제★★★ -------------------- 
    CREATE SEQUENCE BOOK_SEQ
    START WITH 100
    INCREMENT BY 100
    MAXVALUE 999
    NOCACHE
    NOCYCLE;

    DROP SEQUENCE BOOK_SEQ;    
    CREATE TABLE BOOKCATEGORY(
    CATEGORY_CODE   NUMBER(3) PRIMARY KEY,
    CATEGORY_NAME   VARCHAR2(50) UNIQUE,
    OFFICE_LOC      VARCHAR2(50) NOT NULL
    );
    SELECT * FROM BOOKCATEGORY;
    DROP TABLE BOOKCATEGORY;
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, '철학', '3층 인문실'); 
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, '인문', '3층 인문실'); 
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, '자연과학', '4층 과학실'); 
    INSERT INTO BOOKCATEGORY VALUES (BOOK_SEQ.NEXTVAL, 'IT', '4층 과학실'); 
    
    SELECT * FROM BOOK;
    DROP TABLE BOOK;
    CREATE TABLE BOOK(
    CATEGORY_CODE   NUMBER(3) REFERENCES BOOKCATEGORY(CATEGORY_CODE),
    BOOKNO      VARCHAR2(10) PRIMARY KEY,
    BOOKNAME    VARCHAR(50),
    PUBLISHER   VARCHAR(50),
    PUBYEAR     NUMBER(4) DEFAULT EXTRACT(YEAR FROM SYSDATE)
    );
    SELECT * FROM BOOK;
    DROP TABLE BOOK;
    
    INSERT INTO BOOK VALUES (100,'100A01','철학자의 삶','더존출판',2021);
    INSERT INTO BOOK VALUES (400,'400A01','이것이 DB다','더존출판',2018);
    
    
-------------------------------------------------------------------------------
CREATE SEQUENCE STUDENT_SEQ
  MAXVALUE 9999
  NOCACHE
  NOCYCLE;
  
  CREATE TABLE MAJOR (
    MAJOR_CODE      NUMBER(4) PRIMARY KEY,
    MAJOR_NAME      VARCHAR2(50) UNIQUE,
    MAJOR_OFFICE_LOC VARCHAR2(50) NOT NULL
    );
    SELECT * FROM MAJOR;
    
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '경영정보', '경영관 305호');
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '소프트웨어공학', '정보관 808호');
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '디자인', '예술관 606호');
    INSERT INTO MAJOR VALUES (STUDENT_SEQ.NEXTVAL, '경제', '경상관 202호');
    
    
  
  CREATE TABLE STUDENT(
    STUDENT_CODE       VARCHAR2(10) PRIMARY KEY,
    STUDENT_NAME       VARCHAR2(50) NOT NULL,
    SCORE              NUMBER(10) CHECK (0<=SCORE AND SCORE<=100),
    MAJOR_CODE         NUMBER(4) REFERENCES MAJOR(MAJOR_CODE)
    );
  
  SELECT * FROM STUDENT;
    
    INSERT INTO STUDENT VALUES ('AO1', '김길동', 100,1);
    INSERT INTO STUDENT VALUES ('AO2', '문길동', 90,2);
    INSERT INTO STUDENT VALUES ('AO3', '홍길동', 95,1);
    
-------------------------------------------------------------------------------

CREATE SEQUENCE MEMBER_MNO_SQ
    START WITH -1
    MINVALUE -1
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;
    


CREATE TABLE MEMBER_LEVEL (
    LEVELNO     NUMBER(4) PRIMARY KEY ,
    LEVELNAME   VARCHAR2(50) NOT NULL );
SELECT * FROM MEMBER_LEVEL;
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'BLACK');
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'일반');
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'실버');
    INSERT INTO MEMBER_LEVEL VALUES (MEMBER_MNO_SQ.NEXTVAL,'골드');


CREATE TABLE MEMBER(
    MNO     NUMBER(4) PRIMARY KEY,
    MNAME   VARCHAR2(50) NOT NULL,
    MPW     VARCHAR2(50) CHECK (LENGTH(MPW)<9),
    MEMAIL  VARCHAR2(50) UNIQUE,
    MPOINT  NUMBER(10) CHECK (0<=MPOINT),
    MRDATE  DATE    DEFAULT SYSDATE,
    LEVELNO NUMBER(4)   REFERENCES MEMBER_LEVEL(LEVELNO)
);
SELECT * FROM MEMBER;
DROP TABLE MEMBER;
    INSERT INTO MEMBER VALUES (1,'홍길동','aa','hong@hong.com',0,'22/03/10',0);
    INSERT INTO MEMBER VALUES (2,'신길동','bb','ain@ain.com',1000,'22/04/01',1);

--텍스트 출력 
SELECT MNO, MNAME, MRDATE, MEMAIL, MPOINT , LEVELNAME||'고객'
FROM MEMBER_LEVEL M , MEMBER W
WHERE M.LEVELNO = W.LEVELNO;











