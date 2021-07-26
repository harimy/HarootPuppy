SELECT USER
FROM DUAL;
--==>> HAROOTPUPPY

-- 산책방 정보 뷰 
SELECT WALKROOM_CODE, WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_MIN, WALKROOM_MAX, WALKROOM_GENDATE
     , WALKROOM_START, WALKROOM_END, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGTITUDE
     ,PARTICIPANTS_CODE, SID_CODE, MEM_ID, MEM_NICKNAME, WALKROOM_LEADER
     , PET_CODE, PET_NAME, PET_PHOTO, PET_BITE_CODE, PET_BITE_CONTENT, PET_DESEX_CODE, PET_DESEX_CONTENT
     , PET_CHAR1_CODE, PET_CHAR1_CONTENT, PET_CHAR2_CODE, PET_CHAR2_CONTENT, PET_CHAR3_CODE, PET_CHAR3_CONTENT
     , PET_CHAR4_CODE, PET_CHAR4_CONTENT, RELATION_CODE, MATCH_STATE, WALK_STATE, MATCH_CODE, MATCH_DATE
     , AUTO_CODE, AUTO_CONTENT, STYLE_CODE, STYLE_CONTENT, BITE_CODE, BITE_CONTENT
     , DESEX_CODE, DESEX_CONTENT, SAMESEX_CODE, SAMESEX_CONTENT
FROM WALKROOMVIEW;

-- 산책 점수 뷰
SELECT SID_CODE, EVAL_AVG, REWARDS, WALK_SCORE
FROM WALKSCOREVIEW;


-- 신고당한 방을 제외한 산책방 리스트 출력 뷰
-- 매칭 완료된 방을 제외하는 코드 추가하여 뷰 재생성(2021-07-24)
CREATE OR REPLACE VIEW WALKROOMLISTVIEW
AS
SELECT W.WALKROOM_CODE, W.WALKROOM_LEADER, W.AUTO_CODE
     , SL.STYLE_CONTENT, BL.BITE_CONTENT, DL.DESEX_CONTENT, SSL.SAMESEX_CONTENT
     , W.WALKROOM_MIN, W.WALKROOM_MAX
     , TO_CHAR(W.WALKROOM_START, 'YYYY-MM-DD HH24:MI') AS WALKROOM_START
     , TO_CHAR(W.WALKROOM_END, 'YYYY-MM-DD HH24:MI') AS WALKROOM_END
     , TO_CHAR(W.WALKROOM_START, 'HH24:MI') AS START_TIME
     , TO_CHAR(W.WALKROOM_END, 'HH24:MI') AS END_TIME
     , W.WALKROOM_TITLE, W.WALKROOM_WORDS, W.WALKROOM_PLACE, W.WALKROOM_LATITUDE, W.WALKROOM_LONGITUDE
     , TO_CHAR(W.WALKROOM_GENDATE, 'YYYY-MM-DD HH24:MI:SS') AS WALKROOM_GENDATE
     , M.MEM_NICKNAME, C.PARTI_COUNT
FROM TBL_WALKROOM W, TBL_SID S, TBL_MEMBER M
   , TBL_STYLE_LEG SL, TBL_BITE_LEG BL, TBL_DESEX_LEG DL, TBL_SAMESEX_LEG SSL
   , (SELECT W.WALKROOM_CODE AS WALKROOM_CODE
           , COUNT(*) AS PARTI_COUNT
      FROM TBL_WALKROOM W, TBL_PARTICIPANTS P
      WHERE W.WALKROOM_CODE = P.WALKROOM_CODE(+)
      GROUP BY W.WALKROOM_CODE) C
WHERE W.WALKROOM_LEADER = S.SID_CODE(+)
  AND S.MEM_CODE = M.MEM_CODE(+)
  AND W.STYLE_CODE = SL.STYLE_CODE(+)
  AND W.BITE_CODE = BL.BITE_CODE(+)
  AND W.DESEX_CODE = DL.DESEX_CODE(+)
  AND W.SAMESEX_CODE = SSL.SAMESEX_CODE(+)
  AND W.WALKROOM_CODE = C.WALKROOM_CODE(+)
  AND W.WALKROOM_CODE NOT IN (SELECT WR.WALKROOM_CODE AS WALKROOM_CODE          -- 신고당한 방 제외
                              FROM TBL_REPORT_LOG L, TBL_WALKROOM_REPORT WR
                              WHERE L.REP_LOG_CODE = WR.REP_LOG_CODE
                                AND L.REP_STATE_CODE NOT IN 2
                              GROUP BY WR.WALKROOM_CODE)
  AND W.WALKROOM_CODE NOT IN (SELECT WALKROOM_CODE                              -- 매칭 완료된 방 제외
                              FROM TBL_MATCH)
