create table tbl_attr(
    ano number constraint pk_attr_ano primary key,
    mno number,
    constraint fk_attr_mno foreign key(mno) references tbl_member(mno),
    pno number,
    constraint fk_attr_pno foreign key(pno) references tbl_product(pno),
    apath nvarchar2(30) not null,
    auuid nvarchar2(100) not null,
    afilename nvarchar2(50) not null
);

alter table tbl_attr
add athoumbnail char(1) default 'n' check(athoumbnail in('y','n'));

create table tbl_visit(
    vdate date constraint pk_vdate primary key,
    vcount number default 0
);