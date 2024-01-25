create table t_notice(
    nno number constraint pk_nno primary key,
    ncategory nvarchar2(15) not null,
    ntitle nvarchar2(30) not null,
    ncontent nvarchar2(500) not null,
    nregdate date default sysdate,
    count number default 0 
);

select * from ALL_CONSTRAINTS;

alter table t_notice rename constraint pk_qno to pk_nno;