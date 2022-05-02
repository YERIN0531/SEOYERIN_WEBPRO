-- DCL (계정생성, 권한부여, 권한박탈, 계정삭제)
-- DDL (제약조건 , 시퀀스 없음)
-- DML (outer join, and = &&, or = ||) 여기선 연결연산자 없음 
-- java에서 쓸 데이터 넣고 연습해 보기 

show databases; -- database 리스트 보기  
-- ----------------- ★ ★ ★ DCL ★ ★ ★ ------------------------
-- 계정 생성, 권한 부여, 권한 박탈, 계정 제거 

-- 계정 생성 
-- 오라클 : create user user01 identified by tiger;
create user user01 identified by 'password'; 

-- 권한부여 
-- 오라클 : grant dba to user01; 
grant all on *.* to user01;

-- 권한박탈
revoke all on *.* from user01;

-- 계정제거
drop user user01;

-- ----------------- DDL 하기 전 데이터 베이스로 들어감 -------------
show databases;

-- 데이터 베이스를 새로 만들어줘도 됨 
-- 1. kimdb 라는 새로운 데이터 베이스 영역 생성 
create database kimdb;

-- 2. kimdb 데이터 베이스 영역으로 들어감 
use kimdb;

-- 3. 현재 들어와 있는 데이터베이스 뭔지 확인하기 
select database();

-- 4. 다른 데이터 베이스 영역으로 바꾸고 싶으면 "그냥 use 데이터베이스이름" 해주면 됨 
use world; -- world 데이터 베이스로 들어감 
use kimdb; -- kimdb 데이터 베이스로 들어감 (수업시간에 하는 모든건 kimdb로 할것 ) 

-- 5. kimdb 안에 있는 테이블 확인하기 
-- oracle : select * from tab;
show tables;

-- ----------------- ★ ★ ★ DDL ★ ★ ★ ------------------------
-- 테이블 생성, 제약조건, 시퀀스 없음
-- mysql은 바로 create 안됨. database를 선택 해준 뒤에 table생성 가능 
-- oracle : number-> numeric , varchar2 -> varchar, date - >datetime
-- oracle : sysdate -> sysdate() or now()
create table emp(
	empno 		numeric(4) 		primary key,
    ename 		varchar(20) 	not null,
    nickname 	varchar(20) 	unique,
    sal 		numeric(7,2) 	check(sal>0),
    hiredate 	datetime 		default now(),
    comm 		numeric(7,2) 	default 0
);
select * from emp;

-- table 지울 때 
-- oracle :  drop table emp;
drop table if exists emp;

-- Major (mCODE<시퀀스 같은 순차번호>) : PK, mName, MOffice  
-- Student (sNO:PK, sName, mCode) 
-- 필요한 제약조건 : primary key, foreign key
create table major (
	mCode 	int primary key auto_increment, -- auto_increment 일 경우 int 사용 
    mName 	varchar(20),
    mOffice varchar(50)
);

create table student(
	sNO		int primary key,
    sName	varchar(20),
    mCode	int references major(mCode)
);

-- major 테이블에 데이터 넣기 
insert into major(mName, mOffice) values ('컴공','402호');
insert into major(mName, mOffice) values ('경영','502호');
insert into major(mName, mOffice) values ('경제','302호');
select * from major;

-- student 테이블에 데이터 넣기 
insert into student values (1111,'홍',1);
insert into student values (2222,'이',2);
insert into student values (3333,'사',3);
select * from student;

-- major 테이블에 3까지 밖에 없는데 student에는 그 이상 들어감 
-- foreign key 로 연결이 안된것..? 
-- mysql은 foreign key 아래에 써줘야 먹힘 
insert into student values (4444,'박',4);

-- 지우고 다시 만들어 보자 
drop table if exists student;
drop table if exists major;

create table major (
	mCode	int auto_increment,
    mName	varchar(30) not null,
    mOffice varchar(30),
    primary key (mCode));

