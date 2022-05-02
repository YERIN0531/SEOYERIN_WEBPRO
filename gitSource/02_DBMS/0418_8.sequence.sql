-- [VIII] SEQUENCE : 순차번호 생성기, 대부분 인위적인 PK 사용 용도 
DROP SEQUENCE FRIEND_SEQ;
CREATE SEQUENCE FRIEND_SEQ; --1부터 시작, 하나씩 증가, 한도없이 계속 증가 ;
    
CREATE SEQUENCE FRIEND_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 1
    NOCACHE
    NOCYCLE;
    -- START WITH   : 몇부터 시작할건지 [안써도됨-디폴트임]
    -- INCREMENT BY : 몇단위로 늘어날건지 [안써도됨-디폴트임]
    -- MAXVALUE     : 몇까지 늘어날건지 9999(4자리까지)
    -- MINVALUE     : 
    -- NOCACHE      : 캐쉬메모리에 아무런 데이터도 안만드는 것 ★★★★★
    -- NOCYCLE      : (안쓰면)9999까지 만들고 자동적으로 1 다시 생성 ★★

SELECT FRIEND_SEQ.NEXTVAL FROM DUAL; -- NEXTVAL을 함으로써 하나씩 증가가 됨 
DROP SEQUENCE FRIEND_SEQ;

CREATE SEQUENCE FRIEND_SEQ
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;
    
DROP TABLE FRIEND;

CREATE TABLE FRIEND(
    NUM     NUMBER(4) PRIMARY KEY, --시퀀스 이용 (MAXVALUE와 NUMBER()타입 일치시키기)
    NAME    VARCHAR2(30) NOT NULL,
    TEL     VARCHAR2(30) UNIQUE,   --번호는 문자열로 , NULL을 허용, 유일한 값
    ADDRESS VARCHAR2(300),
    LAST_MODIFYED DATE DEFAULT SYSDATE
    );
    
    INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS) 
        VALUES (FRIEND_SEQ.NEXTVAL, '홍길동',NULL,'서울시 용산구');
        
    INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS) 
        VALUES (FRIEND_SEQ.NEXTVAL, '박길동','010-9999-9999','서울시 강남구 강남대로94길 13 삼겸빌딩 402');
    
    SELECT * FROM FRIEND;
    
    INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS)
        VALUES (FRIEND_SEQ.NEXTVAL, '신길동', '010-8888-8888','서울시 영등포구');
    -- 에러를 한번 내면 그 에러난 것도 시퀀스로 잡혀버림 
    
    SELECT FRIEND_SEQ.CURRVAL FROM DUAL; --현재 시퀀스 값
    COMMIT;
    
-- ex. 초기값 101부터 최대값 999,999까지 1씩 증가하는 test_seq 시퀀스를 생성 
CREATE SEQUENCE TEST_SEQ 
    START WITH 101
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
SELECT TEST_SEQ.CURRVAL FROM DUAL; --시퀀스의 현재 값이 없어서 에러 
SELECT TEST_SEQ.NEXTVAL FROM DUAL;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- ★★★연습문제★★★ --------------------









    
    
    
    
    
    
    
    
    
    
    
    






















