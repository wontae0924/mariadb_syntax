--  insert, select, update, delete
-- INSERT : 테이블에 새로운 레코드를 추가
-- INSERT INTO 테이블이름(필드이름1, 필드이름2 ,....) VALUES (데이터 값1, 데이터값2,)
insert into author(id, name, email) values(1,'kim','abc@naver.com');

-- SELECT : SELECT 필드이름 FROM 테이블 이름 [where 조건];
-- 모든 필드 검색  SELECT * FROM 테이블 이름; *는 리눅스 시간에도 들었지만 전체라는 의미가 있음
select*from author;
select*from author where id=1;
select name,email from author where id=1;
select*from author where id>1;
select password from author where id>1 and name='abc';

--  UPDATE : 테이블 레코드의 내용을 수정
--  UPDATE 테이블 이름 SET 필드 이름1=데이터값1, 필드 이름2 =데이터값2, WHERE 필드 이름 =데이터 값
--  만약 where 절을 생략하면 
update author set email='hello1@test.com'where id = 2;

-- DELETE : 데이터 삭제
-- delete from 테이블이름 where 필드이름=데이터 값
-- where 절을 생략하면, 해당 테이블에 저장된 모든 데이터가 삭제
delete from post where author_id=5;

