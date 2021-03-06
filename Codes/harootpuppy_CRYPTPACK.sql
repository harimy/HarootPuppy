SELECT USER
FROM DUAL;
--==>> HAROOTPUPPY

--○ 패키지 선언
CREATE OR REPLACE PACKAGE CRYPTPACK
AS
    FUNCTION ENCRYPT(STR VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2;
    FUNCTION DECRYPT(XCRYPT VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2;
    
END CRYPTPACK;
--==>> Package CRYPTPACK이(가) 컴파일되었습니다.

--○ 패키지 몸체 구성
CREATE OR REPLACE PACKAGE BODY CRYPTPACK
AS
    CRYPTED_STRING VARCHAR2(2000);
    

    FUNCTION ENCRYPT(STR VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2
    IS
        PIECES_OF_EIGHT NUMBER := ( ( FLOOR (LENGTH(STR)/8+.9) ) *8 );
    BEGIN
        DBMS_OBFUSCATION_TOOLKIT.DESENCRYPT
        ( INPUT_STRING      => RPAD(STR, PIECES_OF_EIGHT)
        , KEY_STRING        => RPAD(HASH, 8, '#')
        , ENCRYPTED_STRING  => CRYPTED_STRING
        );
        
        RETURN CRYPTED_STRING;
    END;
    
    FUNCTION DECRYPT(XCRYPT VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2
    IS
    BEGIN
        DBMS_OBFUSCATION_TOOLKIT.DESDECRYPT
        ( INPUT_STRING      => XCRYPT
        , KEY_STRING        => RPAD(HASH, 8, '#')
        , DECRYPTED_STRING  => CRYPTED_STRING
        );
        
        RETURN TRIM(CRYPTED_STRING);
    END;

END CRYPTPACK;
--==>> Package Body CRYPTPACK이(가) 컴파일되었습니다.

