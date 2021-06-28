-- 접속 계정 확인
SELECT USER
FROM DUAL;
--==>> HAROOT

-- 생성된 테이블 리스트 확인
SELECT *
FROM TAB;

-- 세션 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

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
ALTER TABLE TBL_MEMBER MODIFY MEM_NICKNAME VARCHAR2(50);

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
, MEM_CODE  VARCHAR2(30) NOT NULL
, CONSTRAINT SID_CODE_PK PRIMARY KEY(SID_CODE)
, CONSTRAINT SID_MEMCODE_FK FOREIGN KEY(MEM_CODE)
             REFERENCES TBL_MEMBER(MEM_CODE)
             ON DELETE SET NULL
);
--==>> Table TBL_SID이(가) 생성되었습니다.

-- MEM_CODE NOT NULL 제약사항 제거
--> TBL_MEMBER 에서 삭제되면 NULL 값이 되기 때문에
ALTER TABLE TBL_SID MODIFY MEM_CODE NULL;

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

-- 13. TBL_ASK_STATE : 문의처리상태
CREATE TABLE TBL_ASK_STATE
( ASK_STATE_CODE    VARCHAR2(2)
, ASK_STATE_CONTENT VARCHAR2(30) NOT NULL
, CONSTRAINT ASKSTATE_CODE_PK PRIMARY KEY(ASK_STATE_CODE)
);
--==>> Table TBL_ASK_STATE이(가) 생성되었습니다.

ALTER TABLE TBL_ASK_STATE MODIFY ASK_STATE_CONTENT VARCHAR2(30);

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
( REP_TYPE_CODE     VARCHAR2(30)
, REP_TYPE_CONTENT  VARCHAR2(100) NOT NULL
, CONSTRAINT REPORTTYPE_CODE_PK PRIMARY KEY(REP_TYPE_CODE)
);
--==>> Table TBL_REPORT_TYPE이(가) 생성되었습니다.

DESC TBL_REPORT_TYPE;
--==>>
/*
이름               널?       유형            
---------------- -------- ------------- 
REP_TYPE_CODE    NOT NULL VARCHAR2(30)  
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
VALUES('PETTY021', '래브라도 리트리버', '중형견');
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


-- 26.
-- 27.
-- 28.
-- 29.
-- 30.
-- 31.
-- 32.
-- 33.
-- 34.
-- 35.
-- 36.
-- 37.
-- 38.
-- 39.
-- 40.
-- 41.
-- 42.
-- 43.
-- 44.
-- 45.
-- 46.