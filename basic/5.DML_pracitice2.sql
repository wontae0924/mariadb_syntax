--  4. 실습
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
  content varchar(3000), author_id int FOREIGN key REFERENCES author(id));

--  5. 실습
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

-- 6. 실습
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

-- 7.실습
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