CREATE USER HTEST IDENTIFIED BY java006$;
--==>> User HTEST이(가) 생성되었습니다.

GRANT CONNECT, RESOURCE, DBA TO HTEST;
--==>> Grant을(를) 성공했습니다.

---------------------------------새 계정 생성--------------------------------------

CREATE USER HAROOTPUPPY IDENTIFIED BY TIGER;
--==>> User HAROOTPUPPY이(가) 생성되었습니다.

GRANT CONNECT, RESOURCE, DBA TO HAROOTPUPPY;
--==>> Grant을(를) 성공했습니다.
