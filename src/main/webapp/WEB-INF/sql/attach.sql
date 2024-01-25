create table t_iquiry(
    ino number constraint pk_ino primary key,
    mid nvarchar2(30) constraint fk_iquiry_mid REFERENCES tbl_member(mid),
    mpw nvarchar2(20) not null,
    memail nvarchar2(30) not null,
    imessage nvarchar2(500) not null,
    ifile varchar2(100)
);