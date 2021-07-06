SELECT USER
FROM DUAL;
--==>> HTEST


-- MemberDAO.xml

SELECT *
FROM MEMBERVIEW;


-- 회원 수 확인
SELECT COUNT (*) AS COUNT
FROM MEMBERVIEW;
--==>> 8


-- 회원 번호의 최대값
SELECT MAX(TO_NUMBER((SUBSTR(MEM_CODE, 4, 6))))
FROM MEMBERVIEW;
--==>> 10


-- 회원 리스트 확인
SELECT SID_CODE, MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH  -- 6
    , MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME  -- 5
    , PAUSE_CODE ,PAUSE_START, OUT_CODE, OUT_TYPE_CODE, OUT_DATE -- 5
    , WALK_AGREE_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE, OUT_TYPE_CONTENT
FROM MEMBERVIEW;
--==>> 나옴 

SELECT SID_CODE, MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH  
    	, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME  
    	, PAUSE_CODE ,PAUSE_START, OUT_CODE, OUT_TYPE_CODE, OUT_DATE 
    	, WALK_AGREE_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE, OUT_TYPE_CONTENT
		FROM MEMBERVIEW;


-- 회원 데이터 추가
INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME
, MEM_BIRTH, MEM_GENDER, MEM_TEL
, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
VALUES ('#{mem_code}', '#{mem_id}', CRYPTPACK.ENCRYPT('#{mem_pw}', '#{mem_id}'), '#{mem_name}'
, TO_DATE('#{mem_birth}', 'YYYY-MM-DD'), '#{mem_gender}', '#{mem_tel}'
, '#{mem_addr}', TO_DATE('#{mem_gendate}', 'YYYY-MM-DD'), '#{mem_nickname}');


-- 회원 검색(회원번호, 이름, 아이디로 검색 가능)
SELECT SID_CODE, MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH  -- 6
    , MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME  -- 5
    , PAUSE_CODE ,PAUSE_START, OUT_CODE, OUT_TYPE_CODE, OUT_DATE -- 5
    , WALK_AGREE_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE, OUT_TYPE_CONTENT
FROM MEMBERVIEW
WHERE MEM_CODE = '{#mem_code}';

SELECT SID_CODE, MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH  -- 6
    , MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME  -- 5
    , PAUSE_CODE ,PAUSE_START, OUT_CODE, OUT_TYPE_CODE, OUT_DATE -- 5
    , WALK_AGREE_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE, OUT_TYPE_CONTENT
FROM MEMBERVIEW
WHERE MEM_CODE = 'MEM001';


--  왜이제야 들리죠~~오오~~~ 우우우~~~~ 서롤 만나기 위해 ~(by 하림)


-- 회원 수정

-- MEM테이블 업데이트 전 동의테이블 INSERT가 먼저 입력되어야함.
-- 입력값이 이전 값과 같을 경우 INSERT 되지 않아야 함.

SELECT *
FROM TBL_WALK_AGREE;


INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('{#walk_agree_code}', '{#sid_code}', '{#walkd_agree_check}', '{#walk_agree_date}');


UPDATE TBL_MEMBER
SET MEM_PW = '{#mem_pw}', MEM_TEL = '{#mem_tel}'
, MEM_ADDR = '{#mem_addr}', MEM_NICKNAME = '{#mem_addr}'
WHERE MEM_CODE = '{#mem_code}';




-- 회원 삭제(탈퇴)

DELETE
FROM TBL_MEMBER
WHERE MEM_ID = '{#mem_id}';


