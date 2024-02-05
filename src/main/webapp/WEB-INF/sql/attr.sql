create table tbl_attr(
    ano number constraint pk_attr_ano primary key,
    mno number,
    constraint fk_attr_mno foreign key(mno) references tbl_member(mno),
    pno number,
    constraint fk_attr_pno foreign key(pno) references tbl_product(pno),
    athoumbnail char(1) default 'n' check(athoumbnail in ('y','n')),
    apath nvarchar2(30) not null,
    auuid nvarchar2(100) not null,
    afilename nvarchar2(50) not null
);

create sequence seq_attr_ano;


alter table tbl_attr
add athoumbnail char(1) default 'n' check(athoumbnail in('y','n'));
