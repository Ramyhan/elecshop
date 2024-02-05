--모든 테이블 지우기
SELECT 'DROP TABLE "
' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

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
    PINFO1 NVARCHAR2(50),
    PINFO2 NVARCHAR2(50),
    PINFO3 NVARCHAR2(50),
    PIMAGE_THOUMB NVARCHAR2(50),
    PIMAGE_INFO1 NVARCHAR2(50),
    PIMAGE_INFO2 NVARCHAR2(50),
    ORDER_COUNT NUMBER DEFAULT 0,
    PREGDATE DATE DEFAULT SYSDATE
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
