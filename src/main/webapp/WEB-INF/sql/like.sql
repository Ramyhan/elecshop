create table tbl_like(
	lno number constraint pk_lno primary key,
    mid nvarchar2(50) constraint fk_like_mid references tbl_member(mid),
    pno number constraint fk_like_pno references tbl_product(pno),
    lregdate date default sysdate
);

create sequence seq_lno;