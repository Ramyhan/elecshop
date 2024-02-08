--모든 테이블 지우기
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' 
FROM user_tables;


--모든 시퀀스 지우기
SELECT 'DROP SEQUENCE ' || SEQUENCE_NAME || ';'
FROM   ALL_SEQUENCES
WHERE  SEQUENCE_OWNER='TEST_SHOP';

--시작
create table tbl_member(
    mno number constraint pk_mno primary key,
    mname nvarchar2(10) not null,
    mid NVARCHAR2(30) not null unique,
    mpw NVARCHAR2(30) not null,
    memail NVARCHAR2(30) not null unique,
    maddr NVARCHAR2(50) not null,
    maddr_detail NVARCHAR2(50) not null,
    mpost_code NVARCHAR2(10) not null,
    mphone NVARCHAR2(15) unique,
    mbirthday date not null,
    mregdate date default sysdate,
    mpoint number default 0,
    mstate number default 1 not null check (mstate in(0, 1))
);

create sequence seq_member_mno;

-- 포인트 코드 테이블
create table tbl_point_code(
    point_code char(2) constraint pk_point_code primary key, -- 포인트 코드
    point_info nvarchar2(50) not null, -- 포인트 정보
    point_num number -- 포인트
);

-- 포인트 테이블
create table tbl_point(
    pno number constraint pk_point_pno primary key,
    mid nvarchar2(30) constraint fk_point_mid references tbl_member(mid),
    ppoint number not null,
    point_code char(2) constraint fk_point_code references tbl_point_code(point_code),
    regdate date default sysdate
);

create sequence seq_point_pno;

create table tbl_daily_check(
    dno number constraint pk_did primary key,
    mid nvarchar2(30) constraint fk_daily_mid references tbl_member(mid),
    regdate date default sysdate
);

create sequence seq_daily_dno;

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

--상품
create table tbl_product_detail(
    pdno number constraint pk_pdno primary key,
    pdname nvarchar2(30)
);
create table tbl_manufacturer(
    mno number constraint pk_manufacturer_mno primary key,
    mname nvarchar2(30)
);
create table tbl_product_type(
    ptype number constraint pk_ptype primary key,
    tname nvarchar2(30) not null
);


CREATE TABLE TBL_PRODUCT(
    PNO NUMBER CONSTRAINT PK_PNO PRIMARY KEY,
    PNAME NVARCHAR2(50) NOT NULL,
    MNO NUMBER CONSTRAINT FK_MNO REFERENCES tbl_manufacturer(MNO),
    PPRICE NUMBER NOT NULL,
    PCODE NVARCHAR2(50), -- 일련번호
    PTYPE NUMBER(1) CONSTRAINT FK_PTYPE REFERENCES TBL_PRODUCT_TYPE(PTYPE) NOT NULL, -- 노트북:1, 모니터:2, 태블릿:3, 음향기기:4, 주변기기:5
    PDNO NUMBER CONSTRAINT FK_PDNO REFERENCES TBL_PRODUCT_DETAIL(PDNO),
    PINFO_MAIN NVARCHAR2(30),
    PINFO1 NVARCHAR2(300),
    PINFO2 NVARCHAR2(300),
    PINFO3 NVARCHAR2(300),
    PIMAGE_THOUMB NVARCHAR2(50) NOT NULL,
    PIMAGE_INFO1 NVARCHAR2(50) NOT NULL,
    PIMAGE_INFO2 NVARCHAR2(50) NOT NULL,
    ORDER_COUNT NUMBER DEFAULT 0,
    PREGDATE DATE DEFAULT SYSDATE,
    ISDELETE NUMBER(1) DEFAULT 0 CHECK(ISDELETE IN (0, 1)) 
);

CREATE TABLE TBL_PRODUCT_OPTION(
 	ONO NUMBER CONSTRAINT PK_ONO PRIMARY KEY,
    PNO NUMBER CONSTRAINT FK_PNO REFERENCES TBL_PRODUCT(PNO),
    ONAME NVARCHAR2(10) NOT NULL,
    OPRICE NUMBER(7) NOT NULL,
    OTYPE NUMBER(1) NOT NULL
);

CREATE SEQUENCE SEQ_ONO;
CREATE SEQUENCE SEQ_PNO;

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


CREATE TABLE TBL_CART(
    CNO NUMBER CONSTRAINT PK_CNO PRIMARY KEY,
    PNO NUMBER CONSTRAINT FK_CART_PNO REFERENCES TBL_PRODUCT(PNO) NOT NULL,
    MID NVARCHAR2(30) CONSTRAINT FK_CART_MID REFERENCES TBL_MEMBER(MID) NOT NULL,
    CPRICE NUMBER(10) NOT NULL,
    COPTION NVARCHAR2(100),
    CREGDATE DATE DEFAULT SYSDATE
);

