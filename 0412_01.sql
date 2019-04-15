CREATE TABLE HOTEL(
    roomNum NUMBER(3) NOT NULL,
    guest varchar2(10 char) NOT NULL,
    CONSTRAINT room_pk primary key(roomNum));
    
DESC HOTEL;

SELECT * FROM HOTEL;

INSERT INTO HOTEL VALUES(101, '유형욱');

select * from hotel;

drop table hotel;

insert into hotel (roomNum, guest) values(103,'유형욱');

delete from hotel where roomNum = 103;
