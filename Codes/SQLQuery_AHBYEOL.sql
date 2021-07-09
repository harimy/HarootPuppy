
SELECT USER
FROM DUAL;
--==>> HAROOTPUPPY

-- 날짜 형식 변경
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH:MI:SS';


-- 신고유형테이블에 5. 산책방/댓글 이라는 레코드 추가
SELECT *
FROM TBL_REPORT_TYPE;

INSERT INTO TBL_REPORT_TYPE VALUES(5, '산책방/댓글');

UPDATE TBL_REPORT_TYPE
SET REP_TYPE_CONTENT = '산책방/게시물'
WHERE REP_TYPE_CODE = 3;


UPDATE TBL_REPORT_LOG
SET REP_TYPE_CODE = 5
WHERE REP_LOG_CODE = 'REP005';

--커밋
COMMIT;
-- 커밋 완료.
--WALKCOMM_REP_CODE, WALK_COMM_WRITER, WALKROOM_CODE 
------------------------------------> 
------------------------------------> REPORTVIEW 하나로 모든 애들을 묶은 뷰
-- 수정 
-- 아별 21.07.07 
CREATE OR REPLACE VIEW REPORTVIEW
AS
SELECT L.REP_LOG_CODE AS REP_LOG_CODE               -- 신고내역코드
    , L.REP_TYPE_CODE AS REP_TYPE_CODE              -- 신고유형코드 -> 신고유형코드에 따라 피신고자 컬럼이 달라짐..
    , T.REP_TYPE_CONTENT AS REP_TYPE_CONTENT        -- 신고유형내용
    --, L.REP_LOG_WRITER AS REP_LOG_WRITER          -- 안쓸듯?
    , SI.SID_CODE AS SID_CODE                       -- 신고자 (회원코드)
    , TO_CHAR(L.REP_LOG_DATE, 'YYYY-MM-DD HH24:MI:SS') AS REP_LOG_DATE  -- 신고날짜
    , L.REP_STATE_CODE AS REP_STATE_CODE                                -- 신고처리상태코드 
    , S.REP_STATE_CONTENT AS REP_STATE_CONTENT                          -- 신고처리상태내용
    , TO_CHAR(L.REP_LOG_READ, 'YYYY-MM-DD') AS REP_LOG_READ             -- 열람날짜
    , WCR.WALKCOMM_REP_CODE AS WALKCOMM_REP_CODE                        -- 산책방댓글신고코드
    , WC.WALK_COMM_WRITER AS WALK_COMM_WRITER                           -- 산책방댓글작성자 (피신고자)
    , BCR.BOARDCOMM_REP_CODE AS BOARDCOMM_REP_CODE                      -- 게시판댓글신고코드
    , BC.BOARD_COMM_WRITER AS BOARD_COMM_WRITER                         -- 게시판댓글작성자 (피신고자)
    , BR.BOARD_REP_CODE AS BOARD_REP_CODE                               -- 게시물신고코드
    , BR.BOARD_CODE AS BOARD_CODE                                       -- 게시물코드(숫자)
    , B.BOARD_WRITER AS BOARD_WRITER                                    -- 게시물작성자 (피신고자)
    , B.BOARD_TITLE AS BOARD_TITLE                                      -- 게시물 제목
    , B.BOARD_CONTENT AS BOARD_CONTENT                                  -- 게시물 내용
    , WR.WALKROOM_REP_CODE AS WALKROOM_REP_CODE                         -- 산책방신고코드
    , W.WALKROOM_CODE AS WALKROOM_CODE                                  -- 산책방 코드 --> 추가
    , W.WALKROOM_TITLE AS WALKROOM_TITLE                                -- 산책방 제목 --> 추가
    , W.WALKROOM_WORDS AS WALKROOM_WORDS                                -- 산책방 내용 --> 추가
    , W.WALKROOM_LEADER AS WALKROOM_LEADER                              -- 산책방방장 (피신고자)
    , OO.OFF_REP_CODE AS OFF_REP_CODE                                   -- 오프라인신고코드 -> TBL_OFFOPINION 에서 조회가능..
    , OO.PARTICIPANTS_CODE AS PARTICIPANTS_CODE                         -- 참여자코드 (피신고자)
    ------추가!!!
    , BC.BOARD_COMM_CODE AS BOARD_COMM_CODE                             -- 게시판댓글코드
    , BC.BOARD_COMM_CONTENT AS BOARD_COMM_CONTENT                       -- 게시판댓글내용
    , WC.WALK_COMM_CONTENT AS WALK_COMM_CONTENT                         -- 산책방댓글내용
FROM TBL_REPORT_LOG L
LEFT OUTER JOIN TBL_REPORT_TYPE T ON L.REP_TYPE_CODE = T.REP_TYPE_CODE
LEFT OUTER JOIN TBL_SID SI ON L.REP_LOG_WRITER = SI.SID_CODE
LEFT OUTER JOIN TBL_REPORT_STATE S ON L.REP_STATE_CODE = S.REP_STATE_CODE
LEFT OUTER JOIN TBL_WALKCOMM_REPORT WCR ON L.REP_LOG_CODE = WCR.REP_LOG_CODE
LEFT OUTER JOIN TBL_WALK_COMMENT WC ON WCR.WALK_COMM_CODE = WC.WALK_COMM_CODE
LEFT OUTER JOIN TBL_BOARDCOMM_REPORT BCR ON L.REP_LOG_CODE = BCR.REP_LOG_CODE
LEFT OUTER JOIN TBL_BOARD_COMMENT BC ON BCR.BOARD_COMM_CODE = BC.BOARD_COMM_CODE
LEFT OUTER JOIN TBL_BOARD_REPORT BR ON L.REP_LOG_CODE = BR.REP_LOG_CODE
LEFT OUTER JOIN TBL_BOARD B ON BR.BOARD_CODE = B.BOARD_CODE
LEFT OUTER JOIN TBL_WALKROOM_REPORT WR ON L.REP_LOG_CODE = WR.REP_LOG_CODE
LEFT OUTER JOIN TBL_WALKROOM W ON WR.WALKROOM_CODE = W.WALKROOM_CODE
LEFT OUTER JOIN TBL_OFF_REPORT OO ON L.REP_LOG_CODE = OO.REP_LOG_CODE
ORDER BY L.REP_LOG_CODE;


SELECT *
FROM REPORTVIEW;

/*
1. REPORTVIEW (신고내역 + 유형+신고자+처리상태)
2. REPORTVIEW_WCR (1 REPORTVIEW + 산책방댓글신고)
3. REPORTVIEW_BCR (1 REPORTVIEW + 게시물댓글신고)
4. REPORTVIEW_BR (1 REPORTVIEW + 게시물신고)
5. REPORTVIEW_WR (1 REPORTVIEW + 산책방신고)
6. REPORTVIEW_OR (1 REPORTVIEW + 오프라인신고)
*/

--○ 게시판 신고 조회(게시믈)
SELECT REP_LOG_CODE 
    , REP_TYPE_CODE
    , REP_TYPE_CONTENT
    , SID_CODE
    , REP_LOG_DATE
    , REP_STATE_CODE
    , REP_STATE_CONTENT
    , REP_LOG_READ
    , BOARD_REP_CODE
    , BOARD_CODE
    , BOARD_WRITER
    , BOARD_TITLE
    , BOARD_CONTENT
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 1
ORDER BY REP_LOG_CODE
;
--==>> 
/*
REP001	1	게시물	SID003	2021-06-27 00:00:00	2	신고해제	2021-06-28	BREP001	7	SID001
REP002	1	게시물	SID007	2021-06-27 00:00:00	1	미처리	2021-06-28	BREP002	3	SID001
REP003	1	게시물	SID002	2021-06-27 00:00:00	1	미처리	2021-06-28	BREP003	3	SID001
*/

--○ 게시판 신고 조회(댓글) -- 댓글 내용 컬럼 추가완료
SELECT REP_LOG_CODE 
    , REP_TYPE_CODE
    , REP_TYPE_CONTENT
    , SID_CODE
    , REP_LOG_DATE
    , REP_STATE_CODE
    , REP_STATE_CONTENT
    , REP_LOG_READ
    , BOARD_REP_CODE
    , BOARD_CODE
    , BOARD_WRITER
    , BOARDCOMM_REP_CODE
    , BOARD_COMM_WRITER
    , BOARD_COMM_CODE                             
    , BOARD_COMM_CONTENT
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 2
ORDER BY REP_LOG_CODE
;


