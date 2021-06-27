-- 접속 계정 확인
SELECT USER
FROM DUAL;
--==>> HAROOT

-- 생성된 테이블 리스트 확인
SELECT *
FROM TAB;

-- 세션 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

-- 1. TBL_ADMIN : 관리자
CREATE TABLE TBL_ADMIN
( ADMIN_CODE     VARCHAR2(30)
, ADMIN_ID       VARCHAR2(50) NOT NULL 
, ADMIN_PW       VARCHAR2(30) NOT NULL 
, ADMIN_NAME     VARCHAR2(30) NOT NULL
, ADMIN_REGDATE  DATE         DEFAULT SYSDATE
, CONSTRAINT ADMIN_CODE_PK PRIMARY KEY(ADMIN_CODE)
, CONSTRAINT ADMIN_ID_UK UNIQUE(ADMIN_ID)
);
--==>> Table TBL_ADMIN이(가) 생성되었습니다.

DESC TBL_ADMIN;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
ADMIN_CODE    NOT NULL VARCHAR2(30) 
ADMIN_ID      NOT NULL VARCHAR2(50) 
ADMIN_PW      NOT NULL VARCHAR2(30) 
ADMIN_NAME    NOT NULL VARCHAR2(30) 
ADMIN_REGDATE          DATE      
*/

INSERT INTO TBL_ADMIN(ADMIN_CODE, ADMIN_ID, ADMIN_PW, ADMIN_NAME)
VALUES ('ADMIN001', 'admin1', CRYPTPACK.ENCRYPT('0308', 'admin1'), '김아별');
INSERT INTO TBL_ADMIN(ADMIN_CODE, ADMIN_ID, ADMIN_PW, ADMIN_NAME)
VALUES ('ADMIN002', 'admin2', CRYPTPACK.ENCRYPT('0909', 'admin2'), '박나현');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_ADMIN;
--==>> 
/*
ADMIN_CODE	ADMIN_ID	ADMIN_PW	ADMIN_NAME	ADMIN_REGDATE
ADMIN001	admin1	    œ��	        김아별	    2021-06-27 15:41:27
ADMIN002	admin2	   �nȣ	        박나현	    2021-06-27 15:44:11
*/


-- 2. TBL_NOTICE_LEG : 공지 카테고리 범례
CREATE TABLE TBL_NOTICE_LEG
( NOTICE_CATE_CODE      VARCHAR2(2)
, NOTICE_CATE_CONTENT   VARCHAR2(30) NOT NULL
, CONSTRAINT NOTICELEG_CODE_PK PRIMARY KEY(NOTICE_CATE_CODE)
);
--==>> Table TBL_NOTICE_LEG이(가) 생성되었습니다.

DESC TBL_NOTICE_LEG;
--==>>
/*
이름                  널?       유형           
------------------- -------- ------------ 
NOTICE_CATE_CODE    NOT NULL VARCHAR2(2)  
NOTICE_CATE_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_NOTICE_LEG(NOTICE_CATE_CODE, NOTICE_CATE_CONTENT)
VALUES ('1', '안내');
INSERT INTO TBL_NOTICE_LEG(NOTICE_CATE_CODE, NOTICE_CATE_CONTENT)
VALUES ('2', '필독');
INSERT INTO TBL_NOTICE_LEG(NOTICE_CATE_CODE, NOTICE_CATE_CONTENT)
VALUES ('3', '공지');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM TBL_NOTICE_LEG;
--==>>
/*
NOTICE_CATE_CODE	NOTICE_CATE_CONTENT
1	                안내
2	                필독
3	                공지
*/


-- 3. TBL_BOARD_LEG : 게시글 카테고리 범례
CREATE TABLE TBL_BOARD_LEG
( BOARD_CATE_CODE       VARCHAR2(2)
, BOARD_CATE_CONTENT    VARCHAR2(30) NOT NULL
, CONSTRAINT BOARDLEG_CODE_PK PRIMARY KEY(BOARD_CATE_CODE)
);
--==>> Table TBL_BOARD_LEG이(가) 생성되었습니다.

