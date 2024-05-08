
-- 회원정보
create table if not exists user_info
(
	user_no		int auto_increment primary key comment '유저번호',
	user_name	varchar(4) not null comment '유저이름',
	user_address varchar(10) not null comment '유저주소'
) engine=innodb comment '회원정보';


-- 전화번호부

create table if not exists CALL_LIST
(
	call_list_code int auto_increment comment '전화번호부코드',
	user_no int unique comment '유저번호',
	constraint pk_call_list_code primary key (call_list_code),
	constraint fk_user_no FOREIGN key (user_no) references user_info (user_no)
) engine=innodb comment '전화번호부';




-- 전화번호
CREATE TABLE IF NOT EXISTS call_number
(
    call_code int primary key auto_increment comment '전화번호코드',
    user_no int  comment '유저번호',
    call_name varchar(10) not null comment '전화번호 구분',
    call_number varchar(20) not null comment '전화번호',
    main_call char check(main_call in ('y','n')) comment '상태(대표번호)',
    
    constraint fk_user_no FOREIGN key (user_no) references user_info (user_no)
) engine=innodb comment '전화번호';


-- 전화번호 링크
create table if not exists call_link
(
	call_list_code int comment '전화번호부코드',
	call_code int comment '전화번호코드',
	
	constraint fk_call_list_code FOREIGN key (call_list_code) references user_info (user_no),
	constraint fk_call_code FOREIGN key (call_code) references user_info (user_no)
)engine=innodb comment '전화번호 링크';


-- 데이터삽입

INSERT INTO user_info VALUES (null, '김다영', '면목동');
INSERT INTO user_info VALUES (null, '김민주', '암사동');
INSERT INTO user_info VALUES (null, '김재석', '고잔동');
INSERT INTO user_info VALUES (null, '박하영', '군자동');
INSERT INTO user_info VALUES (null, '서은진', '가산동');