ORDER BY WALKROOM_CODE DESC;


SELECT WALKROOM_CODE, WALKROOM_LEADER, AUTO_CODE
     , STYLE_CONTENT, BITE_CONTENT, DESEX_CONTENT, SAMESEX_CONTENT
     , WALKROOM_MIN, WALKROOM_MAX, WALKROOM_START, WALKROOM_END
     , START_TIME, END_TIME
     , WALKROOM_TITLE, WALKROOM_WORDS
     , WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE
     , WALKROOM_GENDATE, MEM_NICKNAME, PARTI_COUNT
FROM WALKROOMLISTVIEW;

-- 산책방 수 카운트 쿼리
SELECT COUNT(*) AS COUNT
FROM WALKROOMLISTVIEW;

-- 산책방 추가 쿼리
INSERT INTO TBL_WALKROOM(WALKROOM_CODE, WALKROOM_LEADER
, AUTO_CODE, STYLE_CODE, BITE_CODE, DESEX_CODE, SAMESEX_CODE
, WALKROOM_MIN, WALKROOM_MAX
, WALKROOM_START, WALKROOM_END
, WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE
, WALKROOM_GENDATE)
VALUES(1, 'SID001'
, '1', '2', '0', '1', '0'
, 2, 4
, TO_DATE('2021-06-27 18:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2021-06-27 19:00', 'YYYY-MM-DD HH24:MI')
, '함께 산책 하실 분?', '같이가요ㅎ', '안양천 철산-가산 돌다리 앞', '37.475694', '126.876208'
, TO_DATE('2021-06-27 13:15:24', 'YYYY-MM-DD HH24:MI:SS'));

SELECT MAX(WALKROOM_CODE)
FROM TBL_WALKROOM;

SELECT MAX(WALKROOM_CODE) AS MAX_NUM
FROM WALKROOMLISTVIEW;

SELECT *
FROM TBL_WALKROOM;
WHERE WALKROOM_CODE=6;

COMMIT;

SELECT *
FROM TBL_PARTICIPANTS;

SELECT *
FROM TBL_MEMBER;

-- 로그인 조회 쿼리
SELECT S.SID_CODE AS SID_CODE
     , M.MEM_CODE AS MEM_CODE
     , M.MEM_ID AS MEM_ID
     , M.MEM_NAME AS MEM_NAME
FROM TBL_SID S,
(
    SELECT MEM_CODE, MEM_ID, MEM_NAME
    FROM TBL_MEMBER
    WHERE MEM_ID = 'joohee'
    AND MEM_PW = CRYPTPACK.ENCRYPT('1224', 'joohee')
)M
WHERE S.MEM_CODE = M.MEM_CODE;

SELECT *
FROM TBL_RELATION;


INSERT INTO TBL_PARTICIPANTS(PARTICIPANTS_CODE, WALKROOM_CODE, RELATION_CODE, PARTICIPANTS_START)
VALUES('PAR008', 4, 'REL003', SYSDATE);

ROLLBACK;

-- 최대 PARTICIPANTS_CODE 뽑아내는 쿼리
SELECT MAX(TO_NUMBER(SUBSTR(PARTICIPANTS_CODE, 4)))
FROM TBL_PARTICIPANTS
              

-- 나중에 테이블 새로 만들고 나면 쓸 쿼리
SELECT PARTICIPANTS_CODE
FROM TBL_PARTICIPANTS
WHERE ROWNUM=1
ORDER BY PARTICIPANTS_CODE DESC;


-- 반경 계산
SELECT count(*)
FROM (
SELECT ( 6371 * acos( cos( radians( 37.4097995 ) ) * cos( radians( lat) ) * cos( radians( lot ) - radians(127.128697) ) + sin( radians(37.4097995) ) * sin( radians(lat) ) ) ) AS distance
FROM cf_location
) DATA
WHERE DATA.distance < 3;

SELECT count(*)
FROM (
SELECT ( 6371 * acos( cos( radians( 37.4097995 ) ) * cos( radians( PET_FAV_LAT ) ) * cos( radians( PET_FAV_LNG ) - radians(127.128697) ) + sin( radians(37.4097995) ) * sin( radians(PET_FAV_LNG) ) ) ) AS distance
FROM TBL_PET
) DATA
WHERE DATA.distance < 3;

