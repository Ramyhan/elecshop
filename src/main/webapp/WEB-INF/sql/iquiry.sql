create table tbl_iquiry(
    ino number constraint pk_iquiry_ino primary key,
    mid nvarchar2(20) not null,
    constraint fk_mid foreign key(mid) references tbl_member(mid),
    ireceiver nvarchar2(20) not null,
    constraint fk_ireceiver foreign key(ireceiver) references tbl_member(mid),
    memail nvarchar2(30) not null,
    ititle nvarchar2(50) not null,
    imessage nvarchar2(500) not null
);