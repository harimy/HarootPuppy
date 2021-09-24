SELECT USER
FROM DUAL;
--==>> HAROOTPUPPY


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



-------------------- 회원 수정

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
정



-- 회원 삭제(탈퇴)

DELETE
FROM TBL_MEMBER
WHERE MEM_ID = '{#mem_id}';



-- 국진수 회원 수정
SELECT *
FROM TBL_MEMBER
ORDER BY MEM_CODE;

ROLLBACK;

UPDATE TBL_MEMBER
SET MEM_TEL='010-8282-8282'
WHERE MEM_CODE = 'MEM012';



UPDATE TBL_MEMBER
SET MEM_TEL='010-1231-1231'
WHERE MEM_CODE = 'MEM011';

UPDATE TBL_MEMBER
SET MEM_REGDATE = TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS')
WHERE MEM_CODE = 'MEM012';


alter session set nls_date_format='YYYY/MM/DD HH24:MI:SS'; 

-- 되는 
SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

commit;

---------------SID 테이블, 산책 동의 테이블 입력(회원가입시 실행되어야 함)--------------------------

SELECT *
FROM TBL_MEMBER 
ORDER BY MEM_CODE;

SELECT * 
FROM TBL_WALK_AGREE
ORDER BY WALK_AGREE_CODE;

SELECT *
FROM TBL_SID;


INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES('SID011', 'MEM011');
INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
VALUES('SID012', 'MEM012');


INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR009', 'SID009', 'Y', TO_DATE('2021-06-23 00:00:00'));

INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR010', 'SID010', 'Y', TO_DATE('2021-06-26 00:00:00'));

INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR011', 'SID011', 'Y', TO_DATE('2021-07-06 13:12:24'));

INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
VALUES('AGR012', 'SID012', 'Y', TO_DATE('2021-07-07 18:27:12'));


commit;


----------------------------------------------------------------------------------------
MEM_CODE 등... 각종 코드 만들기


SELECT CASE WHEN LENGTH(TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)) = 1
            THEN 'MEM'|| '00' || TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)
            WHEN LENGTH(TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)) = 2
            THEN 'MEM'|| '0' || TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)
            ELSE 'MEM'|| TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)
            END AS MEM_CODE
FROM TBL_MEMBER;


SELECT CASE WHEN LENGTH(TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)) = 1
            THEN 'MEM'|| '00' || TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)
            WHEN LENGTH(TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)) = 2
            THEN 'MEM'|| '0' || TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)
            ELSE 'MEM'|| TO_CHAR(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6)))+1)
            END AS MEM_CODE
FROM TBL_MEMBER;


SELECT *
		FROM TBL_ADMIN
		WHERE ADMIN_ID='admin1' AND ADMIN_PW=CRYPTPACK.ENCRYPT('0308', 'admin1');



EXEC PRC_MEMBER_INSERT('milky_bboy', '6969', '백도준', '1999-12-24', 'M', '010-1435-1234', '인천시 연수구 송도동 12', '백설기12', 'Y');

ROLLBACK;

SELECT *
FROM TBL_MEMBER
ORDER BY MEM_CODE;

SELECT *
FROM TBL_SID;

SELECT *
FROM TBL_WALK_AGREE;


UPDATE TBL_MEMBER
SET MEM_PW=CRYPTPACK.ENCRYPT('1012', 'kangjun')
WHERE MEM_CODE='MEM008';

commit;

SELECT *
FROM TABS;

SELECT *
FROM TBL_PET_TYPE
ORDER BY PET_TYPE_NAME;


SELECT *
FROM TBL_PET_INFO;

SELECT *
FROM PETVIEW;


SELECT *
FROM TBL_PET;

SELECT *
FROM TBL_PET_INFO;

