create table jdbc_board(
    board_no number not null,  -- 번호(자동증가)
    board_title varchar2(100) not null, -- 제목
    board_writer varchar2(50) not null, -- 작성자
    board_date date not null,   -- 작성날짜
    board_content clob,     -- 내용
    constraint pk_jdbc_board primary key (board_no)
);

create sequence board_seq
    start with 1   -- 시작번호
    increment by 1; -- 증가값
    
select * from jdbc_board;

select board_seq.nextval from dual;

insert into jdbc_board values (board_seq.currval, 'test!', 'Hyungwook', sysdate, 'Testing!!');

insert into jdbc_board values (board_seq.nextval, 'why?', 'Hyungwook', sysdate, 'why?');

update jdbc_board set (board_title, board_content) = ( select '??', '??' from jdbc_board where board_no = 3);

