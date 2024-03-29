create table tbl_notice(
    nno number constraint pk_nno primary key,
    ncategory nvarchar2(15) not null,
    ntitle nvarchar2(30) not null,
    ncontent nvarchar2(500) not null,
    nregdate date default sysdate,
    nstate varchar2(5) default 'false' CHECK(nstate in ('false','true')),
    nurl varchar2(50),
    nfilename nvarchar2(50),
    ncount number default 0 
);

create sequence seq_nno;

insert into tbl_notice(nno, ncategory, ntitle, ncontent)
values(seq_nno.nextval,'배송','배송관련공지','01-28일부터 배송이 중단됩니다');

select * from ALL_CONSTRAINTS;

alter table tbl_notice rename constraint pk_qno to pk_nno;