create table tbl_coupon(
    cno number constraint pk_coupon_cno primary key,
    mid nvarchar2(30) constraint fk_coupon_mid references tbl_member(mid),
    coupon_name nvarchar2(50) not null,
    use number default 0 check (use in(0, 1)), -- 사용여부 0 미사용, 1 사용 
    sale number check (sale between 1 and 100),
    regdate date default sysdate,
    expiry_date date not null -- 사용기한
);


create sequence seq_coupon_cno;

insert into tbl_coupon
(cno, mid, coupon_name, use, sale, expiry_date)
values
(seq_coupon.nextval, 'asdf1234', '신규가입 10% 할인 쿠폰', 0, 10, '2024-02-02');

select * from tbl_coupon
where mid = 'asdf1234';
commit;