--○ 산책방 신고(산책방 게시물)
SELECT REP_LOG_CODE 
    , REP_TYPE_CODE
    , REP_TYPE_CONTENT
    , SID_CODE
    , REP_LOG_DATE
    , REP_STATE_CODE
    , REP_STATE_CONTENT
    , REP_LOG_READ
    , WALKROOM_REP_CODE
    , WALKROOM_LEADER
    , WALKROOM_CODE
    , WALKROOM_TITLE
    , WALKROOM_WORDS
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 3
ORDER BY REP_LOG_CODE
;

--○ 산책방 신고(산책방 댓글) -- 댓글 내용 컬럼 추가
SELECT REP_LOG_CODE 
    , REP_TYPE_CODE
    , REP_TYPE_CONTENT
    , SID_CODE
    , REP_LOG_DATE
    , REP_STATE_CODE
    , REP_STATE_CONTENT
    , REP_LOG_READ
    , WALKROOM_REP_CODE
    , WALKROOM_LEADER
    , WALKROOM_CODE
    , WALK_COMM_CONTENT
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 5
ORDER BY REP_LOG_CODE
;



--------------------------------------------------------------------------------
SELECT *
FROM TBL_REPORT_LOG;

SELECT *
FROM TBL_WALKROOM;

SELECT *
FROM REPORTVIEW;

SELECT *
FROM TBL_REPORT_TYPE;

SELECT *
FROM TBL_BOARD;

SELECT *
FROM TBL_OFF_REPORT;

SELECT *
FROM TBL_BOARD_COMMENT;
--------------------------------------------------------------------------------
--쿼리문
--------------------------------------------------------------------------------
--○ 미처리된 게시판 게시물 건수 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 1
  AND REP_STATE_CODE = 1
;
--==>> 2

--○ 미처리된 게시판 댓글 건수 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 2
  AND REP_STATE_CODE = 1
;
--==>> 0 

--○ 미처리된 산책메이트 방 게시물 건수 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 3
  AND REP_STATE_CODE = 1
;
--==>> 1 

--○ 미처리된 산책메이트 방 댓글 건수 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 5
 AND REP_STATE_CODE = 1
;
--==>>  0

--○ 미처리된 오프라인 신고 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 4
 AND REP_STATE_CODE = 1
;
--==>> 1



--○  게시물 신고 조회(게시물)
SELECT REP_LOG_CODE 
    , REP_TYPE_CODE
    , REP_TYPE_CONTENT
    , SID_CODE
    , REP_LOG_DATE
    , REP_STATE_CODE
    , REP_STATE_CONTENT
    , REP_LOG_READ
    , BOARD_REP_CODE
    , BOARD_CODE
    , BOARD_WRITER
    , BOARD_TITLE
    , BOARD_CONTENT
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 1
ORDER BY REP_LOG_CODE
;
--==>> 
/*
REP001	1	게시글	SID003	2021-06-27	2	신고해제	2021-06-28	BREP001	7	SID001	샘플사료무나	안양천돌다리로 오실분
REP002	1	게시글	SID007	2021-06-27	1	미처리	2021-06-28	BREP002	3	SID001	오늘 뜨거운 밤	뜨거운밤..어쩌고..신고당할만한 이야기
REP003	1	게시글	SID002	2021-06-27	1	미처리	2021-06-28	BREP003	3	SID001	오늘 뜨거운 밤	뜨거운밤..어쩌고..신고당할만한 이야기
*/


-------------------------------------------------
-- ReportDTO 구성
/*
 rep_log_code
, rep_type_code, rep_type_content, sid_code, rep_log_date
,rep_state_code, rep_state_content
, rep_log_read, walkcomm_rep_code
, walk_comm_writer, boardcomm_rep_code, board_comm_writer
, board_rep_code, board_code, board_writer
, walkroom_rep_code, walkroom_leader
, off_rep_code, participants_code
, board_title, board_content
, walkroom_code, walkroom_title, walkroom_words
, board_comm_code                             
, board_comm_content
*/

--------------------------------------------------------------------------------
-- 수정
-- 아별 21.07.07
-- 고객 지원 (고객 문의) 뷰에 닉네임 컬럼 추가(ASKVIEW_HYEYEON.sql 에도 작성)
CREATE OR REPLACE VIEW ASKVIEW
AS
SELECT A.ASK_CODE AS ASK_CODE
     , A.ASK_CATE_CODE AS ASK_CATE_CODE
     , AL.ASK_CATE_CONTENT AS ASK_CATE_CONTENT
     , A.SID_CODE AS SID_CODE
     , M.MEM_NICKNAME AS MEM_NICKNAME
     , TO_CHAR(A.ASK_DATE, 'YYYY-MM-DD HH24:MI:SS') AS ASK_DATE
     , A.ASK_TITLE AS ASK_TITLE
     , A.ASK_CONTENT AS ASK_CONTENT
     , A.ASK_PHOTO AS ASK_PHOTO
     , A.ASK_STATE_CODE AS ASK_STATE_CODE
     , AST.ASK_STATE_CONTENT AS ASK_STATE_CONTENT
     , TO_CHAR(A.ASK_READ, 'YYYY-MM-DD HH24:MI:SS') AS ASK_READ
FROM TBL_ASK A
LEFT OUTER JOIN TBL_ASK_LEG AL
ON A.ASK_CATE_CODE = AL.ASK_CATE_CODE
LEFT OUTER JOIN TBL_ASK_STATE AST
ON A.ASK_STATE_CODE = AST.ASK_STATE_CODE
LEFT OUTER JOIN TBL_SID S
ON A.SID_CODE = S.SID_CODE
LEFT OUTER JOIN TBL_MEMBER M
ON S.MEM_CODE = M.MEM_CODE
ORDER BY ASK_CODE;


-- 고객지원(고객문의) 전체 데이터 조회 
SELECT ASK_CODE
    , ASK_CATE_CODE 
    ,ASK_CATE_CONTENT
    , SID_CODE
    , MEM_NICKNAME
    , ASK_DATE
    , ASK_TITLE
    , ASK_CONTENT
    , ASK_PHOTO
    , ASK_STATE_CODE
    , ASK_STATE_CONTENT
    , ASK_READ
FROM ASKVIEW
ORDER BY ASK_CODE
;
--==>>
/*
ASK_CODE	ASK_CATE_CODE	ASK_CATE_CONTENT	SID_CODE	MEM_NICKNAME	ASK_DATE	ASK_TITLE	ASK_CONTENT	ASK_PHOTO	ASK_STATE_CODE	ASK_STATE_CONTENT	ASK_READ
1	1	산책메이트	SID003	뚜또집사	2021-06-23 00:00:00	강아지가요	강아지가 다른 강아지를 무서워하면 산책이 가능한가요?		2	답변완료	2021-06-23 00:00:00
2	2	다이어리	SID001	주리짱	2021-06-23 00:00:00	다이어리삭제	다이어리 삭제 시 복구가 불가능한가요??		2	답변완료	2021-06-23 00:00:00
3	2	다이어리	SID001	주리짱	2021-06-27 00:00:00	다이어리 중복	다이어리 중복 작성하면 어케되나여?		1	미처리	
*/

-- 답변 대기 문의 COUNT
SELECT COUNT(*)
FROM ASKVIEW
WHERE ASK_STATE_CODE = 1
;
--==>> 1

SELECT *
FROM TBL_REPORT_TYPE;
--==>>
/*
1	게시물
2	댓글
3	산책방/게시물
4	오프라인
5	산책방/댓글
*/

SELECT REP_LOG_CODE 
			    , REP_TYPE_CODE
			    , REP_TYPE_CONTENT
			    , SID_CODE
			    , REP_LOG_DATE
			    , REP_STATE_CODE
			    , REP_STATE_CONTENT
			    , REP_LOG_READ
			    , WALKROOM_REP_CODE
			    , WALKROOM_LEADER
			    , WALKROOM_CODE
			    , WALKROOM_TITLE
			    , WALKROOM_WORDS
FROM REPORTVIEW
WHERE REP_TYPE_CODE = 3
ORDER BY REP_LOG_CODE;
--===>>
/*
REP_LOG_CODE	REP_TYPE_CODE	REP_TYPE_CONTENT	SID_CODE	REP_LOG_DATE	REP_STATE_CODE	REP_STATE_CONTENT	REP_LOG_READ	WALKROOM_REP_CODE	WALKROOM_LEADER	WALKROOM_CODE	WALKROOM_TITLE	WALKROOM_WORDS
REP004	3	산책방/게시물	SID001	2021-06-27 00:00:00	3	신고확정						
REP008	3	산책방/게시물	SID002	2021-06-27 00:00:00	1	미처리		WRREP001	SID001	1	함께 산책 하실 분?	같이가요ㅎ
REP009	3	산책방/게시물	SID010	2021-06-27 00:00:00	2	신고해제	2021-06-28	WRREP002	SID002	2	가취가욥~!	프로산책러입니다
*/


