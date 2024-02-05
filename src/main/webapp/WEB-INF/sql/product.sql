-- 상품 테이블
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

INSERT INTO TBL_PRODUCT(PNO, PNAME, MNO, PPRICE, PCODE, PTYPE, PDNO, PINFO_MAIN, PINFO1, PINFO2, PINFO3, PIMAGE_THOUMB, PIMAGE_INFO1, PIMAGE_INFO2, ORDER_COUNT)
VALUES (SEQ_PNO.NEXTVAL,
        'Galaxy Book4 Pro',
        1,
        3140000,
        'NT960QGK-KD72G',
        1,
        0,
        '40.6 cm WQXGA + AMOLED 디스플레이',
        '운영체계,Windows 11 Home',
        '프로세서/칩셋, Intel® Core™ Ultra 7 Processor 155H',
        '메모리, 32GB LPDDR5X Memory (On Board 32GB)',
        'galaxybook4pro.png',
        'galaxybook4pro2.jpg',
        'galaxybook4pro3.jpg',
        5);
        
CREATE TABLE TBL_PRODUCT_OPTION(
 	ONO NUMBER CONSTRAINT PK_ONO PRIMARY KEY,
    PNO NUMBER CONSTRAINT FK_PNO REFERENCES TBL_PRODUCT(PNO),
    ONAME NVARCHAR2(10) NOT NULL,
    OPRICE NUMBER(7) NOT NULL,
    OTYPE NUMBER(1) NOT NULL
);

CREATE SEQUENCE SEQ_ONO;

INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_ONO.NEXTVAL, 5, '256G', 50000, 1);
INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_ONO.NEXTVAL, 5, '512G', 50000, 1);
INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_ONO.NEXTVAL, 5, '1T', 120000, 1);

INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_ONO.NEXTVAL, 5, 'DIVKS5LIV', 50000, 2);
INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_OPTION.NEXTVAL, 5, 'GRAY', 150000, 3);



create table tbl_product_type(
    ptype number constraint pk_ptype primary key,
    tname nvarchar2(30) not null
);
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


create table tbl_manufacturer(
    mno number constraint pk_manufacturer_mno primary key,
    mname nvarchar2(30)
);
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


create table tbl_product_detail(
    pdno number constraint pk_pdno primary key,
    pdname nvarchar2(30)
);
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
=======
VALUES (SEQ_ONO.NEXTVAL, 5, '1111111', 100000, 2);
INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_ONO.NEXTVAL, 5, '2222222', 150000, 2);

INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_ONO.NEXTVAL, 5, 'BLACK', 150000, 3);
INSERT INTO TBL_PRODUCT_OPTION(ONO, PNO, ONAME, OPRICE, OTYPE)
VALUES (SEQ_ONO.NEXTVAL, 5, 'GRAY', 150000, 3);
>>>>>>> branch 'master' of https://github.com/Ramyhan/elecshop.git