create table student(
	sNo		int,
    sName	varchar(30),
    mCode	int,
    primary key (sNo),
    foreign key (mCode) references major(mCode));

insert into major(mName, mOffice) values ('컴공','402호');
insert into major(mName, mOffice) values ('경영','502호');
insert into major(mName, mOffice) values ('경제','302호');
select * from major;
 
insert into student values (1111,'홍',1);
insert into student values (2222,'이',2);
insert into student values (3333,'사',3);
insert into student values (4444,'박',4); -- 에러남 foreign key 제대로 작동 
select * from student;

-- equi 조인 써보기 
-- 학번, 이름, 학과코드, 학과명, 사무실 
select sNo, sName, s.mCode, mName, mOffice
	from student s, major m
	where s.mCode = m.mCode;
    
-- ----------------------------------자바(JDBC)----------------------------------
	-- 자바(JDBC) 수업시간에 쓸 테이블 
 drop table if exists personal; -- emp 테이블 유사 
 drop table if exists division; -- dept 테이블 유사

-- division 테이블 생성 및 데이터 insert 하기 
create table division(
	dno 	 int, 		  -- 부서번호
    dname 	 varchar(20), -- 부서이름
    phone	 varchar(20), -- 부서전화
    position varchar(20), -- 부서 위치
    primary key(dno) );
insert into division values (10, 'finance', '02-545-5555','강남');    
insert into division values (20, 'research', '02-777-7777','회현');
insert into division values (30, 'sales', '02-333-3333','서초');
insert into division values (40, 'marketing', '02-666-66666','과천');
select * from division;

-- personal 테이블 생성 및 데이터 insert 하기 
create table personal(
	pno 	  int,					 -- 사번
    pname	  varchar(20) not null,  -- 사원명
    job		  varchar(20) not null,  -- 직책
    manager	  int,					 -- 상사의 사번
    startdate date,					 -- 입사일
    pay		  int,					 -- 급여
    bonus	  int,					 -- 상여
    dno		  int,					 -- 부서번호
    primary key(pno),
    foreign key(dno) references division(dno));
insert into personal values (1111,'smith','manager', 1001, '1990-12-17', 1000, null, 10);
insert into personal values (1112,'ally','salesman',1116,'1991-02-20',1600,500,30);
insert into personal values (1113,'word','salesman',1116,'1992-02-24',1450,300,30);
insert into personal values (1114,'james','manager',1001,'1990-04-12',3975,null,20);
insert into personal values (1001,'bill','president',null,'1989-01-10',7000,null,10);
insert into personal values (1116,'johnson','manager',1001,'1991-05-01',3550,null,30);
insert into personal values (1118,'martin','analyst',1111,'1991-09-09',3450,null,10);
insert into personal values (1121,'kim','clerk',1114,'1990-12-08',4000,null,20);
insert into personal values (1123,'lee','salesman',1116,'1991-09-23',1200,0,30);
insert into personal values (1226,'park','analyst',1111,'1990-01-03',2500,null,10);
select * from personal;
commit;
select * from division;
select * from personal;


-- =========================================================================================================
-- =========================================================================================================
-- 						----------------- ★ ★ ★ 연습문제 ★ ★ ★ ------------------------

-- ★ ★ ★ DML(outer join , 단일행함수 일부 , top-N구문 ,  and=&&, or=|| 연결연산자 없기 때문에 concat 써야함)
 
-- 1. 사번, 이름, 급여를 출력
select pno, pname, pay from personal;

-- 2. 급여가 2000~5000 사이 모든 직원의 모든 필드
select * from personal where pay between 2000 and 5000;

-- 3. 부서번호가 10또는 20인 사원의 사번, 이름, 부서번호
select pno, pname, dno from personal where dno = 10 or dno = 20;
-- 3. 선생님 풀이 
select pno, pname, dno from personal where dno in(10,20);
select pno, pname, dno from personal where dno = 10 || dno = 20;