-------------------------------------------------------------------산책방 신고조회시 비어있는 데이터 수정
-- REP004 
SELECT *
FROM TBL_WALKROOM_REPORT;

SELECT *
FROM TBL_REPORT_LOG
WHERE REP_LOG_CODE = 'REP004';
--==>>
/*
REP_LOG_CODE	REP_TYPE_CODE	REP_TYPE_CONTENT	SID_CODE	REP_LOG_DATE	REP_STATE_CODE	REP_STATE_CONTENT	REP_LOG_READ	WALKROOM_REP_CODE	WALKROOM_LEADER	WALKROOM_CODE	WALKROOM_TITLE	WALKROOM_WORDS
REP004	3	산책방/게시물	SID001	2021-06-27 00:00:00	3	신고확정						
*/

SELECT *
FROM TBL_WALKROOM;
--==>>
/*
1	SID001	1	2	0	1	0	2	4	21/06/27	21/06/27	함께 산책 하실 분?	같이가요ㅎ	안양천 철산-가산 돌다리 앞	37.475694	126.876208	21/06/27
*/


UPDATE TBL_REPORT_LOG
SET REP_TYPE_CODE = 5
WHERE REP_LOG_CODE = 'REP004';
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM REPORTVIEW;

COMMIT;
--==>> 커밋 완료.

-- 수정 
-- 아별 21.07.07 15:00
CREATE OR REPLACE VIEW REPORTVIEW
AS
SELECT L.REP_LOG_CODE AS REP_LOG_CODE               -- 신고내역코드
    , L.REP_TYPE_CODE AS REP_TYPE_CODE              -- 신고유형코드 -> 신고유형코드에 따라 피신고자 컬럼이 달라짐..
    , T.REP_TYPE_CONTENT AS REP_TYPE_CONTENT        -- 신고유형내용
    --, L.REP_LOG_WRITER AS REP_LOG_WRITER          -- 안쓸듯?
    , SI.SID_CODE AS SID_CODE                       -- 신고자 (회원코드)
    , TO_CHAR(L.REP_LOG_DATE, 'YYYY-MM-DD HH24:MI:SS') AS REP_LOG_DATE  -- 신고날짜
    , L.REP_STATE_CODE AS REP_STATE_CODE                                -- 신고처리상태코드 
    , S.REP_STATE_CONTENT AS REP_STATE_CONTENT                          -- 신고처리상태내용
    , TO_CHAR(L.REP_LOG_READ, 'YYYY-MM-DD') AS REP_LOG_READ             -- 열람날짜
    , WCR.WALKCOMM_REP_CODE AS WALKCOMM_REP_CODE                        -- 산책방댓글신고코드
    , WC.WALK_COMM_WRITER AS WALK_COMM_WRITER                           -- 산책방댓글작성자 (피신고자)
    , BCR.BOARDCOMM_REP_CODE AS BOARDCOMM_REP_CODE                      -- 게시판댓글신고코드
    , BC.BOARD_COMM_WRITER AS BOARD_COMM_WRITER                         -- 게시판댓글작성자 (피신고자)
    , BR.BOARD_REP_CODE AS BOARD_REP_CODE                               -- 게시물신고코드
    , BR.BOARD_CODE AS BOARD_CODE                                       -- 게시물코드(숫자)
    , B.BOARD_WRITER AS BOARD_WRITER                                    -- 게시물작성자 (피신고자)
    , B.BOARD_TITLE AS BOARD_TITLE                                      -- 게시물 제목
    , B.BOARD_CONTENT AS BOARD_CONTENT                                  -- 게시물 내용
    , WR.WALKROOM_REP_CODE AS WALKROOM_REP_CODE                         -- 산책방신고코드
    , W.WALKROOM_CODE AS WALKROOM_CODE                                  -- 산책방 코드 --> 추가
    , W.WALKROOM_TITLE AS WALKROOM_TITLE                                -- 산책방 제목 --> 추가
    , W.WALKROOM_WORDS AS WALKROOM_WORDS                                -- 산책방 내용 --> 추가
    , W.WALKROOM_LEADER AS WALKROOM_LEADER                              -- 산책방방장 (피신고자)
    , OO.OFF_REP_CODE AS OFF_REP_CODE                                   -- 오프라인신고코드 -> TBL_OFFOPINION 에서 조회가능..
    , OO.PARTICIPANTS_CODE AS PARTICIPANTS_CODE                         -- 참여자코드 (피신고자)
    ------추가!!!
    , BC.BOARD_COMM_CODE AS BOARD_COMM_CODE                             -- 게시판댓글코드
    , BC.BOARD_COMM_CONTENT AS BOARD_COMM_CONTENT                       -- 게시판댓글내용
    , WC.WALK_COMM_CONTENT AS WALK_COMM_CONTENT                         -- 산책방댓글내용
FROM TBL_REPORT_LOG L
LEFT OUTER JOIN TBL_REPORT_TYPE T ON L.REP_TYPE_CODE = T.REP_TYPE_CODE
LEFT OUTER JOIN TBL_SID SI ON L.REP_LOG_WRITER = SI.SID_CODE
LEFT OUTER JOIN TBL_REPORT_STATE S ON L.REP_STATE_CODE = S.REP_STATE_CODE
LEFT OUTER JOIN TBL_WALKCOMM_REPORT WCR ON L.REP_LOG_CODE = WCR.REP_LOG_CODE
LEFT OUTER JOIN TBL_WALK_COMMENT WC ON WCR.WALK_COMM_CODE = WC.WALK_COMM_CODE

LEFT OUTER JOIN TBL_BOARDCOMM_REPORT BCR ON L.REP_LOG_CODE = BCR.REP_LOG_CODE

LEFT OUTER JOIN TBL_BOARD_COMMENT BC ON BCR.BOARD_COMM_CODE = BC.BOARD_COMM_CODE

LEFT OUTER JOIN TBL_BOARD_REPORT BR ON L.REP_LOG_CODE = BR.REP_LOG_CODE

LEFT OUTER JOIN TBL_BOARD B ON BR.BOARD_CODE = B.BOARD_CODE

LEFT OUTER JOIN TBL_WALKROOM_REPORT WR ON L.REP_LOG_CODE = WR.REP_LOG_CODE
LEFT OUTER JOIN TBL_WALKROOM W ON WR.WALKROOM_CODE = W.WALKROOM_CODE
LEFT OUTER JOIN TBL_OFF_REPORT OO ON L.REP_LOG_CODE = OO.REP_LOG_CODE
ORDER BY L.REP_LOG_CODE;


SELECT *
FROM TBL_WALK_COMMENT;
--==>>
/*
WALK_COMM_CODE	WALKROOM_CODE	WALK_COMM_WRITER	WALK_COMM_CONTENT	WALK_COMM_DATE
1	1	SID001	오늘5분만 늦춰도될까요?	21/06/27
2	2	SID002	왜아무도안들어오지..	21/06/27
3	1	SID003	네 그럼 몇시까지인가요?	21/06/27
4	3	SID007	반갑습니다	21/06/27
5	3	SID009	넹 좋은 산책해요	21/06/27
6	3	SID008	저희애기구경하실래요?	21/06/27
7	4	SID010	저희애기도 귀엽답니다	21/06/27
8	4	SID008	이따 함 보죠 ㅎ	21/06/27
9	3	SID007	사람 더 올까요?	21/06/27
10	4	SID010	달리기 함 하실?	21/06/27
*/


SELECT *
FROM TBL_WALKCOMM_REPORT;
--==>>
/*
WALKCOMM_REP_CODE	REP_LOG_CODE	WALK_COMM_CODE
WCREP001	REP004	2
WCREP002	REP005	1
*/

SELECT *
FROM TBL_BOARD_COMMENT;
--==>>
/*
BOARD_COMM_CODE	BOARD_CODE	BOARD_COMM_WRITER	BOARD_COMM_CONTENT	BOARD_COMM_DATE
1	1	SID001	헐대박 그런 우연이있네요	21/06/22
2	1	SID002	진짜웃기죠?	21/06/22
3	2	SID002	와 저희 애기도 이거 좋아해요	21/06/23
4	3	SID007	신고합니다	21/06/24
5	4	SID010	구매완	21/06/24
6	6	SID008	제가 살게요	21/06/25
7	8	SID003	고생하셨네요	21/06/25
8	10	SID001	당장 갑니다	21/06/26
9	9	SID009	그러게요ㅠ 저도 아직 매칭중	21/06/26
10	10	SID007	펫페어가 머죠?	21/06/27
*/
SELECT *
FROM TBL_BOARDCOMM_REPORT;

