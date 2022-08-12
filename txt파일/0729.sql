drop table board;
commit;
select * from board;
drop sequence board_seq;

create table board(
    bno number(7) constraint board_pk_bno primary key,
    title varchar2(100 char),
    content clob,
    password varchar2(10 char),
    nickname varchar2(10 char),
    writeTime date default sysdate,
    readCnt number(3) default 0
);

create sequence board_seq;

select * from board;

insert into board(bno, title, content, nickname, password) values(board_seq.nextval,'aaa','bbb','spring','1234');

select bno, title, content from board;

delete from board where bno=4;

update board set title='bbb',content='aaa' where bno=4;

select * from board;

create sequence board_seq;

drop sequence board_seq;

drop table aaa;

drop SEQUENCE aaa_seq;

create table aaa(
    bno number(7) constraint aaa_pk_bno primary key,
    title varchar2(100 char),
    content clob,
    password varchar2(10 char),
    nickname varchar2(10 char),
    writeTime date default sysdate,
    readCnt number(3) default 0
);
select * from aaa;

create sequence aaa_seq;