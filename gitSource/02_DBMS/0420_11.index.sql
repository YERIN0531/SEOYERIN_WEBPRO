-- [XI] 인덱스 : 조회를 빠르게 하는 인덱스 
-- Q. 내가 직접 만들지 않아도 인덱스가 생성된 이유 
-- A. 테이블 생성시 PRIMARY KEY 만들면 얘네ㅔ가 자동으로 인덱스 생성 
SELECT * FROM USER_INDEXES; -- 딕셔너리뷰에서 SCOTT이 소유한 인덱스 정보
DESC EMP;

DROP TABLE EMP01;
-- 1. EMP 내용과 같은 EMP01 생성 (이렇게 생성한다고 해서 제약조건들도 같이 복사 되는 것이 아님) 
CREATE TABLE EMP01 AS SELECT * FROM EMP; -- EMP내용과 같은 EMP01 생성
SELECT * FROM EMP01; --14행

-- 2. 행 추가 하기 2번 수행하기 
INSERT INTO EMP01 SELECT * FROM EMP01; -- 1번 수행시(28행) 2번(56행) 

-- 3. 몇행인지 갯수 확인하기 
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;

-- 4. 11번 수행 하기 (11만4천개)
INSERT INTO EMP01 SELECT * FROM EMP01;

-- 5. 데이터 폼 하나 추가 하기 (홍이라는 사람 하나 추가)
INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO) VALUES (1111,'HONG',40);

-- 6. 홍 여러개 집어 넣는 작업  (3번실행-91만개) 
-- 위에서 홍을 추가했기 때문에 EMP01을 INSERT 하면 홍도 같이 추가로 좀 더 들어가게 됨 
INSERT INTO EMP01 SELECT * FROM EMP01; 

-- 7. 인덱스 생성 전 조회
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- 인덱스 생성 전 : 0.018초

-- 8. 인덱스 생성 후 조회 
--    인덱스 생성 ( EMP01 테이블의 ENAME)
CREATE INDEX IDX_EMP01_ENAME ON EMP01 (ENAME); -- 인덱스 생성 : 0.364초
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- 인덱스 생성 후 : 0.001초 

-- 9. 데이터 딕셔너리에서 인덱스 이름 잘 적혀있는지 확인해보기 
SELECT * FROM USER_INDEXES WHERE INDEX_NAME = 'IDX_EMP01_ENAME';
COMMIT; --91만개 행 

-- 10. 인덱스 생성 후 INSERT 속도 보기 
INSERT INTO EMP01 SELECT * FROM EMP01; -- 인덱스 생성 후 INSERT 속도 : 21.3초

-- 11. 'HONG'들어간거 ROLLBACK 해서 다시 91만개 만들기  
ROLLBACK; -- 취소 속도 : 8.981~10.3초 

-- 12. 인덱스 삭제 하기 
DROP INDEX IDX_EMP01_ENAME;
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;

-- 13. 인덱스 제거 후 INSERT 속도 보기 
INSERT INTO EMP01 SELECT * FROM EMP01; -- 인덱스 제거 후 INSERT 속도 : 1.269초 

-- EMP01 관련 테이블을 DROP 하면 인덱스도 같이 사라짐 





