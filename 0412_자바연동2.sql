#2019-04-12 
자바연동 과제

SELECT * FROM jdbc_board;

delete from jdbc_board where board_no = 3;

insert into jdbc_board values (board_seq.nextval, '비밀 게시판', '유형욱', sysdate, '테스트 가즈아!!!!!');

select  board_no as "게시물 번호",
        board_title as "게시물 제목",
        board_writer as "작성자",
        board_date as "작성일",
        board_content as "내용"
        from jdbc_board;
        
desc jdbc_board;

create table mymember(
    mem_id varchar2(8) not null,  -- 회원ID
    mem_name varchar2(100) not null, -- 이름
    mem_tel varchar2(50) not null, -- 전화번호
    mem_addr varchar2(128)    -- 주소
);

Drop table jdbc_board;

