create table jdbc_board(
    board_no number not null,  -- 번호(자동증가)
    board_title varchar2(100) not null, -- 제목
    board_writer varchar2(50) not null, -- 작성자
    board_date date not null,   -- 작성날짜
    board_content clob,     -- 내용
    constraint pk_jdbc_board primary key (board_no)
);

select * from jdbc_board;

create sequence board_seq
    start with 1
    increment by 1;
    
select board_seq.nextval from dual;

select * from jdbc_board;

drop sequence board_seq;

drop table jdbc_board;


desc jdbc_board;

insert into jdbc_board values(board_seq.currval, 'Title test', 'Hyungwook', sysdate, 'I doing test');

insert into jdbc_board values(board_seq.nextval, 'Title test', 'Hyungwook', sysdate, 'I doing test');

select * from jdbc_board;

delete from jdbc_board where board_no = 21;


update jdbc_board
    set (board_title, board_content) = ('testing', 'Content Update Testing!!')
where board_no = 4;

update jdbc_board set board_title = 'Modify'
    where board_no = 3;
    
    select * from jdbc_board;

update jdbc_board set (board_title, board_content) = ('Title Update!!', 'Content Updat!!')
    where board_no = 3;
    
    -- update test!!

update jdbc_board set board_title = 'hello', board_content = 'hello!!'
    where board_no = 2;
    
    
    select * from jdbc_board;


CREATE SEQUENCE TEMPSEQ
    MINVALUE 10;


-- NEXTVAL을 한번 실행해야함!
SELECT TEMPSEQ.NEXTVAL FROM DUAL;
    
    INSERT INTO LPROD VALUES (TEMPSEQ.CURRVAL, 'P501', '농산물'); -- 최초에만 CURRVAL
    INSERT INTO LPROD VALUES (TEMPSEQ.NEXTVAL, 'P502', '수산물');
    INSERT INTO LPROD VALUES (TEMPSEQ.NEXTVAL, 'P503', '임산물');
    -- TEMPSEQ.CURRVAL로 다쓰면 다 10으로 나옴. 최초에 만들면 SELECT TEMPSEQ.NEXTVAL 해줘야함.
    
    SELECT * FROM LPROD;
    
    
