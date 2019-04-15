-- TABLE과 별도의 독립된 시퀀스 객체.
SEQUENCE 객체(시퀀스라는 객체생성해서 사용)
1. 생성
CREATE SEQUENCE 시퀀스명; -- 가장 기본적인 시퀀스(Default)

-- 시퀀스 참조하기위해서 반드시 NextValue가 1개이상 호출되어야 한다.
2. 값 호출
    시퀀스명.CURRVAL : 현재 값
    시퀀스명.NEXTVAL : 다음 값
    ** 시퀀스가 생성된 후 맨 처음 NEXTVAL함수가 한번은 호출되어야 한다.
    
CREATE SEQUENCE TEMPSEQ
    MINVALUE 10;    -- LPROD 테이블에서 시퀀스가 9이상이라서.
-- 왼쪽 메뉴에 시쿼스에 들어가면 생성된거 확인 가능
--DROP SEQUENCE TEMPSEQ;

DELETE FROM LPROD WHERE LPROD_ID >= 10;

SELECT * FROM LPROD;

-- 이 순서대로 해야함!
CREATE SEQUENCE TEMPSEQ
    MINVALUE 10;


-- NEXTVAL을 한번 실행해야함!
SELECT TEMPSEQ.NEXTVAL FROM DUAL;
    
    INSERT INTO LPROD VALUES (TEMPSEQ.CURRVAL, 'P501', '농산물'); -- 최초에만 CURRVAL
    INSERT INTO LPROD VALUES (TEMPSEQ.NEXTVAL, 'P502', '수산물');
    INSERT INTO LPROD VALUES (TEMPSEQ.NEXTVAL, 'P503', '임산물');
    -- TEMPSEQ.CURRVAL로 다쓰면 다 10으로 나옴. 최초에 만들면 SELECT TEMPSEQ.NEXTVAL 해줘야함.
    
    SELECT * FROM LPROD;




