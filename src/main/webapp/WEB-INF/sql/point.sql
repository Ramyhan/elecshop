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


-- 포인트 코드 기본 정보들
insert into tbl_point_code(point_code, point_info, point_num)
values ('AC', '출석체크', 500);

insert into tbl_point_code(point_code, point_info, point_num)
values ('RV', '리뷰', 1000);

insert into tbl_point_code(point_code, point_info, point_num)
values ('RP', '댓글', 100);

insert into tbl_point_code(point_code, point_info)
values ('PU', '포인트 사용');


insert into tbl_point
		(pno, mid, ppoint, point_code)
		values
		(seq_point_pno.nextval, 'zxcv1234', 100, 'RP');


update tbl_member set
mpoint =  mpoint + 100
where mid = 'zxcv1234';

select mpoint from tbl_member
where mid = 'zxcv1234';


-- 포인트 정보 가져오기
select tbl_point.pid, tbl_point.mid, tbl_point.point_code, tbl_point.ppoint, tbl_point.regdate,
tbl_point_code.point_info
from tbl_point_code, tbl_point
where tbl_point.mid = 'zxcv1234'
and tbl_point_code.point_code = tbl_point.point_code;