SELECT *
FROM TBL_PET;

SELECT *
FROM TBL_WALKROOM
WHERE WALKROOM_CODE = 1;

-- 업데이트 쿼리문
UPDATE TBL_WALKROOM
SET AUTO_CODE=1, STYLE_CODE=2, BITE_CODE=0, DESEX_CODE=1, SAMESEX_CODE=0
  , WALKROOM_MIN=2, WALKROOM_MAX=4
  , WALKROOM_START=TO_DATE('2021-06-27', 'YYYY-MM-DD')
  , WALKROOM_END=TO_DATE('2021-06-27', 'YYYY-MM-DD')
  , WALKROOM_TITLE='함께 산책하실 분?'
  , WALKROOM_WORDS='같이? 가요?'
  , WALKROOM_PLACE='안양천 돌다리'
  , WALKROOM_LATITUE='37. 475694'
  , WALKROOM_LONGITUDE='126.876209'
WHERE WALKROOM_CODE=1;

-- 삭제 쿼리문
DELETE
FROM TBL_WALKROOM
WHERE WALKROOM_CODE = 8;


-- ================================= 산책방 입장 =================================
-- 1. WALKROOMVIEW 에서 같은 산책방 코드 가진것만 조회
-- 2-1. 방에 참여중이지 않은 경우 (= 로그인한 유저와 같은 SID_CODE 가 존재하지 않는 경우) → TBL_PARTICIPANTS 에 UPDATE
-- 2-2. 방에 참여중인 경우 ① : 같은 유저 같은 반려견(= 같은 SID_CODE, 같은 REL_CODE)로 참여중일 때 → 그냥 입장
-- 2-3. 방에 참여중인 경우 ② : 같은 유저 다른 반려견(= 같은 SID_CODE, 다른 REL_CODE)로 참여중일 때 → 안내문구 출력 후 분기처리
CREATE OR REPLACE VIEW WALKROOM_ENTERCHECK_VIEW
AS
SELECT W.WALKROOM_CODE, W.WALKROOM_LEADER, P.PARTICIPANTS_CODE, P.RELATION_CODE
     , R.SID_CODE, R.PET_CODE
FROM TBL_WALKROOM W, TBL_PARTICIPANTS P, TBL_RELATION R
WHERE W.WALKROOM_CODE = P.WALKROOM_CODE
  AND P.RELATION_CODE = R.RELATION_CODE
ORDER BY W.WALKROOM_CODE; 
--==>> View WALKROOM_ENTERCHECK_VIEW이(가) 생성되었습니다.

-- 특정 산책방에 참여중인 회원/반려견 코드 조회
SELECT *
FROM WALKROOM_ENTERCHECK_VIEW
WHERE WALKROOM_CODE = 1;

-- 특정 산책방에 특정 회원 참여중인지 여부 조회
-- count == 0 이면 : TBL_PARTICIPANTS에 INSERT 후 입장
-- count >= 1 이면 : 아래 쿼리문에서 PET_CODE 도 추가하여 함께 조회 
SELECT COUNT(*)
FROM WALKROOM_ENTERCHECK_VIEW
WHERE WALKROOM_CODE = 1
  AND SID_CODE = 'SID001';

-- 특정 산책방에 특정 회원 참여중인 경우 현재 선택한 반려견과 함께 참여중인지 조회
-- count == 0 이면 : 현재 회원이 다른 반려견으로 참여중임 → 분기처리
-- count == 1 이면 : 현재 회원이 현재 반려견으로 참여중임 → 방 입장 가능.
SELECT COUNT(*)
FROM WALKROOM_ENTERCHECK_VIEW
WHERE WALKROOM_CODE = 1
  AND SID_CODE = 'SID001'
  AND RELATION_CODE = 'REL003';

-- 양육관계 코드 구하는 쿼리
SELECT R.RELATION_CODE, R.SID_CODE, R.PET_CODE
     , RT.RELATION_TYPE_CODE, RT.RELATION_TYPE_CONTENT
FROM TBL_RELATION R, TBL_RELATION_TYPE RT
WHERE R.RELATION_TYPE_CODE = RT.RELATION_TYPE_CODE
  AND SID_CODE = 'SID001'
  AND PET_CODE = 'PET003';

-- PARTICIPANTS_CODE 조회하는 쿼리 
SELECT PARTICIPANTS_CODE
FROM TBL_PARTICIPANTS
WHERE WALKROOM_CODE = 1
  AND RELATION_CODE = 'REL003'
