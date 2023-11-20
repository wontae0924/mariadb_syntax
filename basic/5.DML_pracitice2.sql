--  4. 3일차 복습 
-- 기존 데이터베이스 삭제
drop database board;
-- 데이터 베이서 재생성
create database board;

use board;
-- 아래 스키마 보고 각 author,post 테이블 재생성. fk에는 별도의 참조키 관련 옵션이 없는 default(restrict) 설정.
create table author(
  id int PRIMARY KEY , name varchar(100) NOT NULL,
  email varchar(255), password varchar(255),
  role varchar(50), address varchar(255)
);

create table post(
  id int PRIMARY KEY, title varchar(255),
  content varchar(3000), author_id int FOREIGN KEY REFERENCES author(id));

--  5. delete 실습
-- 게시핀 회원은 총 5명이 되도록 만들고, 게시판에 실명으로 글이 쓰여진 게시글은 총3건,
--  익명으로 글이 쓰여진 글은 총 2건이 있도록 데이터 insert
insert into author(id, name, email,password,role,address) values(1,'lee1','abc1@naver.com','1234','abc1','1234');
insert into author(id, name, email,password,role,address) values(2,'lee2','abc1@naver.com','1234','abc2','1234');
insert into author(id, name, email,password,role,address) values(3,'lee3','abc1@naver.com','1234','abc3','1234');
insert into author(id, name, email,password,role,address) values(4,'lee4','abc1@naver.com','1234','abc4','1234');
insert into author(id, name, email,password,role,address) values(5,'lee5','abc1@naver.com','1234','abc5','1234');

insert into post(id, title, content,author_id) values(1,'title1','hello world1',1);
insert into post(id, title, content,author_id) values(2,'title2','hello world2',2);
insert into post(id, title, content,author_id) values(3,'title3','hello world3',3);
insert into post(id, title, content) values(4,'title4','hello world4');
insert into post(id, title, content) values(5,'title5','hello world5');
-- 게시판의 회원을 모두 delete 하되 , 기존에 posting 된 글은 삭제되지 않고 남아잇도록 하여라.
update post set author_id = null where author_id is not null;
select*from post;
delete from author; --파워셀에서 실행해야함
describe author;
-- post의 글을 3개만 조회하되, title을 기준으로 오름차순하고 만약 제목이 같은경우 content로 내림차순으로 조회
select * from post order by title asc, content desc limit 3;

-- 6. 숫자 타입 실습
-- author 테이블에 age 데이터 tinyint unsigned로 추가 및 255이하 insert 255초과 insert 테스트
ALTER TABLE author add COLUMN age tinyint unsigned;
insert into author(id, name, age) values(1,'age1','25');
insert into author(id, name, age) values(2,'age2','2555');
select * from author;
-- post에 proce라는 원고료컬럼을 추가 원고료 컬럼은 총자릿수 10자리 및 소수점단위는 3자리까지 가능
-- 컬럼 추가 후 비어있는 컬럼에 숫자 update test.(소수점 3이하 테스트, 3초과 테스트해보기)
ALTER TABLE post add COLUMN price DECIMAL(10,3);
insert into post(id, title, price) values(6,'price1','3.14');
insert into post(id, title, price) values(7,'price2','3.14159');
select * from post;

-- 7. enum타입으로 실습
-- role타입 enum타입으로 변경하고,
-- 'user','admin'으로 enum타입 지정. not null로 설정하되,
-- 입력이 없을시에는 'user'로 세팅되도록 default 설정
ALTER TABLE author MODIFY COLUMN role enum('admin','user') not null default 'user';
-- admin으로 데이터 세팅 후 INSERT
insert into author(id, name, role) values(1,'admin','admin');
-- super-user 데이터로 insert
insert into author(id, name, role) values(2,'superkim','super-user'); -- 안되는걸 보여주기 위해
-- role 데이터 없이 insert
insert into author(id, name) values(3,'lee');
insert into author(id, name ) values(4,'lww');