SELECT *
FROM TBL_REPORT_LOG;

SELECT *
FROM TBL_BOARD_REPORT;

------------------------------------------------------------------------------------- REPORTVIEW 수정


----------------------------------------------------------------------------------------------------------
SELECT L.REP_LOG_CODE AS REP_LOG_CODE                -- 신고내역코드
    , RT.REP_TYPE_CODE AS REP_TYPE_CODE              -- 신고유형코드 → 신고유형코드에 따라 피신고자 컬럼이 달라짐..
    , RT.REP_TYPE_CONTENT AS REP_TYPE_CONTENT        -- 신고유형내용
    , S.SID_CODE AS SID_CODE                         -- 신고자
    , BC.BOARD_COMM_CODE AS BOARD_COMM_CODE          -- 게시판댓글코드
    , B.BOARD_TITLE AS BOARD_TITLE                   -- 게시물 제목
    , B.BOARD_CONTENT AS BOARD_CONTENT               -- 게시물 내용
    , B.BOARD_WRITER AS BOARD_WRITER                 -- 게시물작성자 (피신고자)
FROM TBL_REPORT_LOG L, TBL_REPORT_TYPE RT, TBL_SID S, TBL_BOARDCOMM_REPORT BCR, TBL_BOARD_COMMENT BC, TBL_BOARD B
WHERE L.REP_TYPE_CODE = RT.REP_TYPE_CODE(+)
  AND L.REP_LOG_WRITER = S.SID_CODE(+)
  AND L.REP_LOG_CODE = BCR.REP_LOG_CODE(+)
  AND BCR.BOARD_COMM_CODE = BC.BOARD_COMM_CODE(+)
  AND BC.BOARD_CODE = B.BOARD_CODE(+);


--==>>
/*
11개 행
REP_LOG_CODE	REP_TYPE_CODE	REP_TYPE_CONTENT	SID_CODE	BOARD_COMM_CODE	BOARD_TITLE	BOARD_CONTENT
REP006	2	댓글	SID003	2	오늘대박	오늘 산책메이트 산책갔는데 옆집 사람이었다 문열때부터 같이갔음 대박
REP007	2	댓글	SID003	5	로x캐닌 할인	견종별 사료가 10% 할인~
REP001	1	게시글	SID003			
REP008	3	산책방/게시물	SID002			
REP004	5	산책방/댓글	SID001			
REP010	4	오프라인	SID003			
REP009	3	산책방/게시물	SID010			
REP002	1	게시글	SID007			
REP011	4	오프라인	SID001			
REP005	5	산책방/댓글	SID001			
REP003	1	게시글	SID002					
*/

------------------------ 하림이가 보낸건데 댓글과 게시물에서 글제목, 글번호, 등을 동시에 볼순 없는것 같다.
------------------------ 그래서 어제 만들어둔 REPORTVIEW 로 쓰기로했음
--
--SELECT L.REP_LOG_CODE AS REP_LOG_CODE              -- 신고내역코드
--    , RT.REP_TYPE_CODE AS REP_TYPE_CODE             -- 신고유형코드 → 신고유형코드에 따라 피신고자 컬럼이 달라짐..
--    , RT.REP_TYPE_CONTENT AS REP_TYPE_CONTENT       -- 신고유형내용
--    , S.SID_CODE AS SID_CODE
--    , BC.BOARD_COMM_CODE AS BOARD_COMM_CODE
--    , B.BOARD_TITLE AS BOARD_TITLE
--    , B.BOARD_CONTENT AS BOARD_CONTENT
--    , B.BOARD_CODE AS BOARD_CODE
--FROM TBL_REPORT_LOG L, TBL_REPORT_TYPE RT, TBL_SID S, TBL_BOARDCOMM_REPORT BCR, TBL_BOARD_COMMENT BC, TBL_BOARD B
--WHERE L.REP_TYPE_CODE = RT.REP_TYPE_CODE(+)
--  AND L.REP_LOG_WRITER = S.SID_CODE(+)
--  AND L.REP_LOG_CODE = BCR.REP_LOG_CODE(+)
--  AND BC.BOARD_CODE = B.BOARD_CODE(+)
--  AND BCR.BOARD_COMM_CODE = BC.BOARD_COMM_CODE(+);
--  
  
-------------------------------

CREATE OR REPLACE VIEW REPORTVIEW
AS
SELECT L.REP_LOG_CODE AS REP_LOG_CODE                                   -- 신고내역코드
    , L.REP_TYPE_CODE AS REP_TYPE_CODE                                  -- 신고유형코드 -> 신고유형코드에 따라 피신고자 컬럼이 달라짐..
    , T.REP_TYPE_CONTENT AS REP_TYPE_CONTENT                            -- 신고유형내용
    --, L.REP_LOG_WRITER AS REP_LOG_WRITER                              -- 안쓸듯? (SID_CODE랑 중복)
    , SI.SID_CODE AS SID_CODE                                           -- 신고자 (회원코드)
    , M.MEM_NICKNAME AS REPORTER_NICKNAME                               -- 신고자 닉네임  --> 07.07 추가
    , TO_CHAR(L.REP_LOG_DATE, 'YYYY-MM-DD') AS REP_LOG_DATE             -- 신고날짜
    , L.REP_STATE_CODE AS REP_STATE_CODE                                -- 신고처리상태코드 
    , S.REP_STATE_CONTENT AS REP_STATE_CONTENT                          -- 신고처리상태내용
    , TO_CHAR(L.REP_LOG_READ, 'YYYY-MM-DD') AS REP_LOG_READ             -- 열람날짜
    , WCR.WALKCOMM_REP_CODE AS WALKCOMM_REP_CODE                        -- 산책방댓글신고코드
    , WC.WALK_COMM_WRITER AS WALK_COMM_WRITER                           -- 산책방댓글작성자 (피신고자)
    , BCR.BOARDCOMM_REP_CODE AS BOARDCOMM_REP_CODE                      -- 게시판댓글신고코드
    , BC.BOARD_COMM_WRITER AS BOARD_COMM_WRITER                         -- 게시판댓글작성자 (피신고자)
    , BR.BOARD_REP_CODE AS BOARD_REP_CODE                               -- 게시물신고코드
    , BR.BOARD_CODE AS BOARD_CODE                                       -- 게시물코드(숫자)
    , B.BOARD_WRITER AS BOARD_WRITER                                    -- 게시물작성자 (피신고자)
    , B.BOARD_TITLE AS BOARD_TITLE                                      -- 게시물 제목
    , B.BOARD_CONTENT AS BOARD_CONTENT                                  -- 게시물 내용
    , WR.WALKROOM_REP_CODE AS WALKROOM_REP_CODE                         -- 산책방신고코드
    , W.WALKROOM_CODE AS WALKROOM_CODE                                  -- 산책방 코드 --> 추가
    , W.WALKROOM_TITLE AS WALKROOM_TITLE                                -- 산책방 제목 --> 추가
    , W.WALKROOM_WORDS AS WALKROOM_WORDS                                -- 산책방 내용 --> 추가
    , W.WALKROOM_LEADER AS WALKROOM_LEADER                              -- 산책방방장 (피신고자)
    , OO.OFF_REP_CODE AS OFF_REP_CODE                                   -- 오프라인신고코드 -> TBL_OFFOPINION 에서 조회가능..
    , OO.PARTICIPANTS_CODE AS PARTICIPANTS_CODE                         -- 참여자코드 (피신고자)
    ------추가!!!
    , BC.BOARD_COMM_CODE AS BOARD_COMM_CODE                             -- 게시판댓글코드
    , BC.BOARD_COMM_CONTENT AS BOARD_COMM_CONTENT                       -- 게시판댓글내용
    , WC.WALK_COMM_CONTENT AS WALK_COMM_CONTENT                         -- 산책방댓글내용

    
FROM TBL_REPORT_LOG L
LEFT OUTER JOIN TBL_REPORT_TYPE T ON L.REP_TYPE_CODE = T.REP_TYPE_CODE
LEFT OUTER JOIN TBL_SID SI ON L.REP_LOG_WRITER = SI.SID_CODE

-- 추가
LEFT OUTER JOIN TBL_MEMBER M ON M.MEM_CODE = SI.MEM_CODE
--

LEFT OUTER JOIN TBL_REPORT_STATE S ON L.REP_STATE_CODE = S.REP_STATE_CODE
LEFT OUTER JOIN TBL_WALKCOMM_REPORT WCR ON L.REP_LOG_CODE = WCR.REP_LOG_CODE
LEFT OUTER JOIN TBL_WALK_COMMENT WC ON WCR.WALK_COMM_CODE = WC.WALK_COMM_CODE

