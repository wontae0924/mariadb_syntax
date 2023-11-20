-- 1. DDL  실습
-- post 테이블의 contents 컬럼 글자수 3000으로 변경
alter table post modify COLUMN contents varchar(3000);
-- autor 테이블에 address 컬럼 varchar 255로 추가
alter table author ADD COLUMN address varchar(255);
-- post 테이블 생성문 미리 확인 -> post 테이블 삭제 -> post 테이블 다시 생성
SHOW CREATE TABLE post;
DROP TABLE post;
-- SHOW CREATE TABLE post 에서 카피한 내용
CREATE TABLE `post` (
   `id` int(11) NOT NULL,
   `title` varchar(255) DEFAULT NULL,
   `contents` varchar(500) DEFAULT NULL,
   `author_id` int(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `author_id` (`author_id`),
   CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci



