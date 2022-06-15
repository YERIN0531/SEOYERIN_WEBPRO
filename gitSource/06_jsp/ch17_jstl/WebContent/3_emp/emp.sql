-- DAO query
-- 전체 list
SELECT * FROM EMP;
-- 검색
-- A를 대소문자로 바꾸는거 여기다 UPPER 넣어도 되지만, 자바에서(UPEERCASE) 처리해도 됨 
-- 하지만 쿼리해서 해줄 수 있는건 쿼리에서 다 해주는게 좋음. 자바소스가 복잡해질 수 있음 
-- JOB에 만약 NULL이 들어갈 경우 자바에서 NULL이 들어오고 안들어오면 UPPERCASE 해주기 이런거까지 해줘야됨 
SELECT * FROM EMP WHERE ENAME LIKE '%A%' AND JOB LIKE '%E%';
SELECT * FROM EMP WHERE ENAME LIKE '%'||UPPER('A')||'%' AND JOB LIKE '%'||UPPER('E')||'%';