LEFT OUTER JOIN TBL_BOARDCOMM_REPORT BCR ON L.REP_LOG_CODE = BCR.REP_LOG_CODE

LEFT OUTER JOIN TBL_BOARD_COMMENT BC ON BCR.BOARD_COMM_CODE = BC.BOARD_COMM_CODE

LEFT OUTER JOIN TBL_BOARD_REPORT BR ON L.REP_LOG_CODE = BR.REP_LOG_CODE

LEFT OUTER JOIN TBL_BOARD B ON BR.BOARD_CODE = B.BOARD_CODE

LEFT OUTER JOIN TBL_WALKROOM_REPORT WR ON L.REP_LOG_CODE = WR.REP_LOG_CODE
LEFT OUTER JOIN TBL_WALKROOM W ON WR.WALKROOM_CODE = W.WALKROOM_CODE
LEFT OUTER JOIN TBL_OFF_REPORT OO ON L.REP_LOG_CODE = OO.REP_LOG_CODE
ORDER BY L.REP_LOG_CODE;
--==>>
/*
-- 11개 레코드
REP001	1	게시글	SID003	2021-06-27	2	신고해제	2021-06-28					BREP001	7	SID001	샘플사료무나	안양천돌다리로 오실분											뚜또집사
REP002	1	게시글	SID007	2021-06-27	1	미처리	2021-06-28					BREP002	3	SID001	오늘 뜨거운 밤	뜨거운밤..어쩌고..신고당할만한 이야기											맛있는참치
REP003	1	게시글	SID002	2021-06-27	1	미처리	2021-06-28					BREP003	3	SID001	오늘 뜨거운 밤	뜨거운밤..어쩌고..신고당할만한 이야기											사공혜연
REP004	5	산책방/댓글	SID001	2021-06-27	1	미처리		WCREP001	SID002								WRREP003	1	함께 산책 하실 분?	같이가요ㅎ	SID001					왜아무도안들어오지..	주리짱
REP005	5	산책방/댓글	SID001	2021-06-27	2	신고해제	2021-06-28	WCREP002	SID001																	오늘5분만 늦춰도될까요?	주리짱
REP006	2	댓글	SID003	2021-06-27	2	신고해제	2021-06-28			BCREP001	SID002													2	진짜웃기죠?		뚜또집사
REP007	2	댓글	SID003	2021-06-27	2	신고해제	2021-06-28			BCREP002	SID010													5	구매완		뚜또집사
REP008	3	산책방/게시물	SID002	2021-06-27	1	미처리											WRREP001	1	함께 산책 하실 분?	같이가요ㅎ	SID001						사공혜연
REP009	3	산책방/게시물	SID010	2021-06-27	2	신고해제	2021-06-28										WRREP002	2	가취가욥~!	프로산책러입니다	SID002						연기연습하는은우
REP010	4	오프라인	SID003	2021-06-28	2	신고해제	2021-06-29															OFFREP001	PAR001				뚜또집사
REP011	4	오프라인	SID001	2021-06-28	1	미처리																OFFREP002	PAR004				주리짱
*/

-----------------------------------------------------------------------------------------------------------------
-- TBL_REPORT_LOG 테이블 열람날짜, 신고날짜 형식 수정 (시, 분, 초 부여)

SELECT *
FROM TBL_REPORT_LOG;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-27 18:30:01', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-28 13:30:01', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP001';

UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-27 18:31:02', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-28 13:32:03', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP002';

--
UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-27 18:30:01', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-28 13:30:01', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP003';

UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-27 18:41:02', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-28 13:42:03', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP005';

UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-27 18:43:41', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-28 13:45:01', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP006';

UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-27 18:50:01', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-28 14:00:11', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP007';

UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-27 19:11:02', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-28 14:11:03', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP009';

UPDATE TBL_REPORT_LOG
SET REP_LOG_DATE = TO_DATE('2021-06-28 09:31:02', 'YYYY-MM-DD HH24:MI:SS')
    , REP_LOG_READ = TO_DATE('2021-06-29 15:02:03', 'YYYY-MM-DD HH24:MI:SS')
WHERE REP_LOG_CODE = 'REP010';
--==>> 1 행 이(가) 업데이트되었습니다.

-- 시, 분, 초 부여후 재조회
SELECT *
FROM TBL_REPORT_LOG;
--==>>
/*
REP_LOG_CODE	REP_TYPE_CODE	REP_LOG_WRITER	REP_LOG_DATE	REP_STATE_CODE	REP_LOG_READ
REP001	1	SID003	2021-06-27 18:30:01	2	2021-06-28 13:30:01
REP002	1	SID007	2021-06-27 18:31:02	1	2021-06-28 13:32:03
REP003	1	SID002	2021-06-27 18:30:01	1	2021-06-28 13:30:01
REP004	5	SID001	2021-06-27 00:00:00	1	
REP005	5	SID001	2021-06-27 18:41:02	2	2021-06-28 13:42:03
REP006	2	SID003	2021-06-27 18:43:41	2	2021-06-28 13:45:01
REP007	2	SID003	2021-06-27 18:50:01	2	2021-06-28 14:00:11
REP008	3	SID002	2021-06-27 00:00:00	1	
REP009	3	SID010	2021-06-27 19:11:02	2	2021-06-28 14:11:03
REP010	4	SID003	2021-06-28 09:31:02	2	2021-06-29 15:02:03
REP011	4	SID001	2021-06-28 00:00:00	1	
*/


-- 커밋
COMMIT;
--==>> 커밋 완료.

-----------------------------------------------------------------------------------------------------------------
-- 열람하지 않은(읽지않은) 신고 COUNT

-- 신고유형 조회
SELECT *
FROM TBL_REPORT_TYPE;
--==>>
/*
REP_TYPE_CODE	REP_TYPE_CONTENT
1	게시글
2	댓글
3	산책방/게시물
4	오프라인
5	산책방/댓글
*/

-- 읽지않은 게시판 > 게시물 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_LOG_READ IS NULL
  AND REP_TYPE_CODE = 1
;
--==>> 0

-- 읽지않은 산책방 > 게시물 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_LOG_READ IS NULL
  AND REP_TYPE_CODE = 3
;
--==>> 1

-- 읽지않은 산책방 > 오프라인신고의견 COUNT
SELECT COUNT(*)
FROM REPORTVIEW
WHERE REP_LOG_READ IS NULL
  AND REP_TYPE_CODE = 4
;
--==>> 1


SELECT *
FROM TBL_MEMBER;
--==>>
/*
9개 레코드
MEM001	joohee	"nb�	정주희	1997-12-24 00:00:00	F	010-1111-1111	경기도 광명시 철산동	2021-05-24 00:00:00	주리짱
MEM002	hyeyeon	3F&�F	선혜연	1995-11-02 00:00:00	F	010-2222-2222	경기도 고양시 일산서구 주엽로98	2021-06-20 00:00:00	사공혜연
MEM003	harim	-0��	이하림	1997-10-22 00:00:00	F	010-3333-3333	서울 금천구 가산동	2021-06-01 00:00:00	뚜또집사
MEM006	hyerim	��� W	한혜림	1997-10-06 00:00:00	F	010-6666-6666	경기도 수원시 세류동	2021-06-19 00:00:00	혜림냥냥
MEM007	dongwon	gM� L	강동원	1981-01-18 00:00:00	M	010-7777-7777	경상남도 거창군 거창읍	2021-06-20 00:00:00	맛있는참치
MEM008	kangjun	�X親*�	서강준	1993-10-12 00:00:00	M	010-8888-8888	서울 강남구 자곡동	2021-06-22 00:00:00	바싹말린강준
MEM009	moonbin	�:6�	문빈	1998-01-26 00:00:00	M	010-9999-9999	인천 연수구 송도동	2021-06-23 00:00:00	니가내별이다
MEM010	eunwoo	�Yϓ��	차은우	1997-03-30 00:00:00	M	010-1997-0330	경기도 군포시 수리산로 37	2021-06-26 00:00:00	연기연습하는은우
MEM011	jinsootasty	֕},)r�	국진수	2002-06-14 00:00:00	M	010,1231,1231	서울 성북구 길음동	0021-07-07 00:00:00	밥진수
*/  

SELECT *
FROM TBL_SID;
--==>>
--1O개 레코드
/*
SID001	MEM001
SID002	MEM002
SID003	MEM003
SID004	
SID005	
SID006	MEM006
SID007	MEM007
SID008	MEM008
SID009	MEM009
SID010	MEM010
*/

