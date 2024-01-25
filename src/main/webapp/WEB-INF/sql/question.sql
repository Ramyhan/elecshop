create table t_question(
    qno number constraint pk_qno primary key,
    qtitle nvarchar2(25) not null,
    qcontent nvarchar2(1000) not null,
    qcategory nvarchar2(10) not null,
    qsubcategory nvarchar2(10) not null,
    qimage varchar2(50)
);

create sequence seq_qno;