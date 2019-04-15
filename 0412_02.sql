2019-04-12)

1. UPDATE문
    - 테이블에 있는 기존의 데이터를 변경 할 때 사용
    (사용형식)
    
    UPDATE 테이블명
        SET 커럼명 = 값,
            컬럼명 = 값,
                .
                .
        WHERE 조건;
        
--        SELECT * FROM MEMBER;

        SELECT MEM_NAME, MEM_MILEAGE, MEM_HP
            FROM MEMBER
        WHERE MEM_ID='c001';
        
        예) MEMBER테이블의 회원번호가 'c001'인 회원의 마일리지를 4000으로 변경하고
            핸드폰 번호를'010-1230-4567'로 변경하시오. (전제조건 : 'c001'회원이 존재한다.)
            
            UPDATE MEMBER 
                SET MEM_MILEAGE = 4000, MEM_HP = '010-1230-4567'
                WHERE MEM_ID = 'c001';
            
            SELECT MEM_ID, MEM_NAME, MEM_MILEAGE, MEM_HP FROM MEMBER WHERE MEM_ID = 'c001';
            
2. DELETE 문
    - 테이블에 문재하는 자료(들)을 삭제할 때 사용
    (사용형식)
    DELETE 테이블명
        (WHERE 조건);

    예) MEMBER 테이블의 모든 자료를 삭제하시오. -- 참조중이라서 못지움
    
    SELECT * FROM MEMBER;

--    SELECT COUNT(*) FROM MEMBER;
    
--    SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER';
--    DELETE MEMBER;
--    DESC MEMBER;

    예) CART 테이블의 모든 자료를 삭제하시오
    
    SELECT * FROM CART;
    
    ** 모든 자료 삭제 -WHERE절 생략
    
    DELETE CART; -- 삭제됨.
    
    ROLLBACK; -- 롤백됨.
    
    ** 조건에 합당한 자료만(일부) 삭제 - WHERE절 사용
        - 회원번호가 'q001'인 회원의 판매 정보만 CART 테이블에서 삭제
        
        
    SELECT COUNT(*)
        FROM  CART
    WHERE CART_MEMBER='q001';
    
    SELECT * FROM CART WHERE CART_MEMBER='q001';
    
    DELETE CART
        WHERE CART_MEMBER='q001';
        
    ROLLBACK;
        
        
3. 테이블 복사
    - 테이블 컬럼과 내용(데이터=>행,열)를 하나의 QUEST문으로 복사
    - 기본키와 외래키에 관한 사항은 복사되지 않음. (CONSTRAINT 된 내용들은 복사안됨.)
    ( 사용형식 )
    CREATE TABLE 테이블명 AS (SELECT 문);    ==> 서브쿼리

    SELECT * FROM MEMBER;    
예) MEMBER 테이블을 TEMP_MEM테이블로 복사하시오.

    -- MEMBER테이블로부터 모든 값을 내보내라.
    CREATE TABLE TEMP_MEM1 AS (SELECT * FROM MEMBER);
    
    SELECT * FROM TEMP_MEM1;
    
    SELECT * FROM LPROD;
    
    CREATE TABLE TEMP_LPROD1(SEQ, GUBUN_CODE, GUBUN_NAME)   -- COLUMN명을 바꿔서 저장가능
        AS (SELECT * FROM LPROD);
    
    SELECT * FROM TEMP_LPROD1;


    
    
    
    
    
