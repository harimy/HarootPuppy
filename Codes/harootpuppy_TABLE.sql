-- 접속 계정 확인
SELECT USER
FROM DUAL;
--==>> HAROOTPUPPY

-- 생성된 테이블 리스트 확인
SELECT *
FROM TAB;

-- 세션 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- 01. TBL_ADMIN : 관리자
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
VALUES ('ADM001', 'admin1', CRYPTPACK.ENCRYPT('0308', 'admin1'), '김아별');
INSERT INTO TBL_ADMIN(ADMIN_CODE, ADMIN_ID, ADMIN_PW, ADMIN_NAME)
VALUES ('ADM002', 'admin2', CRYPTPACK.ENCRYPT('0909', 'admin2'), '박나현');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_ADMIN;
--==>> 
/*
ADMIN_CODE	ADMIN_ID	ADMIN_PW	ADMIN_NAME	ADMIN_REGDATE
ADMIN001	admin1	    œ��	        김아별	    2021-06-27 15:41:27
ADMIN002	admin2	   �nȣ	        박나현	    2021-06-27 15:44:11
*/


-- 02. TBL_NOTICE_LEG : 공지 카테고리 범례
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


-- 03. TBL_BOARD_LEG : 게시글 카테고리 범례
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


-- 04. TBL_REPORT_STATE :  신고 처리상태 범례
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


-- 05. TBL_MEMBER : 회원정보
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
, MEM_NICKNAME  VARCHAR2(50)    NOT NULL
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
MEM_NICKNAME NOT NULL VARCHAR2(50)
*/

-- 데이터 입력
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

-- 닉네임 컬럼 타입 변경 VARCHAR2(20) -> VARCHAR2(50)
--ALTER TABLE TBL_MEMBER MODIFY MEM_NICKNAME VARCHAR2(50);

-- 추가 데이터 입력
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM006', 'hyerim', CRYPTPACK.ENCRYPT('1006', 'hyerim'), '한혜림', TO_DATE('1997-10-06', 'YYYY-MM-DD'), 'F'
, '010-6666-6666', '경기도 수원시 세류동', TO_DATE('2021-06-19', 'YYYY-MM-DD'), '혜림냥냥');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM007', 'dongwon', CRYPTPACK.ENCRYPT('0118', 'dongwon'), '강동원', TO_DATE('1981-01-18', 'YYYY-MM-DD'), 'M'
, '010-7777-7777', '경상남도 거창군 거창읍', TO_DATE('2021-06-20', 'YYYY-MM-DD'), '맛있는참치');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM008', 'kangjun', CRYPTPACK.ENCRYPT('1012', 'kangjun'), '서강준', TO_DATE('1993-10-12', 'YYYY-MM-DD'), 'M'
, '010-8888-8888', '서울 강남구 자곡동', TO_DATE('2021-06-22', 'YYYY-MM-DD'), '바싹말린강준');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM009', 'moonbin', CRYPTPACK.ENCRYPT('0126', 'moonbin'), '문빈', TO_DATE('1998-01-26', 'YYYY-MM-DD'), 'M'
, '010-9999-9999', '인천 연수구 송도동', TO_DATE('2021-06-23', 'YYYY-MM-DD'), '니가내별이다');
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('MEM010', 'eunwoo', CRYPTPACK.ENCRYPT('0330', 'eunwoo'), '차은우', TO_DATE('1997-03-30', 'YYYY-MM-DD'), 'M'
, '010-1997-0330', '경기도 군포시 수리산로 37', TO_DATE('2021-06-26', 'YYYY-MM-DD'), '연기연습하는은우');

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

-- 06. TBL_SID : 회원 (TBL_MEMBER 참조해옴)
CREATE TABLE TBL_SID
( SID_CODE  VARCHAR2(30)
, MEM_CODE  VARCHAR2(30)
, CONSTRAINT SID_CODE_PK PRIMARY KEY(SID_CODE)
, CONSTRAINT SID_MEMCODE_FK FOREIGN KEY(MEM_CODE)
             REFERENCES TBL_MEMBER(MEM_CODE)
             ON DELETE SET NULL
);
--==>> Table TBL_SID이(가) 생성되었습니다.

-- MEM_CODE NOT NULL 제약사항 제거
--> TBL_MEMBER 에서 삭제되면 NULL 값이 되기 때문에
--ALTER TABLE TBL_SID MODIFY MEM_CODE NULL;

DESC TBL_SID;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
SID_CODE NOT NULL VARCHAR2(30) 
MEM_CODE NOT NULL VARCHAR2(30) 
*/

-- 데이터 입력
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
--==>> 1 행 이(가) 삽입되었습니다. * 5

-- 추가 데이터 입력
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID006', 'MEM006');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID007', 'MEM007');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID008', 'MEM008');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID009', 'MEM009');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES ('SID010', 'MEM010');
--==>> 1 행 이(가) 삽입되었습니다. * 5

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

COMMIT;

-- [탈퇴 관련]
--> 탈퇴 시 처리 순서
--> 1. TBL_OUT 에 SID_CODE, OUT_TYPE_CODE 참조해와서 INSERT
--> 2. TBL_SELF_OUT 또는 TBL_BAN 에 회원정보테이블에서 NAME, ID, TEL 가져와서 INSERT
--> 3. TBL_MEMBER 에서 해당 회원 DELETE 

-- 07. TBL_OUT_TYPE : 탈퇴 유형
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

-- 08. TBL_OUT : 회원 탈퇴
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


-- 09. TBL_SELF_OUT : 자진탈퇴 체크
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


-- 10. TBL_BAN : 강제탈퇴체크
CREATE TABLE TBL_BAN
( BAN_CODE  VARCHAR2(30)
, BAN_NAME  VARCHAR2(30) NOT NULL
, BAN_ID    VARCHAR2(50) NOT NULL
, BAN_TEL   VARCHAR2(40) NOT NULL
, CONSTRAINT BAN_CODE_PK PRIMARY KEY(BAN_CODE)
);
--==>> Table TBL_BAN이(가) 생성되었습니다.

DESC TBL_BAN;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
BAN_CODE NOT NULL VARCHAR2(30) 
BAN_NAME NOT NULL VARCHAR2(30) 
BAN_ID   NOT NULL VARCHAR2(50) 
BAN_TEL  NOT NULL VARCHAR2(40) 
*/

-- 탈퇴한 회원 데이터 삽입
-- [강제 탈퇴]
-- 탈퇴 테이블에 SID_CODE, OUT_TYPE_CODE 참조해서 데이터 INSERT
INSERT INTO TBL_OUT(OUT_CODE, SID_CODE, OUT_TYPE_CODE)
VALUES ('OUT001', 'SID004', '2');
--==>> 1 행 이(가) 삽입되었습니다.
SELECT *
FROM TBL_OUT;
--==>> OUT001	SID004	2	2021-06-28 00:06:42

-- 강제 탈퇴 테이블에 이름, 아이디, 전화번호 INSERT
INSERT INTO TBL_BAN(BAN_CODE, BAN_NAME, BAN_ID, BAN_TEL)
VALUES ('BAN001', '김호진', 'hojin', '010-4444-4444');
--==>> 1 행 이(가) 삽입되었습니다.
SELECT *
FROM TBL_BAN;
--==>> BAN001	김호진	hojin	010-4444-4444

-- 회원 정보 테이블에서 해당 회원 DELETE
DELETE
FROM TBL_MEMBER
WHERE MEM_CODE = 'MEM004';
--==>> 1 행 이(가) 삭제되었습니다.
SELECT *
FROM TBL_MEMBER;
--==>>
/*
MEM_CODE	MEM_ID	MEM_PW	MEM_NAME	MEM_BIRTH	MEM_GENDER	MEM_TEL	        MEM_ADDR	            MEM_REGDATE	MEM_NICKNAME
MEM001	    joohee	"nb��	정주희	    1997-12-24	F	        010-1111-1111	경기도 광명시 철산동	        2021-05-24 	주리짱
MEM002	    hyeyeon	3F&��3F	선혜연	    1995-11-02	F	        010-2222-2222	경기도 고양시 일산서구 주엽로98	2021-06-20  사공혜연
MEM003	    harim	-0��_؋�	이하림	    1997-10-22 	F	        010-3333-3333	서울 금천구 가산동	        2021-06-01  뚜또집사
MEM005	    iu	    9Ł��	이지은	    1993-05-16	F	        010-5555-5555	서울 마포구 공덕동	        2021-05-31  이유짱
*/
SELECT *
FROM TBL_SID;
--==>>
/*
SID001	MEM001
SID002	MEM002
SID003	MEM003
SID004	(null)
SID005	MEM005
*/

-- [자진 탈퇴]
-- 탈퇴 테이블 SID_CODE, OUT_TYPE_CODE 참조해서 데이터 INSERT
INSERT INTO TBL_OUT(OUT_CODE, SID_CODE, OUT_TYPE_CODE)
VALUES ('OUT002', 'SID005', '1');
--==>> 1 행 이(가) 삽입되었습니다.
SELECT *
FROM TBL_OUT;
--==>>
/*
OUT001	SID004	2	2021-06-28 00:06:42
OUT002	SID005	1	2021-06-28 00:54:24
*/

-- 자진 탈퇴 테이블에 이름, 아이디, 전화번호 INSERT
INSERT INTO TBL_SELF_OUT(SELF_OUT_CODE, SELF_OUT_ID)
VALUES ('SEL001', 'iu');
--==>> 1 행 이(가) 삽입되었습니다.

-- 회원 정보 테이블에서 해당 회원 DELETE
DELETE
FROM TBL_MEMBER
WHERE MEM_CODE='MEM005';
--==>> 1 행 이(가) 삽입되었습니다.


-- 11. TBL_FAQ : 자주하는 질문
CREATE TABLE TBL_FAQ
( FAQ_CODE      VARCHAR2(30)
, FAQ_TITLE     VARCHAR2(100) NOT NULL
, FAQ_CONTENT   VARCHAR2(4000) NOT NULL
, CONSTRAINT FAQ_CODE_PK PRIMARY KEY(FAQ_CODE)
);
--==>> Table TBL_FAQ이(가) 생성되었습니다.

DESC TBL_FAQ;
--==>>
/*
이름          널?       유형             
----------- -------- -------------- 
FAQ_CODE    NOT NULL VARCHAR2(30)   
FAQ_TITLE   NOT NULL VARCHAR2(100)  
FAQ_CONTENT NOT NULL VARCHAR2(4000) 
*/


-- 12. TBL_ASK_LEG : 문의 카테고리
CREATE TABLE TBL_ASK_LEG
( ASK_CATE_CODE     VARCHAR2(30)
, ASK_CATE_CONTENT  VARCHAR2(30) NOT NULL
, CONSTRAINT ASKLEG_CODE_PK PRIMARY KEY(ASK_CATE_CODE)
);
--==>> Table TBL_ASK_LEG이(가) 생성되었습니다.

DESC TBL_ASK_LEG;
--==>>
/*
이름               널?       유형           
---------------- -------- ------------ 
ASK_CATE_CODE    NOT NULL VARCHAR2(30) 
ASK_CATE_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_ASK_LEG(ASK_CATE_CODE, ASK_CATE_CONTENT)
VALUES ('1', '산책메이트');
INSERT INTO TBL_ASK_LEG(ASK_CATE_CODE, ASK_CATE_CONTENT)
VALUES ('2', '다이어리');
INSERT INTO TBL_ASK_LEG(ASK_CATE_CODE, ASK_CATE_CONTENT)
VALUES ('3', '게시판');
INSERT INTO TBL_ASK_LEG(ASK_CATE_CODE, ASK_CATE_CONTENT)
VALUES ('4', '계정');
INSERT INTO TBL_ASK_LEG(ASK_CATE_CODE, ASK_CATE_CONTENT)
VALUES ('5', '기타');
--==>> 1 행 이(가) 삽입되었습니다. * 5

SELECT *
FROM TBL_ASK_LEG;
--==>>
/*
1	산책메이트
2	다이어리
3	게시판
4	계정
5	기타
*/

-- 13. TBL_ASK_STATE : 문의처리상태
CREATE TABLE TBL_ASK_STATE
( ASK_STATE_CODE    VARCHAR2(2)
, ASK_STATE_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT ASKSTATE_CODE_PK PRIMARY KEY(ASK_STATE_CODE)
);
--==>> Table TBL_ASK_STATE이(가) 생성되었습니다.

DESC TBL_ASK_STATE;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
ASK_STATE_CODE    NOT NULL VARCHAR2(2)  
ASK_STATE_CONTENT NOT NULL VARCHAR2(30) 
*/

--ALTER TABLE TBL_ASK_STATE MODIFY ASK_STATE_CONTENT VARCHAR2(30);

INSERT INTO TBL_ASK_STATE(ASK_STATE_CODE, ASK_STATE_CONTENT)
VALUES ('1', '미처리');
INSERT INTO TBL_ASK_STATE(ASK_STATE_CODE, ASK_STATE_CONTENT)
VALUES ('2', '답변완료');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_ASK_STATE;
--==>> 
/*
1	미처리
2	답변완료
*/

COMMIT;
--==>> 커밋 완료.


-- 14. TBL_REWARD : 상벌점
CREATE TABLE TBL_REWARD
( REWARD_CODE    VARCHAR2(2)
, REWARD_SCORE   NUMBER(3) NOT NULL
, REWARD_CONTENT VARCHAR2(100) NOT NULL
, CONSTRAINT REWARD_CODE_PK PRIMARY KEY(REWARD_CODE)
);
--==>> Table TBL_REWARD이(가) 생성되었습니다.

DESC TBL_REWARD;
--==>>
/*
이름             널?       유형            
-------------- -------- ------------- 
REWARD_CODE    NOT NULL VARCHAR2(2)   
REWARD_SCORE   NOT NULL NUMBER(3)     
REWARD_CONTENT NOT NULL VARCHAR2(100) 
*/

INSERT INTO TBL_REWARD(REWARD_CODE, REWARD_SCORE, REWARD_CONTENT)
VALUES ('1', -7, '방장이 30분 전까지 매칭완료 하지 않은 경우');
INSERT INTO TBL_REWARD(REWARD_CODE, REWARD_SCORE, REWARD_CONTENT)
VALUES ('2', -7, '방장이 최종 매칭 전 방을 나간 경우');
INSERT INTO TBL_REWARD(REWARD_CODE, REWARD_SCORE, REWARD_CONTENT)
VALUES ('3', -10, '방장이 최종 매칭 완료 후 방을 나간 경우');
INSERT INTO TBL_REWARD(REWARD_CODE, REWARD_SCORE, REWARD_CONTENT)
VALUES ('4', -5, '참여자가 매칭 완료 후 방을 나간 경우');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_REWARD;

-- 15. TBL_REPORT_TYPE : 신고유형 
CREATE TABLE TBL_REPORT_TYPE
( REP_TYPE_CODE     VARCHAR2(2)
, REP_TYPE_CONTENT  VARCHAR2(100) NOT NULL
, CONSTRAINT REPORTTYPE_CODE_PK PRIMARY KEY(REP_TYPE_CODE)
);
--==>> Table TBL_REPORT_TYPE이(가) 생성되었습니다.

--ALTER TABLE TBL_REPORT_TYPE MODIFY REP_TYPE_CODE VARCHAR2(2);

DESC TBL_REPORT_TYPE;
--==>>
/*
이름               널?       유형            
---------------- -------- ------------- 
REP_TYPE_CODE    NOT NULL VARCHAR2(2)   
REP_TYPE_CONTENT NOT NULL VARCHAR2(100) 
*/



INSERT INTO TBL_REPORT_TYPE(REP_TYPE_CODE, REP_TYPE_CONTENT)
VALUES ('1', '게시글');
INSERT INTO TBL_REPORT_TYPE(REP_TYPE_CODE, REP_TYPE_CONTENT)
VALUES ('2', '댓글');
INSERT INTO TBL_REPORT_TYPE(REP_TYPE_CODE, REP_TYPE_CONTENT)
VALUES ('3', '산책방');
INSERT INTO TBL_REPORT_TYPE(REP_TYPE_CODE, REP_TYPE_CONTENT)
VALUES ('4', '오프라인');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_REPORT_TYPE;
--==>>
/*
1	게시글
2	댓글
3	산책방
4	오프라인
*/


-- 16. TBL_AUTO_LEG : 자동확정옵션 범례
CREATE TABLE TBL_AUTO_LEG
( AUTO_CODE    VARCHAR2(2)
, AUTO_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT AUTOLEG_CODE_PK PRIMARY KEY(AUTO_CODE)
);
--==>> Table TBL_AUTO_LEG이(가) 생성되었습니다.

DESC TBL_AUTO_LEG;
--==>>
/*
이름           널?       유형           
------------ -------- ------------ 
AUTO_CODE    NOT NULL VARCHAR2(2)  
AUTO_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_AUTO_LEG(AUTO_CODE, AUTO_CONTENT)
VALUES ('0', '자동확정 사용안함');
INSERT INTO TBL_AUTO_LEG(AUTO_CODE, AUTO_CONTENT)
VALUES ('1', '자동확정 사용함');

SELECT *
FROM TBL_AUTO_LEG;
--==>>
/*
0	자동확정 사용안함
1	자동확정 사용함
*/


-- 17. TBL_STYLE_LEG : 산책 스타일 범례
CREATE TABLE TBL_STYLE_LEG
( STYLE_CODE    VARCHAR2(2)
, STYLE_CONTENT VARCHAR2(100) NOT NULL
, CONSTRAINT STYLELEG_CODE_PK PRIMARY KEY(STYLE_CODE)
);
--==>> Table TBL_STYLE_LEG이(가) 생성되었습니다.

DESC TBL_STYLE_LEG;
--==>>
/*
이름            널?       유형            
------------- -------- ------------- 
STYLE_CODE    NOT NULL VARCHAR2(2)   
STYLE_CONTENT NOT NULL VARCHAR2(100) 
*/

INSERT INTO TBL_STYLE_LEG(STYLE_CODE, STYLE_CONTENT)
VALUES ('1', '가까운 주변을 구석구석 산책해요');
INSERT INTO TBL_STYLE_LEG(STYLE_CODE, STYLE_CONTENT)
VALUES ('2', '활기차게 뛰어다녀요');
INSERT INTO TBL_STYLE_LEG(STYLE_CODE, STYLE_CONTENT)
VALUES ('3', '느긋하게 쉬어가며 산책해요');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_STYLE_LEG;
--==>>
/*
1	가까운 주변을 구석구석 산책해요
2	활기차게 뛰어다녀요
3	느긋하게 쉬어가며 산책해요
*/


-- 18. TBL_BITE_LEG : 입질 여부 범례
CREATE TABLE TBL_BITE_LEG
( BITE_CODE    VARCHAR2(2)
, BITE_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT BITELEG_CODE_PK PRIMARY KEY(BITE_CODE)
);
--==>> Table TBL_BITE_LEG이(가) 생성되었습니다.

DESC TBL_BITE_LEG;
--==>>
/*
이름           널?       유형           
------------ -------- ------------ 
BITE_CODE    NOT NULL VARCHAR2(2)  
BITE_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_BITE_LEG(BITE_CODE, BITE_CONTENT)
VALUES ('0', '입질 없음');
INSERT INTO TBL_BITE_LEG(BITE_CODE, BITE_CONTENT)
VALUES ('1', '입질 있음');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_BITE_LEG;
--==>>
/*
0	입질 없음
1	입질 있음
*/


-- 19. TBL_DESEX_LEG : 중성화여부 범례
CREATE TABLE TBL_DESEX_LEG
( DESEX_CODE    VARCHAR2(2)
, DESEX_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT DESEXLEG_CODE_PK PRIMARY KEY(DESEX_CODE)
);
--==>> Table TBL_DESEX_LEG이(가) 생성되었습니다.

DESC TBL_DESEX_LEG;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
DESEX_CODE    NOT NULL VARCHAR2(2)  
DESEX_CONTENT NOT NULL VARCHAR2(30)
*/

INSERT INTO TBL_DESEX_LEG(DESEX_CODE, DESEX_CONTENT)
VALUES ('0', '중성화 미완료');
INSERT INTO TBL_DESEX_LEG(DESEX_CODE, DESEX_CONTENT)
VALUES ('1', '중성화 완료');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_DESEX_LEG;
--==>>
/*
0	중성화 미완료
1	중성화 완료
*/

-- 20. TBL_SAMESEX_LEG : 동일성별여부 범례
CREATE TABLE TBL_SAMESEX_LEG
( SAMESEX_CODE    VARCHAR2(2)
, SAMESEX_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT SAMESEXLEG_CODE_PK PRIMARY KEY(SAMESEX_CODE)
);
--==>> Table TBL_SAMESEX_LEG이(가) 생성되었습니다.

DESC TBL_SAMESEX_LEG;
--==>>
/*
이름              널?       유형           
--------------- -------- ------------ 
SAMESEX_CODE    NOT NULL VARCHAR2(2)  
SAMESEX_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_SAMESEX_LEG(SAMESEX_CODE, SAMESEX_CONTENT)
VALUES ('0', '상관없음');
INSERT INTO TBL_SAMESEX_LEG(SAMESEX_CODE, SAMESEX_CONTENT)
VALUES ('1', '동일성별만');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_SAMESEX_LEG;
--==>>
/*
0	상관없음
1	동일성별만
*/


-- 21. TBL_EVAL_ITEM : 산책평가항목
CREATE TABLE TBL_EVAL_ITEM
( EV_ITEM_CODE      VARCHAR2(2)
, EV_ITEM_CONTENT   VARCHAR2(300) NOT NULL
, CONSTRAINT EVALITEM_CODE_PK PRIMARY KEY(EV_ITEM_CODE)
);
--==>> Table TBL_EVAL_ITEM이(가) 생성되었습니다.

DESC TBL_EVAL_ITEM;
--==>>
/*
이름              널?       유형            
--------------- -------- ------------- 
EV_ITEM_CODE    NOT NULL VARCHAR2(2)   
EV_ITEM_CONTENT NOT NULL VARCHAR2(300) 
*/

INSERT INTO TBL_EVAL_ITEM(EV_ITEM_CODE, EV_ITEM_CONTENT)
VALUES ('1', '친절하고 매너가 좋았나요?');
INSERT INTO TBL_EVAL_ITEM(EV_ITEM_CODE, EV_ITEM_CONTENT)
VALUES ('2', '시간 약속은 잘 지켰나요?');
INSERT INTO TBL_EVAL_ITEM(EV_ITEM_CODE, EV_ITEM_CONTENT)
VALUES ('3', '반려견 케어는 잘 했나요?');
INSERT INTO TBL_EVAL_ITEM(EV_ITEM_CODE, EV_ITEM_CONTENT)
VALUES ('4', '응답이 빨랐나요?');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_EVAL_ITEM;
--==>>
/*
1	친절하고 매너가 좋았나요?
2	시간 약속은 잘 지켰나요?
3	반려견 케어는 잘 했나요?
4	응답이 빨랐나요?
*/