SELECT *
FROM TBL_SID S
RIGHT JOIN TBL_MEMBER M
ON S.MEM_CODE = M.MEM_CODE;
--==>>
/*
SID001	MEM001	MEM001	joohee	"nb�	정주희	1997-12-24 00:00:00	F	010-1111-1111	경기도 광명시 철산동	2021-05-24 00:00:00	주리짱
SID002	MEM002	MEM002	hyeyeon	3F&�F	선혜연	1995-11-02 00:00:00	F	010-2222-2222	경기도 고양시 일산서구 주엽로98	2021-06-20 00:00:00	사공혜연
SID003	MEM003	MEM003	harim	-0��	이하림	1997-10-22 00:00:00	F	010-3333-3333	서울 금천구 가산동	2021-06-01 00:00:00	뚜또집사
SID006	MEM006	MEM006	hyerim	��� W	한혜림	1997-10-06 00:00:00	F	010-6666-6666	경기도 수원시 세류동	2021-06-19 00:00:00	혜림냥냥
SID007	MEM007	MEM007	dongwon	gM� L	강동원	1981-01-18 00:00:00	M	010-7777-7777	경상남도 거창군 거창읍	2021-06-20 00:00:00	맛있는참치
SID008	MEM008	MEM008	kangjun	�X親*�	서강준	1993-10-12 00:00:00	M	010-8888-8888	서울 강남구 자곡동	2021-06-22 00:00:00	바싹말린강준
SID009	MEM009	MEM009	moonbin	�:6�	문빈	1998-01-26 00:00:00	M	010-9999-9999	인천 연수구 송도동	2021-06-23 00:00:00	니가내별이다
SID010	MEM010	MEM010	eunwoo	�Yϓ��	차은우	1997-03-30 00:00:00	M	010-1997-0330	경기도 군포시 수리산로 37	2021-06-26 00:00:00	연기연습하는은우
		MEM011	jinsootasty	֕},)r�	국진수	2002-06-14 00:00:00	M	010,1231,1231	서울 성북구 길음동	0021-07-07 00:00:00	밥진수
*/

-- REPORTVIEW 에 신고자 닉네임 컬럼 추가
SELECT *
FROM REPORTVIEW;
--==>>
/*
11개 레코드
REP_LOG_CODE	REP_TYPE_CODE	REP_TYPE_CONTENT	SID_CODE	REP_LOG_DATE	REP_STATE_CODE	REP_STATE_CONTENT	REP_LOG_READ	WALKCOMM_REP_CODE	WALK_COMM_WRITER	BOARDCOMM_REP_CODE	BOARD_COMM_WRITER	BOARD_REP_CODE	BOARD_CODE	BOARD_WRITER	BOARD_TITLE	BOARD_CONTENT	WALKROOM_REP_CODE	WALKROOM_CODE	WALKROOM_TITLE	WALKROOM_WORDS	WALKROOM_LEADER	OFF_REP_CODE	PARTICIPANTS_CODE	BOARD_COMM_CODE	BOARD_COMM_CONTENT	WALK_COMM_CONTENT	REPORTER_NICKNAME
REP001	1	게시글	SID003	2021-06-27	2	신고해제	2021-06-28					BREP001	7	SID001	샘플사료무나	안양천돌다리로 오실분											뚜또집사
REP002	1	게시글	SID007	2021-06-27	1	미처리	2021-06-28					BREP002	3	SID001	오늘 뜨거운 밤	뜨거운밤..어쩌고..신고당할만한 이야기											맛있는참치
REP003	1	게시글	SID002	2021-06-27	1	미처리	2021-06-28					BREP003	3	SID001	오늘 뜨거운 밤	뜨거운밤..어쩌고..신고당할만한 이야기											사공혜연
REP004	5	산책방/댓글	SID001	2021-06-27	1	미처리		WCREP001	SID002								WRREP003	1	함께 산책 하실 분?	같이가요ㅎ	SID001					왜아무도안들어오지..	주리짱
REP005	5	산책방/댓글	SID001	2021-06-27	2	신고해제	2021-06-28	WCREP002	SID001																	오늘5분만 늦춰도될까요?	주리짱
REP006	2	댓글	SID003	2021-06-27	2	신고해제	2021-06-28			BCREP001	SID002													2	진짜웃기죠?		뚜또집사
REP007	2	댓글	SID003	2021-06-27	2	신고해제	2021-06-28			BCREP002	SID010													5	구매완		뚜또집사
REP008	3	산책방/게시물	SID002	2021-06-27	1	미처리											WRREP001	1	함께 산책 하실 분?	같이가요ㅎ	SID001						사공혜연
REP009	3	산책방/게시물	SID010	2021-06-27	2	신고해제	2021-06-28										WRREP002	2	가취가욥~!	프로산책러입니다	SID002						연기연습하는은우
REP010	4	오프라인	SID003	2021-06-28	2	신고해제	2021-06-29															OFFREP001	PAR001				뚜또집사
REP011	4	오프라인	SID001	2021-06-28	1	미처리																OFFREP002	PAR004				주리짱
*/

SELECT *
FROM TBL_ASK;
--==>>
/*
ASK_CODE	ASK_CATE_CODE	SID_CODE	ASK_DATE	ASK_TITLE	ASK_CONTENT	ASK_PHOTO	ASK_STATE_CODE	ASK_READ
1	1	SID003	21/06/23	강아지가요	강아지가 다른 강아지를 무서워하면 산책이 가능한가요?		2	21/06/23
2	2	SID001	21/06/23	다이어리삭제	다이어리 삭제 시 복구가 불가능한가요??		2	21/06/23
3	2	SID001	21/06/27	다이어리 중복	다이어리 중복 작성하면 어케되나여?		1	
*/

SELECT *
FROM ASKVIEW;
--==>>
/*
ASK_CODE	ASK_CATE_CODE	ASK_CATE_CONTENT	SID_CODE	MEM_NICKNAME	ASK_DATE	ASK_TITLE	ASK_CONTENT	ASK_PHOTO	ASK_STATE_CODE	ASK_STATE_CONTENT	ASK_READ
    1	1	산책메이트	SID003	뚜또집사	2021-06-23 00:00:00	강아지가요	강아지가 다른 강아지를 무서워하면 산책이 가능한가요?		2	답변완료	2021-06-23 00:00:00
    2	2	다이어리	SID001	주리짱	2021-06-23 00:00:00	다이어리삭제	다이어리 삭제 시 복구가 불가능한가요??		2	답변완료	2021-06-23 00:00:00
    3	2	다이어리	SID001	주리짱	2021-06-27 00:00:00	다이어리 중복	다이어리 중복 작성하면 어케되나여?		1	미처리	
*/

-- 고객 문의 뷰 ASKVIEW

SELECT  ASK_CODE            -- 고객문의코드
    , ASK_CATE_CODE         -- 문의카테고리코드
    , ASK_CATE_CONTENT      -- 문의카테고리내용
    , SID_CODE              -- 작성자(회원코드)
    , MEM_NICKNAME          -- 작성자닉네임
    , ASK_DATE              -- 문의날짜
    , ASK_TITLE             -- 문의제목
    , ASK_CONTENT           -- 문의내용
    , ASK_PHOTO             -- 문의사진
    , ASK_STATE_CODE        -- 문의처리상태코드
    , ASK_STATE_CONTENT     -- 문의처리상태내용 (미처리, 답변완료)
    , ASK_READ              -- 열람날짜
FROM ASKVIEW
ORDER BY ASK_CODE
;
--==>>
/*
1	1	산책메이트	SID003	뚜또집사	2021-06-23 00:00:00	강아지가요	강아지가 다른 강아지를 무서워하면 산책이 가능한가요?		2	답변완료	2021-06-23 00:00:00
2	2	다이어리	SID001	주리짱	2021-06-23 00:00:00	다이어리삭제	다이어리 삭제 시 복구가 불가능한가요??		2	답변완료	2021-06-23 00:00:00
3	2	다이어리	SID001	주리짱	2021-06-27 00:00:00	다이어리 중복	다이어리 중복 작성하면 어케되나여?		1	미처리	
*/


/*
ASK_CODE, ASK_CATE_CODE, ASK_CATE_CONTENT, SID_CODE, MEM_NICKNAME, ASK_DATE
, ASK_TITLE, ASK_CONTENT, ASK_PHOTO, ASK_STATE_CODE, ASK_STATE_CONTENT, ASK_READ              
*/

--안읽은 고객문의 수 
SELECT COUNT(*)
FROM ASKVIEW
WHERE ASK_READ IS NULL
;
--==>> 1

