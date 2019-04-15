2019-04-15(월) 
1. 비교연산자(>, <, >=, <=, !=(<>))

예) 상품 중 판매가가 170, 000원인 상품 조회
    단, Alias는 상품번호, 상품명, 판매가
    
    SELECT  PROD_ID AS 상품번호,
            PROD_NAME AS 상품명,  
            TO_CHAR(PROD_PRICE, '999,999,990') AS 판매가
        FROM PROD
        WHERE PROD_PRICE=170000;
    
    예) 상품 중 판매가가 170,000원 이상인 상품 조회
    단, Aalis는 상품번호, 상품명, 판매가
    
    select  prod_id as 상품번호,
            prod_name as 상품명,
            to_char(prod_price, '999,999,990') as 판매가
        from prod
        where prod_price >= 170000;
        
2. 논리연산자(NOT, AND, OR)
    - 진리표
    
    X   Y   |   NOT AND OR
 ---------------------------
    0   0   |       0   0
    0   1   |       0   1
    1   0   |       0   1
    1   1   |       1   1
 ---------------------------
 
    예) 상품 중 판매가가 170,000원 이상 300,000원 이하인 상품 조회
    단, Aalis는 상품번호, 상품명, 판매가
    
    select  prod_id as 상품번호,
            prod_name as 상품명,
            to_char(prod_price, '999,999,990') as 판매가
    from prod
    where prod_price >= 170000 AND prod_price <= 300000;
    
    ** NULL비교시 '='을 사용하면 정확한 비교 연산이 이루어지지 않음.
    '='대신 'IS' (IS NOT)연산자 사용
    
예) 사원 테이블에서 MANAGER_ID가 NULL인 사원의
    사원번호, 사원명, 부서번호를 검사하시오
    
    SELECT  EMPLOYEE_ID AS 사원번호,
            EMP_NAME AS 사원명, 
            DEPARTMENT_ID AS 부서번호
        FROM EMPLOYEES
        WHERE MANAGER_ID IS NULL;
    
    SELECT * FROM EMPLOYEES;
    
3. 조건식
    - 하나 이상의 관계식과 논리연산자가 결합된 식
    - 결과는 TRUE/FALSE 중 하나
    (1) 비교 조건식
    - 논리연산자나 ANY, SOME, ALL 키워드로 비교되는 조건식
        (ㄱ) ANY
        - ANY연산자 다음 '()'안에 기술된 값 중 어느 하나와 일치하면
            전체 결과가 참이되는 조건식
    
    