-- 22. TBL_READYOPTION_LEG : 레디옵션 범례
CREATE TABLE TBL_READYOPTION_LEG
( READYOPTION_CODE      VARCHAR2(2)
, READYOPTION_CONTENT   VARCHAR2(30) NOT NULL
, CONSTRAINT READYOPTIONLEG_CODE_PK PRIMARY KEY(READYOPTION_CODE)
);
--==>> Table TBL_READYOPTION_LEG이(가) 생성되었습니다.

DESC TBL_READYOPTION_LEG;
--==>>
/*
이름                  널?       유형           
------------------- -------- ------------ 
READYOPTION_CODE    NOT NULL VARCHAR2(2)  
READYOPTION_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_READYOPTION_LEG(READYOPTION_CODE, READYOPTION_CONTENT)
VALUES('0', '레디고정 사용안함');
INSERT INTO TBL_READYOPTION_LEG(READYOPTION_CODE, READYOPTION_CONTENT)
VALUES('1', '레디고정 사용함');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_READYOPTION_LEG;
--==>> 
/*
0	레디고정 사용안함
1	레디고정 사용함
*/ 


-- 23.
CREATE TABLE TBL_READYSTATE_LEG
( READYSTATE_CODE       VARCHAR2(2)
, READYSTATE_CONTENT    VARCHAR2(30) NOT NULL
, CONSTRAINT READYSTATELEG_CODE_PK PRIMARY KEY(READYSTATE_CODE)
);
--==>> Table TBL_READYSTATE_LEG이(가) 생성되었습니다.

DESC TBL_READYSTATE_LEG;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
READYSTATE_CODE    NOT NULL VARCHAR2(2)  
READYSTATE_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_READYSTATE_LEG(READYSTATE_CODE, READYSTATE_CONTENT)
VALUES('0', '레디 안함');
INSERT INTO TBL_READYSTATE_LEG(READYSTATE_CODE, READYSTATE_CONTENT)
VALUES('1', '레디 함');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_READYSTATE_LEG;
--==>>
/*
0	레디 안함
1	레디 함
*/


-- 24. TBL_PET_TYPE : 품종
CREATE TABLE TBL_PET_TYPE
( PET_TYPE_CODE VARCHAR2(30)
, PET_TYPE_NAME VARCHAR2(50) NOT NULL
, PET_TYPE_SIZE VARCHAR2(10) NOT NULL
, CONSTRAINT PETTYPE_CODE_PK PRIMARY KEY(PET_TYPE_CODE)
, CONSTRAINT PETTYPE_NAME_UK UNIQUE(PET_TYPE_NAME)
);
--==>> Table TBL_PET_TYPE이(가) 생성되었습니다.

DESC TBL_PET_TYPE;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
PET_TYPE_CODE NOT NULL VARCHAR2(30) 
PET_TYPE_NAME NOT NULL VARCHAR2(50) 
PET_TYPE_SIZE NOT NULL VARCHAR2(10) 
*/

INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY001', '포메라니안', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY002', '말티즈', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY003', '토이푸들', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY004', '시츄', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY005', '미니핀', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY006', '파피용', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY007', '페키니즈', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY008', '요크셔테리어', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY009', '치와와', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY010', '미니어쳐 슈나우저', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY011', '비숑 프리제', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY012', '퍼그', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY013', '프렌치불독', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY014', '저먼 스피츠', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY015', '폼피츠', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY016', '말티푸', '소형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY017', '닥스훈트', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY018', '보더콜리', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY019', '시베리안 허스키', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY020', '콜리', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY021', '복서', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY022', '스탠다드 푸들', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY023', '비글', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY024', '셔틀랜드 쉽독', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY025', '코카 스파니엘', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY026', '불독', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY027', '스탠다드 슈나우저', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY028', '시바견', '중형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY029', '달마시안', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY030', '차우차우', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY031', '삽살개', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY032', '핏불테리어', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY033', '사모예드', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY034', '아프간 하운드', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY035', '알래스칸 맬러뮤트', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY036', '벨지안 쉽독', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY037', '보르조이', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY038', '불테리어', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY039', '래브라도 리트리버', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY040', '그레이 하운드', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY041', '올드 잉글리쉬 쉽독', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY042', '골든 리트리버', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY043', '도베르만', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY044', '셰퍼드', '대형견');
INSERT INTO TBL_PET_TYPE(PET_TYPE_CODE, PET_TYPE_NAME, PET_TYPE_SIZE)
VALUES('PETTY045', '그레이트 피레니즈', '대형견');

SELECT *
FROM TBL_PET_TYPE;

-- 25. TBL_RELATION_TYPE : 양육관계종류
CREATE TABLE TBL_RELATION_TYPE
( RELATION_TYPE_CODE        VARCHAR2(2)
, RELATION_TYPE_CONTENT    VARCHAR2(50) NOT NULL
, CONSTRAINT RELATIONTYPE_CODE_PK PRIMARY KEY(RELATION_TYPE_CODE)
);
--==>> Table TBL_RELATION_TYPE이(가) 생성되었습니다.

DESC TBL_RELATION_TYPE;
--==>>
/*
이름                    널?       유형           
--------------------- -------- ------------ 
RELATION_TYPE_CODE    NOT NULL VARCHAR2(2)  
RELATION_TYPE_CONTENT NOT NULL VARCHAR2(50) 
*/

INSERT INTO TBL_RELATION_TYPE(RELATION_TYPE_CODE, RELATION_TYPE_CONTENT)
VALUES('1', '주양육자');
INSERT INTO TBL_RELATION_TYPE(RELATION_TYPE_CODE, RELATION_TYPE_CONTENT)
VALUES('2', '보조양육자');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_RELATION_TYPE;
--==>>
/*
1	주양육자
2	보조양육자
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.


-- 26. TBL_PET_CHAR1 : 반려견 성격1
CREATE TABLE TBL_PET_CHAR1
( PET_CHAR1_CODE    VARCHAR2(2)
, PET_CHAR1_CONTENT VARCHAR2(300) NOT NULL
, CONSTRAINT PETCHAR1_CODE_PK PRIMARY KEY(PET_CHAR1_CODE)
);
--==>> Table TBL_PET_CHAR1이(가) 생성되었습니다.

DESC TBL_PET_CHAR1;
--==>>
/*
이름                널?       유형            
----------------- -------- ------------- 
PET_CHAR1_CODE    NOT NULL VARCHAR2(2)   
PET_CHAR1_CONTENT NOT NULL VARCHAR2(300) 
*/

INSERT INTO TBL_PET_CHAR1(PET_CHAR1_CODE, PET_CHAR1_CONTENT)
VALUES('1', '활발해요');
INSERT INTO TBL_PET_CHAR1(PET_CHAR1_CODE, PET_CHAR1_CONTENT)
VALUES('2', '얌전해요');
--==>> 1 행 이(가) 삽입되었습니다.1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_PET_CHAR1;
--==>> 
/*
1	활발해요
2	얌전해요
*/


-- 27. TBL_PET_CHAR2 : 반려견 성격2
CREATE TABLE TBL_PET_CHAR2
( PET_CHAR2_CODE    VARCHAR2(2)
, PET_CHAR2_CONTENT VARCHAR2(300) NOT NULL
, CONSTRAINT PETCHAR2_CODE_PK PRIMARY KEY(PET_CHAR2_CODE)
);
--==>> Table TBL_PET_CHAR2이(가) 생성되었습니다.

DESC TBL_PET_CHAR2;
--==>>
/*
이름                널?       유형            
----------------- -------- ------------- 
PET_CHAR2_CODE    NOT NULL VARCHAR2(2)   
PET_CHAR2_CONTENT NOT NULL VARCHAR2(300) 
*/

INSERT INTO TBL_PET_CHAR2(PET_CHAR2_CODE, PET_CHAR2_CONTENT)
VALUES('1', '겁이 많아요');
INSERT INTO TBL_PET_CHAR2(PET_CHAR2_CODE, PET_CHAR2_CONTENT)
VALUES('2', '대범해요');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_PET_CHAR2;
--==>>
/*
1	겁이 많아요
2	대범해요
*/

-- 28. TBL_PET_CHAR3 : 반려견 성격3
CREATE TABLE TBL_PET_CHAR3
( PET_CHAR3_CODE    VARCHAR2(2)
, PET_CHAR3_CONTENT VARCHAR2(300) NOT NULL
, CONSTRAINT PETCHAR3_CODE_PK PRIMARY KEY(PET_CHAR3_CODE)
);
--==>> Table TBL_PET_CHAR3이(가) 생성되었습니다.

DESC TBL_PET_CHAR3;
--==>>
/*
이름                널?       유형            
----------------- -------- ------------- 
PET_CHAR3_CODE    NOT NULL VARCHAR2(2)   
PET_CHAR3_CONTENT NOT NULL VARCHAR2(300) 
*/

INSERT INTO TBL_PET_CHAR3(PET_CHAR3_CODE, PET_CHAR3_CONTENT)
VALUES('1', '말이 많아요');
INSERT INTO TBL_PET_CHAR3(PET_CHAR3_CODE, PET_CHAR3_CONTENT)
VALUES('2', '조용해요');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_PET_CHAR3;
--==>>>
/*
1	말이 많아요
2	조용해요
*/


-- 29. TBL_PET_CHAR4 : 반려견 성격4
CREATE TABLE TBL_PET_CHAR4
( PET_CHAR4_CODE    VARCHAR2(2)
, PET_CHAR4_CONTENT VARCHAR2(300)
, CONSTRAINT PETCHAR4_CODE_PK PRIMARY KEY(PET_CHAR4_CODE)
);
--==>> Table TBL_PET_CHAR4이(가) 생성되었습니다.

DESC TBL_PET_CHAR4;
--==>>
/*
이름                널?       유형            
----------------- -------- ------------- 
PET_CHAR4_CODE    NOT NULL VARCHAR2(2)   
PET_CHAR4_CONTENT          VARCHAR2(300) 
*/

INSERT INTO TBL_PET_CHAR4(PET_CHAR4_CODE, PET_CHAR4_CONTENT)
VALUES('1', '주인바라기');
INSERT INTO TBL_PET_CHAR4(PET_CHAR4_CODE, PET_CHAR4_CONTENT)
VALUES('2', '사람이면 다 좋아요');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_PET_CHAR4;
--==>>
/*
1	주인바라기
2	사람이면 다 좋아요
*/


-- 30. TBL_UNIT : 급여단위
CREATE TABLE TBL_UNIT
( UNIT_CODE     VARCHAR2(2)
, UNIT_CONTENT  VARCHAR2(30) NOT NULL
, CONSTRAINT UNIT_CODE_PK PRIMARY KEY(UNIT_CODE)
);
--==>> Table TBL_UNIT이(가) 생성되었습니다.

DESC TBL_UNIT;
--==>>
/*
이름           널?       유형           
------------ -------- ------------ 
UNIT_CODE    NOT NULL VARCHAR2(2)  
UNIT_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_UNIT(UNIT_CODE, UNIT_CONTENT)
VALUES('1', 'g');
INSERT INTO TBL_UNIT(UNIT_CODE, UNIT_CONTENT)
VALUES('2', 'ml');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_UNIT;
--==>>
/*
1	g
2	ml
*/


-- 31. TBL_MEAL_TYPE : 사료종류
CREATE TABLE TBL_MEAL_TYPE
( MEAL_TYPE_CODE    VARCHAR2(2)
, MEAL_TYPE_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT MEALTYPE_CODE_PK PRIMARY KEY(MEAL_TYPE_CODE)
);
--==>> Table TBL_MEAL_TYPE이(가) 생성되었습니다.

DESC TBL_MEAL_TYPE;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
MEAL_TYPE_CODE    NOT NULL VARCHAR2(2)  
MEAL_TYPE_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_MEAL_TYPE(MEAL_TYPE_CODE, MEAL_TYPE_CONTENT) VALUES('1' , '건식');
INSERT INTO TBL_MEAL_TYPE(MEAL_TYPE_CODE, MEAL_TYPE_CONTENT) VALUES('2' , '습식');
INSERT INTO TBL_MEAL_TYPE(MEAL_TYPE_CODE, MEAL_TYPE_CONTENT) VALUES('3' , '생식');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_MEAL_TYPE;
--==>> 
/*
1	건식
2	습식
3	생식
*/


-- 32. TBL_HOSPITAL : 병원
CREATE TABLE TBL_HOSPITAL
( HOSPITAL_CODE VARCHAR2(30)
, HOSPITAL_NAME VARCHAR2(50) NOT NULL
, HOSPITAL_DOCTOR VARCHAR2(30)
, CONSTRAINT HOSPITAL_CODE_PK PRIMARY KEY(HOSPITAL_CODE)
);
--==>> Table TBL_HOSPITAL이(가) 생성되었습니다.

DESC TBL_HOSPITAL;
--==>>
/*
이름              널?       유형           
--------------- -------- ------------ 
HOSPITAL_CODE   NOT NULL VARCHAR2(30) 
HOSPITAL_NAME   NOT NULL VARCHAR2(50) 
HOSPITAL_DOCTOR          VARCHAR2(30) 
*/

INSERT INTO TBL_HOSPITAL(HOSPITAL_CODE, HOSPITAL_NAME, HOSPITAL_DOCTOR)
VALUES('HOS001', '봄빛동물병원', '함성철');
--==>> 1 행 이(가) 삽입되었습니다.


-- 33. TBL_INJECT_TYPE : 접종종류
CREATE TABLE TBL_INJECT_TYPE
( INJECT_TYPE_CODE VARCHAR2(2)
, INJECT_TYPE_NAME VARCHAR2(100) NOT NULL
, CONSTRAINT INJECTTYPE_CODE_PK PRIMARY KEY(INJECT_TYPE_CODE)
);
--==>> Table TBL_INJECT_TYPE이(가) 생성되었습니다.

DESC TBL_INJECT_TYPE;
--==>> 
/*
이름               널?       유형            
---------------- -------- ------------- 
INJECT_TYPE_CODE NOT NULL VARCHAR2(2)   
INJECT_TYPE_NAME NOT NULL VARCHAR2(100) 
*/

INSERT INTO TBL_INJECT_TYPE(INJECT_TYPE_CODE, INJECT_TYPE_NAME) VALUES('1' , '광견병접종');
INSERT INTO TBL_INJECT_TYPE(INJECT_TYPE_CODE, INJECT_TYPE_NAME) VALUES('2' , '종합백신접종');
INSERT INTO TBL_INJECT_TYPE(INJECT_TYPE_CODE, INJECT_TYPE_NAME) VALUES('3' , '켄넬코프접종');
INSERT INTO TBL_INJECT_TYPE(INJECT_TYPE_CODE, INJECT_TYPE_NAME) VALUES('4' , '코로나접종');
INSERT INTO TBL_INJECT_TYPE(INJECT_TYPE_CODE, INJECT_TYPE_NAME) VALUES('5' , '인플루엔자접종');
--==>> 1 행 이(가) 삽입되었습니다. * 5

SELECT *
FROM TBL_INJECT_TYPE;
--==>>
/*
1	광견병접종
2	종합백신접종
3	켄넬코프접종
4	코로나접종
5	인플루엔자접종
*/


-- 34. TBL_SHOP : 미용샵
CREATE TABLE TBL_SHOP
( SHOP_CODE VARCHAR2(30)
, SHOP_NAME VARCHAR2(50) NOT NULL
, CONSTRAINT SHOP_CODE_PK PRIMARY KEY(SHOP_CODE)
);
--==>> Table TBL_SHOP이(가) 생성되었습니다.

DESC TBL_SHOP;
--==>>
/*
이름        널?       유형           
--------- -------- ------------ 
SHOP_CODE NOT NULL VARCHAR2(30) 
SHOP_NAME NOT NULL VARCHAR2(50) 
*/

INSERT INTO TBL_SHOP(SHOP_CODE, SHOP_NAME) VALUES('SHOP001', '독독독');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_SHOP;
--==>> SHOP001	독독독


-- 35. TBL_BEAUTY_TYPE : 미용종류
CREATE TABLE TBL_BEAUTY_TYPE
( BEAUTY_TYPE_CODE VARCHAR2(2)
, BEAUTY_TYPE_NAME VARCHAR2(50) NOT NULL
, CONSTRAINT BEAUTYTYPE_CODE_PK PRIMARY KEY(BEAUTY_TYPE_CODE)
);
--==>> Table TBL_BEAUTY_TYPE이(가) 생성되었습니다.

DESC TBL_BEAUTY_TYPE;
--==>>
/*
이름               널?       유형           
---------------- -------- ------------ 
BEAUTY_TYPE_CODE NOT NULL VARCHAR2(2)  
BEAUTY_TYPE_NAME NOT NULL VARCHAR2(50) 
*/

INSERT INTO TBL_BEAUTY_TYPE VALUES('1', '가위컷');
INSERT INTO TBL_BEAUTY_TYPE VALUES('2', '닭발컷');
INSERT INTO TBL_BEAUTY_TYPE VALUES('3', '부분미용');
INSERT INTO TBL_BEAUTY_TYPE VALUES('4', '전체미용'); 
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_BEAUTY_TYPE;
--==>>
/*
1	가위컷
2	닭발컷
3	부분미용
4	전체미용
*/

-- 36. TBL_URINE : 소변
CREATE TABLE TBL_URINE
( URINE_CODE    VARCHAR2(30)
, URINE_STATE   VARCHAR2(10) NOT NULL
, URINE_ETC     VARCHAR2(4000)
, CONSTRAINT URINE_CODE_PK PRIMARY KEY(URINE_CODE)
);
--==>> Table TBL_URINE이(가) 생성되었습니다.

DESC TBL_URINE;
--==>>
/*
이름          널?       유형             
----------- -------- -------------- 
URINE_CODE  NOT NULL VARCHAR2(30)   
URINE_STATE NOT NULL VARCHAR2(10)   
URINE_ETC            VARCHAR2(4000) 
*/

-- 37. TBL_FECES : 대변
CREATE TABLE TBL_FECES
( FECES_CODE    VARCHAR2(30)
, FECES_STATE   VARCHAR2(30) NOT NULL
, FECES_ETC     VARCHAR2(4000)
, CONSTRAINT FECES_CODE_PK PRIMARY KEY(FECES_CODE)
);
--==>> Table TBL_FECES이(가) 생성되었습니다.

DESC TBL_FECES;
--==>>
/*
이름          널?       유형             
----------- -------- -------------- 
FECES_CODE  NOT NULL VARCHAR2(30)   
FECES_STATE NOT NULL VARCHAR2(30)   
FECES_ETC            VARCHAR2(4000) 
*/

-- 38. TBL_STATE_LEG : 상태범례
CREATE TABLE TBL_STATE_LEG
( STATE_LEG_CODE VARCHAR2(2)
, STATE_LEG_NAME VARCHAR2(30) NOT NULL
, CONSTRAINT STATELEG_CODE_PK PRIMARY KEY(STATE_LEG_CODE)
);
--==>> Table TBL_STATE_LEG이(가) 생성되었습니다.

DESC TBL_STATE_LEG;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
STATE_LEG_CODE NOT NULL VARCHAR2(2)  
STATE_LEG_NAME NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_STATE_LEG(STATE_LEG_CODE, STATE_LEG_NAME) VALUES('1' , '좋아요');
INSERT INTO TBL_STATE_LEG(STATE_LEG_CODE, STATE_LEG_NAME) VALUES('2' , '신나요');
INSERT INTO TBL_STATE_LEG(STATE_LEG_CODE, STATE_LEG_NAME) VALUES('3' , '화나요');
INSERT INTO TBL_STATE_LEG(STATE_LEG_CODE, STATE_LEG_NAME) VALUES('4' , '우울해요');
INSERT INTO TBL_STATE_LEG(STATE_LEG_CODE, STATE_LEG_NAME) VALUES('5' , '발정기');
--==>> 1 행 이(가) 삽입되었습니다. * 5

SELECT *
FROM TBL_STATE_LEG;
--==>>
/*
1	좋아요
2	신나요
3	화나요
4	우울해요
5	발정기
*/

-- 39. TBL_DISEASE_TYPE : 기저질환유형
CREATE TABLE TBL_DISEASE_TYPE
( DISEASE_TYPE_CODE VARCHAR2(30)
, DISEASE_CONTENT   VARCHAR2(50) NOT NULL
, CONSTRAINT DISEASETYPE_CODE_PK PRIMARY KEY(DISEASE_TYPE_CODE)
);
--==>> Table TBL_DISEASE_TYPE이(가) 생성되었습니다.

DESC TBL_DISEASE_TYPE;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
DISEASE_TYPE_CODE NOT NULL VARCHAR2(30) 
DISEASE_CONTENT   NOT NULL VARCHAR2(50) 
*/

INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('1', '기관지염');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('2', '비만');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('3', '세균성/식이성 설자');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('4', '소양증');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('5', '슬개골 탈구');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('6', '외이염 (급성/만성)');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('7', '유루증');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('8', '장염');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('9', '치은염/치주염');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('10', '퇴행성 관절염');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('11', '피부사상균증');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('12', '피부염 (감염성/아토피성)');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('13', '피부질환');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('14', '방광염');
INSERT INTO TBL_DISEASE_TYPE(DISEASE_TYPE_CODE, DISEASE_CONTENT) VALUES('15', '기타');
--==>> 1 행 이(가) 삽입되었습니다. * 15

SELECT *
FROM TBL_DISEASE_TYPE;
--==>>
/*
1	기관지염
2	비만
3	세균성/식이성 설자
4	소양증
5	슬개골 탈구
6	외이염 (급성/만성)
7	유루증
8	장염
9	치은염/치주염
10	퇴행성 관절염
11	피부사상균증
12	피부염 (감염성/아토피성)
13	피부질환
14	방광염
15	기타
*/


-- 40. TBL_FAV_FOOD_TYPE : 관심사료유형
CREATE TABLE TBL_FAV_FOOD_TYPE
( FAV_FOOD_TYPE_CODE    VARCHAR2(30)
, FAV_FOOD_CONTENT      VARCHAR2(50) NOT NULL
, CONSTRAINT FAVFOODTYPE_CODE_PK PRIMARY KEY(FAV_FOOD_TYPE_CODE)
);
--==>> Table TBL_FAV_FOOD_TYPE이(가) 생성되었습니다.

DESC TBL_FAV_FOOD_TYPE;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
FAV_FOOD_TYPE_CODE NOT NULL VARCHAR2(30) 
FAV_FOOD_CONTENT   NOT NULL VARCHAR2(50) 
*/

