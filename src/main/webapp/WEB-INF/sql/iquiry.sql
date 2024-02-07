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