-- 8.시간 실습
-- post테이블에 datetime으로 create_time 컬럼 추가 및 default로 현재시간 들어가도록 설정
-- 힌트 datetime(6) default current_timestamp(6)
ALTER TABLE post add COLUMN create_time DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6);
-- 컬럼 추가 후 insert 테스트
insert into  post(id, title, price) values(7,'lee',3.11);

-- 9.논리연산자 실습
-- author 테이블의 id가 1,2,4는 아닌 데이터 조회(not in 사용)
select*from author where id not in(1,2,4);
-- post 테이블의 id가 2~4까지 데이터 조회
-- between 활용, and 활용, or 조건 활용
select*from post where id between 2 and 4;
select*from post where id >= 2 && id <= 4;

-- 10. 날짜 실습
-- date_format, like, between ,비교연산자 를 각각 사용하여 2023년에 생성된 데이터 출력
SELECT*FROM post where date_format(create_time,'%Y') = '2023';
SELECT*FROM post where create_time like '2023-01-01%';
SELECT*FROM post where create_time between '2023-01-01' and '2023-12-31';
SELECT*FROM post where create_time >= '2023-01-01' and create_time <= '2023-12-31';
--  now()를 활용해서 오늘날짜에 생성된 데이터 출력
SELECT*FROM post where now(create_time,'%Y') ='2023';

-- 11. not null 실슴
-- post에 있는 title을 not null 설정하여라
alter table post modify column title varchar(100) not null;
-- auto_increment 키워드와 함께 새로운 레코드가 추가될 때 마다 1씩 증가된 값을 저장
새로운 레코드가 추가 될 때 
alter table post modify column id INT auto_increment;
-- post테이블에 id 없이 insert
-- insert한 데이터 삭제
-- 다시 id 없이 insert
insert into post(title) values('kim');
delete from post where id = 9;
insert into post(title) values('kim222');

-- 12. UNIQUE 실습
-- 제약조건 목록조회
describe author;
select*from INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_Name = 'autor';
-- author 테이블 email에 unique 제약 조건 추가
alter table author modify column email varchar(255) unique;
--  컬럼 제약조건으로 추가
select*from INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_Name = 'autor';
--  제약조건 제거 및 index제거
ALTER TABLE author DROP imdex email;
ALTER TABLE author DROP CONSTRAINT email;
--  테이블 제약조건 추가 형식으로 추가
ALTER TABLE author ADD email_unique UNIQUE(email);

-- 외래키 제약조건에서 ON UPDATE CASCADE등의 옵션
-- post 테이블에 ON UPDATE CASCADE 설정
-- 먼저, 기존 foreign key 제약조건을 조회 후 삭제
select*from INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_Name = 'post';
ALTER table post drop foreign key post_ibfk_1;
  alter table post drop index author_id;
-- 새롭게 제약조건 추가
alter table post add CONSTRAINT post_author_fk foreign key(author_id) REFERENCES author(id) on update CASCADE;
alter table post add CONSTRAINT post_author_fk foreign key(author_id) REFERENCES author(id) on update set null on delete set null ;

-- 흐름제어 실습
-- post테이블에서 id,title,contents, 그리고 author_id의 경우 author_type이라는 이름으로 조회 author_id가 
-- 만약 1이면 first_author, 2이면 second_author로 조회가 되도록 하고 3이상 그외의 경위 etc_author로 조회되도록 하여라
-- 1. case when 사용
-- 2. if문 사용하여 동일하게 출력
select id,title,contents,
case author_id
when 1 then 'first_author'
when 2 then 'second_author'
else 'etc_author'
end
as author_type from post;

-- if문 실습
-- if문법 사용해서 만약 author_id 1이면 first_author 그렇지 않은 others 출력하시오
-- id,title,content,author_type 형식으로 출력
select id,title,content,if(author_id =1 ,'first_author','others' ) as author_type from post;
-- 위에서 사용한 ifnull사용하여 동일하게 i 만들기
select id,title,content,ifnull(id !=1 ,'first_author','others' ) as author_type from post;


