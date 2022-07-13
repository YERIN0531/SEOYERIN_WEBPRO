--BOARD table DROP &  CREATE
DROP SEQUENCE BOARD_SEQ;
CREATE SEQUENCE BOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;

DROP TABLE BOARD;
CREATE TABLE BOARD(
    BID         NUMBER(6)       PRIMARY KEY,
    BNAME       VARCHAR2(50)    NOT NULL,  --작성자 이름
    BTITLE      VARCHAR2(100)   NOT NULL, 
    BCONTENT    VARCHAR2(1000),
    BDATE       DATE            DEFAULT SYSDATE NOT NULL, --작성시점
    BHIT        NUMBER(6)       DEFAULT 0 NOT NULL, -- 조회수
    BGROUP      NUMBER(6)       NOT NULL, -- 글 그룹
    BSTEP       NUMBER(6)       NOT NULL, -- 글 그룹내 출력순서
    BINDENT     NUMBER(6)       NOT NULL, -- 들여쓰기
    BIP         VARCHAR2(20)    NOT NULL  -- 글쓴이의 IP주소 
);

-- DUMMY DATA
SELECT * FROM BOARD;
INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
    VALUES(BOARD_SEQ.NEXTVAL, '홍길동', '글1', '-', BOARD_SEQ.CURRVAL, 0,0,'192.168.10.30');
INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
    VALUES(BOARD_SEQ.NEXTVAL, '김길동', '글2', '-', BOARD_SEQ.CURRVAL, 0,0,'192.168.10.30');

    --1번글의 답변 DUMMY DATA
INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
    VALUES(BOARD_SEQ.NEXTVAL, '답녀', '글1-1', '답', 1, 1,1,'192.1.1.1');

-- DAO에 들어갈 QUERY 
-- 글목록(startRow ~ endRow)
SELECT * FROM BOARD ORDER BY BGROUP DESC, BSTEP; -- 글 출력 순서 
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOARD ORDER BY BGROUP DESC, BSTEP) A) 
WHERE RN BETWEEN 2 AND 3;

-- 전체 글 갯수
SELECT COUNT(*) CNT FROM BOARD;
-- 원글쓰기
INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
    VALUES(BOARD_SEQ.NEXTVAL, '김길동', '글3', '-', BOARD_SEQ.CURRVAL, 0,0,'192.168.10.31');
-- bid 조회수 올리기
UPDATE BOARD SET BHIT = BHIT + 1 WHERE BID=1;
-- 글 상세보기 (bid로 dto 가져오기)
SELECT * FROM BOARD WHERE BID = 1;
-- 답변글 쓰기 전 step A : 1번글의 답변글 쓸 예정 
SELECT * FROM BOARD WHERE BGROUP =1; -- 1번 GROUP 출력 
UPDATE BOARD SET BSTEP = BSTEP+1 WHERE BGROUP='1' AND BSTEP>0;
-- 답변글 쓰기
INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
    VALUES(BOARD_SEQ.NEXTVAL, '홍답', '글1-2',NULL, 1, 1,1,'192.1.1.1');
-- 글 수정
UPDATE BOARD SET BNAME = '김김김',
                 BTITLE ='좋은글',
                 BCONTENT='본문입니다',
                 BIP = '180.05.05.05'
                 WHERE BID=2;
                 
-- 글 삭제 
DELETE FROM BOARD WHERE BID=2;