CREATE OR REPLACE VIEW PETVIEW
AS
SELECT P.PET_CODE AS PET_CODE
    , P.PET_TYPE_CODE AS PET_TYPE_CODE
    , T.PET_TYPE_NAME AS PET_TYPE_NAME
    , P.BITE_CODE AS BITE_CODE
    , B.BITE_CONTENT AS BITE_CONTENT
    , P.DESEX_CODE AS DESEX_CODE
    , S.DESEX_CONTENT AS DESEX_CONTENT
    , P.PET_SEX AS PET_SEX
    , TO_CHAR(P.PET_BIRTH, 'YYYY-MM-DD') AS PET_BIRTH 
    , P.PET_FAV_PLACE AS PET_FAV_PLACE
    , P.PET_FAV_LAT AS PET_FAV_LAT
    , P.PET_FAV_LNG AS PET_FAV_LNG
    , P.PET_SOCIAL AS PET_SOCIAL
    , P.PET_CHAR1_CODE AS PET_CHAR1_CODE
    , C1.PET_CHAR1_CONTENT AS PET_CHAR1_CONTENT
    , P.PET_CHAR2_CODE AS PET_CHAR2_CODE
    , C2.PET_CHAR2_CONTENT AS PET_CHAR2_CONTENT
    , P.PET_CHAR3_CODE AS PET_CHAR3_CODE
    , C3.PET_CHAR3_CONTENT AS PET_CHAR3_CONTENT
    , P.PET_CHAR4_CODE AS PET_CHAR4_CODE
    , C4.PET_CHAR4_CONTENT AS PET_CHAR4_CONTENT
    , P.PET_SIZE AS PET_SIZE
    , I.PET_INFO_CODE AS PET_INFO_CODE
    , I.PET_NAME AS PET_NAME
    , I.PET_PHOTO AS PET_PHOTO
    , I.PET_ADDR AS PET_ADDR
    , I.PET_ADDR_LAT AS PET_ADDR_LAT
    , I.PET_ADDR_LNG AS PET_ADDR_LNG
    , I.PET_REGNUM AS PET_REGNUM    
    , D.DISEASE_CODE AS DISEASE_CODE
    , DT.DISEASE_CONTENT AS DISEASE_CONTENT    
    , F.FAV_FOOD_CODE AS FAV_FOOD_CODE
    , FT.FAV_FOOD_CONTENT AS FAV_FOOD_CONTENT    
    , V.INJECT_TYPE_CODE AS VACCINE_CODE
    , JT.INJECT_TYPE_NAME AS INJECT_TYPE_NAME
FROM TBL_PET P
LEFT OUTER JOIN TBL_PET_INFO I ON P.PET_CODE = I.PET_CODE
LEFT OUTER JOIN TBL_PET_TYPE T ON P.PET_TYPE_CODE = T.PET_TYPE_CODE
LEFT OUTER JOIN TBL_BITE_LEG B ON P.BITE_CODE = B.BITE_CODE
LEFT OUTER JOIN TBL_DESEX_LEG S ON P.DESEX_CODE = S.DESEX_CODE
LEFT OUTER JOIN TBL_PET_CHAR1 C1 ON P.PET_CHAR1_CODE = C1.PET_CHAR1_CODE
LEFT OUTER JOIN TBL_PET_CHAR2 C2 ON P.PET_CHAR2_CODE = C2.PET_CHAR2_CODE
LEFT OUTER JOIN TBL_PET_CHAR3 C3 ON P.PET_CHAR3_CODE = C3.PET_CHAR3_CODE
LEFT OUTER JOIN TBL_PET_CHAR4 C4 ON P.PET_CHAR4_CODE = C4.PET_CHAR4_CODE
LEFT OUTER JOIN TBL_DISEASE D ON P.PET_CODE = D.PET_CODE
LEFT OUTER JOIN TBL_DISEASE_TYPE DT ON D.DISEASE_TYPE_CODE = DT.DISEASE_TYPE_CODE
LEFT OUTER JOIN TBL_FAV_FOOD F ON P.PET_CODE = F.PET_CODE
LEFT OUTER JOIN TBL_FAV_FOOD_TYPE FT ON F.FAV_FOOD_TYPE_CODE = FT.FAV_FOOD_TYPE_CODE
LEFT OUTER JOIN TBL_VACCINE V ON P.PET_CODE = V.PET_CODE
LEFT OUTER JOIN TBL_INJECT_TYPE JT ON V.INJECT_TYPE_CODE = JT.INJECT_TYPE_CODE
ORDER BY P.PET_CODE;



DESC TBL_PET;

-- 반려 동물 등록 관련 조회

SELECT *
FROM TBL_PET;

SELECT *
FROM TBL_BITE_LEG;

SELECT *
FROM TBL_PET_CHAR4;

SELECT *
FROM TBL_PET_INFO;

SELECT *
FROM TBL_MEMBER;


SELECT *
FROM TBL_PET_TYPE;


SELECT *
FROM TBL_DISEASE;

SELECT *
FROM TBL_DISEASE_TYPE;

SELECT *
FROM TBL_FAV_FOOD;

SELECT *
FROM TBL_FAV_FOOD_TYPE;


SELECT *
FROM TBL_VACCINE;

SELECT *
FROM TBL_INJECT_TYPE;

SELECT *
FROM TBL_RELATION_TYPE;


SELECT *
FROM TBL_RELATION;


SELECT PET_CODE, PET_TYPE_CODE, BITE_CODE, DESEX_CODE, PET_SEX, PET_BIRTH
    , PET_FAV_PLACE, PET_SOCIAL, PET_CHAR1_CODE, PET_CHAR2_CODE, PET_CHAR3_CODE, PET_CHAR4_CODE
    , PET_SIZE, PET_FAV_LAT, PET_FAV_LNG
FROM TBL_PET;

select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET'; 



SELECT RELATION_CODE, SID_CODE, PET_CODE, RELATION_TYPE_CODE
FROM TBL_RELATION;



EXEC PRC_PET_INSERT('사진', '누렁이', 'M', '2019-12-14', 'M', '010-1435-1234', '인천시 연수구 송도동 12', '백설기12', 'Y');