DESC TBL_BOARD_LEG;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
BOARD_CATE_CODE    NOT NULL VARCHAR2(2)  
BOARD_CATE_CONTENT NOT NULL VARCHAR2(30)
*/

INSERT INTO TBL_BOARD_LEG(BOARD_CATE_CODE, BOARD_CATE_CONTENT)
VALUES ('1', '행사/할인정보');
INSERT INTO TBL_BOARD_LEG(BOARD_CATE_CODE, BOARD_CATE_CONTENT)
VALUES ('2', '리뷰');
INSERT INTO TBL_BOARD_LEG(BOARD_CATE_CODE, BOARD_CATE_CONTENT)
VALUES ('3', '수다');
INSERT INTO TBL_BOARD_LEG(BOARD_CATE_CODE, BOARD_CATE_CONTENT)
VALUES ('4', '중고장터');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_BOARD_LEG;
--==>>
/*
BOARD_CATE_CODE	BOARD_CATE_CONTENT
1	            행사/할인정보
2	            리뷰
3	            수다
4	            중고장터
*/


-- 4. TBL_REPORT_STATE :  신고 처리상태 범례
CREATE TABLE TBL_REPORT_STATE
( REP_STATE_CODE    VARCHAR2(2)
, REP_STATE_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT REPSTATE_CODE_PK PRIMARY KEY(REP_STATE_CODE)
);
--==>> Table TBL_REPORT_STATE이(가) 생성되었습니다.

DESC TBL_REPORT_STATE;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
REP_STATE_CODE    NOT NULL VARCHAR2(2)  
REP_STATE_CONTENT NOT NULL VARCHAR2(30)
*/

INSERT INTO TBL_REPORT_STATE(REP_STATE_CODE, REP_STATE_CONTENT)
VALUES ('1', '미처리');
INSERT INTO TBL_REPORT_STATE(REP_STATE_CODE, REP_STATE_CONTENT)
VALUES ('2', '신고해제');
INSERT INTO TBL_REPORT_STATE(REP_STATE_CODE, REP_STATE_CONTENT)
VALUES ('3', '신고확정');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM TBL_REPORT_STATE;
--==>>
/*
REP_STATE_CODE	REP_STATE_CONTENT
1	            미처리
2	            신고해제
3	            신고확정
*/


