-- 데이터베이스 생성
CREATE DATABASE board;

-- 데이터베이스 선택
USE board;

-- CREATE TABLE : 테이블 생성
CREATE TABLE 테이블(
  필드이름1 필드타입1 [제약조건],
  필드이름2 필드타입2 [제약조건],
  ...
  [테이블 제약조건]
)

-- author 테이블 신규 생성
CREATE TABLE author(id INT, name VARCHAR(255), 
email VARCHAR(255), password VARCHAR(255)
test1 VARCHAR(255), PRIMARY KEY(id));

--테이블 목록조회
SHOW TABLES;

--테이블 컬럼조회
DESCRIBE author;

-- post 테이블 신규 생성 (나중 실습을 위해 posts 오타 ,content)
CREATE TABLE posts(id INT PRIMARY KEY, title VARCHAR(255), 
content VARCHAR(255), author_id INT, FOREIGN KEY(author_id) REFERENCES author(id));

-- 테이블 컬럼 상세 조회
SHOW FULL COLUMNS FROM author;

-- 테이블 생성문 조회
SHOW CREATE TABLE posts;
-- 해당 생성문 조회 할 경우 결과값
-- CREATE TABLE `posts` (
--    `id` int(11) NOT NULL,
--    `title` varchar(255) DEFAULT NULL,
--    `content` varchar(255) D  EFAULT NULL,
--    `author_id` int(11) DEFAULT NULL,
--    PRIMARY KEY (`id`),
--    KEY `author_id` (`author_id`),
--    CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

-- 테이블 제약조건 조회
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_Name = 'posts';

-- 테이블 index 조회
-- 제약조건 정보조회와 인덱스조회는 상당수 일치
SHOW INDEX FROM posts;

-- RENAME : 테이블 이름 변경 
ALTER TABLE 테이블명 RENAME 새로운테이블명;
ALTER TABLE posts RENAME post;
-- ADD : 컬럼 추가
ALTER TABLE 테이블명 ADD COLUMN 컬럼명 자료형;
ALTER TABLE author ADD COLUMN role varchar(50);
-- MODIFY : 필드 타입 변경
ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 타입[제약조건];
ALTER TABLE author MODIFY COLUMN name varchar(100) NOT NULL;
-- CHANGE : 컬럼 이름 변경 post에 content를 contents로 변경
ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 새로운컬럼명타입[제약조건];
ALTER TABLE post CHANGE COLUMN content contents varchar(50);
-- DROP : 컬럼 삭제 author에 test1 삭제
ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
ALTER TABLE author DROP COLUMN test1;

-- 데이터베이스 삭제
DROP DATABASE 베이스명;
-- 테이블 삭제 -> 아예 테이블 삭제
DROP TABLE 테이블명;
-- 테이블에서 데이터만을 지우고 싶을 때 (초기화?)
DELETE FROM 테이블명;
TRUNCATE TABLE 테이블명;
-- IF EXISTS 특정 객체(예: 데이터베이스나 테이블)가 존재하는 경우에만 실행