INSERT INTO TBL_FAV_FOOD_TYPE(FAV_FOOD_TYPE_CODE, FAV_FOOD_CONTENT)
VALUES('1', '피부개선');
INSERT INTO TBL_FAV_FOOD_TYPE(FAV_FOOD_TYPE_CODE, FAV_FOOD_CONTENT) 
VALUES('2', '다이어트');
INSERT INTO TBL_FAV_FOOD_TYPE(FAV_FOOD_TYPE_CODE, FAV_FOOD_CONTENT) 
VALUES('3', '호흡기개선');
INSERT INTO TBL_FAV_FOOD_TYPE(FAV_FOOD_TYPE_CODE, FAV_FOOD_CONTENT) 
VALUES('4', '치석제거');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_FAV_FOOD_TYPE;
--==>> 
/*
1	피부개선
2	다이어트
3	호흡기개선
4	치석제거
*/

-- 41. TBL_PAUSE : 일시정지 회원
CREATE TABLE TBL_PAUSE
( PAUSE_CODE    VARCHAR2(30)
, SID_CODE      VARCHAR2(30)    NOT NULL
, PASUE_START   DATE            DEFAULT SYSDATE
, CONSTRAINT PAUSE_CODE_PK PRIMARY KEY(PAUSE_CODE)
, CONSTRAINT PAUSE_SID_FK FOREIGN KEY(SID_CODE)
             REFERENCES TBL_SID(SID_CODE)
);
--==>> Table TBL_PAUSE이(가) 생성되었습니다.

-- 잘못된 컬럼명 변경
ALTER TABLE TBL_PAUSE RENAME COLUMN PASUE_START TO PAUSE_START;
--==>> Table TBL_PAUSE이(가) 변경되었습니다.

DESC TBL_PAUSE;
--==>> 
/*
이름          널?       유형           
----------- -------- ------------ 
PAUSE_CODE  NOT NULL VARCHAR2(30) 
SID_CODE    NOT NULL VARCHAR2(30) 
PASUE_START          DATE 
*/

