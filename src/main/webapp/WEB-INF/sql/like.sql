create table tbl_like(
	lno number constraint pk_lno primary key
    mid nvarchar2(50) constraint fk_like_mid references tbl_member(mid),
    
);