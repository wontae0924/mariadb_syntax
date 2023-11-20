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
-- 이름 중복제거하고 조회
select distinct name from author;
-- order by : select문으로 선택한 결과를 oreder by 절을 사용하여 정렬
-- 기본 설정은 오른차순(asc)이며 , 내림차순시 desc 입력. (asc/desc 생략시 asc적용)
-- 여러 필드의 데이터를 쉼표(,)를 사용하여 여러기준으로 정렬할 수도
select*from author order by name;
--  limit number : 특정숫자로 검색량 조절
select*from author order by id desc limit 2;
-- 별칭(alias)을 이용한 처리
-- 테이블과 필드에 임시로 별칭(alias)을 부여하고, 해당 별칭을 select문에서 사용
-- select 필드이름 as 별칭 from 테이블이름; as는 생략가능하지만 많아지면 복잡하니 as 넣기
-- select 필드이름 from 테이블이름;
select name as 이름 from author;
select name as 이름,email as 이메일 from author as 고객정보;

ㅡ--  UPDATE 테이블 이름 SET 필드 이름1=데이터값1, 필드 이름2 =데이터값2, WHERE 필드 이름 =데이터 값
--  만약 where 절을 생략하면 다 변형
update author set email='hello1@test.com'where id = 2;

-- DELETE : 데이터 삭제
-- delete from 테이블이름 where 필드이름=데이터 값
-- where 절을 생략하면, 해당 테이블에 저장된 모든 데이터가 삭제
delete from post where author_id=5;

-- blob
create table table_blob(id int, myimg longblob);
insert into table_blob(id,myimg) values(1,load_file('C:\\test_picture.jpg'));
select*from table_blob;
select hex(myimg) from table_blob where id = 1;

-- enum 컬러명 ENUM(’데이터값1’,’데이터값2’…) 
-- role enum('admin','user') not null default 'user'; -> admin ,user로 데이터 
ALTER TABLE author MODIFY COLUMN role enum('admin','user') not null default 'user';

-- like 특정 패턴을 포함하는 데이터만을 검색하기 위한 와일드카드 문자 , 일반적으로 %와 함께 사용됨
select*from author where name like '홍%'; -- 홍으로 시작하는 글자 찾기
select*from author where name like '%동'; -- 동으로 끝나는 글자 찾기
select*from author where name like '%길%'; -- 길 사이의 글자 찾기
select*from author where name not like '홍%'; -- 홍으로 시작하는 글자 제외 찾기
select*from author where name not like '%동'; -- 동으로 끝나는 글자 제외 찾기
select*from author where name not like '%길%'; -- 길 사이의 글자 제외 찾기

select*from author where name like 'l%';
select*from author where name like '%m';
select*from author where name like '%w%';
select*from author where name not like 'l%';
select*from author where name not like '%m';
select*from author where name not like '%w%';

-- REGEXP 정규 표현식을 토대로 패턴 연산 수행
select*from author where name regexp '[a-z]'; -- a 부터 z까지 들어 있는 알파벳 조회를 원함
select*from author where name regexp '[가-힣]'; -- 가 부터 힣까지 들어 있는 한글 조회를 원함
select*from author where name regexp '[0-9]'; -- 숫자 조회를 원함

-- DEFAULT
CREATE TABLE Test(
ID INT, Name varchar(30) default 'anonymous'
);

-- IF()
-- IF(a,b,c)
-- a는 조건,b는 참일경우 반환값, c는 거짓일경우 반환값
-- 만약 a조건이 참이면 b를 반환하고, 거짓이면 c를 반환합니다.
select  if(1<10,'참','거짓');
-- IFNULL()
-- IFNULL(a,b)
select id,title,content,ifnull(author_id,'anonymus') from post;
