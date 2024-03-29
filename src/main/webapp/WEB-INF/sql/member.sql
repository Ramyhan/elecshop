create table tbl_member(
    mno number constraint pk_mno primary key,
    mname nvarchar2(10) not null,
    mid NVARCHAR2(30) not null unique,
    mpw NVARCHAR2(30) not null,
    memail NVARCHAR2(30) not null unique,
    maddr NVARCHAR2(50) not null,
    maddr_detail NVARCHAR2(50) not null,
    mpost_code NVARCHAR2(10) not null,
    mphone NVARCHAR2(15) unique,
    mbirthday date not null,
    mregdate date default sysdate,
    mpoint number default 0,
    mstate number default 1 not null check (mstate in(0, 1))
);

create sequence seq_member_mno;

alter table tbl_member
add mstate number default 0 check(mstate in(0,1)) not null;


insert into tbl_member
		(mno, mname, mid, mpw, memail, maddr, maddr_detail, mphone, mbirthday)
		values
		(seq_mno.nextval, '김동위', 'zxcv1234', 'zxcv1234', 'zxcv@naver.com', '울산', 'kh','01012345678', '1997-12-30');

select * from tbl_member;

drop table tbl_member;

drop sequence seq_mno;
commit;