SELECT *
FROM TBL_OFF_REPORT;

SELECT *
FROM TBL_OFFOPINION;

-- 오프라인신고 뷰 생성 
CREATE OR REPLACE VIEW OFFLINEVIEW
AS
SELECT ORT.REP_LOG_CODE, ORT.MATCH_CODE, ORT.PARTICIPANTS_CODE, OPN.OFFOPINION_CODE, OPN.OFFOPINION_DATE, OPN.OFFOPINION_TITLE, OPN.OFFOPINION_CONTENT, OPN.OFFOPINION_PHOTO
FROM TBL_OFF_REPORT ORT
LEFT OUTER JOIN TBL_OFFOPINION OPN
ON ORT.OFF_REP_CODE = OPN.OFF_REP_CODE;
--==>> View OFFLINEVIEW이(가) 생성되었습니다.
--==>> 
/*
REP_LOG_CODE	MATCH_CODE	PARTICIPANTS_CODE	OFFOPINION_CODE	OFFOPINION_DATE	OFFOPINION_TITLE	OFFOPINION_CONTENT	OFFOPINION_PHOTO
REP010	MAT001	PAR001	OFFOP001	21/06/30	저 산책 나갔어요	저 그날 주희님 뵀거든요? 좀 어이없네요..	
REP011	MAT001	PAR004					
*/

SELECT REP_LOG_CODE         -- 신고내역코드
    , MATCH_CODE            -- 매칭코드
    , PARTICIPANTS_CODE     -- 참여자코드
    , OFFOPINION_CODE       -- 오프라인의견코드
    , OFFOPINION_DATE       -- 오프라인의견날짜
    , OFFOPINION_TITLE      -- 오프라인의견제목
    , OFFOPINION_CONTENT    -- 오프라인의견내용
    , OFFOPINION_PHOTO      -- 오프라인의견사진
FROM OFFLINEVIEW
;
--==>>
/*
REP_LOG_CODE	MATCH_CODE	PARTICIPANTS_CODE	OFFOPINION_CODE	OFFOPINION_DATE	OFFOPINION_TITLE	OFFOPINION_CONTENT	OFFOPINION_PHOTO
REP010	MAT001	PAR001	OFFOP001	21/06/30	저 산책 나갔어요	저 그날 주희님 뵀거든요? 좀 어이없네요..	
REP011	MAT001	PAR004					
*/
SELECT COUNT(*)
FROM OFFLINEVIEW
WHERE OFFOPINION_DATE IS NULL
;
--==>> 1


--============================================================================================================21.07.08 회원관리 

SELECT *
FROM MEMBERVIEW
;
--==>>
/*
14개 레코드

SID_CODE	MEM_CODE	MEM_ID	MEM_PW	MEM_NAME	MEM_BIRTH	MEM_GENDER	MEM_TEL	MEM_ADDR	MEM_REGDATE	MEM_NICKNAME	PAUSE_CODE	PAUSE_START	OUT_CODE	OUT_TYPE_CODE	OUT_DATE	WALK_AGREE_CODE	WALK_AGREE_CHECK	WALK_AGREE_DATE	OUT_TYPE_CONTENT
SID001	MEM001	joohee	"nb�	정주희	1997-12-24	F	010-1111-1111	경기도 광명시 철산동	2021-05-24	주리짱						AGR001	Y	2021-06-24	
SID002	MEM002	hyeyeon	3F&�F	선혜연	1995-11-02	F	010-2222-2222	경기도 고양시 일산서구 주엽로98	2021-06-20	사공혜연						AGR002	Y	2021-06-25	
SID003	MEM003	harim	-0��	이하림	1997-10-22	F	010-3333-3333	서울 금천구 가산동	2021-06-01	뚜또집사						AGR003	Y	2021-06-25	
SID004													OUT001	2	2021-07-07	AGR004	Y	2021-06-25	강제탈퇴
SID005													OUT002	1	2021-07-07	AGR005	Y	2021-06-25	자진탈퇴
SID006	MEM006	hyerim	��� W	한혜림	1997-10-06	F	010-6666-6666	경기도 수원시 세류동	2021-06-19	혜림냥냥	PAU001	21/06/27				AGR006	Y	2021-06-26	
SID007	MEM007	dongwon	gM� L	강동원	1981-01-18	M	010-7777-7777	경상남도 거창군 거창읍	2021-06-20	맛있는참치						AGR007	Y	2021-06-26	
SID008	MEM008	kangjun	�X親*�	서강준	1993-10-12	M	010-8888-8888	서울 강남구 자곡동	2021-06-22	바싹말린강준						AGR008	Y	2021-06-26	
SID009	MEM009	moonbin	�:6�	문빈	1998-01-26	M	010-9999-9999	인천 연수구 송도동	2021-06-23	니가내별이다						AGR009	Y	2021-06-23	
SID010	MEM010	eunwoo	�Yϓ��	차은우	1997-03-30	M	010-1997-0330	경기도 군포시 수리산로 37	2021-06-26	연기연습하는은우						AGR010	Y	2021-06-26	
SID011	MEM011	jinsootasty	֕},)r�	국진수	2002-06-14	M	010-1231-1231	서울 성북구 길음동	2021-07-06	밥진수						AGR011	Y	2021-07-06	
SID012	MEM012	real_bae	�Y��	윤진배	1974-04-17	M	010,8282,8282	서울 구로구 구로동 23	2021-07-07	진배없다						AGR012	Y	2021-07-07	
SID13	MEM13	purple	-V��	황보혜연	0097-07-16	F	010-1231,5675678	경기 일산시 동구	2021-07-08	보라노랑						AGR13	N	2021-07-08	
SID14	MEM14	milky_bboy	"UK
_D"	백도준	0098-07-09	M	010-6745,3573574	인천 연수구 송도동 12	2021-07-08	백설기123						AGR14	N	2021-07-08	
*/


-- 일시정지회원 : 한혜림, 탈퇴회원:SID004,SID005 제외하여 계정상태가 정상인 회원 리스트 출력

SELECT SID_CODE, MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH
		, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME
		, PAUSE_CODE ,PAUSE_START, OUT_CODE, OUT_TYPE_CODE, OUT_DATE
		, WALK_AGREE_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE, OUT_TYPE_CONTENT
FROM MEMBERVIEW
WHERE PAUSE_CODE IS NULL
  AND OUT_TYPE_CODE IS NULL
; 
--==>>
/*
SID_CODE	MEM_CODE	MEM_ID	MEM_PW	MEM_NAME	MEM_BIRTH	MEM_GENDER	MEM_TEL	MEM_ADDR	MEM_REGDATE	MEM_NICKNAME	PAUSE_CODE	PAUSE_START	OUT_CODE	OUT_TYPE_CODE	OUT_DATE	WALK_AGREE_CODE	WALK_AGREE_CHECK	WALK_AGREE_DATE	OUT_TYPE_CONTENT
SID001	MEM001	joohee	"nb�	정주희	1997-12-24	F	010-1111-1111	경기도 광명시 철산동	2021-05-24	주리짱						AGR001	Y	2021-06-24	
SID002	MEM002	hyeyeon	3F&�F	선혜연	1995-11-02	F	010-2222-2222	경기도 고양시 일산서구 주엽로98	2021-06-20	사공혜연						AGR002	Y	2021-06-25	
SID003	MEM003	harim	-0��	이하림	1997-10-22	F	010-3333-3333	서울 금천구 가산동	2021-06-01	뚜또집사						AGR003	Y	2021-06-25	
SID007	MEM007	dongwon	gM� L	강동원	1981-01-18	M	010-7777-7777	경상남도 거창군 거창읍	2021-06-20	맛있는참치						AGR007	Y	2021-06-26	
SID008	MEM008	kangjun	�X親*�	서강준	1993-10-12	M	010-8888-8888	서울 강남구 자곡동	2021-06-22	바싹말린강준						AGR008	Y	2021-06-26	
SID009	MEM009	moonbin	�:6�	문빈	1998-01-26	M	010-9999-9999	인천 연수구 송도동	2021-06-23	니가내별이다						AGR009	Y	2021-06-23	
SID010	MEM010	eunwoo	�Yϓ��	차은우	1997-03-30	M	010-1997-0330	경기도 군포시 수리산로 37	2021-06-26	연기연습하는은우						AGR010	Y	2021-06-26	
SID011	MEM011	jinsootasty	֕},)r�	국진수	2002-06-14	M	010-1231-1231	서울 성북구 길음동	2021-07-06	밥진수						AGR011	Y	2021-07-06	
SID012	MEM012	real_bae	�Y��	윤진배	1974-04-17	M	010,8282,8282	서울 구로구 구로동 23	2021-07-07	진배없다						AGR012	Y	2021-07-07	
SID13	MEM13	purple	-V��	황보혜연	0097-07-16	F	010-1231,5675678	경기 일산시 동구	2021-07-08	보라노랑						AGR13	N	2021-07-08	
SID14	MEM14	milky_bboy	"UK
_D"	백도준	0098-07-09	M	010-6745,3573574	인천 연수구 송도동 12	2021-07-08	백설기123						AGR14	N	2021-07-08	
*/


