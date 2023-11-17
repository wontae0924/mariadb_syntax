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