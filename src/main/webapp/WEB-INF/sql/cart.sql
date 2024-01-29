CREATE TABLE TBL_CART(
    CNO NUMBER CONSTRAINT PK_CNO PRIMARY KEY,
    PNO NUMBER CONSTRAINT FK_CART_PNO REFERENCES TBL_PRODUCT(PNO) NOT NULL,
    MID NVARCHAR2(30) CONSTRAINT FK_CART_MID REFERENCES TBL_MEMBER(MID) NOT NULL,
    CPRICE NUMBER(10) NOT NULL,
    COPTION NVARCHAR2(100),
    CREGDATE DATE DEFAULT SYSDATE
);

create sequence seq_cno;

select cno, mid, cprice, coption, pname, pimage_thoumb
from tbl_product, tbl_cart
where mid = '1111'
and tbl_product.pno = tbl_cart.pno;