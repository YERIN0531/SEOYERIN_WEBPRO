-- [VIII] SEQUENCE : ������ȣ ������, ��κ� �������� PK ��� �뵵 
DROP SEQUENCE FRIEND_SEQ;
CREATE SEQUENCE FRIEND_SEQ; --1���� ����, �ϳ��� ����, �ѵ����� ��� ���� ;
    
CREATE SEQUENCE FRIEND_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 1
    NOCACHE
    NOCYCLE;
    -- START WITH   : ����� �����Ұ��� [�Ƚᵵ��-����Ʈ��]
    -- INCREMENT BY : ������� �þ���� [�Ƚᵵ��-����Ʈ��]
    -- MAXVALUE     : ����� �þ���� 9999(4�ڸ�����)
    -- MINVALUE     : 
    -- NOCACHE      : ĳ���޸𸮿� �ƹ��� �����͵� �ȸ���� �� �ڡڡڡڡ�
    -- NOCYCLE      : (�Ⱦ���)9999���� ����� �ڵ������� 1 �ٽ� ���� �ڡ�

SELECT FRIEND_SEQ.NEXTVAL FROM DUAL; -- NEXTVAL�� �����ν� �ϳ��� ������ �� 
DROP SEQUENCE FRIEND_SEQ;

CREATE SEQUENCE FRIEND_SEQ
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;
    
DROP TABLE FRIEND;

CREATE TABLE FRIEND(
    NUM     NUMBER(4) PRIMARY KEY, --������ �̿� (MAXVALUE�� NUMBER()Ÿ�� ��ġ��Ű��)
    NAME    VARCHAR2(30) NOT NULL,
    TEL     VARCHAR2(30) UNIQUE,   --��ȣ�� ���ڿ��� , NULL�� ���, ������ ��
    ADDRESS VARCHAR2(300),
    LAST_MODIFYED DATE DEFAULT SYSDATE
    );
    
    INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS) 
        VALUES (FRIEND_SEQ.NEXTVAL, 'ȫ�浿',NULL,'����� ��걸');
        
    INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS) 
        VALUES (FRIEND_SEQ.NEXTVAL, '�ڱ浿','010-9999-9999','����� ������ �������94�� 13 ������ 402');
    
    SELECT * FROM FRIEND;
    
    INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS)
        VALUES (FRIEND_SEQ.NEXTVAL, '�ű浿', '010-8888-8888','����� ��������');
    -- ������ �ѹ� ���� �� ������ �͵� �������� �������� 
    
    SELECT FRIEND_SEQ.CURRVAL FROM DUAL; --���� ������ ��
    COMMIT;
    
-- ex. �ʱⰪ 101���� �ִ밪 999,999���� 1�� �����ϴ� test_seq �������� ���� 
CREATE SEQUENCE TEST_SEQ 
    START WITH 101
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
SELECT TEST_SEQ.CURRVAL FROM DUAL; --�������� ���� ���� ��� ���� 
SELECT TEST_SEQ.NEXTVAL FROM DUAL;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        -------------------- �ڡڡڿ��������ڡڡ� --------------------









    
    
    
    
    
    
    
    
    
    
    
    






