-- 4. 보너스가 null인 사원의 사번, 이름, 급여 급여 큰 순정렬
select pno, pname, pay from personal where bonus is null order by pay desc;

-- 5. 사번, 이름, 부서번호, 급여. 부서코드 순 정렬 같으면 PAY 큰순
select pno, pname, dno, pay from personal order by dno,pay desc;

-- 6. 사번, 이름, 부서명
select pno, pname, dname
from personal p, division d
where p.dno = d.dno;

-- 7. 사번, 이름, 상사이름
select w.pno, w.pname, m.pname 
from personal w, personal m
where w.manager = m.pno;

-- 8. 사번, 이름, 상사이름(상사가 없는 사람도 출력, 상사가 없으면 대신 null 대신 'ceo')
-- 셀프조인은 oracle과 동일 outer join 은 좀 다름 (oracle에선 + 써주면 됨)
-- nvl 대신 ifnull 써주면 됨 
select w.pno, w.pname, ifnull(m.pname,'ceo')
from personal w left outer join personal m
on w.manager = m.pno; -- left outer join (오른쪽에 있는 애가 안나오면)

-- ifnull= nvl / if 로 쓸땐 아래처럼! 
select w.pno, w.pname, if(m.pname is null,'ceo',m.pname)
from personal w left outer join personal m
on w.manager = m.pno; -- left outer join (오른쪽에 있는 애가 안나오면)

-- 9. 이름이 s로 시작하는 사원 이름
select pname from personal where pname like 's%';
-- 9. 선생님 풀이 
select pname from personal where substr(pname,1,1)='s';
select pname from personal where instr(pname,'s') =1;

-- 10. 사번, 이름, 급여, 부서명, 상사이름 
select w.pno, w.pname, w.pay, dname, m.pname "manager"
from personal w, personal m, division d
where w.manager = m.pno and w.dno= d.dno;

-- 11. 부서코드, 급여합계, 최대급여
select dno, sum(pay), max(pay) from personal group by dno;

-- 12. 부서명, 급여평균, 인원수
select dname, sum(pay), count(*) from division d, personal p 
where p.dno = d.dno group by p.dno;

-- 13. 부서코드, 급여합계, 인원수 인원수가 4명 이상인 부서만 출력 -------------------------------------------------------
select dno, sum(pay), count(*) 
from personal 
group by dno
having count(*) >=4 ;

-- 14. 사번, 이름, 급여 회사에서 제일 급여를 많이 받는 사람
select pno, pname, pay 
	from personal 
    where pay = (select max(pay) from personal);

-- 15. 회사 평균보다 급여를 많이 받는 사람 이름, 급여, 부서번호
select pname, pay, dno 
	from personal 
    where pay > (select avg(pay) from personal);

-- 16. 15번에 부서명을 추가하고 부서명순 정열 같으면 급여 큰순
select pname, pay, p.dno , dname 
from personal p, division d
where p.dno = d.dno
and pay > (select avg(pay) from personal)
order by dname, pay desc;

-- 17. 자신이 속한 부서의 평균보다 많인 받는 사람의 이름, 금여, 부서번호, 반올림한 해당부서평균 

-- 서브쿼리이용
select pname, pay, dno, (select Round(avg(pay),2) from personal where dno = e.dno)"해당부서평균"
from personal e
where pay > (select avg(pay) from personal where dno=e.dno) order by dno;

-- inline view 이용
select pname, pay, p.dno, avgpay
from personal p, (select dno, avg(pay) avgpay from personal group by dno) g
where p.dno=g.dno 
and pay > avgpay 
order by dno;

-- 18. 입사가 가장 빠른 사람의 이름, 급여, 부서명
select pname, pay, dname 
from personal e , division d 
where e.dno = d.dno
and startdate = (select min(startdate) from personal);

-- 19. 이름, 급여, 해당부서평균
select pname, pay, (select avg(pay) from personal where e.dno = dno)"부서별평균"
from personal e
order by dno;

