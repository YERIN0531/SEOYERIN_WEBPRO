-- [XII] TRANSACTON 명령어 : COMMIT(트랜잭션반영); ROLLBACK (트랜잭션 취소); SAVEPOINT(트랜잭션 분할);
-- COMMIT,ROLLBACK은 많이 쓰지만 SAVEPOINT는 많이 안쓰지만 시험엔 나옴 
-- DDL 작업은 트랜잭션에 반영 안됨 
-- DCL 작업도 트랜잭션에 반영 안됨 
-- DML 작업만 트랜잭션에 반영 됨 ( 그 중에서도 SELECT는 해당 X 뭔가를 반영하는게 아니기 때문에 )
DROP TABLE DEPT01;
-- 1. DEPT01 생성 
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
SELECT * FROM DEPT01;   -- 10,20,30,40

-- 2. DEPT01 DELETE 하기  (트랜잭션에 쌓임) 
DELETE FROM DEPT01;     
SELECT * FROM DEPT01;

-- 3. ROLLBACK 하기 (트랜잭션에 만들어진 내용을 ROLLBACK 한다) 
-- COMMIT, ROLLBACK : 새로운 트랜잭션 시작 하겠다는 뜻 
ROLLBACK;

-- 4. DELETE 다시 해보기 - > 트랜잭션에 쌓임 
DELETE FROM DEPT01 WHERE DEPTNO=40;

-- 5. COMMIT 하는 순간 원상복구 불가. 새로운 트랜잭션 시작 
COMMIT;

-- 6. 새로운 트랜잭션 시작 
SELECT * FROM DEPT01;   -- 10,20,30

-- SAVEPOINT
-- 30번부서 DELETE 20번부서 DELETE 10번부서 DELETE 
-- 취소 하고 싶은데 20번부서,10번부서 DELETE만 취소하고 싶음 
-- 30번부서 DELETE - COMMIT - 20번,10번부서 DELETE - ROLLBACK 하면 되지만 귀찮을 수 있음
-- 트랜잭션을 분할하는 SAVEPOINT사용해보자 

-- 1. 30번 DELETE 해보기 하기
DELETE FROM DEPT01 WHERE DEPTNO=30;
SELECT * FROM DEPT01;

-- 2. SACEPOINT 잡아주기 
-- C1 지점 : 10, 20번 부서만 있는 지점 (30번은 위에서 지움) 
SAVEPOINT C1;

-- 3. 20번 DELETE & SAVEPOINT C2생성
-- C2 지점 : 10번 부서만 있는 지점 
DELETE FROM DEPT01 WHERE DEPTNO=20;
SELECT * FROM DEPT01;
SAVEPOINT C2;

-- 4. 10번 DELETE
DELETE FROM DEPT01 WHERE DEPTNO=10;
SELECT * FROM DEPT01; -- 데이터 없음 (다 지웠으니까) 

-- 5. ROLLBACK 하기 
-- ROLLBBACK 하면 전체가 다 날라감. 
-- ROLLBACK TO C1 하면 아래 10번, 20번 부서만 살아 있음 
-- ROLLBACK TO C2 하면 아래 10번부서만 살아있음
ROLLBACK TO C2; -- 10번 부서  ( 트랜잭션엔 20,30부서만 남아있음 -> 이부분이 실행되니 20,30 DELETE 되는 것)
ROLLBACK TO C1; -- 10번 20번 부서 ( 트랜잭션엔 30 부서만 남아있음 -> 이부분이 실행되니 30 DELETE 되는 것 ) 
COMMIT;
SELECT * FROM DEPT01;



