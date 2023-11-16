--  2. 실습
-- author 데이터 5개 추가
--  -> address에는 데이터 추가 X
insert into author(id, name, email,password,role) values(2,'lee1','abc1@naver.com','1234','abc1');
insert into author(id, name, email,password,role) values(3,'lee2','abc2@naver.com','1234','abc2');
insert into author(id, name, email,password,role) values(4,'lee3','abc3@naver.com','1234','abc3');
insert into author(id, name, email,password,role) values(5,'lee4','abc4@naver.com','1234','abc4');
insert into author(id, name, email,password,role) values(6,'lee5','abc5@naver.com','1234','abc5');

-- post 데이터 5개 추가
--  -> 2개는 저자가 있는 데이터
--  -> 2개는 저자가 비어있는 데이터 -> author_id에 NOT NULL 조건없다는 사실 확인
--  -> 1개는 저자가 author_id에 없는 데이터 추가 -> 에러 발생 확인위해
insert into post(id, title, contents,author_id) values(1,'title','hello world',1);
insert into post(id, title, contents,author_id) values(2,'title1','hello world1',2);

insert into post(id, contents,author_id) values(3,'hello world3',3);
insert into post(id, contents,author_id) values(4,'hello world4',4);

insert into post(id, title, contents,author_id) values(5,'title5','hello world5',999);