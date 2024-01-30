create table tbl_daily_check(
    dno number constraint pk_did primary key,
    mid nvarchar2(30) constraint fk_daily_mid references tbl_member(mid),
    regdate date default sysdate
);

create sequence seq_dno;

commit;

-- 출석 여부
select * from(select * from tbl_daily_check order by rownum desc)
where mid = 'zxcv1234'
and rownum = 1;