-- 테이블 drop & create
DROP TABLE BOARD;

CREATE TABLE BOARD(
    NUM         NUMBER(5,0)     PRIMARY KEY,        -- 글번호
    WRITER      VARCHAR2(30)    NOT NULL,           -- 글쓴이
    SUBJECT     VARCHAR2(100)   NOT NULL,           -- 글제목
    CONTENT     VARCHAR2(4000)  NOT NULL,           -- 글내용
    EMAIL       VARCHAR2(30),                       -- 작성자 이메일
    READCOUNT   NUMBER(5)       DEFAULT 0,          -- 글조회수(HIT수)
    PW          VARCHAR2(30)    NOT NULL,           -- 비밀번호(삭제시)
    REF         NUMBER(5)       NOT NULL,           -- 글그룹(원글일 경우 : 글번호 / 답변글일 경우 : 원글의 글번호)
    RE_STEP     NUMBER(5)       NOT NULL,           -- 그룹내 출력 순서(원글은 0)
    RE_INDENT   NUMBER(5)       NOT NULL,           -- 글 LIST 출력시 제목 들여쓰기 정도(원글 0)
    IP          VARCHAR2(20)    NOT NULL,           -- 글작성시 컴퓨터 IP 주소
    RDATE       DATE DEFAULT SYSDATE NOT NULL       -- 글쓴 시점(날짜+시간) 
);

-- 1. 글 갯수
SELECT COUNT(*) FROM BOARD;

-- 2. 글 목록 (최신순 부터)
SELECT * FROM BOARD ORDER BY NUM DESC;
SELECT * FROM BOARD ORDER BY REF DESC; -- 앞으로 이렇게 할 거임 

-- 3. 글쓰기(답변 말고 원글쓰기)
-- READCOUNT는 DEFAULT가 있으니 빼고, RDATE도알아서 SYSDATE 들어오니 빼고 넣기
-- READCOUNT는 상세보기 할때마다 자동으로 숫자가 카운팅됨 
SELECT NVL(MAX(NUM),0)+1 FROM BOARD; -- 글 번호 받는 아이 
INSERT INTO BOARD(NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD),'홍길동','글제목1','본문',NULL,'1',(SELECT NVL(MAX(NUM),0)+1 FROM BOARD),
        0,0,'192.168.10.3');
INSERT INTO BOARD(NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD),'홍길동','글제목2','본문',NULL,'1',(SELECT NVL(MAX(NUM),0)+1 FROM BOARD),
        0,0,'192.168.10.3');
        INSERT INTO BOARD(NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD),'홍길동','글제목3','본문',NULL,'1',(SELECT NVL(MAX(NUM),0)+1 FROM BOARD),
        0,0,'192.168.10.3');
SELECT* FROM BOARD;

-- 4. 글번호로 글(DTO) 가져오기 (글 상세보기)
SELECT * FROM BOARD WHERE NUM=1;

-- 5. 조회수 올리기 
UPDATE BOARD SET READCOUNT = READCOUNT+1 WHERE NUM=1;

-- 6. 글 수정
UPDATE BOARD SET SUBJECT = '수정된제목1',
                  CONTENT = '수정된 본문입니다\n와우',
                  EMAIL = 'hong@hong.com',
                  PW    = '1',
                  IP    = '127.0.0.1' 
                  WHERE NUM=1;
COMMIT;                  
-- 7. 글 삭제(비밀번호 입력해야 삭제가 되도록)
DELETE FROM BOARD WHERE NUM=1 AND PW='1';
ROLLBACK;
SELECT * FROM BOARD;
--------------------------------------------------------------------------------

-- 조회수 조작 (DAO에 쓸건 아니고 글 조회를 많이 하면 HOT 이미지 뜨게 하려고!) 
UPDATE BOARD SET READCOUNT = 12 WHERE NUM=3;




