INSERT INTO TBL_PAUSE(PAUSE_CODE, SID_CODE, PAUSE_START) 
VALUES('PAU001' , 'SID006' , TO_DATE('2021-06-27', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_PAUSE;
--==>> PAU001	SID006	2021-06-27

-- 42. TBL_ASK : 문의
CREATE TABLE TBL_ASK
( ASK_CODE          NUMBER
, ASK_CATE_CODE     VARCHAR2(30)    NOT NULL
, SID_CODE          VARCHAR2(30)    NOT NULL
, ASK_DATE          DATE            DEFAULT SYSDATE
, ASK_TITLE         VARCHAR2(100)   NOT NULL
, ASK_CONTENT       VARCHAR2(4000)  NOT NULL
, ASK_PHOTO         VARCHAR2(300)
, ASK_STATE_CODE    VARCHAR2(2)     NOT NULL
, ASK_READ          DATE
, CONSTRAINT ASK_CODE_PK PRIMARY KEY(ASK_CODE)
, CONSTRAINT ASK_CATECODE_FK FOREIGN KEY(ASK_CATE_CODE)
             REFERENCES TBL_ASK_LEG(ASK_CATE_CODE)
, CONSTRAINT ASK_SID_FK FOREIGN KEY(SID_CODE)
             REFERENCES TBL_SID(SID_CODE)
);
--==>> Table TBL_ASK이(가) 생성되었습니다.

DESC TBL_ASK;
--==>>
/*
이름             널?       유형             
-------------- -------- -------------- 
ASK_CODE       NOT NULL NUMBER         
ASK_CATE_CODE  NOT NULL VARCHAR2(30)   
SID_CODE       NOT NULL VARCHAR2(30)   
ASK_DATE                DATE           
ASK_TITLE      NOT NULL VARCHAR2(100)  
ASK_CONTENT    NOT NULL VARCHAR2(4000) 
ASK_PHOTO               VARCHAR2(300)  
ASK_STATE_CODE NOT NULL VARCHAR2(2)    
ASK_READ                DATE  
*/

INSERT INTO TBL_ASK(ASK_CODE, ASK_CATE_CODE, SID_CODE, ASK_DATE, ASK_TITLE, ASK_CONTENT, ASK_STATE_CODE, ASK_READ)
VALUES(1 , '1', 'SID003' , TO_DATE('2021-06-23', 'YYYY-MM-DD') , '강아지가요' , '강아지가 다른 강아지를 무서워하면 산책이 가능한가요?' 
, '2', TO_DATE('2021-06-23', 'YYYY-MM-DD'));
INSERT INTO TBL_ASK(ASK_CODE, ASK_CATE_CODE, SID_CODE, ASK_DATE, ASK_TITLE, ASK_CONTENT, ASK_STATE_CODE, ASK_READ)
VALUES(2 , '2', 'SID001' , TO_DATE('2021-06-23', 'YYYY-MM-DD') , '다이어리삭제' , '다이어리 삭제 시 복구가 불가능한가요??' , '2', TO_DATE('2021-06-23', 'YYYY-MM-DD'));
INSERT INTO TBL_ASK(ASK_CODE, ASK_CATE_CODE, SID_CODE, ASK_DATE, ASK_TITLE, ASK_CONTENT, ASK_STATE_CODE)
VALUES(3, '2', 'SID001', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '다이어리 중복', '다이어리 중복 작성하면 어케되나여?', '1');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_ASK;
--==>>
/*
ASK_CODE	ASK_CATE_CODE	SID_CODE	ASK_DATE	ASK_TITLE	ASK_CONTENT	                                ASK_PHOTO	ASK_STATE_CODE	ASK_READ
1	        1	            SID003	    2021-06-23	강아지가요	    강아지가 다른 강아지를 무서워하면 산책이 가능한가요?   (null)       2	            2021-06-23
2	        2	            SID001	    2021-06-23	다이어리삭제	다이어리 삭제 시 복구가 불가능한가요??		        (null)      2	            2021-06-23
3	        2	            SID001	    2021-06-27	다이어리 중복	다이어리 중복 작성하면 어케되나여?		            (null)      1	            (null)
*/

-- 43. TBL_ASK_COMMENT : 문의 댓글
CREATE TABLE TBL_ASK_COMMENT
( ASK_COMM_CODE     VARCHAR2(30)
, ASK_CODE          NUMBER          NOT NULL
, ASK_COMM_CONTENT  VARCHAR2(4000)  NOT NULL
, ASK_COMM_DATE     DATE            DEFAULT SYSDATE
, CONSTRAINT ASKCOMM_CODE_PK PRIMARY KEY(ASK_COMM_CODE)
, CONSTRAINT ASKCOMM_ASK_FK FOREIGN KEY(ASK_CODE)
             REFERENCES TBL_ASK(ASK_CODE)
             ON DELETE CASCADE
);
--==>> Table TBL_ASK_COMMENT이(가) 생성되었습니다.

DESC TBL_ASK_COMMENT;
--==>>
/*
이름               널?       유형             
---------------- -------- -------------- 
ASK_COMM_CODE    NOT NULL VARCHAR2(30)   
ASK_CODE         NOT NULL NUMBER         
ASK_COMM_CONTENT NOT NULL VARCHAR2(4000) 
ASK_COMM_DATE             DATE           
*/

INSERT INTO TBL_ASK_COMMENT(ASK_COMM_CODE, ASK_CODE, ASK_COMM_CONTENT, ASK_COMM_DATE)
VALUES(1 , '1' , '사용자분께서 반려견을 케어 가능하시다면 산책이 가능합니다. 다만 조심부탁드려요.', TO_DATE('2021-06-23', 'YYYY-MM-DD'));
INSERT INTO TBL_ASK_COMMENT(ASK_COMM_CODE, ASK_CODE, ASK_COMM_CONTENT, ASK_COMM_DATE) 
VALUES(2 , '2' , '복구는 불가능합니다 감사합니다', TO_DATE('2021-06-23', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다. * 2 

SELECT *
FROM TBL_ASK_COMMENT;
--==>>
/*
ASK_COMM_CODE	ASK_CODE	ASK_COMM_CONTENT	                                            ASK_COMM_DATE
1	            1	        사용자분께서 반려견을 케어 가능하시다면 산책이 가능합니다. 다만 조심부탁드려요.	2021-06-23
2	            2	        복구는 불가능합니다 감사합니다	                                        2021-06-23
*/

-- 44. TBL_NOTICE : 공지 게시글(판)
CREATE TABLE TBL_NOTICE
( NOTICE_CODE       NUMBER
, NOTICE_WRITER      VARCHAR2(30)
, NOTICE_HEAD_CODE  VARCHAR2(2)     NOT NULL
, NOTICE_TITLE      VARCHAR2(100)   NOT NULL
, NOTICE_PHOTO      VARCHAR2(300)
, NOTICE_CONTENT    VARCHAR2(4000)  NOT NULL
, NOTICE_VIEW       NUMBER          DEFAULT 0
, NOTICE_LIKE       NUMBER          DEFAULT 0
, NOTICE_DATE       DATE            DEFAULT SYSDATE
, CONSTRAINT NOTICE_CODE_PK PRIMARY KEY(NOTICE_CODE)
, CONSTRAINT NOTICE_WRITER_FK FOREIGN KEY(NOTICE_WRITER)
             REFERENCES TBL_ADMIN(ADMIN_CODE)
             ON DELETE SET NULL
, CONSTRAINT NOTICE_HEAD_FK FOREIGN KEY(NOTICE_HEAD_CODE)
             REFERENCES TBL_NOTICE_LEG(NOTICE_CATE_CODE)
);
--==>> Table TBL_NOTICE이(가) 생성되었습니다.

DESC TBL_NOTICE;
--==>>
/*
이름               널?       유형             
---------------- -------- -------------- 
NOTICE_CODE      NOT NULL NUMBER         
NOTICE_WRITER    NOT NULL VARCHAR2(30)   
NOTICE_HEAD_CODE NOT NULL VARCHAR2(2)    
NOTICE_TITLE     NOT NULL VARCHAR2(100)  
NOTICE_PHOTO              VARCHAR2(300)  
NOTICE_CONTENT   NOT NULL VARCHAR2(4000) 
NOTICE_VIEW               NUMBER         
NOTICE_LIKE               NUMBER         
NOTICE_DATE               DATE   
*/

INSERT INTO TBL_NOTICE(NOTICE_CODE, NOTICE_WRITER, NOTICE_HEAD_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE)
VALUES (1, 'ADM001', '2', '강아지배변봉투', '산책 시 강아지 배변봉투를 꼭 챙겨주세요', TO_DATE('2021-06-26', 'YYYY-MM-DD'));
INSERT INTO TBL_NOTICE(NOTICE_CODE, NOTICE_WRITER, NOTICE_HEAD_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE)
VALUES (2, 'ADM002', '1', '산책메이트 튜토리얼1', '산책메이트 사용 방법 안내' , TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_NOTICE(NOTICE_CODE, NOTICE_WRITER, NOTICE_HEAD_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE)
VALUES (3, 'ADM002', '1', '산책메이트 튜토리얼2', '산책메이트 사용 방법 안내', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_NOTICE(NOTICE_CODE, NOTICE_WRITER, NOTICE_HEAD_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE)
VALUES (4, 'ADM002', '1', '산책메이트 튜토리얼3', '산책메이트 사용 방법 안내', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_NOTICE(NOTICE_CODE, NOTICE_WRITER, NOTICE_HEAD_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE)
VALUES (5, 'ADM001', '1' , '산책메이트 튜토리얼4', '산책메이트 사용 방법 안내', TO_DATE('2021-06-29', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다. * 5


SELECT *
FROM TBL_NOTICE;
--==>> 
/*
1	ADM001	2	강아지배변봉투		    산책 시 강아지 배변봉투를 꼭 챙겨주세요	0	0	2021-06-26
2	ADM002	1	산책메이트 튜토리얼1		산책메이트 사용 방법 안내	            0	0	2021-06-28
3	ADM002	1	산책메이트 튜토리얼2		산책메이트 사용 방법 안내	            0	0	2021-06-28
4	ADM002	1	산책메이트 튜토리얼3		산책메이트 사용 방법 안내	            0	0	2021-06-28
5	ADM001	1	산책메이트 튜토리얼4		산책메이트 사용 방법 안내	            0	0	2021-06-29
*/

-- 45. TBL_BOARD : 게시글(판)
CREATE TABLE TBL_BOARD
( BOARD_CODE        NUMBER
, BOARD_WRITER      VARCHAR2(30)    NOT NULL
, BOARD_CATE_CODE   VARCHAR2(2)     NOT NULL
, BOARD_TITLE       VARCHAR2(100)   NOT NULL
, BOARD_CONTENT     VARCHAR2(4000)  NOT NULL
, BOARD_PHOTO       VARCHAR2(300)
, BOARD_VIEW        NUMBER          DEFAULT 0
, BOARD_LIKE        NUMBER          DEFAULT 0
, BOARD_DATE        DATE            DEFAULT SYSDATE
, CONSTRAINT BOARD_CODE_PK PRIMARY KEY(BOARD_CODE)
, CONSTRAINT BOARD_WRITER_FK FOREIGN KEY(BOARD_WRITER)
             REFERENCES TBL_SID(SID_CODE)
, CONSTRAINT BOARD_CATE_CODE FOREIGN KEY(BOARD_CATE_CODE)
             REFERENCES TBL_BOARD_LEG(BOARD_CATE_CODE)
);
--==>> Table TBL_BOARD이(가) 생성되었습니다.

DESC TBL_BOARD;
--==>>
/*
이름              널?       유형             
--------------- -------- -------------- 
BOARD_CODE      NOT NULL NUMBER         
BOARD_WRITER    NOT NULL VARCHAR2(30)   
BOARD_CATE_CODE NOT NULL VARCHAR2(2)    
BOARD_TITLE     NOT NULL VARCHAR2(100)  
BOARD_CONTENT   NOT NULL VARCHAR2(4000) 
BOARD_PHOTO              VARCHAR2(300)  
BOARD_VIEW               NUMBER         
BOARD_LIKE               NUMBER         
BOARD_DATE               DATE 
*/

INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
VALUES(1, 'SID002', '3', '오늘대박', '오늘 산책메이트 산책갔는데 옆집 사람이었다 문열때부터 같이갔음 대박', TO_DATE('2021-06-22', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_LIKE, BOARD_DATE)
VALUES(2, 'SID003', '2', '강쥐장난감공후기', '울 애기가 이 공을 참 조아해요 크기도 딱임', 15, TO_DATE('2021-06-23', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
VALUES(3, 'SID001', '3', '오늘 뜨거운 밤', '뜨거운밤..어쩌고..신고당할만한 이야기', TO_DATE('2021-06-23', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_LIKE, BOARD_DATE)
VALUES(4, 'SID002', '1', '로x캐닌 할인', '견종별 사료가 10% 할인~', 11, TO_DATE('2021-06-23', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
VALUES(5, 'SID002', '3', '아 이제 더워지네', '더운 날씨 산책하기에 제격이죠', TO_DATE('2021-06-24', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
VALUES(6, 'SID003', '4', '강쥐밥그릇 중고거래해요', '3천원입니다', TO_DATE('2021-06-24', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_LIKE, BOARD_DATE)
VALUES(7, 'SID001', '4', '샘플사료무나', '안양천돌다리로 오실분', 14, TO_DATE('2021-06-24', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_LIKE , BOARD_DATE)
VALUES(8, 'SID002', '3', '오늘 산책 완', '아주 활짝웃는 우리 날동', 15, TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
VALUES(9, 'SID001', '3', '산책메이트 매칭은 언제쯤 완료되려나', '제목이즈곧내용', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD(BOARD_CODE, BOARD_WRITER, BOARD_CATE_CODE, BOARD_TITLE, BOARD_CONTENT, BOARD_LIKE, BOARD_DATE)
VALUES(10, 'SID003', '1', '펫페어에서 오리진 40% 할인', '내일까지래요', 21, TO_DATE('2021-06-26', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_BOARD;
--==>>
/*
1	SID002	3	오늘대박	오늘 산책메이트 산책갔는데 옆집 사람이었다 문열때부터 같이갔음 대박		0	0	2021-06-22
2	SID003	2	강쥐장난감공후기	울 애기가 이 공을 참 조아해요 크기도 딱임		            0	15	2021-06-23
3	SID001	3	오늘 뜨거운 밤	뜨거운밤..어쩌고..신고당할만한 이야기		                    0	0	2021-06-23
4	SID002	1	로x캐닌 할인	견종별 사료가 10% 할인~		                                0	11	2021-06-23
5	SID002	3	아 이제 더워지네	더운 날씨 산책하기에 제격이죠		                        0	0	2021-06-24
6	SID003	4	강쥐밥그릇 중고거래해요	3천원입니다		                                0	0	2021-06-24
7	SID001	4	샘플사료무나	안양천돌다리로 오실분		                                0	14	2021-06-24
8	SID002	3	오늘 산책 완	아주 활짝웃는 우리 날동		                                0	15	2021-06-25
9	SID001	3	산책메이트 매칭은 언제쯤 완료되려나	제목이즈곧내용		                        0	0	2021-06-25
10	SID003	1	펫페어에서 오리진 40% 할인	내일까지래요		                            0	21	2021-06-26
*/

-- 46. TBL_BOARD_COMMENT : 댓글 (게시글의)
CREATE TABLE TBL_BOARD_COMMENT
( BOARD_COMM_CODE       NUMBER
, BOARD_CODE            NUMBER          NOT NULL
, BOARD_COMM_WRITER     VARCHAR2(30)    NOT NULL
, BOARD_COMM_CONTENT    VARCHAR2(4000)  NOT NULL
, BOARD_COMM_DATE       DATE            DEFAULT SYSDATE
, CONSTRAINT BOARDCOMM_CODE_PK PRIMARY KEY(BOARD_COMM_CODE)
, CONSTRAINT BOARDCOMM_BOARD_FK FOREIGN KEY(BOARD_CODE)
             REFERENCES TBL_BOARD(BOARD_CODE)
             ON DELETE CASCADE
, CONSTRAINT BOARDCOMM_WRITER_FK FOREIGN KEY(BOARD_COMM_WRITER)
             REFERENCES TBL_SID(SID_CODE)
);
--==>> Table TBL_BOARD_COMMENT이(가) 생성되었습니다.

DESC TBL_BOARD_COMMENT;
--==>>
/*
이름                 널?       유형             
------------------ -------- -------------- 
BOARD_COMM_CODE    NOT NULL NUMBER         
BOARD_CODE         NOT NULL NUMBER         
BOARD_COMM_WRITER  NOT NULL VARCHAR2(30)   
BOARD_COMM_CONTENT NOT NULL VARCHAR2(4000) 
BOARD_COMM_DATE             DATE     
*/

INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE) 
VALUES(1, '1', 'SID001', '헐대박 그런 우연이있네요', TO_DATE('2021-06-22', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE) 
VALUES(2, '1', 'SID002', '진짜웃기죠?', TO_DATE('2021-06-22', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(3, '2', 'SID002', '와 저희 애기도 이거 좋아해요', TO_DATE('2021-06-23', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(4, '3', 'SID007', '신고합니다', TO_DATE('2021-06-24', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(5, '4', 'SID010', '구매완', TO_DATE('2021-06-24', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(6, '6', 'SID008', '제가 살게요', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(7, '8', 'SID003', '고생하셨네요', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(8, '10', 'SID001', '당장 갑니다', TO_DATE('2021-06-26', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(9, '9', 'SID009', '그러게요ㅠ 저도 아직 매칭중' , TO_DATE('2021-06-26', 'YYYY-MM-DD'));
INSERT INTO TBL_BOARD_COMMENT(BOARD_COMM_CODE, BOARD_CODE, BOARD_COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE)  
VALUES(10, '10' , 'SID007', '펫페어가 머죠?', TO_DATE('2021-06-27', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다. * 10

SELECT *
FROM TBL_BOARD_COMMENT;
--==>> 
/*
1	1	SID001	헐대박 그런 우연이있네요	2021-06-22
2	1	SID002	진짜웃기죠?	2021-06-22
3	2	SID002	와 저희 애기도 이거 좋아해요	2021-06-23
4	3	SID007	신고합니다	2021-06-24
5	4	SID010	구매완	2021-06-24
6	6	SID008	제가 살게요	2021-06-25
7	8	SID003	고생하셨네요	2021-06-25
8	10	SID001	당장 갑니다	2021-06-26
9	9	SID009	그러게요ㅠ 저도 아직 매칭중	2021-06-26
10	10	SID007	펫페어가 머죠?	2021-06-27
*/


-- 47. TBL_HOT : HOT 게시글(판)
CREATE TABLE TBL_HOT
( HOT_CODE   NUMBER
, BOARD_CODE NUMBER NOT NULL
, CONSTRAINT HOT_CODE_PK PRIMARY KEY(HOT_CODE)
, CONSTRAINT HOT_BOARD_FK FOREIGN KEY(BOARD_CODE)
             REFERENCES TBL_BOARD(BOARD_CODE)
             ON DELETE CASCADE
);
--==>> Table TBL_HOT이(가) 생성되었습니다.

DESC TBL_HOT;
--==>>
/*
이름         널?       유형     
---------- -------- ------ 
HOT_CODE   NOT NULL NUMBER 
BOARD_CODE NOT NULL NUMBER 
*/

INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(1 , 2);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(2 , 4);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(3 , 7);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(4 , 8);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(5 , 10);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(6 , 6);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(7 , 8);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(8 , 10);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(9 , 9);
INSERT INTO TBL_HOT(HOT_CODE, BOARD_CODE) VALUES(10 , 10);
--==>> 1 행 이(가) 삽입되었습니다. * 10

SELECT *
FROM TBL_HOT;
--==>> 
/*
1	2
2	4
3	7
4	8
5	10
6	6
7	8
8	10
9	9
10	10
*/

-- 48. TBL_BLOCK : 차단
CREATE TABLE TBL_BLOCK
( BLOCK_CODE    VARCHAR2(30)
, BLOCKER       VARCHAR2(30) NOT NULL
, BLOCK_TARGET  VARCHAR2(30) NOT NULL
, CONSTRAINT BLOCK_CODE_PK PRIMARY KEY(BLOCK_CODE)
, CONSTRAINT BLOCK_SID_FK FOREIGN KEY(BLOCKER)
             REFERENCES TBL_SID(SID_CODE)
);
--==>> Table TBL_BLOCK이(가) 생성되었습니다.

DESC TBL_BLOCK;
--==>>
/*
이름           널?       유형           
------------ -------- ------------ 
BLOCK_CODE   NOT NULL VARCHAR2(30) 
BLOCKER      NOT NULL VARCHAR2(30) 
BLOCK_TARGET NOT NULL VARCHAR2(30)
*/

INSERT INTO TBL_BLOCK(BLOCK_CODE, BLOCKER, BLOCK_TARGET ) VALUES('BLO001','SID001', 'SID006');
INSERT INTO TBL_BLOCK(BLOCK_CODE, BLOCKER, BLOCK_TARGET )  VALUES('BLO002','SID001', 'SID007');
INSERT INTO TBL_BLOCK(BLOCK_CODE, BLOCKER, BLOCK_TARGET ) VALUES('BLO003','SID007', 'SID001');
INSERT INTO TBL_BLOCK(BLOCK_CODE, BLOCKER, BLOCK_TARGET )  VALUES('BLO004','SID002', 'SID009');
INSERT INTO TBL_BLOCK(BLOCK_CODE, BLOCKER, BLOCK_TARGET )  VALUES('BLO005','SID009', 'SID010');
--==>> 1 행 이(가) 삽입되었습니다. * 5

SELECT *
FROM TBL_BLOCK;
--==>>
/*
BLOCK_CODE	BLOCKER	BLOCK_TARGET
BLO001	    SID001	SID006
BLO002	    SID001	SID007
BLO003	    SID007	SID001
BLO004	    SID002	SID009
BLO005	    SID009	SID010
*/


-- 49. 
CREATE TABLE TBL_PET
( PET_CODE       VARCHAR2(30) 
, PET_TYPE_CODE  VARCHAR2(30)  NOT NULL
, BITE_CODE      VARCHAR2(1)   NOT NULL
, DESEX_CODE     VARCHAR2(1)   NOT NULL
, PET_SEX        VARCHAR2(1)   NOT NULL
, PET_BIRTH      DATE          NOT NULL
, PET_FAV_PLACE  VARCHAR2(200) NOT NULL
, PET_SOCIAL     NUMBER(1)     NOT NULL
, PET_CHAR1_CODE VARCHAR2(2)   NOT NULL
, PET_CHAR2_CODE VARCHAR2(2)   NOT NULL
, PET_CHAR3_CODE VARCHAR2(2)   NOT NULL
, PET_CHAR4_CODE VARCHAR2(2)   NOT NULL
, PET_SIZE       VARCHAR2(10)  NOT NULL
, CONSTRAINT PET_CODE_PK PRIMARY KEY(PET_CODE)
, CONSTRAINT PET_TYPECODE_FK FOREIGN KEY(PET_TYPE_CODE)
             REFERENCES TBL_PET_TYPE(PET_TYPE_CODE)
, CONSTRAINT PET_BITECODE_FK FOREIGN KEY(BITE_CODE)
             REFERENCES TBL_BITE_LEG(BITE_CODE)
, CONSTRAINT PET_DESEXCODE_FK FOREIGN KEY(DESEX_CODE)
             REFERENCES TBL_DESEX_LEG(DESEX_CODE)
, CONSTRAINT PET_CHAR1CODE_FK FOREIGN KEY(PET_CHAR1_CODE)
             REFERENCES TBL_PET_CHAR1(PET_CHAR1_CODE)
, CONSTRAINT PET_CHAR2CODE_FK FOREIGN KEY(PET_CHAR1_CODE)
             REFERENCES TBL_PET_CHAR2(PET_CHAR2_CODE)
, CONSTRAINT PET_CHAR3CODE_FK FOREIGN KEY(PET_CHAR1_CODE)
             REFERENCES TBL_PET_CHAR3(PET_CHAR3_CODE)
, CONSTRAINT PET_CHAR4CODE_FK FOREIGN KEY(PET_CHAR1_CODE)
             REFERENCES TBL_PET_CHAR4(PET_CHAR4_CODE)
);
--==>> Table TBL_PET이(가) 생성되었습니다.

DESC TBL_PET;
--==>>
/*
이름             널?       유형            
-------------- -------- ------------- 
PET_CODE       NOT NULL VARCHAR2(30)  
PET_TYPE_CODE  NOT NULL VARCHAR2(30)  
BITE_CODE      NOT NULL VARCHAR2(1)   
DESEX_CODE     NOT NULL VARCHAR2(1)   
PET_SEX        NOT NULL VARCHAR2(1)   
PET_BIRTH      NOT NULL DATE          
PET_FAV_PLACE  NOT NULL VARCHAR2(200) 
PET_SOCIAL     NOT NULL NUMBER(1)     
PET_CHAR1_CODE NOT NULL VARCHAR2(2)   
PET_CHAR2_CODE NOT NULL VARCHAR2(2)   
PET_CHAR3_CODE NOT NULL VARCHAR2(2)   
PET_CHAR4_CODE NOT NULL VARCHAR2(2)   
PET_SIZE       NOT NULL VARCHAR2(10)  
*/

INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET001', 'PETTY003', '1', '1', 'M', TO_DATE('2010-09-27', 'YYYY-MM-DD'), '안양천', '4' , '1' , '2', '1', '2', '소형견');
INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET002', 'PETTY003', '0', '1', 'M', TO_DATE('2017-09-05', 'YYYY-MM-DD'), '올림픽공원', '4', '1', '1', '1', '2', '소형견');
INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET003', 'PETTY001', '0', '1', 'M', TO_DATE('2012-10-10', 'YYYY-MM-DD'), '철산중학교 운동장', '4', '2', '1', '1', '1', '소형견');
INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET004', 'PETTY002', '0', '0', 'F', TO_DATE('2017-11-11', 'YYYY-MM-DD'), '한강대교', '2', '2', '1', '1' ,'1', '소형견');
INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET005', 'PETTY002', '1', '1', 'M', TO_DATE('2015-09-02', 'YYYY-MM-DD'), '수원 화성 행궁 정문', '3', '2', '1', '1', '1', '소형견');
INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET006', 'PETTY003', '0', '1', 'F', TO_DATE('2019-06-10', 'YYYY-MM-DD'), '홍익대학교 정문', '4', '1', '2', '2', '2', '소형견');
INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET007', 'PETTY001', '0',  '0', 'F', TO_DATE('2019-08-03', 'YYYY-MM-DD'), '연트럴파크 (연남동)', '1', '2', '1', '2', '1', '소형견');
INSERT INTO TBL_PET(PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH, PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE, PET_SIZE)
VALUES('PET008', 'PETTY002', '0', '0', 'F',  TO_DATE('2020-12-31', 'YYYY-MM-DD'), '부산 해운대 바닷가', '2', '2', '2', '1', '2', '소형견');
--==>> 1 행 이(가) 삽입되었습니다. * 8

SELECT *
FROM TBL_PET;
--==>> 
/*
PET001	PETTY003	1	1	M	2010-09-27	안양천	4	1	2	1	2	소형견
PET002	PETTY003	0	1	M	2017-09-05	올림픽공원	4	1	1	1	2	소형견
PET003	PETTY001	0	1	M	2012-10-10	철산중학교 운동장	4	2	1	1	1	소형견
PET004	PETTY002	0	0	F	2017-11-11	한강대교	2	2	1	1	1	소형견
PET005	PETTY002	1	1	M	2015-09-02	수원 화성 행궁 정문	3	2	1	1	1	소형견
PET006	PETTY003	0	1	F	2019-06-10	홍익대학교 정문	4	1	2	2	2	소형견
PET007	PETTY001	0	0	F	2019-08-03	연트럴파크 (연남동)	1	2	1	2	1	소형견
PET008	PETTY002	0	0	F	2020-12-31	부산 해운대 바닷가	2	2	2	1	2	소형견
*/

-- 50. TBL_PET_INFO : 반려견정보
CREATE TABLE TBL_PET_INFO
( PET_INFO_CODE VARCHAR2(30)
, PET_CODE      VARCHAR2(30)    NOT NULL
, PET_NAME      VARCHAR2(30)    NOT NULL
, PET_PHOTO     VARCHAR2(300)   NOT NULL
, PET_ADDR      VARCHAR2(200)   NOT NULL
, PET_REGNUM    VARCHAR2(30)
, CONSTRAINT PETINFO_CODE_PK PRIMARY KEY(PET_INFO_CODE)
, CONSTRAINT PETINFO_PETCODE_FK FOREIGN KEY(PET_CODE)
             REFERENCES TBL_PET(PET_CODE)
);
--==>> Table TBL_PET_INFO이(가) 생성되었습니다.

DESC TBL_PET_INFO;
--==>>
/*
이름            널?       유형            
------------- -------- ------------- 
PET_INFO_CODE NOT NULL VARCHAR2(30)  
PET_CODE      NOT NULL VARCHAR2(30)  
PET_NAME      NOT NULL VARCHAR2(30)  
PET_PHOTO     NOT NULL VARCHAR2(300) 
PET_ADDR      NOT NULL VARCHAR2(200) 
PET_REGNUM             VARCHAR2(30)  
*/

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN001', 'PET001', '날동이', 'C:\Users\joohee\Desktop\final', '부산시 서구 동대신3동');

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN002', 'PET002', '코코 ', 'C:\Users\joohee\Desktop\final', '부산시 서구 동대신1동 ');

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN003', 'PET003', '김치', 'C:\Users\joohee\Desktop\final', '경기도 광명시 철산 3동');

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN004', 'PET004', '재롱이', 'C:\Users\joohee\Desktop\final', '경기도 안양시 비서2동');

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN005', 'PET005', '까꿍이', 'C:\Users\joohee\Desktop\final', '경기도 광명시 하안1동');

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN006', 'PET006', '콩자', 'C:\Users\joohee\Desktop\final', '경기도 부천시 소사구 송내1동');

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN007', 'PET007', '절미', 'C:\Users\joohee\Desktop\final', '대전광역시 서구 둔산동');

INSERT INTO TBL_PET_INFO(PET_INFO_CODE, PET_CODE, PET_NAME, PET_PHOTO, PET_ADDR)
VALUES('PETIN008', 'PET008', '보리', 'C:\Users\joohee\Desktop\final', '경상북도 포항시 북구 흥해읍');
--==>> 1 행 이(가) 삽입되었습니다. * 8

SELECT *
FROM TBL_PET_INFO;
--==>> 
/*
PETIN001	PET001	날동이	C:\Users\joohee\Desktop\final	부산시 서구 동대신3동	
PETIN002	PET002	코코 	C:\Users\joohee\Desktop\final	부산시 서구 동대신1동 	
PETIN003	PET003	김치	C:\Users\joohee\Desktop\final	경기도 광명시 철산 3동	
PETIN004	PET004	재롱이	C:\Users\joohee\Desktop\final	경기도 안양시 비서2동	
PETIN005	PET005	까꿍이	C:\Users\joohee\Desktop\final	경기도 광명시 하안1동	
PETIN006	PET006	콩자	C:\Users\joohee\Desktop\final	경기도 부천시 소사구 송내1동	
PETIN007	PET007	절미	C:\Users\joohee\Desktop\final	대전광역시 서구 둔산동	
PETIN008	PET008	보리	C:\Users\joohee\Desktop\final	경상북도 포항시 북구 흥해읍	
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 51. TBL_RELATION : 양육관계
CREATE TABLE TBL_RELATION
( RELATION_CODE     VARCHAR2(30)
, SID_CODE          VARCHAR2(30) NOT NULL
, PET_CODE          VARCHAR2(30) NOT NULL
, RELATION_TYPE_CODE VARCHAR2(2) NOT NULL
, CONSTRAINT RELATION_CODE_PK PRIMARY KEY (RELATION_CODE)
, CONSTRAINT RELATION_SID_FK FOREIGN KEY (SID_CODE)
             REFERENCES TBL_SID(SID_CODE)
, CONSTRAINT RELATION_PET_FK FOREIGN KEY (PET_CODE)
             REFERENCES TBL_PET(PET_CODE)
, CONSTRAINT RELATION_RELATIONTYPE_FK FOREIGN KEY(RELATION_TYPE_CODE)
             REFERENCES TBL_RELATION_TYPE(RELATION_TYPE_CODE)
);
--==>> Table TBL_RELATION이(가) 생성되었습니다.

DESC TBL_RELATION;
--==>> 
/*
이름                 널?       유형           
------------------ -------- ------------ 
RELATION_CODE      NOT NULL VARCHAR2(30) 
SID_CODE           NOT NULL VARCHAR2(30) 
PET_CODE           NOT NULL VARCHAR2(30) 
RELATION_TYPE_CODE NOT NULL VARCHAR2(2) 
*/

INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL001', 'SID002', 'PET001', '1');
INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL002', 'SID003', 'PET002', '1');
INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL003', 'SID001', 'PET003', '1');
INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL004', 'SID006', 'PET004', '1');
INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL005', 'SID007', 'PET005', '1');
INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL006', 'SID008', 'PET006', '1');
INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL007', 'SID009', 'PET007', '1');
INSERT INTO TBL_RELATION(RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE)
VALUES('REL008', 'SID010', 'PET008', '1');
--==>> 1 행 이(가) 삽입되었습니다. * 8

SELECT *
FROM TBL_RELATION;
--==>>
/*
REL001	SID002	PET001	1
REL002	SID003	PET002	1
REL003	SID001	PET003	1
REL004	SID006	PET004	1
REL005	SID007	PET005	1
REL006	SID008	PET006	1
REL007	SID009	PET007	1
REL008	SID010	PET008	1
*/

-- 52. TBL_VACCINE : 예방접종
CREATE TABLE TBL_VACCINE
( VACCINE_CODE      VARCHAR2(30)
, PET_CODE          VARCHAR2(30) NOT NULL
, INJECT_TYPE_CODE VARCHAR2(2)  NOT NULL
, CONSTRAINT VACCINE_CODE_PK PRIMARY KEY(VACCINE_CODE)
, CONSTRAINT VACCINE_PET_FK FOREIGN KEY(PET_CODE)
             REFERENCES TBL_PET(PET_CODE)
, CONSTRAINT VACCINE_INJECTTYPE_FK FOREIGN KEY(INJECT_TYPE_CODE)
             REFERENCES TBL_INJECT_TYPE(INJECT_TYPE_CODE)
);
--==>> Table TBL_VACCINE이(가) 생성되었습니다.

DESC TBL_VACCINE;
--==>> Table TBL_VACCINE이(가) 생성되었습니다.
/*
이름               널?       유형           
---------------- -------- ------------ 
VACCINE_CODE     NOT NULL VARCHAR2(30) 
PET_CODE         NOT NULL VARCHAR2(30) 
INJECT_TYPE_CODE NOT NULL VARCHAR2(2) 
*/

INSERT INTO TBL_VACCINE(VACCINE_CODE, PET_CODE, INJECT_TYPE_CODE)
VALUES('VAC001', 'PET001', '1');
INSERT INTO TBL_VACCINE(VACCINE_CODE, PET_CODE, INJECT_TYPE_CODE)
VALUES('VAC002', 'PET001', '2');
INSERT INTO TBL_VACCINE(VACCINE_CODE, PET_CODE, INJECT_TYPE_CODE)
VALUES('VAC003', 'PET002', '1');
INSERT INTO TBL_VACCINE(VACCINE_CODE, PET_CODE, INJECT_TYPE_CODE)
VALUES('VAC004', 'PET003', '1');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_VACCINE;
--==>>
/*
VAC001	PET001	1
VAC002	PET001	2
VAC003	PET002	1
VAC004	PET003	1
*/

-- 53. TBL_DISEASE : 기저질환
CREATE TABLE TBL_DISEASE
( DISEASE_CODE      VARCHAR2(30)
, PET_CODE          VARCHAR2(30) NOT NULL
, DISEASE_TYPE_CODE VARCHAR2(2)  NOT NULL
, CONSTRAINT DISEASE_CODE_PK PRIMARY KEY(DISEASE_CODE)
, CONSTRAINT DISEASE_PETCODE_FK FOREIGN KEY(PET_CODE)
             REFERENCES TBL_PET(PET_CODE)
, CONSTRAINT DIESEASE_TYPE_FK FOREIGN KEY(DISEASE_TYPE_CODE)
             REFERENCES TBL_DISEASE_TYPE(DISEASE_TYPE_CODE)
);
--==>> Table TBL_DISEASE이(가) 생성되었습니다.

DESC TBL_DISEASE;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
DISEASE_CODE      NOT NULL VARCHAR2(30) 
PET_CODE          NOT NULL VARCHAR2(30) 
DISEASE_TYPE_CODE NOT NULL VARCHAR2(2)  
*/

INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS001', 'PET001', '1'); 
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS002', 'PET001', '2');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS003', 'PET002', '5');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS004', 'PET003', '2');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS005', 'PET003', '4');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS006', 'PET004', '1');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS007', 'PET005', '3');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS008', 'PET006', '3');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS009', 'PET007', '1');
INSERT INTO TBL_DISEASE(DISEASE_CODE, PET_CODE, DISEASE_TYPE_CODE)
VALUES('DIS010', 'PET008', '4');
--==>> 1 행 이(가) 삽입되었습니다. * 8

SELECT *
FROM TBL_DISEASE;
--==>>
/*
DIS001	PET001	1
DIS002	PET001	2
DIS003	PET002	5
DIS004	PET003	2
DIS005	PET003	4
DIS006	PET004	1
DIS007	PET005	3
DIS008	PET006	3
DIS009	PET007	1
DIS010	PET008	4
*/

-- 54. TBL_FAV_FOOD : 관심사료
CREATE TABLE TBL_FAV_FOOD
( FAV_FOOD_CODE      VARCHAR2(30)
, PET_CODE           VARCHAR2(30) NOT NULL
, FAV_FOOD_TYPE_CODE VARCHAR2(2)  NOT NULL
, CONSTRAINT FAVFOOD_CODE_PK PRIMARY KEY(FAV_FOOD_CODE)
, CONSTRAINT FAVFOOD_PET_FK FOREIGN KEY (PET_CODE)
             REFERENCES TBL_PET(PET_CODE)
, CONSTRAINT FAVFOOD_TYPE_FK FOREIGN KEY(FAV_FOOD_TYPE_CODE)
             REFERENCES  TBL_FAV_FOOD_TYPE(FAV_FOOD_TYPE_CODE)
);
--==>> Table TBL_FAV_FOOD이(가) 생성되었습니다.

DESC TBL_FAV_FOOD;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
FAV_FOOD_CODE      NOT NULL VARCHAR2(30) 
PET_CODE           NOT NULL VARCHAR2(30) 
FAV_FOOD_TYPE_CODE NOT NULL VARCHAR2(2)  
*/

INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO001', 'PET001', '1');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO002', 'PET002', '3');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO003', 'PET003', '1');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO004', 'PET004', '4');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO005', 'PET004', '2');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO006', 'PET005', '3');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO007', 'PET006', '4');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO008', 'PET007', '1');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO009', 'PET008', '2');
INSERT INTO TBL_FAV_FOOD(FAV_FOOD_CODE, PET_CODE, FAV_FOOD_TYPE_CODE)
VALUES('FAVFO010', 'PET008', '3');
--==>> 1 행 이(가) 삽입되었습니다. * 8

SELECT *
FROM TBL_FAV_FOOD;
--==>>
/*
FAVFO001	PET001	1
FAVFO002	PET002	3
FAVFO003	PET003	1
FAVFO004	PET004	4
FAVFO005	PET004	2
FAVFO006	PET005	3
FAVFO007	PET006	4
FAVFO008	PET007	1
FAVFO009	PET008	2
FAVFO010	PET008	3
*/


-- 55. TBL_WALK_AGREE : 산책동의
CREATE TABLE TBL_WALK_AGREE
( WALK_AGREE_CODE   VARCHAR2(30)
, SID_CODE          VARCHAR2(30) NOT NULL
, WALK_AGREE_CHECK  VARCHAR2(2)  NOT NULL
, WALK_AGREE_DATE   DATE         DEFAULT SYSDATE
, CONSTRAINT WALKAGREE_CODE_PK PRIMARY KEY(WALK_AGREE_CODE)
, CONSTRAINT WALKAGREE_SID_FK FOREIGN KEY(SID_CODE)
             REFERENCES TBL_SID(SID_CODE)
);
--==>> Table TBL_WALK_AGREE이(가) 생성되었습니다.

DESC TBL_WALK_AGREE;
--==>>
/*
이름               널?       유형           
---------------- -------- ------------ 
WALK_AGREE_CODE  NOT NULL VARCHAR2(30) 
SID_CODE         NOT NULL VARCHAR2(30) 
WALK_AGREE_CHECK NOT NULL VARCHAR2(2)  
WALK_AGREE_DATE           DATE   
*/

INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR001', 'SID001', 'Y', TO_DATE('2021-06-24', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR002', 'SID002', 'Y', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR003', 'SID003', 'Y', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR004', 'SID004', 'Y', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR005', 'SID005', 'Y', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR006', 'SID006', 'Y', TO_DATE('2021-06-26', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR007', 'SID007', 'Y', TO_DATE('2021-06-26', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR008', 'SID008', 'Y', TO_DATE('2021-06-26', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다. * 8

SELECT *
FROM TBL_WALK_AGREE;
--==>>
/*
AGR001	SID001	Y	2021-06-24
AGR002	SID002	Y	2021-06-25
AGR003	SID003	Y	2021-06-25
AGR004	SID004	Y	2021-06-25
AGR005	SID005	Y	2021-06-25
AGR006	SID006	Y	2021-06-26
AGR007	SID007	Y	2021-06-26
AGR008	SID008	Y	2021-06-26
*/


-- 56. TBL_WALKROOM : 산책방 (산책메이트)
CREATE TABLE TBL_WALKROOM
( WALKROOM_CODE      NUMBER
, WALKROOM_LEADER    VARCHAR2(30)   NOT NULL
, AUTO_CODE          VARCHAR2(2)    NOT NULL
, STYLE_CODE         VARCHAR2(2)    NOT NULL
, BITE_CODE          VARCHAR2(2)    NOT NULL
, DESEX_CODE         VARCHAR2(2)    NOT NULL
, SAMESEX_CODE       VARCHAR2(2)    NOT NULL
, WALKROOM_MIN       NUMBER(1)      NOT NULL
, WALKROOM_MAX       NUMBER(1)      NOT NULL
, WALKROOM_START     DATE           NOT NULL
, WALKROOM_END       DATE           NOT NULL
, WALKROOM_TITLE     VARCHAR2(100)  NOT NULL
, WALKROOM_WORDS     VARCHAR2(300)
, WALKROOM_PLACE     VARCHAR2(100)  NOT NULL
, WALKROOM_LATITUDE  VARCHAR2(20)   NOT NULL
, WALKROOM_LONGITUDE VARCHAR2(20)   NOT NULL
, WALKROOM_GENDATE   DATE           DEFAULT SYSDATE
, CONSTRAINT WALKROOM_CODE_PK PRIMARY KEY(WALKROOM_CODE)
, CONSTRAINT WALKROOM_LEADER_FK FOREIGN KEY(WALKROOM_LEADER)
             REFERENCES TBL_SID(SID_CODE)
, CONSTRAINT WALKROOM_AUTO_FK FOREIGN KEY(AUTO_CODE)
             REFERENCES TBL_AUTO_LEG(AUTO_CODE)
, CONSTRAINT WALKROOM_STYLE_FK FOREIGN KEY(STYLE_CODE)
             REFERENCES TBL_STYLE_LEG(STYLE_CODE)
, CONSTRAINT WALKROOM_BITE_FK FOREIGN KEY(BITE_CODE)
             REFERENCES TBL_BITE_LEG(BITE_CODE)
, CONSTRAINT WALKROOM_DESEX_FK FOREIGN KEY(DESEX_CODE)
             REFERENCES TBL_DESEX_LEG(DESEX_CODE)
, CONSTRAINT WALKROOM_SAMESEX_FK FOREIGN KEY(SAMESEX_CODE)
             REFERENCES TBL_SAMESEX_LEG(SAMESEX_CODE)
);
--==>> Table TBL_WALKROOM이(가) 생성되었습니다.

DESC TBL_WALKROOM;
--==>>
/*
이름                 널?       유형            
------------------ -------- ------------- 
WALKROOM_CODE      NOT NULL NUMBER        
WALKROOM_LEADER    NOT NULL VARCHAR2(30)  
AUTO_CODE          NOT NULL VARCHAR2(2)   
STYLE_CODE         NOT NULL VARCHAR2(2)   
BITE_CODE          NOT NULL VARCHAR2(2)   
DESEX_CODE         NOT NULL VARCHAR2(2)   
SAMESEX_CODE       NOT NULL VARCHAR2(2)   
WALKROOM_MIN       NOT NULL NUMBER(1)     
WALKROOM_MAX       NOT NULL NUMBER(1)     
WALKROOM_START     NOT NULL DATE          
WALKROOM_END       NOT NULL DATE          
WALKROOM_TITLE     NOT NULL VARCHAR2(100) 
WALKROOM_WORDS              VARCHAR2(300) 
WALKROOM_PLACE     NOT NULL VARCHAR2(100) 
WALKROOM_LATITUDE  NOT NULL VARCHAR2(20)  
WALKROOM_LONGITUDE NOT NULL VARCHAR2(20)  
WALKROOM_GENDATE            DATE          
*/

INSERT INTO TBL_WALKROOM(WALKROOM_CODE, WALKROOM_LEADER
, AUTO_CODE, STYLE_CODE, BITE_CODE, DESEX_CODE, SAMESEX_CODE
, WALKROOM_MIN, WALKROOM_MAX
, WALKROOM_START, WALKROOM_END
, WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE
, WALKROOM_GENDATE)
VALUES(1, 'SID001'
, '1', '2', '0', '1', '0'
, 2, 4
, TO_DATE('2021-06-27 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-27 19:00:00', 'YYYY-MM-DD HH24:MI:SS')
, '함께 산책 하실 분?', '같이가요ㅎ', '안양천 철산-가산 돌다리 앞', '37.475694', '126.876208'
, TO_DATE('2021-06-27 13:15:24', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_WALKROOM(WALKROOM_CODE, WALKROOM_LEADER
, AUTO_CODE, STYLE_CODE, BITE_CODE, DESEX_CODE, SAMESEX_CODE
, WALKROOM_MIN, WALKROOM_MAX
, WALKROOM_START, WALKROOM_END
, WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE
, WALKROOM_GENDATE)
VALUES(2, 'SID002'
, '1', '3', '1', '0', '0'
, 3, 4
, TO_DATE('2021-06-27 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-27 21:00:00', 'YYYY-MM-DD HH24:MI:SS')
, '가취가욥~!', '프로산책러입니다', '철산한신아파트 106동 놀이터 앞', '37.473677', '126.874963 '
, TO_DATE('2021-06-27 14:30:22', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_WALKROOM(WALKROOM_CODE, WALKROOM_LEADER
, AUTO_CODE, STYLE_CODE, BITE_CODE, DESEX_CODE, SAMESEX_CODE
, WALKROOM_MIN, WALKROOM_MAX
, WALKROOM_START, WALKROOM_END
, WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE
, WALKROOM_GENDATE)
VALUES(3, 'SID007'
, '0', '1', '1', '0', '1'
, 2, 4
, TO_DATE('2021-06-27 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-27 21:00:00', 'YYYY-MM-DD HH24:MI:SS')
, '감성산책', '울애기 착해요', '올림픽대로 옆 놀이터', '37.448685', '132.871343'
, TO_DATE('2021-06-27 15:12:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_WALKROOM(WALKROOM_CODE, WALKROOM_LEADER
, AUTO_CODE, STYLE_CODE, BITE_CODE, DESEX_CODE, SAMESEX_CODE
, WALKROOM_MIN, WALKROOM_MAX
, WALKROOM_START, WALKROOM_END
, WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE
, WALKROOM_GENDATE)
VALUES(4, 'SID008'
, '1', '2', '0', '1', '0'
, 2, 4
, TO_DATE('2021-06-27 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-27 22:00:00', 'YYYY-MM-DD HH24:MI:SS')
, '함께 산책 하실 분?', '같이가요ㅎ', '안양천 철산-가산 돌다리 앞', '37.475694', '126.876208'
, TO_DATE('2021-06-27 16:01:12', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_WALKROOM;
--==>>
/*
1	SID001	1	2	0	1	0	2	4	2021-06-27	2021-06-27	함께 산책 하실 분?	같이가요ㅎ	안양천 철산-가산 돌다리 앞	37.475694	126.876208
2	SID002	1	3	1	0	0	3	4	2021-06-27	2021-06-27	가취가욥~!	프로산책러입니다	철산한신아파트 106동 놀이터 앞	37.473677	126.874963 
3	SID007	0	1	1	0	1	2	4	2021-06-27	2021-06-27	감성산책	울애기 착해요	올림픽대로 옆 놀이터	37.448685	132.871343
4	SID008	1	2	0	1	0	2	4	2021-06-27	2021-06-27	함께 산책 하실 분?	같이가요ㅎ	안양천 철산-가산 돌다리 앞	37.475694	126.876208
*/

-- 57. TBL_PARTICIPANTS : 산책참여자
CREATE TABLE TBL_PARTICIPANTS
( PARTICIPANTS_CODE  VARCHAR2(30)
, WALKROOM_CODE       NUMBER       NOT NULL
, RELATION_CODE       VARCHAR2(30) NOT NULL
, READYOPTION_CODE    VARCHAR2(2)
, READYSTATE_CODE     VARCHAR2(2)
, PARTICIPANTS_START DATE DEFAULT SYSDATE
, CONSTRAINT PARTICIPANTS_CODE_PK PRIMARY KEY(PARTICIPANTS_CODE)
, CONSTRAINT PARTICIPARNT_WALKROOM_FK FOREIGN KEY(WALKROOM_CODE)
             REFERENCES TBL_WALKROOM(WALKROOM_CODE)
             ON DELETE CASCADE
, CONSTRAINT PARTICIPANTS_RELATION_FK FOREIGN KEY(RELATION_CODE)
             REFERENCES TBL_RELATION(RELATION_CODE)
, CONSTRAINT PARTICIPANTS_READYOPTION_FK FOREIGN KEY(READYOPTION_CODE)
             REFERENCES TBL_READYOPTION_LEG(READYOPTION_CODE)
, CONSTRAINT PARTICIPANTS_READYSTATE_FK FOREIGN KEY(READYSTATE_CODE)
             REFERENCES TBL_READYSTATE_LEG(READYSTATE_CODE)
);
--==>> Table TBL_PARTICIPANTS이(가) 생성되었습니다.

DESC TBL_PARTICIPANTS;
--==>>
/*
이름                  널?       유형           
------------------- -------- ------------ 
PARTICIPANTS_CODE   NOT NULL VARCHAR2(30) 
WALKROOM_CODE       NOT NULL NUMBER       
RELATION_CODE       NOT NULL VARCHAR2(30) 
READYOPTION_CODE             VARCHAR2(2)  
READYSTATE_CODE              VARCHAR2(2)  
PARTICIPANTS_START          DATE            
*/

INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE, RELATION_CODE, PARTICIPANTS_START)
VALUES('PAR001', '1', 'REL003', TO_DATE('2021-06-27 13:15:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE, RELATION_CODE, PARTICIPANTS_START)
VALUES('PAR002', '2', 'REL001', TO_DATE('2021-06-27 14:30:22', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE, RELATION_CODE, PARTICIPANTS_START)
VALUES('PAR003', '3', 'REL005', TO_DATE('2021-06-27 15:12:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE,  RELATION_CODE, READYOPTION_CODE, READYSTATE_CODE, PARTICIPANTS_START)
VALUES('PAR004', '1', 'REL002', 1, 1, TO_DATE('2021-06-27 15:15:45', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE,  RELATION_CODE, READYOPTION_CODE, READYSTATE_CODE, PARTICIPANTS_START)
VALUES('PAR005', '3', 'REL007', 1, 0, TO_DATE('2021-06-27 15:34:34', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE, RELATION_CODE, PARTICIPANTS_START)
VALUES('PAR006', '4', 'REL006', TO_DATE('2021-06-27 16:01:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE,  RELATION_CODE, READYOPTION_CODE, READYSTATE_CODE, PARTICIPANTS_START)
VALUES('PAR007', '4', 'REL008', 0, 1, TO_DATE('2021-06-27 16:43:55', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 7

SELECT *
FROM TBL_PARTICIPANTS;
--==>>
/*
PAR001	1	REL003			2021-06-27
PAR002	2	REL001			2021-06-27
PAR003	3	REL005			2021-06-27
PAR004	1	REL002	1	1	2021-06-27
PAR005	3	REL007	1	0	2021-06-27
PAR006	4	REL006			2021-06-27
PAR007	4	REL008	0	1	2021-06-27
*/

-- 58. TBL_WALK_COMMENT : 산책방 댓글
CREATE TABLE TBL_WALK_COMMENT
( WALK_COMM_CODE    NUMBER
, WALKROOM_CODE     NUMBER         NOT NULL
, WALK_COMM_WRITER  VARCHAR2(30)   NOT NULL
, WALK_COMM_CONTENT VARCHAR2(4000) NOT NULL
, WALK_COMM_DATE    DATE           DEFAULT SYSDATE
, CONSTRAINT WALKCOMMENT_CODE_PK PRIMARY KEY(WALK_COMM_CODE)
, CONSTRAINT WALKCOMMENT_WALKROOM_FK FOREIGN KEY(WALKROOM_CODE)
             REFERENCES TBL_WALKROOM(WALKROOM_CODE)
             ON DELETE CASCADE
, CONSTRAINT WALKCOMMENT_WRITER_FK FOREIGN KEY(WALK_COMM_WRITER)
             REFERENCES TBL_SID(SID_CODE)
);
--==>> Table TBL_WALK_COMMENT이(가) 생성되었습니다.

DESC TBL_WALK_COMMENT;
--==>>
/*
이름                널?       유형             
----------------- -------- -------------- 
WALK_COMM_CODE    NOT NULL NUMBER         
WALKROOM_CODE     NOT NULL NUMBER         
WALK_COMM_WRITER  NOT NULL VARCHAR2(30)   
WALK_COMM_CONTENT NOT NULL VARCHAR2(4000) 
WALK_COMM_DATE             DATE   
*/

INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(1, 1, 'SID001', '오늘5분만 늦춰도될까요?', TO_DATE('2021-06-27 15:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(2, 2, 'SID002', '왜아무도안들어오지..', TO_DATE('2021-06-27 15:35:55', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(3, 1, 'SID003', '네 그럼 몇시까지인가요?', TO_DATE('2021-06-27 16:01:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(4, 3, 'SID007', '반갑습니다', TO_DATE('2021-06-27 16:01:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(5, 3, 'SID009', '넹 좋은 산책해요', TO_DATE('2021-06-27 16:22:34', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(6, 3, 'SID008', '저희애기구경하실래요?', TO_DATE('2021-06-27 16:45:54', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(7, 4, 'SID010', '저희애기도 귀엽답니다', TO_DATE('2021-06-27 17:00:33', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(8, 4, 'SID008', '이따 함 보죠 ㅎ', TO_DATE('2021-06-27 17:03:54', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(9, 3, 'SID007', '사람 더 올까요?', TO_DATE('2021-06-27 17:21:54', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_WALK_COMMENT(WALK_COMM_CODE, WALKROOM_CODE, WALK_COMM_WRITER, WALK_COMM_CONTENT, WALK_COMM_DATE)
VALUES(10, 4, 'SID010', '달리기 함 하실?', TO_DATE('2021-06-27 17:54:55', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 10

SELECT *
FROM TBL_WALK_COMMENT;
--==>> 
/*
1	1	SID001	오늘5분만 늦춰도될까요?	2021-06-27
2	2	SID002	왜아무도안들어오지..	2021-06-27
3	1	SID003	네 그럼 몇시까지인가요?	2021-06-27
4	3	SID007	반갑습니다	2021-06-27
5	3	SID009	넹 좋은 산책해요	2021-06-27
6	3	SID008	저희애기구경하실래요?	2021-06-27
7	4	SID010	저희애기도 귀엽답니다	2021-06-27
8	4	SID008	이따 함 보죠 ㅎ	2021-06-27
9	3	SID007	사람 더 올까요?	2021-06-27
10	4	SID010	달리기 함 하실?	2021-06-27
*/


-- 59. TBL_MATCH : 매칭확정
CREATE TABLE TBL_MATCH
( MATCH_CODE    VARCHAR2(30)
, WALKROOM_CODE NUMBER       NOT NULL
, MATCH_DATE    DATE         DEFAULT SYSDATE
, CONSTRAINT MATCH_CODE_PK PRIMARY KEY(MATCH_CODE)
, CONSTRAINT MATCH_WALKROOM_FK FOREIGN KEY(WALKROOM_CODE)
             REFERENCES TBL_WALKROOM(WALKROOM_CODE)
             ON DELETE CASCADE
);
--==>> Table TBL_MATCH이(가) 생성되었습니다.

DESC TBL_MATCH;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
MATCH_CODE    NOT NULL VARCHAR2(30) 
WALKROOM_CODE NOT NULL NUMBER       
MATCH_DATE             DATE  
*/

INSERT INTO TBL_MATCH(MATCH_CODE, WALKROOM_CODE, MATCH_DATE)
VALUES('MAT001', 1, TO_DATE('2021-06-27 17:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_MATCH(MATCH_CODE, WALKROOM_CODE, MATCH_DATE)
VALUES('MAT002', 3, TO_DATE('2021-06-27 18:30:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_MATCH;
--==>> 
/*
MAT001	1	2021-06-27
MAT002	3	2021-06-27
*/

-- 60. TBL_EVALUATION : 산책평가
CREATE TABLE TBL_EVALUATION
( EVAL_CODE    VARCHAR2(30) 
, MATCH_CODE  VARCHAR2(30) NOT NULL
, EVAL_WRITER VARCHAR2(30) NOT NULL
, EVAL_TARGET VARCHAR2(30) NOT NULL
, EVAL_SCORE1 NUMBER(3)
, EVAL_SCORE2 NUMBER(3)
, EVAL_SCORE3 NUMBER(3)
, EVAL_SCORE4 NUMBER(3)
, CONSTRAINT EVALUATION_CODE_PK PRIMARY KEY(EVAL_CODE)
, CONSTRAINT EVALUATION_MATCH_FK FOREIGN KEY(MATCH_CODE)
             REFERENCES TBL_MATCH(MATCH_CODE)
, CONSTRAINT EVALUATION_WRITER_FK FOREIGN KEY(EVAL_WRITER)
             REFERENCES TBL_PARTICIPANTS(PARTICIPANTS_CODE)
, CONSTRAINT EVALUATION_TARGET_FK FOREIGN KEY(EVAL_TARGET)
             REFERENCES TBL_PARTICIPANTS(PARTICIPANTS_CODE)
);
--==>> Table TBL_EVALUATION이(가) 생성되었습니다.

DESC TBL_EVALUATION;
--==>>
/*
이름          널?       유형           
----------- -------- ------------ 
EVAL_CODE   NOT NULL VARCHAR2(30) 
MATCH_CODE  NOT NULL VARCHAR2(30) 
EVAL_WRITER NOT NULL VARCHAR2(30) 
EVAL_TARGET NOT NULL VARCHAR2(30) 
EVAL_SCORE1          NUMBER(3)    
EVAL_SCORE2          NUMBER(3)    
EVAL_SCORE3          NUMBER(3)    
EVAL_SCORE4          NUMBER(3)    
*/

INSERT INTO TBL_EVALUATION(EVAL_CODE, MATCH_CODE, EVAL_WRITER, EVAL_TARGET, EVAL_SCORE1, EVAL_SCORE2, EVAL_SCORE3, EVAL_SCORE4)
VALUES ('EVAL001', 'MAT001', 'PAR003', 'PAR001', 90, 80, 80, 85);
INSERT INTO TBL_EVALUATION(EVAL_CODE, MATCH_CODE, EVAL_WRITER, EVAL_TARGET)
VALUES ('EVAL002', 'MAT001', 'PAR001', 'PAR003');
INSERT INTO TBL_EVALUATION(EVAL_CODE, MATCH_CODE, EVAL_WRITER, EVAL_TARGET, EVAL_SCORE1, EVAL_SCORE2, EVAL_SCORE3, EVAL_SCORE4)
VALUES ('EVAL003', 'MAT002', 'PAR003', 'PAR005', 90, 90, 90, 90);
INSERT INTO TBL_EVALUATION(EVAL_CODE, MATCH_CODE, EVAL_WRITER, EVAL_TARGET, EVAL_SCORE1, EVAL_SCORE2, EVAL_SCORE3, EVAL_SCORE4)
VALUES ('EVAL004', 'MAT002', 'PAR005', 'PAR003', 80, 75, 80, 90);
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_EVALUATION;
--==>> 
/*
EVA001	MAT001	PAR003	PAR001	90	80	80	85
EVA002	MAT001	PAR001	PAR003				
EVA003	MAT002	PAR003	PAR005	90	90	90	90
EVA004	MAT002	PAR005	PAR003	80	75	80	90
*/

-- 61. TBL_WALK_SCORE : 산책점수
CREATE TABLE TBL_WALK_SCORE
( WALK_SCORE_CODE VARCHAR2(30)
, SID_CODE        VARCHAR2(30) NOT NULL
, REWARD_CODE     VARCHAR2(2)
, EVAL_CODE       VARCHAR2(30)
, WALK_SCORE_DATE DATE         DEFAULT SYSDATE
, CONSTRAINT WALKSCORE_CODE_PK PRIMARY KEY(WALK_SCORE_CODE)
, CONSTRAINT WALKSCORE_SID_FK FOREIGN KEY(SID_CODE)
             REFERENCES TBL_SID(SID_CODE)
, CONSTRAINT WALKSCORE_REWARD_CODE FOREIGN KEY(REWARD_CODE)
             REFERENCES TBL_REWARD(REWARD_CODE)
, CONSTRAINT WALKSCORE_EVAL_FK FOREIGN KEY(EVAL_CODE)
             REFERENCES TBL_EVALUATION(EVAL_CODE)
             ON DELETE CASCADE
);
--==>> Table TBL_WALK_SCORE이(가) 생성되었습니다.

DESC TBL_WALK_SCORE;
--==>>
/*
이름              널?       유형           
--------------- -------- ------------ 
WALK_SCORE_CODE NOT NULL VARCHAR2(30) 
SID_CODE        NOT NULL VARCHAR2(30) 
REWARD_CODE              VARCHAR2(2)  
EVAL_CODE                VARCHAR2(30) 
WALK_SCORE_DATE          DATE         
*/

INSERT INTO TBL_WALK_SCORE(WALK_SCORE_CODE, SID_CODE, EVAL_CODE, WALK_SCORE_DATE)
VALUES('SCORE001' , 'SID001', 'EVAL001', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_SCORE(WALK_SCORE_CODE, SID_CODE, EVAL_CODE, WALK_SCORE_DATE)
VALUES('SCORE002' , 'SID007', 'EVAL003', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_WALK_SCORE(WALK_SCORE_CODE, SID_CODE, EVAL_CODE, WALK_SCORE_DATE)
VALUES('SCORE003' , 'SID009', 'EVAL004', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM TBL_WALK_SCORE;
--==>>
/*
SCORE001	SID001		EVAL001	2021-06-28
SCORE002	SID007		EVAL003	2021-06-28
SCORE003	SID009		EVAL004	2021-06-28
*/


-- 62. TBL_REPORT_LOG : 신고내역
CREATE TABLE TBL_REPORT_LOG
( REP_LOG_CODE   VARCHAR2(30)
, REP_TYPE_CODE VARCHAR2(30)  NOT NULL
, REP_LOG_WRITER VARCHAR2(30) NOT NULL
, REP_LOG_DATE   DATE         DEFAULT SYSDATE
, REP_STATE_CODE VARCHAR2(2)  DEFAULT 1
, REP_LOG_READ   DATE
, CONSTRAINT REPLOG_CODE_PK PRIMARY KEY(REP_LOG_CODE)
, CONSTRAINT REPLOG_TYPE_FK FOREIGN KEY(REP_TYPE_CODE)
             REFERENCES TBL_REPORT_TYPE(REP_TYPE_CODE)
);
--==>> Table TBL_REPORT_LOG이(가) 생성되었습니다.

DESC TBL_REPORT_LOG;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
REP_LOG_CODE   NOT NULL VARCHAR2(30) 
REP_TYPE_CODE  NOT NULL VARCHAR2(30) 
REP_LOG_WRITER NOT NULL VARCHAR2(30) 
REP_LOG_DATE            DATE         
REP_STATE_CODE          VARCHAR2(2)  
REP_LOG_READ            DATE         
*/

INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE, REP_LOG_READ)
VALUES('REP001', '1', 'SID003', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '2', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE, REP_LOG_READ)
VALUES('REP002', '1', 'SID007', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '1', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE, REP_LOG_READ)
VALUES('REP003', '1', 'SID002', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '1', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE)
VALUES('REP004', '3', 'SID001', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '3');
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE, REP_LOG_READ)
VALUES('REP005', '3', 'SID001', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '2', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE, REP_LOG_READ)
VALUES('REP006', '2', 'SID003', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '2', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE)
VALUES('REP007', '2', 'SID003', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '2');
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE)
VALUES('REP008', '3', 'SID002', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '1');
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE, REP_LOG_READ)
VALUES('REP009', '3', 'SID010', TO_DATE('2021-06-27', 'YYYY-MM-DD'), '2', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE)
VALUES('REP010', '4', 'SID003', TO_DATE('2021-06-28', 'YYYY-MM-DD'), '2');
INSERT INTO TBL_REPORT_LOG(REP_LOG_CODE, REP_TYPE_CODE, REP_LOG_WRITER, REP_LOG_DATE, REP_STATE_CODE)
VALUES('REP011', '4', 'SID001', TO_DATE('2021-06-28', 'YYYY-MM-DD'), '1');
--==>> 1 행 이(가) 삽입되었습니다. * 11

SELECT *
FROM TBL_REPORT_LOG;
--==>> 
/*
REP001	1	SID003	2021-06-27	2	2021-06-28
REP002	1	SID007	2021-06-27	1	2021-06-28
REP003	1	SID002	2021-06-27	1	2021-06-28
REP004	3	SID001	2021-06-27	3	
REP005	3	SID001	2021-06-27	2	2021-06-28
REP006	2	SID003	2021-06-27	2	2021-06-28
REP007	2	SID003	2021-06-27	2	
REP008	3	SID002	2021-06-27	1	
REP009	3	SID010	2021-06-27	2	2021-06-28
REP010	4	SID003	2021-06-28	2	
REP011	4	SID001	2021-06-28	1	
*/ 

-- 63. TBL_WALKCOMM_REPORT : 산책방댓글신고
CREATE TABLE TBL_WALKCOMM_REPORT
( WALKCOMM_REP_CODE VARCHAR2(30)
, REP_LOG_CODE      VARCHAR2(30) NOT NULL
, WALK_COMM_CODE    NUMBER       NOT NULL
, CONSTRAINT WALKCOMMREP_CODE_PK PRIMARY KEY(WALKCOMM_REP_CODE)
, CONSTRAINT WALKCOMMREP_REPLOG_FK FOREIGN KEY(REP_LOG_CODE)
             REFERENCES TBL_REPORT_LOG(REP_LOG_CODE)
, CONSTRAINT WALKCOMMREP_WALKCOMM_FK FOREIGN KEY(WALK_COMM_CODE)
             REFERENCES TBL_WALK_COMMENT(WALK_COMM_CODE)
             -- 신고된 댓글을 삭제하면 안되므로 제약조건 설정하지 않음 
);
--==>> Table TBL_WALKCOMM_REPORT이(가) 생성되었습니다.

DESC TBL_WALKCOMM_REPORT;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
WALKCOMM_REP_CODE NOT NULL VARCHAR2(30) 
REP_LOG_CODE      NOT NULL VARCHAR2(30) 
WALK_COMM_CODE    NOT NULL NUMBER  
*/

INSERT INTO TBL_WALKCOMM_REPORT(WALKCOMM_REP_CODE, REP_LOG_CODE, WALK_COMM_CODE)
VALUES('WCREP001', 'REP004', 2);
INSERT INTO TBL_WALKCOMM_REPORT(WALKCOMM_REP_CODE, REP_LOG_CODE, WALK_COMM_CODE)
VALUES('WCREP002', 'REP005', 1);

SELECT *
FROM TBL_WALKCOMM_REPORT;
--==>>
/*
WCREP001	REP004	2
WCREP002	REP005	1
*/

-- 64. TBL_BOARDCOMM_REPORT : 게시글댓글신고
CREATE TABLE TBL_BOARDCOMM_REPORT
( BOARDCOMM_REP_CODE VARCHAR2(30)
, REP_LOG_CODE       VARCHAR2(30) NOT NULL
, BOARD_COMM_CODE    NUMBER       NOT NULL
, CONSTRAINT BOARDCOMMREP_CODE_PK PRIMARY KEY(BOARDCOMM_REP_CODE)
, CONSTRAINT BOARDCOMMREP_REPLOG_FK FOREIGN KEY(REP_LOG_CODE)
             REFERENCES TBL_REPORT_LOG(REP_LOG_CODE)
, CONSTRAINT BOARDCOMMREP_BOARDCOMM_FK FOREIGN KEY(BOARD_COMM_CODE)
             REFERENCES TBL_BOARD_COMMENT(BOARD_COMM_CODE)
             -- 신고된 댓글 삭제 불가능하게 제약조건 설정 안함
);
--==>> Table TBL_BOARDCOMM_REPORT이(가) 생성되었습니다.

DESC TBL_BOARDCOMM_REPORT;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
BOARDCOMM_REP_CODE NOT NULL VARCHAR2(30) 
REP_LOG_CODE       NOT NULL VARCHAR2(30) 
BOARD_COMM_CODE    NOT NULL NUMBER       
*/

INSERT INTO TBL_BOARDCOMM_REPORT(BOARDCOMM_REP_CODE, REP_LOG_CODE, BOARD_COMM_CODE)
VALUES('BCREP001', 'REP006', '2');
INSERT INTO TBL_BOARDCOMM_REPORT(BOARDCOMM_REP_CODE, REP_LOG_CODE, BOARD_COMM_CODE)
VALUES('BCREP002', 'REP007', '5');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_BOARDCOMM_REPORT;
--==>> 
/*
BCREP001	REP006	2
BCREP002	REP007	5
*/

-- 65. TBL_BOARD_REPORT : 게시글신고
CREATE TABLE TBL_BOARD_REPORT
( BOARD_REP_CODE VARCHAR2(30)
, REP_LOG_CODE   VARCHAR2(30) NOT NULL
, BOARD_CODE     NUMBER       NOT NULL
, CONSTRAINT BOARDREP_CODE_PK PRIMARY KEY(BOARD_REP_CODE)
, CONSTRAINT BOARDREP_REPLOG_FK FOREIGN KEY(REP_LOG_CODE)
             REFERENCES TBL_REPORT_LOG(REP_LOG_CODE)
, CONSTRAINT BOARDREP_BOARD_FK FOREIGN KEY(BOARD_CODE)
             REFERENCES TBL_BOARD(BOARD_CODE)
             -- 신고된 게시글 삭제 불가
);
--==>> Table TBL_BOARD_REPORT이(가) 생성되었습니다.

DESC TBL_BOARD_REPORT;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
BOARD_REP_CODE NOT NULL VARCHAR2(30) 
REP_LOG_CODE   NOT NULL VARCHAR2(30) 
BOARD_CODE     NOT NULL NUMBER   
*/

INSERT INTO TBL_BOARD_REPORT(BOARD_REP_CODE, REP_LOG_CODE, BOARD_CODE)
VALUES('BREP001', 'REP001', '7');
INSERT INTO TBL_BOARD_REPORT(BOARD_REP_CODE, REP_LOG_CODE, BOARD_CODE)
VALUES('BREP002', 'REP002', '3');
INSERT INTO TBL_BOARD_REPORT(BOARD_REP_CODE, REP_LOG_CODE, BOARD_CODE)
VALUES('BREP003', 'REP003', '3');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_BOARD_REPORT;
--==>> 
/*
BREP001	REP001	7
BREP002	REP002	3
BREP003	REP003	3
*/


-- 66. TBL_WALKROOM_REPORT : 산책방신고
CREATE TABLE TBL_WALKROOM_REPORT
( WALKROOM_REP_CODE VARCHAR2(30)
, REP_LOG_CODE      VARCHAR2(30) NOT NULL
, WALKROOM_CODE     NUMBER       NOT NULL
, CONSTRAINT WALKROOMREP_CODE_PK PRIMARY KEY(WALKROOM_REP_CODE)
, CONSTRAINT WALKROOMREP_REPLOG_FK FOREIGN KEY(REP_LOG_CODE)
             REFERENCES TBL_REPORT_LOG(REP_LOG_CODE)
, CONSTRAINT WALKROOMREP_WALKROOM_FK FOREIGN KEY(WALKROOM_CODE)
             REFERENCES TBL_WALKROOM(WALKROOM_CODE)
             -- 신고된 산책방 삭제불가
);
--==>> Table TBL_WALKROOM_REPORT이(가) 생성되었습니다.

DESC TBL_WALKROOM_REPORT;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
WALKROOM_REP_CODE NOT NULL VARCHAR2(30) 
REP_LOG_CODE      NOT NULL VARCHAR2(30) 
WALKROOM_CODE     NOT NULL NUMBER 
*/

INSERT INTO TBL_WALKROOM_REPORT(WALKROOM_REP_CODE, REP_LOG_CODE, WALKROOM_CODE)
VALUES('WRREP001', 'REP008', 1);
INSERT INTO TBL_WALKROOM_REPORT(WALKROOM_REP_CODE, REP_LOG_CODE, WALKROOM_CODE)
VALUES('WRREP002', 'REP009', 2);
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_WALKROOM_REPORT;
--==>>
/*
WRREP001	REP008	1
WRREP002	REP009	2
WRREP003	REP004	1
*/

-- 67. TBL_OFF_REPORT : 오프라인신고
CREATE TABLE TBL_OFF_REPORT
( OFF_REP_CODE       VARCHAR2(30)
, REP_LOG_CODE       VARCHAR2(30)
, MATCH_CODE         VARCHAR2(30) NOT NULL
, PARTICIPANTS_CODE VARCHAR2(30)  NOT NULL
, CONSTRAINT OFFREP_CODE_PK PRIMARY KEY(OFF_REP_CODE)
, CONSTRAINT OFFREP_REPLOG_FK FOREIGN KEY(REP_LOG_CODE)
             REFERENCES TBL_REPORT_LOG(REP_LOG_CODE)
, CONSTRAINT OFFREP_MATCH_FK FOREIGN KEY(MATCH_CODE)
             REFERENCES TBL_MATCH(MATCH_CODE)
             -- 오프라인 신고된 매칭 삭제 불가
);
--==>> Table TBL_OFF_REPORT이(가) 생성되었습니다.

DESC TBL_OFF_REPORT;
--==>> 
/*
이름                널?       유형           
----------------- -------- ------------ 
OFF_REP_CODE      NOT NULL VARCHAR2(30) 
REP_LOG_CODE               VARCHAR2(30) 
MATCH_CODE        NOT NULL VARCHAR2(30) 
PARTICIPANTS_CODE NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_OFF_REPORT(OFF_REP_CODE, REP_LOG_CODE, MATCH_CODE, PARTICIPANTS_CODE)
VALUES('OFFREP001', 'REP009', 'MAT001', 'PAR001');
--==>> 1 행 이(가) 삽입되었습니다.

DELETE
FROM TBL_OFF_REPORT;
--==>> OFFREP001	REP009	MAT001	PAR001


------------------------------------> 추가해 할 것 (신고 : 오프라인신고에서 데이터 꼬인 것 수정 및 추가)
SELECT *
FROM TBL_OFF_REPORT;

UPDATE TBL_OFF_REPORT
SET REP_LOG_CODE = 'REP010'
WHERE OFF_REP_CODE = 'OFFREP001';

INSERT INTO TBL_OFF_REPORT(OFF_REP_CODE, REP_LOG_CODE, MATCH_CODE, PARTICIPANTS_CODE)
VALUES('OFFREP002', 'REP011', 'MAT001' ,'PAR004');



-- 68. TBL_OFFOPINION : 무단결석의견
CREATE TABLE TBL_OFFOPINION
( OFFOPINION_CODE    VARCHAR2(30)
, OFF_REP_CODE       VARCHAR2(30)   NOT NULL
, OFFOPINION_DATE    DATE           DEFAULT SYSDATE
, OFFOPINION_TITLE   VARCHAR2(100)  NOT NULL
, OFFOPINION_CONTENT VARCHAR2(4000) NOT NULL
, OFFOPINION_PHOTO   VARCHAR2(300)
, CONSTRAINT OFFOPINION_CODE_PK PRIMARY KEY(OFFOPINION_CODE)
, CONSTRAINT OFFOPINION_OFFREP_FK FOREIGN KEY(OFF_REP_CODE)
             REFERENCES TBL_OFF_REPORT(OFF_REP_CODE)
             -- 신고자체는 삭제되지 않는다.(미처리, 신고해제, 신고확정의 상태만 바뀔 뿐)
);
--==>> Table TBL_OFFOPINION이(가) 생성되었습니다.

DESC TBL_OFFOPINION;
--==>> 
/*
이름                 널?       유형             
------------------ -------- -------------- 
OFFOPINION_CODE    NOT NULL VARCHAR2(30)   
OFF_REP_CODE       NOT NULL VARCHAR2(30)   
OFFOPINION_DATE             DATE           
OFFOPINION_TITLE   NOT NULL VARCHAR2(100)  
OFFOPINION_CONTENT NOT NULL VARCHAR2(4000) 
OFFOPINION_PHOTO            VARCHAR2(300)  
*/

INSERT INTO TBL_OFFOPINION(OFFOPINION_CODE, OFF_REP_CODE, OFFOPINION_DATE, OFFOPINION_TITLE, OFFOPINION_CONTENT)
VALUES('OFFOP001', 'OFFREP001', TO_DATE('2021-06-30', 'YYYY-MM-DD'), '저 산책 나갔어요', '저 그날 주희님 뵀거든요? 좀 어이없네요..');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_OFFOPINION;
--==>> OFFOP001	OFFREP001	2021-06-30	저 산책 나갔어요	저 그날 주희님 뵀거든요? 좀 어이없네요..	

-- 69. TBL_FAVORITE : 즐겨찾기
CREATE TABLE TBL_FAVORITE
( FAVORITE_CODE VARCHAR2(30)
, RELATION_CODE VARCHAR2(30) NOT NULL
, FAVORITE_NAME VARCHAR2(30) NOT NULL
, FAVORITE_DATE DATE         DEFAULT SYSDATE
, CONSTRAINT FAVORITE_CODE_PK PRIMARY KEY(FAVORITE_CODE)
, CONSTRAINT FAVORITE_RELATION_FK FOREIGN KEY(RELATION_CODE)
             REFERENCES TBL_RELATION(RELATION_CODE)
             -- 양육관계는 지워지지 않는다.(sid, pet_code)
);
--==>> Table TBL_FAVORITE이(가) 생성되었습니다.

DESC TBL_FAVORITE;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
FAVORITE_CODE NOT NULL VARCHAR2(30) 
RELATION_CODE NOT NULL VARCHAR2(30) 
FAVORITE_NAME NOT NULL VARCHAR2(30) 
FAVORITE_DATE          DATE  
*/

INSERT INTO TBL_FAVORITE(FAVORITE_CODE, RELATION_CODE, FAVORITE_NAME, FAVORITE_DATE)
VALUES('FAV001', 'REL005', '까꿍사료', TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_FAVORITE(FAVORITE_CODE, RELATION_CODE, FAVORITE_NAME, FAVORITE_DATE)
VALUES('FAV002', 'REL005', '까꿍간식말고기', TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_FAVORITE(FAVORITE_CODE, RELATION_CODE, FAVORITE_NAME, FAVORITE_DATE)
VALUES('FAV003', 'REL006', '콩자껌', TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_FAVORITE(FAVORITE_CODE, RELATION_CODE, FAVORITE_NAME, FAVORITE_DATE)
VALUES('FAV005', 'REL005', '까꿍영양제', TO_DATE('2021-07-02', 'YYYY-MM-DD'));
INSERT INTO TBL_FAVORITE(FAVORITE_CODE, RELATION_CODE, FAVORITE_NAME, FAVORITE_DATE)
VALUES('FAV006', 'REL005', '까꿍손훈련', TO_DATE('2021-07-02', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다. * 5

-- 누락 데이터 추가
INSERT INTO TBL_FAVORITE(FAVORITE_CODE, RELATION_CODE, FAVORITE_NAME, FAVORITE_DATE)
VALUES('FAV004', 'REL005',  '까꿍영양제', TO_DATE('2021-07-02', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_FAVORITE;
--==>>
/*
FAV001	REL005	까꿍사료	2021-06-30
FAV002	REL005	까꿍간식말고기	2021-06-30
FAV003	REL006	콩자껌	2021-06-30
FAV005	REL005	까꿍영양제	2021-07-02
FAV006	REL005	까꿍손훈련	2021-07-02
*/


-- 70. TBL_DAILY : 일일관리
CREATE TABLE TBL_DAILY
( DAILY_CODE VARCHAR2(30)
, RELATION_CODE VARCHAR2(30) NOT NULL
, DAILY_DATE DATE DEFAULT SYSDATE
, CONSTRAINT DAILY_CODE_PK PRIMARY KEY(DAILY_CODE)
, CONSTRAINT DAILY_RELATION_FK FOREIGN KEY(RELATION_CODE)
             REFERENCES TBL_RELATION(RELATION_CODE)
             -- 양육관계는 지워지지 않는다.(sid, pet_code)
);
--==>> Table TBL_DAILY이(가) 생성되었습니다.

--ALTER TABLE TBL_DAILY RENAME COLUMN DAILY_DAT TO DAILY_DATE;
--==>> Table TBL_DAILY이(가) 변경되었습니다.

DESC TBL_DAILY;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
DAILY_CODE    NOT NULL VARCHAR2(30) 
RELATION_CODE NOT NULL VARCHAR2(30) 
DAILY_DAT              DATE 
*/

INSERT INTO TBL_DAILY(DAILY_CODE, RELATION_CODE, DAILY_DATE)
VALUES('DAILY001' , 'REL005', TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_DAILY(DAILY_CODE, RELATION_CODE, DAILY_DATE)
VALUES('DAILY002', 'REL006', TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_DAILY(DAILY_CODE, RELATION_CODE, DAILY_DATE)
VALUES('DAILY003', 'REL005', TO_DATE('2021-07-02', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_DAILY;
--==>>
/*
DAILY001	REL005	2021-06-30
DAILY002	REL006	2021-06-30
DAILY003	REL005	2021-07-02
*/


-- 71. TBL_COMMON : 공통항목
CREATE TABLE TBL_COMMON
( COMMON_CODE   VARCHAR2(30)
, COMMON_START  DATE            NOT NULL
, COMMON_END    DATE            NOT NULL
, COMMON_MEMO   VARCHAR2(4000)
, COMMON_PHOTO  VARCHAR2(300)
, DAILY_CODE    VARCHAR2(30)    NOT NULL
, CONSTRAINT COMMON_CODE_PK PRIMARY KEY(COMMON_CODE)
, CONSTRAINT COMMON_DAILY_FK FOREIGN KEY(DAILY_CODE)
             REFERENCES TBL_DAILY(DAILY_CODE)
             -- 일일관리 삭제 불가
);
--==>> Table TBL_COMMON이(가) 생성되었습니다.

DESC TBL_COMMON;
--==>>
/*
이름           널?       유형             
------------ -------- -------------- 
COMMON_CODE  NOT NULL VARCHAR2(30)   
COMMON_START NOT NULL DATE           
COMMON_END   NOT NULL DATE           
COMMON_MEMO           VARCHAR2(4000) 
COMMON_PHOTO          VARCHAR2(300)  
DAILY_CODE   NOT NULL VARCHAR2(30)   
*/

INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM001', TO_DATE('2021-06-30 1:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 2:00:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍상태','DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM002', TO_DATE('2021-06-30 2:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 3:00:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자상태', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM003', TO_DATE('2021-06-30 3:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 4:00:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍체중', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM004', TO_DATE('2021-06-30 4:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 5:00:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자체중', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM005', TO_DATE('2021-06-30 5:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 6:00:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자출산', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM006', TO_DATE('2021-06-30 6:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 7:00:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍사료','DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM007', TO_DATE('2021-06-30 7:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 8:00:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자사료', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM008', TO_DATE('2021-06-30 8:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 9:00:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍간식', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM009', TO_DATE('2021-06-30 9:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자간식', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM010', TO_DATE('2021-06-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍산책', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM011', TO_DATE('2021-06-30 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자산책', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM012', TO_DATE('2021-06-30 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍양치', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM013', TO_DATE('2021-06-30 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자양치', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM014', TO_DATE('2021-06-30 11:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍귀청소', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM015', TO_DATE('2021-06-30 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:35:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자귀청소', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM016', TO_DATE('2021-06-30 11:35:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:36:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍목욕', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM017', TO_DATE('2021-06-30 11:36:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:37:00', 'YYYY-MM-DD HH24:MI:SS'), '콩자목욕', 'DAILY002');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM018', TO_DATE('2021-06-30 11:37:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:38:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍건강검진', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM019', TO_DATE('2021-06-30 11:39:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-30 11:40:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍접종', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM020', TO_DATE('2021-07-02 1:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-02 1:05:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍질환', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM021', TO_DATE('2021-07-02 1:06:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-02 1:10:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍수술', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM022', TO_DATE('2021-07-02 1:11:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-02 1:15:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍미용', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM023', TO_DATE('2021-07-02 1:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-02 1:25:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍영양제', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM024', TO_DATE('2021-07-02 1:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-02 1:40:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍훈련', 'DAILY001');
INSERT INTO TBL_COMMON(COMMON_CODE, COMMON_START, COMMON_END, COMMON_MEMO, DAILY_CODE)
VALUES('COM025', TO_DATE('2021-07-02 1:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-02 1:50:00', 'YYYY-MM-DD HH24:MI:SS'), '까꿍기타', 'DAILY001');
--==>> 1 행 이(가) 삽입되었습니다. * 25

SELECT *
FROM TBL_COMMON;
--==>> 
/*
COM001	2021-06-30	2021-06-30	까꿍상태		DAILY001
COM002	2021-06-30	2021-06-30	콩자상태		DAILY002
COM003	2021-06-30	2021-06-30	까꿍체중		DAILY001
COM004	2021-06-30	2021-06-30	콩자체중		DAILY002
COM005	2021-06-30	2021-06-30	콩자출산		DAILY002
COM006	2021-06-30	2021-06-30	까꿍사료		DAILY001
COM007	2021-06-30	2021-06-30	콩자사료		DAILY002
COM008	2021-06-30	2021-06-30	까꿍간식		DAILY001
COM009	2021-06-30	2021-06-30	콩자간식		DAILY002
COM010	2021-06-30	2021-06-30	까꿍산책		DAILY001
COM011	2021-06-30	2021-06-30	콩자산책		DAILY002
COM012	2021-06-30	2021-06-30	까꿍양치		DAILY001
COM013	2021-06-30	2021-06-30	콩자양치		DAILY002
COM014	2021-06-30	2021-06-30	까꿍귀청소		DAILY001
COM015	2021-06-30	2021-06-30	콩자귀청소		DAILY002
COM016	2021-06-30	2021-06-30	까꿍목욕		DAILY001
COM017	2021-06-30	2021-06-30	콩자목욕		DAILY002
COM018	2021-06-30	2021-06-30	까꿍건강검진		DAILY001
COM019	2021-06-30	2021-06-30	까꿍접종		DAILY001
COM020	2021-07-02	2021-07-02	까꿍질환		DAILY001
COM021	2021-07-02	2021-07-02	까꿍수술		DAILY001
COM022	2021-07-02	2021-07-02	까꿍미용		DAILY001
COM023	2021-07-02	2021-07-02	까꿍영양제		DAILY001
COM024	2021-07-02	2021-07-02	까꿍훈련		DAILY001
COM025	2021-07-02	2021-07-02	까꿍기타		DAILY001
*/


-- 72. TBL_CLEAN_FAV : 청결즐겨찾기
CREATE TABLE TBL_CLEAN_FAV
( CLEAN_FAV_CODE VARCHAR2(30)
, RELATION_CODE VARCHAR2(30) NOT NULL
, CLEAN_FAV_NAME VARCHAR2(30) NOT NULL
, CLEAN_FAV_DATE DATE DEFAULT SYSDATE
, CONSTRAINT CLEANFAV_CODE_PK PRIMARY KEY(CLEAN_FAV_CODE)
, CONSTRAINT CLEANFAV_RELATION_FK FOREIGN KEY(RELATION_CODE)
             REFERENCES TBL_RELATION(RELATION_CODE)
             -- 양육관계 삭제 불가
);
--==>> Table TBL_CLEAN_FAV이(가) 생성되었습니다.

DESC TBL_CLEAN_FAV;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
CLEAN_FAV_CODE NOT NULL VARCHAR2(30) 
RELATION_CODE  NOT NULL VARCHAR2(30) 
CLEAN_FAV_NAME NOT NULL VARCHAR2(30) 
CLEAN_FAV_DATE          DATE  
*/

INSERT INTO TBL_CLEAN_FAV(CLEAN_FAV_CODE, RELATION_CODE, CLEAN_FAV_NAME, CLEAN_FAV_DATE)
VALUES('CLEAN001', 'REL005', '버박 닭고기맛' , TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_CLEAN_FAV(CLEAN_FAV_CODE, RELATION_CODE, CLEAN_FAV_NAME, CLEAN_FAV_DATE)
VALUES('CLEAN002', 'REL006', '이지엔 바르는치약', TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_CLEAN_FAV(CLEAN_FAV_CODE, RELATION_CODE, CLEAN_FAV_NAME, CLEAN_FAV_DATE)
VALUES('CLEAN003', 'REL005', '하이포닉'  , TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_CLEAN_FAV(CLEAN_FAV_CODE, RELATION_CODE, CLEAN_FAV_NAME, CLEAN_FAV_DATE)
VALUES('CLEAN004', 'REL006', '버박'  , TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_CLEAN_FAV(CLEAN_FAV_CODE, RELATION_CODE, CLEAN_FAV_NAME, CLEAN_FAV_DATE)
VALUES('CLEAN005', 'REL005', '하이포닉 알러지용', TO_DATE('2021-06-30', 'YYYY-MM-DD'));
INSERT INTO TBL_CLEAN_FAV(CLEAN_FAV_CODE, RELATION_CODE, CLEAN_FAV_NAME, CLEAN_FAV_DATE)
VALUES('CLEAN006', 'REL006', '오가닉 백모용'  , TO_DATE('2021-06-30', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다. * 6

SELECT *
FROM TBL_CLEAN_FAV;
--==>>
/*
CLEAN001	REL005	버박 닭고기맛	2021-06-30
CLEAN002	REL006	이지엔 바르는치약	2021-06-30
CLEAN003	REL005	하이포닉	2021-06-30
CLEAN004	REL006	버박	2021-06-30
CLEAN005	REL005	하이포닉 알러지용	2021-06-30
CLEAN006	REL006	오가닉 백모용	2021-06-30
*/

-- 73. TBL_STATE : 상태입력
CREATE TABLE TBL_STATE
( STATE_CODE     VARCHAR2(30)
, COMMON_CODE    VARCHAR2(30) NOT NULL
, STATE_LEG_CODE VARCHAR2(2) NOT NULL
, CONSTRAINT STATE_CODE_PK PRIMARY KEY(STATE_CODE)
, CONSTRAINT STATE_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
             -- 기록 삭제시 공통항목보다 상태가 먼저 지워져야 함 
, CONSTRAINT STATE_LEG_FK FOREIGN KEY(STATE_LEG_CODE)
             REFERENCES TBL_STATE_LEG(STATE_LEG_CODE)
);
--==>> Table TBL_STATE이(가) 생성되었습니다.

DESC TBL_STATE;
--==>> 
/*
이름             널?       유형           
-------------- -------- ------------ 
STATE_CODE     NOT NULL VARCHAR2(30) 
COMMON_CODE    NOT NULL VARCHAR2(30) 
STATE_LEG_CODE NOT NULL VARCHAR2(2)  
*/

INSERT INTO TBL_STATE(STATE_CODE, COMMON_CODE, STATE_LEG_CODE)
VALUES('STA001', 'COM001', '1');
INSERT INTO TBL_STATE(STATE_CODE, COMMON_CODE, STATE_LEG_CODE)
VALUES('STA002', 'COM002', '2');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_STATE;
--==>>
/*
STA001	COM001	1
STA002	COM002	2
*/


-- 74. TBL_WEIGHT : 체중입력
CREATE TABLE TBL_WEIGHT
( WEIGHT_CODE VARCHAR2(30)
, COMMON_CODE VARCHAR2(30) NOT NULL
, WEIGHT      NUMBER(5)    NOT NULL
, CONSTRAINT WEIGHT_CODE_PK PRIMARY KEY(WEIGHT_CODE)
, CONSTRAINT WEIGHT_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
             -- 기록 삭제시 공통항목보다 상태가 먼저 지워져야 함
);
--==>> Table TBL_WEIGHT이(가) 생성되었습니다.

DESC TBL_WEIGHT;
--==>>
/*
이름          널?       유형           
----------- -------- ------------ 
WEIGHT_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE NOT NULL VARCHAR2(30) 
WEIGHT      NOT NULL NUMBER(5)    
*/

INSERT INTO TBL_WEIGHT(WEIGHT_CODE, COMMON_CODE, WEIGHT)
VALUES('WEI001', 'COM003', '4');
INSERT INTO TBL_WEIGHT(WEIGHT_CODE, COMMON_CODE, WEIGHT)
VALUES('WEI002', 'COM004', '3');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_WEIGHT;
--==>>
/*
WEI001	COM003	4
WEI002	COM004	3
*/

-- 75. TBL_MEAL_INFO : 사료
CREATE TABLE TBL_MEAL_INFO
( MEAL_INFO_CODE VARCHAR2(30)
, FAVORITE_CODE  VARCHAR2(30)
, MEAL_NAME      VARCHAR2(30) NOT NULL
, MEAL_TYPE      VARCHAR2(10) NOT NULL
, MEAL_AMOUNT    NUMBER(3)    NOT NULL
, UNIT_CODE      VARCHAR2(2)  NOT NULL
, CONSTRAINT MEALINFO_CODE_PK PRIMARY KEY(MEAL_INFO_CODE)
, CONSTRAINT MEALINFO_FAV_FK FOREIGN KEY(FAVORITE_CODE)
             REFERENCES TBL_FAVORITE(FAVORITE_CODE)
             ON DELETE SET NULL
, CONSTRAINT MEALINFO_TYPE_FK FOREIGN KEY(MEAL_TYPE)
             REFERENCES TBL_MEAL_TYPE(MEAL_TYPE_CODE)
, CONSTRAINT MEALINFO_UNIT_FK FOREIGN KEY(UNIT_CODE)
             REFERENCES TBL_UNIT(UNIT_CODE)
);
--==>> Table TBL_MEAL_INFO이(가) 생성되었습니다.

DESC TBL_MEAL_INFO;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
MEAL_INFO_CODE NOT NULL VARCHAR2(30) 
FAVORITE_CODE           VARCHAR2(30) 
MEAL_NAME      NOT NULL VARCHAR2(30) 
MEAL_TYPE      NOT NULL VARCHAR2(10) 
MEAL_AMOUNT    NOT NULL NUMBER(3)    
UNIT_CODE      NOT NULL VARCHAR2(2) 
*/

INSERT INTO TBL_MEAL_INFO(MEAL_INFO_CODE, FAVORITE_CODE, MEAL_NAME, MEAL_TYPE, MEAL_AMOUNT, UNIT_CODE)
VALUES('MEA001', 'FAV001', '오리젠', '1', 50, '1');
INSERT INTO TBL_MEAL_INFO(MEAL_INFO_CODE, MEAL_NAME, MEAL_TYPE, MEAL_AMOUNT, UNIT_CODE)
VALUES('MEA002', '로얄캐닌', '2', 40, '1');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_MEAL_INFO;
--==>> 
/*
MEA001	FAV001	오리젠	1	50	1
MEA002	(null)	로얄캐닌	2	40	1
*/

-- 76. TBL_MEAL : 사료입력
CREATE TABLE TBL_MEAL
( MEAL_CODE      VARCHAR2(30)
, MEAL_INFO_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE    VARCHAR2(30) NOT NULL
, CONSTRAINT MEAL_CODE_PK PRIMARY KEY(MEAL_CODE)
, CONSTRAINT MEAL_INFO_FK FOREIGN KEY(MEAL_INFO_CODE)
             REFERENCES TBL_MEAL_INFO(MEAL_INFO_CODE)
             -- INFO 는 지워지지 않음
, CONSTRAINT MEAL_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_MEAL이(가) 생성되었습니다.

DESC TBL_MEAL;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
MEAL_CODE      NOT NULL VARCHAR2(30) 
MEAL_INFO_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE    NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_MEAL(MEAL_CODE, MEAL_INFO_CODE, COMMON_CODE)
VALUES('MEC001', 'MEA001', 'COM006');
INSERT INTO TBL_MEAL(MEAL_CODE, MEAL_INFO_CODE, COMMON_CODE)
VALUES('MEC002', 'MEA002', 'COM007');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_MEAL;
--==>> 
/*
MEC001	MEA001	COM006
MEC002	MEA002	COM007
*/

-- 77-0. TBL_SNACK_TYPE : 간식 종류
CREATE TABLE TBL_SNACK_TYPE
( SNACK_TYPE_CODE     VARCHAR2(2)
, SNACK_TYPE_CONTENT  VARCHAR2(30) NOT NULL
, CONSTRAINT SNACKTYPE_CODE_PK PRIMARY KEY(SNACK_TYPE_CODE)
);
--==>> Table TBL_SNACK_TYPE이(가) 생성되었습니다.

DESC TBL_SNACK_TYPE;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
SNACK_TYPE_CODE    NOT NULL VARCHAR2(2)  
SNACK_TYPE_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_SNACK_TYPE(SNACK_TYPE_CODE, SNACK_TYPE_CONTENT)
VALUES('1', '껌');
INSERT INTO TBL_SNACK_TYPE(SNACK_TYPE_CODE, SNACK_TYPE_CONTENT)
VALUES('2', '비스킷/져키');
INSERT INTO TBL_SNACK_TYPE(SNACK_TYPE_CODE, SNACK_TYPE_CONTENT)
VALUES('3', '캔');
INSERT INTO TBL_SNACK_TYPE(SNACK_TYPE_CODE, SNACK_TYPE_CONTENT)
VALUES('4', '육포');
INSERT INTO TBL_SNACK_TYPE(SNACK_TYPE_CODE, SNACK_TYPE_CONTENT)
VALUES('5', '우유');
INSERT INTO TBL_SNACK_TYPE(SNACK_TYPE_CODE, SNACK_TYPE_CONTENT)
VALUES('6', '기타');
--==>> 1 행 이(가) 삽입되었습니다. * 6

SELECT *
FROM TBL_SNACK_TYPE;
--==>>
/*
1	껌
2	비스킷/져키
3	캔
4	육포
5	우유
6	기타
*/


-- 77-1. TBL_SNACK_INFO : 간식
CREATE TABLE TBL_SNACK_INFO
( SNACK_INFO_CODE VARCHAR2(30)
, FAVORITE_CODE   VARCHAR2(30)
, SNACK_NAME      VARCHAR2(30) NOT NULL
, SNACK_TYPE      VARCHAR2(30) NOT NULL
, SNACK_AMOUNT    NUMBER(3)    NOT NULL
, UNIT_CODE       VARCHAR2(2)  NOT NULL
, CONSTRAINT SNACKINFO_CODE_PK PRIMARY KEY(SNACK_INFO_CODE)
, CONSTRAINT SNACKINFO_FAV_FK FOREIGN KEY(FAVORITE_CODE)
             REFERENCES TBL_FAVORITE(FAVORITE_CODE)
, CONSTRAINT SNACKINFO_UNIT_FK FOREIGN KEY(UNIT_CODE)
             REFERENCES TBL_UNIT(UNIT_CODE)
);
--==>> Table TBL_SNACK_INFO이(가) 생성되었습니다.

DESC TBL_SNACK_INFO;
--==>>
/*
이름              널?       유형           
--------------- -------- ------------ 
SNACK_INFO_CODE NOT NULL VARCHAR2(30) 
FAVORITE_CODE            VARCHAR2(30) 
SNACK_NAME      NOT NULL VARCHAR2(30) 
SNACK_TYPE      NOT NULL VARCHAR2(30) 
SNACK_AMOUNT    NOT NULL NUMBER(3)    
UNIT_CODE       NOT NULL VARCHAR2(2)  
*/

INSERT INTO TBL_SNACK_INFO(SNACK_INFO_CODE, FAVORITE_CODE, SNACK_NAME, SNACK_TYPE, SNACK_AMOUNT, UNIT_CODE)
VALUES('SNA001', 'FAV002', '말고기', '고기', 20, '1');
INSERT INTO TBL_SNACK_INFO(SNACK_INFO_CODE, FAVORITE_CODE, SNACK_NAME, SNACK_TYPE, SNACK_AMOUNT, UNIT_CODE)
VALUES('SNA002', 'FAV003', '개껌', '껌', 10, '1');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_SNACK_INFO;
--==>> 
/*
SNA001	FAV002	말고기	고기	20	1
SNA002	FAV003	개껌	껌	10	1
*/

-- 외래키 제약조건 추가를 위한 레코드 값 변경
UPDATE TBL_SNACK_INFO
SET SNACK_TYPE='2'
WHERE SNACK_INFO_CODE='SNA001';

UPDATE TBL_SNACK_INFO
SET SNACK_TYPE='1'
WHERE SNACK_INFO_CODE='SNA002';

-- 외래키 제약조건 추가
ALTER TABLE TBL_SNACK_INFO
ADD CONSTRAINT SNACKINFO_TYPE_FK FOREIGN KEY(SNACK_TYPE)
               REFERENCES TBL_SNACK_TYPE(SNACK_TYPE_CODE);

SELECT *
FROM TBL_SNACK_INFO;
--==>> 
/*
SNA001	FAV002	말고기	2	20	1
SNA002	FAV003	개껌	    1	10	1
*/


-- 78. TBL_SNACK : 간식입력
CREATE TABLE TBL_SNACK
( SNACK_CODE      VARCHAR2(30)
, SNACK_INFO_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE     VARCHAR2(30) NOT NULL
, CONSTRAINT SNACK_CODE_PK PRIMARY KEY(SNACK_CODE)
, CONSTRAINT SNACK_INFO_FK FOREIGN KEY(SNACK_INFO_CODE)
             REFERENCES TBL_SNACK_INFO(SNACK_INFO_CODE)
             -- INFO 는 지워지지 않음
, CONSTRAINT SNACK_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_SNACK이(가) 생성되었습니다.


DESC TBL_SNACK;
--==>> 
/*
이름              널?       유형           
--------------- -------- ------------ 
SNACK_CODE      NOT NULL VARCHAR2(30) 
SNACK_INFO_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE     NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_SNACK(SNACK_CODE, SNACK_INFO_CODE, COMMON_CODE)
VALUES('SNC001', 'SNA001', 'COM008');
INSERT INTO TBL_SNACK(SNACK_CODE, SNACK_INFO_CODE, COMMON_CODE)
VALUES('SNC002', 'SNA002', 'COM009');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_SNACK;
--==>>
/*
SNC001	SNA001	COM008
SNC002	SNA002	COM009
*/


-- 79. TBL_WALK : 산책입력
CREATE TABLE TBL_WALK
( WALK_CODE VARCHAR2(30)
, COMMON_CODE VARCHAR2(30) NOT NULL
, WALK_WATHER VARCHAR2(10)
, WALK_PLACE VARCHAR2(100) NOT NULL
, CONSTRAINT WALK_CODE_PK PRIMARY KEY(WALK_CODE)
, CONSTRAINT WALK_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_WALK이(가) 생성되었습니다.

DESC TBL_WALK;
--==>>
/*
이름          널?       유형            
----------- -------- ------------- 
WALK_CODE   NOT NULL VARCHAR2(30)  
COMMON_CODE NOT NULL VARCHAR2(30)  
WALK_WATHER          VARCHAR2(10)  
WALK_PLACE  NOT NULL VARCHAR2(100) 
*/

INSERT INTO TBL_WALK(WALK_CODE, COMMON_CODE, WALK_WATHER, WALK_PLACE)
VALUES('DWA001', 'COM010', '해쨍쨍', '안양천 돌다리부터 13단지 전체');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_WALK;
--==>> DWA001	COM010	해쨍쨍	안양천 돌다리부터 13단지 전체

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 80. TBL_TOOTH : 양치입력
CREATE TABLE TBL_TOOTH
( TOOTH_CODE     VARCHAR2(30)
, CLEAN_FAV_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE    VARCHAR2(30) NOT NULL
, CONSTRAINT TOOTH_CODE_PK PRIMARY KEY(TOOTH_CODE)
, CONSTRAINT TOOTH_CLEANFAV_FK FOREIGN KEY(CLEAN_FAV_CODE)
             REFERENCES TBL_CLEAN_FAV(CLEAN_FAV_CODE)
             -- 청결은 즐찾 삭제 불가(정책)
, CONSTRAINT TOOTH_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE) 
);
--==>> Table TBL_TOOTH이(가) 생성되었습니다.
 
DESC TBL_TOOTH;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
TOOTH_CODE     NOT NULL VARCHAR2(30) 
CLEAN_FAV_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE    NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_TOOTH(TOOTH_CODE, CLEAN_FAV_CODE, COMMON_CODE)
VALUES('TOO001' , 'CLEAN001' , 'COM012');
INSERT INTO TBL_TOOTH(TOOTH_CODE, CLEAN_FAV_CODE, COMMON_CODE)
VALUES('TOO002' , 'CLEAN002' , 'COM013');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_TOOTH;
--==>>
/*
TOO001	CLEAN001	COM012
TOO002	CLEAN002	COM013
*/


-- 81. TBL_EAR : 귀청소입력
CREATE TABLE TBL_EAR
( EAR_CODE       VARCHAR2(30)
, CLEAN_FAV_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE    VARCHAR2(30) NOT NULL
, CONSTRAINT EAR_CODE_PK PRIMARY KEY(EAR_CODE)
, CONSTRAINT EAR_CLEANFAV_FK FOREIGN KEY(CLEAN_FAV_CODE)
             REFERENCES TBL_CLEAN_FAV(CLEAN_FAV_CODE)
             -- 청결은 즐찾 삭제 불가(정책)
, CONSTRAINT EAR_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_EAR이(가) 생성되었습니다.

DESC TBL_EAR;
--==>> 
/*
이름             널?       유형           
-------------- -------- ------------ 
EAR_CODE       NOT NULL VARCHAR2(30) 
CLEAN_FAV_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE    NOT NULL VARCHAR2(30)
*/

INSERT INTO TBL_EAR(EAR_CODE, CLEAN_FAV_CODE, COMMON_CODE)
VALUES('EAR001', 'CLEAN003', 'COM014');
INSERT INTO TBL_EAR(EAR_CODE, CLEAN_FAV_CODE, COMMON_CODE)
VALUES('EAR002', 'CLEAN004', 'COM015');

SELECT *
FROM TBL_EAR;
--==>>
/*
EAR001	CLEAN003	COM014
EAR002	CLEAN004	COM015
*/


-- 82. TBL_BATH : 목욕입력
CREATE TABLE TBL_BATH
( BATH_CODE      VARCHAR2(30)
, CLEAN_FAV_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE    VARCHAR2(30) NOT NULL
, CONSTRAINT BATH_CODE_PK PRIMARY KEY(BATH_CODE)
, CONSTRAINT BATH_CLEANFAV_FK FOREIGN KEY(CLEAN_FAV_CODE)
             REFERENCES TBL_CLEAN_FAV(CLEAN_FAV_CODE)
             -- 청결은 즐찾 삭제 불가(정책)
, CONSTRAINT BATH_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_BATH이(가) 생성되었습니다.

DESC TBL_BATH;
--==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
BATH_CODE      NOT NULL VARCHAR2(30) 
CLEAN_FAV_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE    NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_BATH(BATH_CODE, CLEAN_FAV_CODE, COMMON_CODE )
VALUES('BAT001', 'CLEAN005', 'COM016');
INSERT INTO TBL_BATH(BATH_CODE, CLEAN_FAV_CODE, COMMON_CODE )
VALUES('BAT002', 'CLEAN006', 'COM017');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_BATH;
--==>>
/*
BAT001	CLEAN005	COM016
BAT002	CLEAN006	COM017
*/

-- 83. TBL_CHECK : 건강검진입력 
CREATE TABLE TBL_CHECK
( CHECK_CODE    VARCHAR2(30)
, HOSPITAL_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE   VARCHAR2(30) NOT NULL
, CHECK_COST    NUMBER       NOT NULL
, CHECK_NEXT    DATE
, CONSTRAINT CHECK_CODE_PK PRIMARY KEY(CHECK_CODE)
, CONSTRAINT CHECK_HOS_FK FOREIGN KEY(HOSPITAL_CODE)
             REFERENCES TBL_HOSPITAL(HOSPITAL_CODE)
             -- 병원 삭제 불가
, CONSTRAINT CHECK_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)

);
--==>> Table TBL_CHECK이(가) 생성되었습니다.

DESC TBL_CHECK;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
CHECK_CODE    NOT NULL VARCHAR2(30) 
HOSPITAL_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE   NOT NULL VARCHAR2(30) 
CHECK_COST    NOT NULL NUMBER       
CHECK_NEXT             DATE      
*/

INSERT INTO TBL_CHECK(CHECK_CODE, HOSPITAL_CODE, COMMON_CODE, CHECK_COST, CHECK_NEXT)
VALUES('CHE001', 'HOS001', 'COM018', 97000 , TO_DATE('2021-07-30', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_CHECK;
--==>> CHE001	HOS001	COM018	97000	21/07/30


-- 84. TBL_INJECT : 접종입력
CREATE TABLE TBL_INJECT
( INJECT_CODE           VARCHAR2(30)
, HOSPITAL_CODE         VARCHAR2(30)    NOT NULL
, INJECT_TYPE_CODE      VARCHAR2(30)    NOT NULL
, COMMON_CODE           VARCHAR2(30)    NOT NULL
, INJECT_COST           NUMBER          NOT NULL
, INJECT_NEXT           DATE
, CONSTRAINT INJECT_CODE_PK PRIMARY KEY(INJECT_CODE)
, CONSTRAINT INJECT_HOS_FK FOREIGN KEY(HOSPITAL_CODE)
             REFERENCES TBL_HOSPITAL(HOSPITAL_CODE)
             -- 병원 삭제 안됨
, CONSTRAINT INJECT_TYPE_FK FOREIGN KEY(INJECT_TYPE_CODE)
             REFERENCES TBL_INJECT_TYPE(INJECT_TYPE_CODE)
, CONSTRAINT INJECT_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE) 
);
--==>> Table TBL_INJECT이(가) 생성되었습니다.

DESC TBL_INJECT;
--==>>
/*
이름               널?       유형           
---------------- -------- ------------ 
INJECT_CODE      NOT NULL VARCHAR2(30) 
HOSPITAL_CODE    NOT NULL VARCHAR2(30) 
INJECT_TYPE_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE      NOT NULL VARCHAR2(30) 
INJECT_COST      NOT NULL NUMBER       
INJECT_NEXT               DATE    
*/

INSERT INTO TBL_INJECT(INJECT_CODE, HOSPITAL_CODE, INJECT_TYPE_CODE, COMMON_CODE, INJECT_COST,  INJECT_NEXT)
VALUES('INJ001', 'HOS001', '1', 'COM019' , 50000, TO_DATE('2021-07-30', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_INJECT;
--==>> INJ001	HOS001	1	COM019	50000	21/07/30

-- 85. TBL_ILLNESS : 질환입력
CREATE TABLE TBL_ILLNESS
( ILLNESS_CODE VARCHAR2(30)
, HOSPITAL_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE VARCHAR2(30) NOT NULL
, ILLNESS_NAME VARCHAR2(30) NOT NULL
, ILLNESS_COST NUMBER NOT NULL
, ILLNESS_NEXT DATE
, CONSTRAINT ILLNESS_CODE_PK PRIMARY KEY(ILLNESS_CODE)
, CONSTRAINT ILLNESS_HOS_FK FOREIGN KEY(HOSPITAL_CODE)
             REFERENCES TBL_HOSPITAL(HOSPITAL_CODE)
             -- 병원 삭제 안됨
, CONSTRAINT ILLNESS_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_ILLNESS이(가) 생성되었습니다.

DESC TBL_ILLNESS;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
ILLNESS_CODE  NOT NULL VARCHAR2(30) 
HOSPITAL_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE   NOT NULL VARCHAR2(30) 
ILLNESS_NAME  NOT NULL VARCHAR2(30) 
ILLNESS_COST  NOT NULL NUMBER       
ILLNESS_NEXT           DATE 
*/

INSERT INTO TBL_ILLNESS(ILLNESS_CODE, HOSPITAL_CODE, COMMON_CODE, ILLNESS_NAME, ILLNESS_COST, ILLNESS_NEXT)
VALUES('ILL001', 'HOS001', 'COM020', '감기', 50000, TO_DATE('2021-07-30', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_ILLNESS;
--==>> ILL001	HOS001	COM020	감기	50000	21/07/30


-- 86. TBL_SURGERY : 수술/입원입력
CREATE TABLE TBL_SURGERY
( SURGERY_CODE VARCHAR2(30)
, HOSPITAL_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE VARCHAR2(30) NOT NULL
, SURGERY_NAME VARCHAR2(30) NOT NULL
, SURGERY_COST NUMBER NOT NULL
, SURGERY_NEXT DATE
, CONSTRAINT SURGERY_CODE_PK PRIMARY KEY(SURGERY_CODE)
, CONSTRAINT SURGERY_HOS_FK FOREIGN KEY(HOSPITAL_CODE)
             REFERENCES TBL_HOSPITAL(HOSPITAL_CODE)
             -- 병원 삭제 안됨
, CONSTRAINT SURGERY_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_SURGERY이(가) 생성되었습니다.

-- 잘못된 컬럼명 변경
--ALTER TABLE TBL_SURGERY RENAME COLUMN SURGERY_COSE TO SURGERY_COST;
--==>> Table TBL_SURGERY이(가) 변경되었습니다.

DESC TBL_SURGERY;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
SURGERY_CODE  NOT NULL VARCHAR2(30) 
HOSPITAL_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE   NOT NULL VARCHAR2(30) 
SURGERY_NAME  NOT NULL VARCHAR2(30) 
SURGERY_COSE  NOT NULL NUMBER       
SURGERY_NEXT           DATE        
*/

INSERT INTO TBL_SURGERY(SURGERY_CODE, HOSPITAL_CODE, COMMON_CODE, SURGERY_NAME, SURGERY_COST, SURGERY_NEXT)
VALUES('SUR001' , 'HOS001' , 'COM021', '중성화' , 210000 , TO_DATE('2021-07-30', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_SURGERY;
--==>> SUR001	HOS001	COM021	중성화	210000	21/07/30


-- 87. TBL_BEAUTY : 미용입력
CREATE TABLE TBL_BEAUTY
( BEAUTY_CODE VARCHAR2(30)
, SHOP_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE VARCHAR2(30) NOT NULL
, BEAUTY_TYPE_CODE VARCHAR2(30) NOT NULL
, BEAUTY_COST NUMBER NOT NULL
, CONSTRAINT BEAUTY_CODE_PK PRIMARY KEY(BEAUTY_CODE)
, CONSTRAINT BEAUTY_SHOP_FK FOREIGN KEY(SHOP_CODE)
             REFERENCES TBL_SHOP(SHOP_CODE)
             -- 미용샵 삭제 불가
, CONSTRAINT BEAUTY_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
, CONSTRAINT BEAUTY_TYPE_FK FOREIGN KEY(BEAUTY_TYPE_CODE)
             REFERENCES TBL_BEAUTY_TYPE(BEAUTY_TYPE_CODE)
);
--==>> Table TBL_BEAUTY이(가) 생성되었습니다.

DESC TBL_BEAUTY;
--==>>
/*
이름               널?       유형           
---------------- -------- ------------ 
BEAUTY_CODE      NOT NULL VARCHAR2(30) 
SHOP_CODE        NOT NULL VARCHAR2(30) 
COMMON_CODE      NOT NULL VARCHAR2(30) 
BEAUTY_TYPE_CODE NOT NULL VARCHAR2(30) 
BEAUTY_COST      NOT NULL NUMBER  
*/

INSERT INTO TBL_BEAUTY (BEAUTY_CODE, SHOP_CODE, COMMON_CODE, BEAUTY_TYPE_CODE, BEAUTY_COST)
VALUES('BEA001', 'SHOP001', 'COM022', '1', 50000);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_BEAUTY;
--==>> BEA001	SHOP001	COM022	1	50000

-- 88. TBL_MEDICINE_TYPE : 약 종류
CREATE TABLE TBL_MEDICINE_TYPE
( MEDICINE_TYPE_CODE    VARCHAR2(2)
, MEDICINE_CONTENT      VARCHAR2(30) NOT NULL
, CONSTRAINT MEDICINETYPE_CODE_PK PRIMARY KEY(MEDICINE_TYPE_CODE)
);
--==>> Table TBL_MEDICINE_TYPE이(가) 생성되었습니다.

DESC TBL_MEDICINE_TYPE;
--==>> 
/*
이름                 널?       유형           
------------------ -------- ------------ 
MEDICINE_TYPE_CODE NOT NULL VARCHAR2(2)  
MEDICINE_CONTENT   NOT NULL VARCHAR2(30)
*/
1 가루
2 알
3 물 

INSERT INTO TBL_MEDICINE_TYPE(MEDICINE_TYPE_CODE, MEDICINE_CONTENT)
VALUES('1', '가루약');
INSERT INTO TBL_MEDICINE_TYPE(MEDICINE_TYPE_CODE, MEDICINE_CONTENT)
VALUES('2', '알약');
INSERT INTO TBL_MEDICINE_TYPE(MEDICINE_TYPE_CODE, MEDICINE_CONTENT)
VALUES('3', '물약');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM TBL_MEDICINE_TYPE;
--==>> 
/*
1	가루약
2	알약
3	물약
*/

-- 89. TBL_NUTRIENTS_INFO : 영양제
CREATE TABLE TBL_NUTRIENTS_INFO
( NUT_INFO_CODE VARCHAR2(30)
, FAVORITE_CODE VARCHAR2(30)
, NUT_NAME      VARCHAR2(30) NOT NULL
, NUT_TYPE      VARCHAR2(10) NOT NULL
, NUT_AMOUNT    NUMBER       NOT NULL
, UNIT_CODE     VARCHAR2(30) NOT NULL
, CONSTRAINT NUTRIENTSINFO_CODE_PK PRIMARY KEY(NUT_INFO_CODE)
, CONSTRAINT NUTRIENTSINFO_FAV_FK FOREIGN KEY(FAVORITE_CODE)
             REFERENCES TBL_FAVORITE(FAVORITE_CODE)
             ON DELETE SET NULL
, CONSTRAINT NUTRIENTSINFO_TYPE_FK FOREIGN KEY(NUT_TYPE)
             REFERENCES TBL_MEDICINE_TYPE(MEDICINE_TYPE_CODE)
, CONSTRAINT NUTRIENTSINFO_UNIT_CODE FOREIGN KEY(UNIT_CODE)
             REFERENCES TBL_UNIT(UNIT_CODE)
);
--==>> Table TBL_NUTRIENTS_INFO이(가) 생성되었습니다.

DESC TBL_NUTRIENTS_INFO;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
NUT_INFO_CODE NOT NULL VARCHAR2(30) 
FAVORITE_CODE          VARCHAR2(30) 
NUT_NAME      NOT NULL VARCHAR2(30) 
NUT_TYPE      NOT NULL VARCHAR2(10) 
NUT_AMOUNT    NOT NULL NUMBER       
UNIT_CODE     NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_NUTRIENTS_INFO(NUT_INFO_CODE, FAVORITE_CODE, NUT_NAME, NUT_TYPE, NUT_AMOUNT, UNIT_CODE)
VALUES('NUT001' , 'FAV004' , '오메가3', '1', 50, '1');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_NUTRIENTS_INFO;
--==>> NUT001	FAV004	오메가3	1	50	1


-- 90. TBL_NUTRIENTS : 영양제입력
CREATE TABLE TBL_NUTRIENTS
( NUT_CODE      VARCHAR2(30)
, NUT_INFO_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE   VARCHAR2(30) NOT NULL
, CONSTRAINT NUTRIENTS_CODE_PK PRIMARY KEY(NUT_CODE)
, CONSTRAINT NUTRIENTS_INFO_FK FOREIGN KEY(NUT_INFO_CODE)
             REFERENCES TBL_NUTRIENTS_INFO(NUT_INFO_CODE)
, CONSTRAINT NUTRIENTS_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_NUTRIENTS이(가) 생성되었습니다.

DESC TBL_NUTRIENTS;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
NUT_CODE      NOT NULL VARCHAR2(30) 
NUT_INFO_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE   NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_NUTRIENTS(NUT_CODE, NUT_INFO_CODE, COMMON_CODE)
VALUES('NUC001' , 'NUT001' , 'COM023');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_NUTRIENTS;
--==>> NUC001	NUT001	COM023

-- 91. TBL_TRAIN_TYPE : 훈련종류
CREATE TABLE TBL_TRAIN_TYPE
( TRAIN_TYPE_CODE       VARCHAR2(2)
, TRAIN_TYPE_CONTENT    VARCHAR2(30) NOT NULL
, CONSTRAINT TRAINTYPE_CODE_PK PRIMARY KEY(TRAIN_TYPE_CODE)
);
--==>> Table TBL_TRAIN_TYPE이(가) 생성되었습니다.

DESC TBL_TRAIN_TYPE;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
TRAIN_TYPE_CODE    NOT NULL VARCHAR2(2)  
TRAIN_TYPE_CONTENT NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_TRAIN_TYPE(TRAIN_TYPE_CODE, TRAIN_TYPE_CONTENT)
VALUES('1', '기본 명령 훈련');
INSERT INTO TBL_TRAIN_TYPE(TRAIN_TYPE_CODE, TRAIN_TYPE_CONTENT)
VALUES('2', '행동 교정 훈련');
INSERT INTO TBL_TRAIN_TYPE(TRAIN_TYPE_CODE, TRAIN_TYPE_CONTENT)
VALUES('3', '사회화 훈련');
INSERT INTO TBL_TRAIN_TYPE(TRAIN_TYPE_CODE, TRAIN_TYPE_CONTENT)
VALUES('4', '배변 훈련');
INSERT INTO TBL_TRAIN_TYPE(TRAIN_TYPE_CODE, TRAIN_TYPE_CONTENT)
VALUES('5', '기타');

SELECT *
FROM TBL_TRAIN_TYPE;
--==>>
/*
1	기본 명령 훈련
2	행동 교정 훈련
3	사회화 훈련
4	배변 훈련
5	기타
*/

-- 92. TBL_TRAIN : 훈련입력
CREATE TABLE TBL_TRAIN
( TRAIN_CODE    VARCHAR2(30)
, FAVORITE_CODE VARCHAR2(30)
, TRAIN_NAME    VARCHAR2(30) NOT NULL
, TRAIN_TYPE    VARCHAR2(30) NOT NULL
, COMMON_CODE   VARCHAR2(30) NOT NULL
, CONSTRAINT TRAIN_CODE_PK PRIMARY KEY(TRAIN_CODE)
, CONSTRAINT TRAIN_FAV_FK FOREIGN KEY(FAVORITE_CODE)
             REFERENCES TBL_FAVORITE(FAVORITE_CODE)
             ON DELETE SET NULL
, CONSTRAINT TRAIN_TYPE_FK FOREIGN KEY(TRAIN_TYPE)
             REFERENCES TBL_TRAIN_TYPE(TRAIN_TYPE_CODE)
, CONSTRAINT TRAIN_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_TRAIN이(가) 생성되었습니다.

DESC TBL_TRAIN;
--==>>
/*
이름            널?       유형           
------------- -------- ------------ 
TRAIN_CODE    NOT NULL VARCHAR2(30) 
FAVORITE_CODE          VARCHAR2(30) 
TRAIN_NAME    NOT NULL VARCHAR2(30) 
TRAIN_TYPE    NOT NULL VARCHAR2(30) 
COMMON_CODE   NOT NULL VARCHAR2(30)
*/

INSERT INTO TBL_TRAIN(TRAIN_CODE, FAVORITE_CODE, TRAIN_NAME, TRAIN_TYPE, COMMON_CODE)
VALUES('TRA001', 'FAV005', '손' , '1', 'COM024');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_TRAIN;
--==>> TRA001	FAV005	손	1	COM024


-- 93. TBL_ETC : 기타입력
CREATE TABLE TBL_ETC
( ETC_CODE      VARCHAR2(30)
, COMMON_CODE   VARCHAR2(30) NOT NULL
, ETC_TITLE     VARCHAR2(100) NOT NULL
, ETC_CONTENT   VARCHAR2(4000) NOT NULL
, CONSTRAINT ETC_CODE_PK PRIMARY KEY(ETC_CODE)
, CONSTRAINT ETC_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_ETC이(가) 생성되었습니다.

DESC TBL_ETC;
--==>>
/*
이름          널?       유형             
----------- -------- -------------- 
ETC_CODE    NOT NULL VARCHAR2(30)   
COMMON_CODE NOT NULL VARCHAR2(30)   
ETC_TITLE   NOT NULL VARCHAR2(100)  
ETC_CONTENT NOT NULL VARCHAR2(4000) 
*/

INSERT INTO TBL_ETC(ETC_CODE, COMMON_CODE, ETC_TITLE, ETC_CONTENT)
VALUES('ETC001', 'COM025', '이게먼대' , '애기잔다');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_ETC;
--==>> ETC001	COM025	이게먼대	애기잔다


-- 94. TBL_TOILET : 배변입력
CREATE TABLE TBL_TOILET
( TOILET_CODE   VARCHAR2(30)
, COMMON_CODE   VARCHAR2(30) NOT NULL
, URINE_CODE    VARCHAR2(30)
, FECES_CODE    VARCHAR2(30)
, CONSTRAINT TOILET_CODE_PK PRIMARY KEY(TOILET_CODE)
, CONSTRAINT TOILET_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
, CONSTRAINT TOILET_URINE_FK FOREIGN KEY(URINE_CODE)
             REFERENCES TBL_URINE(URINE_CODE)
             -- 소변 삭제 불가
, CONSTRAINT TOILET_FECES_FK FOREIGN KEY(FECES_CODE)
             REFERENCES TBL_FECES(FECES_CODE)
             -- 대변 삭제 불가
);
--==>> Table TBL_TOILET이(가) 생성되었습니다.

DESC TBL_TOILET;
--==>>
/*
이름          널?       유형           
----------- -------- ------------ 
TOILET_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE NOT NULL VARCHAR2(30) 
URINE_CODE           VARCHAR2(30) 
FECES_CODE           VARCHAR2(30)
*/


-- 95. TBL_MEDICINE_INFO : 복약
CREATE TABLE TBL_MEDICINE_INFO
( MEDICINE_INFO_CODE  VARCHAR2(30)
, FAVORITE_CODE       VARCHAR2(30)
, MEDICINE_NAME       VARCHAR2(30)  NOT NULL
, MEDICINE_TYPE_CODE  VARCHAR2(2)   NOT NULL
, MEDICINE_EFFECT     VARCHAR2(100) 
, MEDICINE_AMOUNT     NUMBER(4)     NOT NULL
, UNIT_CODE           VARCHAR2(2)   NOT NULL
, MEDICINE_DISEASE    VARCHAR2(30)  NOT NULL
, HOSPITAL_CODE       VARCHAR2(30)  NOT NULL
, CONSTRAINT MEDICINEINFO_CODE_PK PRIMARY KEY(MEDICINE_INFO_CODE)
, CONSTRAINT MEDICINEINFO_FAV_FK FOREIGN KEY(FAVORITE_CODE)
             REFERENCES TBL_FAVORITE(FAVORITE_CODE)
             ON DELETE SET NULL
, CONSTRAINT MEDICINEINFO_TYPE_FK FOREIGN KEY(MEDICINE_TYPE_CODE)
             REFERENCES TBL_MEDICINE_TYPE(MEDICINE_TYPE_CODE)
, CONSTRAINT MEDICINEINFO_UNIT_FK FOREIGN KEY(UNIT_CODE)
             REFERENCES TBL_UNIT(UNIT_CODE)
, CONSTRAINT MEDICINEINFO_HOS_FK FOREIGN KEY(HOSPITAL_CODE)
             REFERENCES TBL_HOSPITAL(HOSPITAL_CODE)
);
--==>> Table TBL_MEDICINE_INFO이(가) 생성되었습니다.

DESC TBL_MEDICINE_INFO;
--==>>
/*
이름                 널?       유형            
------------------ -------- ------------- 
MEDICINE_INFO_CODE NOT NULL VARCHAR2(30)  
FAVORITE_CODE               VARCHAR2(30)  
MEDICINE_NAME      NOT NULL VARCHAR2(30)  
MEDICINE_TYPE_CODE NOT NULL VARCHAR2(2)   
MEDICINE_EFFECT             VARCHAR2(100) 
MEDICINE_AMOUNT    NOT NULL NUMBER(4)     
UNIT_CODE          NOT NULL VARCHAR2(2)   
MEDICINE_DISEASE   NOT NULL VARCHAR2(30)  
HOSPITAL_CODE      NOT NULL VARCHAR2(30)  
*/

-- 96. TBL_MEDICINE : 복약 입력
CREATE TABLE TBL_MEDICINE
( MEDICINE_CODE  VARCHAR2(30)
, MEDICINE_INFO_CODE VARCHAR2(30) NOT NULL
, COMMON_CODE    VARCHAR2(30) NOT NULL
, CONSTRAINT MEDICINE_CODE_PK PRIMARY KEY(MEDICINE_CODE)
, CONSTRAINT MEDICINE_INFO_FK FOREIGN KEY(MEDICINE_INFO_CODE)
             REFERENCES TBL_MEDICINE_INFO(MEDICINE_INFO_CODE)
, CONSTRAINT MEDICINE_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_MEDICINE이(가) 생성되었습니다.

DESC TBL_MEDICINE;
--==>>
/*
이름                 널?       유형           
------------------ -------- ------------ 
MEDICINE_CODE      NOT NULL VARCHAR2(30) 
MEDICINE_INFO_CODE NOT NULL VARCHAR2(30) 
COMMON_CODE        NOT NULL VARCHAR2(30) 
*/

-- 97. TBL_BIRTH : 출산입력
CREATE TABLE TBL_BIRTH
( BIRTH_CODE VARCHAR2(30)
, BIRTH_TEMPERATURE NUMBER(4)
, BIRTH_ACCOUNT NUMBER(2) NOT NULL
, BIRTH_MALE VARCHAR2(30)
, COMMON_CODE VARCHAR2(30) NOT NULL
, CONSTRAINT BIRTH_CODE_PK PRIMARY KEY(BIRTH_CODE)
, CONSTRAINT BIRTH_MALE_FK FOREIGN KEY(BIRTH_MALE)
             REFERENCES TBL_PET_TYPE(PET_TYPE_CODE)
, CONSTRAINT BIRTH_COMMON_FK FOREIGN KEY(COMMON_CODE)
             REFERENCES TBL_COMMON(COMMON_CODE)
);
--==>> Table TBL_BIRTH이(가) 생성되었습니다.

DESC TBL_BIRTH;
--==>>
/*
이름                널?       유형           
----------------- -------- ------------ 
BIRTH_CODE        NOT NULL VARCHAR2(30) 
BIRTH_TEMPERATURE          NUMBER(4)    
BIRTH_ACCOUNT     NOT NULL NUMBER(2)    
BIRTH_MALE                 VARCHAR2(30) 
COMMON_CODE       NOT NULL VARCHAR2(30) 
*/

INSERT INTO TBL_BIRTH(BIRTH_CODE, BIRTH_TEMPERATURE, BIRTH_ACCOUNT, COMMON_CODE)
VALUES('BIR001', 39, 3, 'COM005');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_BIRTH;
--==>> BIR001	39	3		COM005

-- 커밋
COMMIT;
--==>> 커밋 완료.


-- 잘못 들어간 공통항목(TBL_COMMON) 데이터 업데이트
SELECT *
FROM TBL_COMMON;

UPDATE TBL_COMMON
SET DAILY_CODE='DAILY003'
WHERE COMMON_CODE='COM020';

UPDATE TBL_COMMON
SET DAILY_CODE='DAILY003'
WHERE COMMON_CODE='COM021';

UPDATE TBL_COMMON
SET DAILY_CODE='DAILY003'
WHERE COMMON_CODE='COM022';

UPDATE TBL_COMMON
SET DAILY_CODE='DAILY003'
WHERE COMMON_CODE='COM023';

UPDATE TBL_COMMON
SET DAILY_CODE='DAILY003'
WHERE COMMON_CODE='COM024';

UPDATE TBL_COMMON
SET DAILY_CODE='DAILY003'
WHERE COMMON_CODE='COM025';

SELECT *
FROM TBL_COMMON;

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- TBL_WALKROOM 더미데이터 수정
SELECT *
FROM TBL_WALKROOM;

UPDATE TBL_WALKROOM
SET WALKROOM_TITLE ='산책하GO, 즐기GO, FUN FUN하게~!', WALKROOM_WORDS = '동네 산책 좋아합니다.'
  , WALKROOM_PLACE = '맥도날드 종암SK점'
  , WALKROOM_LATITUDE = '37.595734', WALKROOM_LONGITUDE ='127.035938' 
  , WALKROOM_START = TO_DATE('2021-07-07 20:00:00', 'YYYY-MM-DD HH24:MI:SS')
  , WALKROOM_END = TO_DATE('2021-07-07 21:00:00', 'YYYY-MM-DD HH24:MI:SS')
  , WALKROOM_GENDATE = TO_DATE('2021-07-07 17:15:21', 'YYYY-MM-DD HH24:MI:SS')
WHERE WALKROOM_CODE = 4;
--==>> 1 행 이(가) 업데이트되었습니다.

COMMIT;
--==>> 커밋 완료.