create sequence seq_cno;

create table tbl_like(
	lno number constraint pk_lno primary key,
    mid nvarchar2(50) constraint fk_like_mid references tbl_member(mid),
    pno number constraint fk_like_pno references tbl_product(pno),
    lregdate date default sysdate
);

create sequence seq_lno;

CREATE TABLE TBL_REVIEW(
    RNO NUMBER PRIMARY KEY,
    PNO NUMBER CONSTRAINT FK_REVIEW_PNO REFERENCES TBL_PRODUCT(PNO),
    MID NVARCHAR2(20) NOT NULL CONSTRAINT FK_REVIEW_MID REFERENCES TBL_MEMBER(MID),
    RCONTENT NVARCHAR2(100) NOT NULL,
    RGRADE NUMBER(1) DEFAULT 5,
    RREGDATE DATE DEFAULT SYSDATE);
    
CREATE SEQUENCE SEQ_REVIEW;

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

create table tbl_visit(
    vdate date constraint pk_vdate primary key,
    vcount number default 0
);

create table tbl_iquiry(
    ino number constraint pk_iquiry_ino primary key,
    mid nvarchar2(20) not null,
    constraint fk_mid foreign key(mid) references tbl_member(mid),
    ititle nvarchar2(50) not null,
    imessage nvarchar2(500) not null,
    ireply nvarchar2(500),
    iregdate date default sysdate
);

create sequence seq_ino;

create table tbl_question(
    qno number constraint pk_qno primary key,
    qtitle nvarchar2(25) not null,
    qcontent nvarchar2(1000) not null,
    qcategory nvarchar2(10) not null,
    qsubcategory nvarchar2(10) not null,
    qurl varchar2(150),
    qstate varchar2(5) default 'false' check(qstate in ('false','true'))
);

create sequence seq_qno;

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



commit;

--인서트
insert into tbl_point_code(point_code, point_info, point_num)
values ('AC', '출석체크', 500);

insert into tbl_point_code(point_code, point_info, point_num)
values ('RV', '리뷰', 1000);

insert into tbl_point_code(point_code, point_info, point_num)
values ('RP', '댓글', 100);

insert into tbl_point_code(point_code, point_info)
values ('PU', '포인트 사용');

insert into tbl_product_detail (pdno, pdname)
values (1, '스피커');
insert into tbl_product_detail (pdno, pdname)
values (2, '헤드셋');
insert into tbl_product_detail (pdno, pdname)
values (3, '이어폰');
insert into tbl_product_detail (pdno, pdname)
values (4, '마우스');
insert into tbl_product_detail (pdno, pdname)
values (5, '키보드');

insert into tbl_manufacturer (mno, mname)
values (1, '삼성(samsung');
insert into tbl_manufacturer (mno, mname)
values (2, '엘지(LG)');
insert into tbl_manufacturer (mno, mname)
values (3, '애플(apple)');
insert into tbl_manufacturer (mno, mname)
values (4, '델(dell)');
insert into tbl_manufacturer (mno, mname)
values (5, '아수스(asus)');
insert into tbl_manufacturer (mno, mname)
values (6, '레이져(razer)');
insert into tbl_manufacturer (mno, mname)
values (7, 'msi');
insert into tbl_manufacturer (mno, mname)
values (8, '레노버(lenovo)');
insert into tbl_manufacturer (mno, mname)
values (9, 'hp');
insert into tbl_manufacturer (mno, mname)
values (10, '소니(sony)');
insert into tbl_manufacturer (mno, mname)
values (11, '젠하이져');
insert into tbl_manufacturer (mno, mname)
values (12, 'akg');
insert into tbl_manufacturer (mno, mname)
values (13, '브리츠(britz)');
insert into tbl_manufacturer (mno, mname)
values (14, '크리에이티브');
insert into tbl_manufacturer (mno, mname)
values (15, '로지텍(logitech)');
insert into tbl_manufacturer (mno, mname)
values (16, '앱코(ABKO)');

insert into tbl_product_type (ptype, tname)
values (1, '노트북');
insert into tbl_product_type (ptype, tname)
values (2, '모니터');
insert into tbl_product_type (ptype, tname)
values (3, '태블릿');
insert into tbl_product_type (ptype, tname)
values (4, '음향기기');
insert into tbl_product_type (ptype, tname)
values (5, '주변기기');

commit;
