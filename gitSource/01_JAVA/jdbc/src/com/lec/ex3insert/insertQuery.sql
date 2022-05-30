-- InsertDept 1 예제 
INSERT INTO DEPT VALUES (70,'IT','SEOUL');
ROLLBACK;
COMMIT;
SELECT * FROM DEPT;

-- InsertDept 2 예제 
    -- 1) 부서번호 중복체크 [둘 중 하나 쓰기] 
SELECT * FROM DEPT WHERE DEPTNO=70; -- rs.next()결과가 true/false
                                    -- true  : 중복을 알리는 메시지 출력 
                                    -- false : 부서명/부서위치 입력받기 
SELECT COUNT(*)CNT FROM DEPT WHERE DEPTNO=70; -- 타이틀에 특수문자 안들어가게 조심(ALIAS쓰기)                                     
                                              -- rs.next()결과가 1/0
                                              -- 1 : 중복을 알리는 메시지 출력 
                                              -- 0 : 부서명/부서위치 입력받기 
    -- 2) 셀렉트 결과에 따라 INSERT 할지 말지 고민하기                                           
INSERT INTO DEPT VALUES (70,'IT','SEOUL');    

------------------------------------update
--입력
INSERT INTO DEPT VALUES (55,'IT','SEOUL');
UPDATE DEPT SET DNAME = 'ABC' WHERE DEPTNO = 55;
DELETE FROM DEPT WHERE DEPTNO=55;

-- 수정 
UPDATE DEPT SET DNAME = 'ABC', LOC ='SEOUL' WHERE DEPTNO =55;
COMMIT;

--삭제 
DELETE FROM DEPT WHERE DEPTNO=55;
COMMIT;
SELECT * FROM DEPT;


--------------------------------------prepared
--(부서명을 입력받아) 사원의 사번, 이름, 직책, 급여를 출력하시오 
SELECT EMPNO, ENAME, JOB, SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND DNAME = UPPER('sales');