-- 5. TBL_MEMBER : 회원정보
CREATE TABLE TBL_MEMBER
( MEM_CODE      VARCHAR2(30)
, MEM_ID        VARCHAR2(50)    NOT NULL
, MEM_PW        VARCHAR2(30)    NOT NULL
, MEM_NAME      VARCHAR2(30)    NOT NULL
, MEM_BIRTH     DATE            NOT NULL
, MEM_GENDER    VARCHAR2(1)     NOT NULL
, MEM_TEL       VARCHAR2(40)    NOT NULL
, MEM_ADDR      VARCHAR2(200)   NOT NULL
, MEM_REGDATE   DATE            DEFAULT SYSDATE
, MEM_NICKNAME  VARCHAR2(20)    NOT NULL
, CONSTRAINT MEMBER_CODE_PK PRIMARY KEY(MEM_CODE)
, CONSTRAINT MEMBER_ID_UK UNIQUE(MEM_ID)
, CONSTRAINT MEMBER_NICKNAME_UK UNIQUE(MEM_NICKNAME)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

DESC TBL_MEMBER;
--==>>
/*
이름           널?       유형            
------------ -------- ------------- 
MEM_CODE     NOT NULL VARCHAR2(30)  
MEM_ID       NOT NULL VARCHAR2(50)  
MEM_PW       NOT NULL VARCHAR2(30)  
MEM_NAME     NOT NULL VARCHAR2(30)  
MEM_BIRTH    NOT NULL DATE          
MEM_GENDER   NOT NULL VARCHAR2(1)   
MEM_TEL      NOT NULL VARCHAR2(40)  
MEM_ADDR     NOT NULL VARCHAR2(200) 
MEM_REGDATE           DATE          
MEM_NICKNAME NOT NULL VARCHAR2(20)
*/

INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM001', 'joohee', CRYPTPACK.ENCRYPT('1224', 'joohee'), '정주희', TO_DATE('1997-12-24', 'YYYY-MM-DD'), 'F'
, '010-1111-1111', '경기도 광명시 철산동', TO_DATE('2021-05-24', 'YYYY-MM-DD'), '주리짱');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM002', 'hyeyeon', CRYPTPACK.ENCRYPT('1102', 'hyeyeon'), '선혜연', TO_DATE('1995-11-02', 'YYYY-MM-DD'), 'F'
, '010-2222-2222', '경기도 고양시 일산서구 주엽로98', TO_DATE('2021-06-20', 'YYYY-MM-DD'), '사공혜연');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM003', 'harim', CRYPTPACK.ENCRYPT('1022', 'harim'), '이하림', TO_DATE('1997-10-22', 'YYYY-MM-DD'), 'F'
, '010-3333-3333', '서울 금천구 가산동', TO_DATE('2021-06-01', 'YYYY-MM-DD'), '뚜또집사');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM004', 'hojin', CRYPTPACK.ENCRYPT('0302', 'hojin'), '김호진', TO_DATE('1975-03-02', 'YYYY-MM-DD'), 'M'
, '010-4444-4444', '경기도 광명시 철산동', TO_DATE('2021-05-24', 'YYYY-MM-DD'), '나는야호진이');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM005', 'iu', CRYPTPACK.ENCRYPT('0516', 'iu'), '이지은', TO_DATE('1993-05-16', 'YYYY-MM-DD'), 'F'
, '010-5555-5555', '서울 마포구 공덕동', TO_DATE('2021-05-31', 'YYYY-MM-DD'), '이유짱');
--==>> 1 행 이(가) 삽입되었습니다. * 5

SELECT MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, TO_CHAR(MEM_BIRTH, 'YYYY-MM-DD') "MEM_BIRTH"
     , MEM_GENDER, MEM_TEL, MEM_ADDR, TO_CHAR(MEM_REGDATE, 'YYYY-MM-DD') "MEM_REGDATE", MEM_NICKNAME
FROM TBL_MEMBER;
--==>>
/*
MEM_CODE	MEM_ID	MEM_PW	MEM_NAME	MEM_BIRTH	MEM_GENDER	MEM_TEL	        MEM_ADDR	                MEM_REGDATE	    MEM_NICKNAME
MEM001	    joohee	"nb��	정주희	    1997-12-24	F	        010-1111-1111	경기도 광명시 철산동	            2021-05-24	    주리짱
MEM002	    hyeyeon	3F&��3F	선혜연	    1995-11-02	F	        010-2222-2222	경기도 고양시 일산서구 주엽로98	    2021-06-20	    사공혜연
MEM003	    harim	-0��_؋�	이하림	    1997-10-22	F	        010-3333-3333	서울 금천구 가산동	            2021-06-01	    뚜또집사
MEM004	    hojin	>Y��	김호진	    1975-03-02	M	        010-4444-4444	경기도 광명시 철산동	            2021-05-24	    나는야호진이
MEM005	    iu	    9Ł��	이지은	    1993-05-16	F	        010-5555-5555	서울 마포구 공덕동	            2021-05-31	    이유짱
*/

-- 6. TBL_SID : 회원 (TBL_MEMBER 참조해옴)
CREATE TABLE TBL_SID
( SID_CODE  VARCHAR2(30)
, MEM_CODE  VARCHAR2(30) NOT NULL
, CONSTRAINT SID_CODE_PK PRIMARY KEY(SID_CODE)
, CONSTRAINT SID_MEMCODE_FK FOREIGN KEY(MEM_CODE)
             REFERENCES TBL_MEMBER(MEM_CODE)
);
--==>> Table TBL_SID이(가) 생성되었습니다.