예) 상품테이블에서 상품분류코드가 'P101', 'P201', 'P301'중 하나와 일치하는
    상품의 상품번호 상품명 매입가를 검사하시오.
    
    (OR 연산자 사용)
     SELECT PROD_ID     AS 상품번호,
            PROD_NAME   AS 상품명,
            PROD_LGU    AS 매입가
        FROM PROD
        WHERE   PROD_LGU = 'P101'
            OR  PROD_LGU = 'P201'
            OR  PROD_LGU = 'P301';
 
    (ANY 연산자 사용)
    SELECT  PROD_ID     AS 상품번호,
            PROD_NAME   AS 상품명,
            PROD_LGU    AS 매입가
        FROM PROD
        WHERE PROD_LGU = ANY('P101', 'P201', 'P301');
        
   예) 상품테이블에서 상품분류코드가 'P101', 'P201', 'P301'이외의
    상품의 상품번호 상품명 매입가를 검사하시오.
    
    SELECT PROD_ID     AS 상품번호,
           PROD_NAME   AS 상품명,
           PROD_LGU    AS 매입가
       FROM PROD
       WHERE    NOT(PROD_LGU = 'P101'
            OR  PROD_LGU    = 'P201'
            OR  PROD_LGU    = 'P301');
            
    SELECT  PROD_ID     AS 상품번호,
            PROD_NAME   AS 상품명,
            PROD_LGU    AS 매입가
        FROM PROD
        WHERE NOT(PROD_LGU = ANY('P101', 'P201', 'P301'));
    
    ** IN 연산자
    - ANY와 같은 결과를 나타냄
    (사용형식)
    컬럼명 IN (값리스트)
    
    SELECT  PROD_ID     AS 상품번호,
            PROD_NAME   AS 상품명,
            PROD_LGU    AS 매입가
            FROM PROD
            WHERE PROD_LGU IN('P101', 'P201', 'P301');
            --WHERE PROD_LGU NOT IN('P101', 'P201', 'P301');
            
    예)  1. COMMISSION_PCT가 NULL이 아닌 사원들을 추출(사원번호)하여 EX_01테이블에 저장하라
         2. EX_01 테이블에 존재하는 사원들의 사원번호, 사원명, 부서코드, 급여를 검사하시오. --> 관계를 맺어서 JOIN 해야하는데 IN으로 해결
         
         1) EX_01 TABLE 생성과 자료 입력
         
         CREATE TABLE EX_01(
            EMPLOYEE_ID NUMBER(6));
            
        INSERT INTO EX_01   -- 서브쿼리는 values 안씀
            SELECT EMPLOYEE_ID
            FROM EMPLOYEES
            WHERE commission_pct IS NOT NULL;
            
            
            SELECT EMPLOYEE_ID, commission_pct
            FROM EMPLOYEES
            WHERE commission_pct IS NOT NULL;
            
        SELECT * FROM EX_01;
        
        
        2) IN연산자를 사용하여 결과 도출
        
        SELECT  A.EMPLOYEE_ID AS 사원번호,
                A.EMPLOYEE_NAME AS 사원명,
                A.DEPARTMENT_ID   AS 부서코드,
                A.SALARY  AS 급여
            FROM EMPLOYEES A
        WHERE A.EMPLOYEE_ID IN (SELECT B.EMPLOYEE_ID    -- 서브쿼리
                                FROM EX_01 B)           -- 원래는 ,로 구분해야하는데 서브쿼리로 해결
         
            
        (ㄴ) SOME
        - ANY와 같은 기능
        (사용형식)
        컬럼명 =SOME 값1, 값2,...
    예) 사원테이블에서 소속부서가 50, 70, 80번 중 하나인 사람의
        사원번호, 사원명, 부서코드, 급여를 검사하시오.
        
        SELECT  EMPLOYEE_ID     AS  사원번호,
                EMP_NAME        AS  사원명,
                DEPARTMENT_ID   AS  부서코드,
                SALARY          AS  급여
            FROM EMPLOYEES
            WHERE DEPARTMENT_ID =SOME(50, 70, 80) --ANY랑 SOME이랑 같음
            ORDER BY DEPARTMENT_ID;

        (ㄷ) ALL
            .ALL 다음 기술된 값들을 모두 만족하는 경우 결과가 참이되는 연산자
            (사용형식)
            컬럼명=ALL(값1, 값2,...)
            
            SELECT  EMPLOYEE_ID     AS  사원번호,
                    EMP_NAME        AS  사원명,
                    DEPARTMENT_ID   AS  부서코드,
                    SALARY          AS  급여
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = ALL(50, 70, 80);
        (2) BETWEEN - AND 조건식
            - 범위를 나타내는 조건식에 사용
            - AND연산자로 대치가능
            
        예)  회원테이블에서 출생년도가 75년부터 80년까지 속한 회원의
             회원번호, 이름, 마일리지, 직업을 검사하시오.
             
             SELECT * FROM MEMBER;
             
             SELECT MEM_ID  AS  회원번호,
                    MEM_NAME    AS  이름,
                    MEM_MILEAGE AS  마일리지,
                    MEM_JOB     AS  직업
            FROM    MEMBER
            ORDER BY MEM_MILEAGE DESC;
            
            
            SELECT MEM_ID  AS  회원번호,
                    MEM_NAME    AS  이름,
                    MEM_MILEAGE AS  마일리지,
                    MEM_JOB     AS  직업
            FROM    MEMBER
            ORDER BY 3 DESC;    -- 3번째 나온 컬럼을 기준으로 정렬하라
            
        (AND 연산자 사용)
        SELECT MEM_ID  AS  회원번호,
                MEM_NAME    AS  이름,
                MEM_BIR     AS  생년월일,
                MEM_MILEAGE AS  마일리지,
                MEM_JOB     AS  직업
            FROM    MEMBER
            WHERE MEM_BIR >= TO_DATE('19750101')
            AND MEM_BIR <= TO_DATE('19801231')
            ORDER BY 3;

        (BETWEEN 연산자 사용)            
          SELECT MEM_ID  AS  회원번호,
                MEM_NAME    AS  이름,
                MEM_BIR     AS  생년월일,
                MEM_MILEAGE AS  마일리지,
                MEM_JOB     AS  직업
            FROM    MEMBER
            WHERE MEM_BIR BETWEEN '19750101' AND '19801231'
            ORDER BY 3;
   
   예) 회원테이블에서 마일리지가 4000~6000사이의 회원을 검사하여
        회원번호, 회원명, 마일리지와 비고란에 '우수회원'을 출력하는 QUERY 작성
        
        SELECT * FROM MEMBER;
        
        
        SELECT  MEM_ID  AS  회원번호,
                MEM_NAME    AS  회원명,
                MEM_MILEAGE AS  마일리지,
                '우수회원' AS  "비 고"
            FROM MEMBER
            
            WHERE MEM_MILEAGE BETWEEN 4000 AND 6000;
            
    (3) LIKE 연산자
        - 와일드카드(%, _)를 이용하여 조건식 구성
        - '%'는 모든 문자열에 대응
        예) '김%' -> 첫 글자가 '김'이면 참(TRUE) 반환
        - '%'는 글자수에 관계없음
        - '_'는 사용된 위치에서 한 글자에 대응
        예) '홍_동' -> 첫 글자는 반드시 '홍'이어야 하고 두번째 글짜는 오라클에서 
            인실할 수 있는 글자이어야 하고 세번째 글자는 반드시 '동' 이어야함
            
        예) 회원테이블에서 '박'씨 성을 가진 회원들을 검색하시오.
            단, Alias는 회원번호, 회원명, 주소이다
            
            SELECT  MEM_ID      AS  회원번호,
                    MEM_NAME    AS  회원명,
                    MEM_ADD1 || ' ' || MEM_ADD2 AS 주소
                    FROM MEMBER
--                    WHERE MEM_NAME LIKE '김%';
                    WHERE MEM_NAME LIKE '김_희';
            
             