-- 특정 회원 검색
SELECT SID_CODE, MEM_CODE, MEM_ID, MEM_PW, MEM_NAME, MEM_BIRTH
		, MEM_GENDER, MEM_TEL, MEM_ADDR, MEM_REGDATE, MEM_NICKNAME
		, PAUSE_CODE ,PAUSE_START, OUT_CODE, OUT_TYPE_CODE, OUT_DATE
		, WALK_AGREE_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE, OUT_TYPE_CONTENT
FROM MEMBERVIEW
WHERE SID_CODE = 'SID001'
;

SELECT *
FROM TBL_PET;

-- 강아지 이름 조회
SELECT *
FROM TBL_PET_INFO;

SELECT RELATION_CODE, SID_CODE, PET_CODE
FROM TBL_RELATION
WHERE SID_CODE = 'SID001';

SELECT *
FROM PETVIEW;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--○ 쿼리문 준비
--1. 특정 회원의 양육관계 리스트 검색
SELECT SID_CODE, PET_CODE, PET_NAME, RELATION_CODE, PET_PHOTO
FROM FORPETNAME_VIEW
WHERE SID_CODE = 'SID001';

--2. 특정회원의 특정 반려견 정보 (pet_code 기반)
SELECT PET_CODE, PET_NAME, SID_CODE, RELATION_CODE
FROM FORPETNAME_VIEW
WHERE PET_CODE = 'PET003';


--3. 반려견 정보보기 버튼을 위한 (반려견정보) 쿼리문 
SELECT PET_NAME, PET_SEX, PET_REGNUM, PET_BIRTH, PET_TYPE_NAME, PET_SIZE
    , DISEASE_CONTENT, FAV_FOOD_CONTENT, INJECT_TYPE_NAME
FROM PETVIEW
WHERE PET_CODE = 'PET003';


---------------------------------------------------------------------------------
-- 회원정보 수정 

SELECT *
FROM TBL_MEMBER;
--==>>
/*
MEM001	joohee	"nb�	정주희	97/12/24	F	010-1111-1111	경기도 광명시 철산동	21/05/24	주리짱
MEM002	hyeyeon	3F&�F	선혜연	95/11/02	F	010-2222-2222	경기도 고양시 일산서구 주엽로98	21/06/20	사공혜연
MEM003	harim	-0��	이하림	97/10/22	F	010-3333-3333	서울 금천구 가산동	21/06/01	뚜또집사
MEM012	real_bae	�Y��	윤진배	74/04/17	M	010,8282,8282	서울 구로구 구로동 23	21/07/07	진배없다
MEM13	purple	-V��	황보혜연	97/07/16	F	010-1231,5675678	경기 일산시 동구	21/07/08	보라노랑
MEM006	hyerim	��� W	한혜림	97/10/06	F	010-6666-6666	경기도 수원시 세류동	21/06/19	혜림냥냥
MEM007	dongwon	gM� L	강동원	81/01/18	M	010-7777-7777	경상남도 거창군 거창읍	21/06/20	맛있는참치
MEM008	kangjun	�X親*�	서강준	93/10/12	M	010-8888-8888	서울 강남구 자곡동	21/06/22	바싹말린강준
MEM009	moonbin	�:6�	문빈	98/01/26	M	010-9999-9999	인천 연수구 송도동	21/06/23	니가내별이다
MEM010	eunwoo	�Yϓ��	차은우	97/03/30	M	010-1997-0330	경기도 군포시 수리산로 37	21/06/26	연기연습하는은우
MEM011	jinsootasty	֕},)r�	국진수	02/06/14	M	010-1231-1231	서울 성북구 길음동	21/07/06	밥진수
MEM14	milky_bboy	"UK
_D"	백도준	98/07/09	M	010-6745,3573574	인천 연수구 송도동 12	21/07/08	백설기123
*/


-- 회원정보 수정 쿼리문 
UPDATE TBL_MEMBER
SET MEM_ID = 'joohee'
  , MEM_NAME = '정쭈희'
  , MEM_NICKNAME = '쭈희짱'
  , MEM_GENDER = 'F'
  , MEM_BIRTH = TO_DATE('2020-06-20','YYYY-MM-DD')
  , MEM_TEL = '010-1111-1111'
  , MEM_ADDR = '경기도 광명시 철산동'
WHERE MEM_CODE = 'MEM001'
;

SELECT *
FROM TBL_MEMBER;

DELETE
FROM TBL_MEMBER
WHERE MEM_CODE = 'MEM001'
;

ROLLBACK;

COMMIT;
--==>> 롤백 완료.
--커밋 완료.

DESC TBL_MEMBER;

--------------------------------------------------------------------------------

--○ PRC_MEMBER_INSERT
/*
CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_MEM_ID              IN TBL_MEMBER.MEM_ID%TYPE
, V_MEM_PW              IN TBL_MEMBER.MEM_PW%TYPE
, V_MEM_NAME            IN TBL_MEMBER.MEM_NAME%TYPE
, V_MEM_BIRTH           IN TBL_MEMBER.MEM_BIRTH%TYPE
, V_MEM_GENDER          IN TBL_MEMBER.MEM_GENDER%TYPE
, V_MEM_TEL             IN TBL_MEMBER.MEM_TEL%TYPE
, V_MEM_ADDR            IN TBL_MEMBER.MEM_ADDR%TYPE
, V_MEM_NICKNAME        IN TBL_MEMBER.MEM_NICKNAME%TYPE
, V_WALK_AGREE_CHECK    IN TBL_WALK_AGREE.WALK_AGREE_CHECK%TYPE
)
IS
    V_MEM_CODE            TBL_MEMBER.MEM_CODE%TYPE;
    V_SID_CODE            TBL_SID.SID_CODE%TYPE;
    V_WALK_AGREE_CODE     TBL_WALK_AGREE.WALK_AGREE_CODE%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
    -- MEM_CODE 자동입력
    SELECT CONCAT('MEM', NVL(MAX(TO_NUMBER(SUBSTR(MEM_CODE, 4, 6))), 0) + 1) INTO V_MEM_CODE
    FROM TBL_MEMBER;
    
    -- INSERT MEMBER 쿼리문
    INSERT INTO TBL_MEMBER(MEM_CODE, MEM_ID, MEM_PW, MEM_NAME
    , MEM_BIRTH, MEM_GENDER, MEM_TEL
    , MEM_ADDR, MEM_REGDATE, MEM_NICKNAME)
    VALUES (V_MEM_CODE, V_MEM_ID, CRYPTPACK.ENCRYPT(V_MEM_PW, V_MEM_ID), V_MEM_NAME
    , TO_DATE(V_MEM_BIRTH, 'YYYY-MM-DD'),  V_MEM_GENDER
    , (SUBSTR(V_MEM_TEL, 1, 3) || '-' || SUBSTR(V_MEM_TEL, 5, 8) || SUBSTR(V_MEM_TEL, 10, 13))
    , V_MEM_ADDR
    , TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS')
    , V_MEM_NICKNAME);
    
    
    -- SID_CODE 자동입력
    SELECT CONCAT('SID', NVL(MAX(TO_NUMBER(SUBSTR(SID_CODE, 4, 6))),0) + 1) INTO V_SID_CODE
    FROM TBL_SID;   
    
    -- INSERT SID 쿼리문
    INSERT INTO TBL_SID(SID_CODE, MEM_CODE)
    VALUES(V_SID_CODE, V_MEM_CODE);
    
    
     -- WALK_AGREE_CODE 자동입력
    SELECT CONCAT('AGR', NVL(MAX(TO_NUMBER(SUBSTR(WALK_AGREE_CODE, 4, 6))), 0) + 1) INTO V_WALK_AGREE_CODE
    FROM TBL_WALK_AGREE;   
    
    -- INSERT WALK_AGREE 쿼리문
    INSERT INTO TBL_WALK_AGREE(WALK_AGREE_CODE, SID_CODE, WALK_AGREE_CHECK, WALK_AGREE_DATE)
    VALUES(V_WALK_AGREE_CODE, V_SID_CODE, V_WALK_AGREE_CHECK
    , TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'));
    
END;
*/