-- 20. 이름, 급여, 부서명, 해당부서평균
select pname , pay, dname, (select avg(pay) from personal where p.dno = dno)"부서별평균"
from personal p, division d
where p.dno = d.dno
order by p.dno;

select pname , pay, dname, (select avg(pay) from personal)"부서별평균"
from personal p, division d
where p.dno = d.dno
order by p.dno;

-- ===============================================================================================
-- ===============================================================================================
-- 	------------------------- Oracle에서의 단일행함수와 MySQL 컬럼함수의 다른 부분  ------------------------

-- ★ from 절 
-- oracle 에서는 from 절을 써야 함 - > select round(789.56,2) from dual;
-- MySQL 에서는 from 절 없이도 실행 가능
select round(789.56,2);

-- ===============================================================================================

-- ★ 연결연산자 
-- oracle 에서는 || 연결 연산자 -> select pname || '은' || job || '이다' from personal;
-- mysql 에서는 concat 써서 사용 
select concat(concat(pname, '은 ') ,concat(job, '이다')) from personal;
select concat(pname,'은',job,'이다') from personal;

-- ===============================================================================================

-- ★ 날짜 관련 컬럼함수  (Personal 테이블의 startdate 타입 : datetime)
-- (1) 날짜 뽑는 함수
select year (startdate), month(startdate), day(startdate), 
	   hour(startdate), minute(startdate), second(startdate) from personal;

-- (2) date_format(날짜형데이터 시간형데이터, '포맷') 날짜형을 문자로 전환 
--     oracle : to_char(날짜형데이터,'포맷') -oracle 방법 : yy/mm/dd
	-- 포맷 글자 : %y(년도2자리) , %Y (연도4자리) , %M(월이름) , %m (04월,05월), %c 4(월수)
    -- %d 20,01,02,03..(일2자리) %e 20,1,2,3
    -- %H 24시간 %h 12시간 , %p 오전 오후 , %i 분, %s 초
    
-- 시스템으로부터 현재 날짜와 시간 
select sysdate();
select now();

-- 시스템으로부터 현재 날짜만 
select current_date();
select curdate();

-- 시스템으로부터 현재 시간만
select current_time();
select curtime();

-- 시스템으로부터 date_format을 이용해서 원하는 format으로 뽑고 싶을때 
select date_format(now(),'%Y년%m월%e일 %p %h시 %i분'); 

-- (3) 숫자를 문자로 전환
	-- format(숫자데이터) : 3자리 콤마 추가 
    -- format(숫자데이터, 소수점자리수) : 소수점 확보되면서 3자리 콤마 추가 
select format(pay,1) from personal;

-- ===============================================================================================

-- ★ workbench에서 데이터 삭제하거나 수정 (where 절에 primary key를 이용한 비교)
insert into personal(pno,pname, job, manager, startdate, pay, bonus, dno)
	values (1000, 'hong', 'manager', 1001, curdate(), 9000, 900, 40);
commit;
set sql_safe_updates = 0; -- mysql이 아니라 workbench의 문법임
delete from personal where pname = 'hong';

-- ===============================================================================================

-- ★ ★ ★ TOP-N구문 
-- 데이터가 제대로 올라갔는지 확인할때 select*from 해버리면 시간이 오래 걸릴 수 있으니 top_n 구문을 활용해서 몇번부터 몇번까지 뿌려 라는걸 해줄것 

-- oracle : select rownum, pno from personal;
-- mysql : rownum이 없음 대신 

-- limit n 		(1등~n등까지) 
-- limit 3,3 	(4등~6등까지) (3번째부터, 3개) 
-- limit 5,4	(6등~9등까지) (5번째부터, 4개)
select pname, pay from personal order by pay desc limit 5;		-- 1등~5등 
select pname, pay from personal order by pay desc limit 3,3;	-- 4등~6등(4등부터 3개)
select pname, pay from personal order by pay desc limit 5,4;	-- 6등 9등 (6등부터 4개)


















