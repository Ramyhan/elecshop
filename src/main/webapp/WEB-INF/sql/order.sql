create table tbl_order(
    ono number constraint pk_order_ono primary key,
    mid nvarchar2(30) constraint fk_order_mid references tbl_member(mid),
    oname nvarchar2(10) not null,
    ophone nvarchar2(20) not null,
    oprice number not null,
    oaddr NVARCHAR2(50) not null,
    oaddr_detail NVARCHAR2(50) not null,
    opost_code NVARCHAR2(10) not null,
    odelivery number not null, -- 0무료 1일반 2특수
    regdate date default sysdate
);

create table tbl_order_detail(
    odno number constraint pk_order_detail_odno primary key,
    ono number constraint fk_order_detail_ono references tbl_order(ono),
    pno number constraint fk_order_detail_pno references tbl_product(pno),
    product_count number not null
);
create sequence seq_order_ono;
create sequence seq_order_detail_odno;
commit;