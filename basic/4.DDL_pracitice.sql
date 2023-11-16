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
insert into post(id, title, contents,author_id) values(1,'title','hello world',1);
insert into post(id, title, contents,author_id) values(2,'title1','hello world1',2);
--  -> 2개는 저자가 비어있는 데이터 -> author_id에 NOT NULL 조건없다는 사실 확인
insert into post(id, title ,contents) values(3,'title2','hello world3');
insert into post(id, title , contents) values(4,'title3','hello world4');
--  -> 1개는 저자가 author_id에 없는 데이터 추가 -> 에러 발생 확인위해
insert into post(id, title, contents,author_id) values(5,'title5','hello world5',999);

-- 3. 실습
-- author 데이터 중 id가 4인 데이터를 email을 abc@naver.com, name을 abc로 변경
update author set email='abc@naver.com', name='abc' where id=4;
-- post에 글쓴적이 없는 author 데이터 1개 삭제
delete from post where id=3; --id는 post에 글쓴적이 없음
-- post에 글쓴적이 있는 author 데이터 1개 삭제 -> 에러 -> 조치후 삭제
delete from author where id=2; -- 삭제 할려고 하나 id=2는 post에 글쓴적이 있어 삭제못하는 에러 발생
delete from post where author_id=2; -- 하여 그 글쓴 기록을 삭제 조치
delete from author where id=2; -- 다시 삭제하면 이상 없음