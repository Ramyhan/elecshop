create table tbl_order(
    ono number constraint pk_order_ono primary key,
    mid nvarchar2(30) constraint fk_order_mid references tbl_member(mid),
    oname nvarchar2(10) not null,
    ophone nvarchar2(20) not null, -- 수령인 번호
    oprice number default 0 not null, -- 총 가격
    oaddr NVARCHAR2(50) not null, -- 주소
    oaddr_detail NVARCHAR2(50) not null, -- 상세주소
    opost_code NVARCHAR2(10) not null, -- 우편번호
    odelivery number not null, -- 0무료 1일반 2특수
    delivery_status number default 0 not null,
    regdate date default sysdate -- 주문일
);

create table tbl_order_detail(
    odno number constraint pk_order_detail_odno primary key,
    ono number constraint fk_order_detail_ono references tbl_order(ono),
    pno number constraint fk_order_detail_pno references tbl_product(pno),
    odpirce number not null,
    odoption nvarchar2(100),
    odproduct_count number not null
);


create sequence seq_order_ono;
create sequence seq_order_detail_odno;

alter table tbl_order
add delivery_status number default 0 not null;
alter table tbl_order_detail
add odprice number default 0 not null;


create sequence seq_order_ono;
create sequence seq_order_detail_odno;
commit;