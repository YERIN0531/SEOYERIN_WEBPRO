-- 테이블 & 시퀀스 drop 및 create

DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    CID     VARCHAR2(50) PRIMARY KEY,
    CPW     VARCHAR2(50) NOT NULL,
    CNAME   VARCHAR2(50) NOT NULL,
    CEMAIL  VARCHAR2(50),
    IMAGE   VARCHAR2(30) NOT NULL,
    CBIRTH  DATE         NOT NULL,
    CADDRESS VARCHAR2(250),
    CRDATE  DATE DEFAULT SYSDATE
);
SELECT * FROM MEMBER;
DROP TABLE MANAGER CASCADE CONSTRAINTS;
DROP TABLE MANAGER;
CREATE TABLE MANAGER(
    MID     VARCHAR2(50) PRIMARY KEY,
    MPW     VARCHAR2(50) NOT NULL,
    MNAME   VARCHAR2(50) NOT NULL
);

SELECT * FROM MANAGER;

DROP SEQUENCE FILE_SEQ;
DROP TABLE FILEBOARD;

CREATE SEQUENCE FILE_SEQ;
CREATE TABLE FILEBOARD(
    FNUM       NUMBER(7) PRIMARY KEY,
    CID        VARCHAR2(50) REFERENCES MEMBER(CID),
    MID        VARCHAR2(50) REFERENCES MANAGER(MID),
    FTITLE     VARCHAR2(250) NOT NULL,
    FCONTENT   VARCHAR2(4000),
    FFILENAME  VARCHAR2(50),
    FHIT       NUMBER(7)DEFAULT 0 NOT NULL,
    FRDATE     DATE DEFAULT SYSDATE NOT NULL,
    FIP        VARCHAR2(50) NOT NULL,
    FREF       NUMBER(7) NOT NULL,
    FRE_STEP   NUMBER(7) NOT NULL,
    FRE_LEVEL  NUMBER(7) NOT NULL
);
SELECT * FROM FILEBOARD;