;

-- 레디 고정 옵션 업데이트 쿼리
UPDATE TBL_PARTICIPANTS
SET READYOPTION_CODE = '1'
WHERE PARTICIPANTS_CODE = 'PAR14'
;

-- 레디 상태 업데이트 쿼리
UPDATE TBL_PARTICIPANTS
SET READYSTATE_CODE = '1'
WHERE PARTICIPANTS_CODE = 'PAR14'
;

-- 산책방 나가기
DELETE
FROM TBL_PARTICIPANTS
WHERE PARTICIPANTS_CODE = 'PAR17'
;

-- 특정 산책방 코드와 특정 유저인 경우 WALKROOMVIEW 조회
SELECT *
FROM WALKROOMVIEW
WHERE WALKROOM_CODE = '1'
  AND PARTICIPANTS_CODE = 'PAR001'
;

-- 참여자 코드 최대값 얻어내기
SELECT MAX(TO_NUMBER(SUBSTR(PARTICIPANTS_CODE, 4)))
FROM TBL_PARTICIPANTS
;

-- ================================ 매칭관련 쿼리 =================================

-- 매칭 코드 최대값
SELECT MAX(TO_NUMBER(SUBSTR(MATCH_CODE, 4)))
FROM TBL_MATCH
;

-- 매칭 테이블에 레코드 추가 
INSERT INTO TBL_MATCH(MATCH_CODE, WALKROOM_CODE, MATCH_DATE)
VALUES('MAT3', 2, SYSDATE)
;

-- 현재 산책방 참여인원이 최소인원보다 많은 지 체크하기 위한 쿼리문

-- 특정 산책방의 최소인원
SELECT WALKROOM_MIN
FROM TBL_WALKROOM
WHERE WALKROOM_CODE = 1
;

-- 특정 산책방의 참여인원
SELECT COUNT(*)
FROM WALKROOMVIEW
WHERE WALKROOM_CODE = 1
GROUP BY WALKROOM_CODE
;

-- 해당 산책방에 레디 안한 참여자가 있는지 체크하는 쿼리문
-- 조회 결과는 레디 안한 사용자의 수와 같다. (즉, 0이 아니면 매칭 불가능)
SELECT COUNT(*)
FROM WALKROOMVIEW
WHERE WALKROOM_CODE = 1
  AND READYSTATE_CODE = 0
;

-- 해당 산책방의 매칭 상태 확인하는 쿼리문
-- 1이면 매칭 완료 상태, 0이면 매칭 안된 상태
SELECT COUNT(*)
FROM TBL_MATCH
WHERE WALKROOM_CODE = 7
;

-- 매칭 취소 버튼 클릭 시 매칭테이블에서 삭제하는 쿼리문
DELETE
FROM TBL_MATCH
WHERE WALKROOM_CODE=9
;

-- 히스토리 조회 쿼리문(신고 당한 방도 일단 조회)
-- 신청완료 : 해당 회원이 레디(방장이면 null)하고 매치코드 존재하지 않는 산책방
SELECT *
FROM WALKROOMVIEW
WHERE READYSTATE_CODE != 0
  AND SID_CODE = 'SID010'
  AND MATCH_CODE IS NULL
  --AND TO_DATE(WALKROOM_END, 'YYYY-MM-DD HH24:MI:SS') > SYSDATE
;

-- 산책예정 : 해당 회원이 레디(방장이면 null)하고 매칭테이블에 존재하는 방
SELECT *
FROM WALKROOMVIEW
WHERE READYSTATE_CODE != 0
  AND MATCH_CODE IS NOT NULL
  AND SID_CODE = 'SID003'   
  --AND TO_DATE(WALKROOM_END, 'YYYY-MM-DD HH24:MI:SS') > SYSDATE
;

-- 산책완료 : 해당 회원 레디(방장은 null)하고 매칭테이블에 존재하며 산책 종료시간이 현재보다 과거인 경우
SELECT *
FROM WALKROOMVIEW
WHERE READYSTATE_CODE != 0
  AND SYSDATE >= TO_DATE(WALKROOM_END, 'YYYY-MM-DD HH24:MI:SS')
  AND MATCH_CODE IS NOT NULL
  AND SID_CODE = 'SID003'
;

-- 양육관계 코드로 펫 코드 조회
SELECT PET_CODE
FROM TBL_RELATION
WHERE RELATION_CODE='REL008'
;