DESC TBL_SID;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
SID_CODE NOT NULL VARCHAR2(30) 
MEM_CODE NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID001', 'MEM001');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID002', 'MEM002');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID003', 'MEM003');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID004', 'MEM004');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID005', 'MEM005');

SELECT *
FROM TBL_SID;
--==>>
/*
SID_CODE	MEM_CODE
SID001	    MEM001
SID002	    MEM002
SID003	    MEM003
SID004	    MEM004
SID005	    MEM005
*/


-- [탈퇴 관련]
--> 탈퇴 시 처리 순서
--> 1. TBL_OUT 에 SID_CODE, OUT_TYPE_CODE 참조해와서 INSERT
--> 2. TBL_SELF_OUT 또는 TBL_BAN 에 회원정보테이블에서 NAME, ID, TEL 가져와서 INSERT
--> 3. TBL_MEMBER 에서 해당 회원 DELETE 

-- 7. TBL_OUT_TYPE : 탈퇴 유형
CREATE TABLE TBL_OUT_TYPE
( OUT_TYPE_CODE     VARCHAR2(2)
, OUT_TYPE_CONTENT  VARCHAR2(30) NOT NULL
, CONSTRAINT OUTTYPE_CODE_PK PRIMARY KEY(OUT_TYPE_CODE)
);
--==>> Table TBL_OUT_TYPE이(가) 생성되었습니다.

DESC TBL_OUT_TYPE;
--==>>
/*
이름               널?       유형           
---------------- -------- ------------ 
OUT_TYPE_CODE    NOT NULL VARCHAR2(2)  
OUT_TYPE_CONTENT NOT NULL VARCHAR2(30)  
*/

INSERT INTO TBL_OUT_TYPE(OUT_TYPE_CODE, OUT_TYPE_CONTENT)
VALUES ('1', '자진탈퇴');
INSERT INTO TBL_OUT_TYPE(OUT_TYPE_CODE, OUT_TYPE_CONTENT)
VALUES ('2', '강제탈퇴');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_OUT_TYPE;
--==>>
/*
OUT_TYPE_CODE	OUT_TYPE_CONTENT
1	            자진탈퇴
2	            강제탈퇴
*/

-- 8. TBL_OUT : 회원 탈퇴
CREATE TABLE TBL_OUT
( OUT_CODE      VARCHAR2(30)
, SID_CODE      VARCHAR2(30) NOT NULL
, OUT_TYPE_CODE VARCHAR2(30) NOT NULL
, OUT_DATE      DATE         DEFAULT SYSDATE
, CONSTRAINT OUT_CODE_PK PRIMARY KEY(OUT_CODE)
, CONSTRAINT OUT_SIDCODE_FK FOREIGN KEY(SID_CODE)
             REFERENCES TBL_SID(SID_CODE)
, CONSTRAINT OUT_TYPECODE_FK FOREIGN KEY(OUT_TYPE_CODE)
             REFERENCES TBL_OUT_TYPE(OUT_TYPE_CODE)
);
--==>> Table TBL_OUT이(가) 생성되었습니다.

DESC TBL_OUT;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
OUT_CODE      NOT NULL VARCHAR2(30) 
SID_CODE      NOT NULL VARCHAR2(30) 
OUT_TYPE_CODE NOT NULL VARCHAR2(30) 
OUT_DATE               DATE     
*/


-- 9. TBL_SELF_OUT : 자진탈퇴 체크
CREATE TABLE TBL_SELF_OUT
( SELF_OUT_CODE    VARCHAR2(30)
, SELF_OUT_ID      VARCHAR2(50) NOT NULL
, CONSTRAINT SELFOUT_CODE_PK PRIMARY KEY(SELF_OUT_CODE)
, CONSTRAINT SELFOUT_ID_UK UNIQUE(SELF_OUT_ID)
);
--==>> Table TBL_SELF_OUT이(가) 생성되었습니다.

DESC TBL_SELF_OUT;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
SELF_OUT_CODE NOT NULL VARCHAR2(30) 
SELF_OUT_ID   NOT NULL VARCHAR2(50)
*/
