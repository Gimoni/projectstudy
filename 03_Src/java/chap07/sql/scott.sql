desc emp;

select * 
  from emp;
  
list * from emp;

DROP TABLE USERS;

CREATE TABLE USERS ( 
     ID         varchar2(20) CONSTRAINT USERS_ID_PK PRIMARY KEY,
     PASSWORD   VARCHAR2(100 char) NOT NULL,
     NAME       VARCHAR2(20) NOT NULL, 
     MOBILE     VARCHAR2(15) NOT NULL, 
     ROLE       VARCHAR2(20  char)
);

select * from users;

insert into users values ('python', '$2a$10$ayg93l/BuyOQ0b/1huGiJuBXm71M9fELCMt4OZ0da1bEX2mweIbcm','python','+821012345678', 'USER');
insert into users values ('java',   '$2a$10$nOMTH4OzkBYs1u1L2B5K5.SNO257rvxJH7cAd4Rykebfv5NRwfSi.','java','+821012345679', 'ADMIN');

commit;

select * from users where mobile = '+821012345678';

select count(*) from users;

select * from users;

insert INTO users 
VALUES ('gimon31','1234567','gimon','+8254326789','USER');


crate table board {
     NO         varchar2(200) CONSTRAINT USERS_ID_PK PRIMARY KEY,
     PASSWORD   VARCHAR2(100 char) NOT NULL,
     NAME       VARCHAR2(20) NOT NULL, 
     MOBILE     VARCHAR2(15) NOT NULL, 
     ROLE       VARCHAR2(20  char)
}

CREATE TABLE board (
  id NUMBER NOT NULL,
  title VARCHAR2(100) NOT NULL,
  content VARCHAR2(4000),
  day DATE,
  writer VARCHAR2(100),
  CONSTRAINT board_pk PRIMARY KEY (id)
);

select * from board;

drop table board;

INSERT INTO board (id, title, content, day, writer)
VALUES (1, 'Sample Title 1', 'Sample Content 1', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 'John Doe');

INSERT INTO board (id, title, content, day, writer)
VALUES (2, 'Sample Title 2', 'Sample Content 2', TO_DATE('2023-06-19', 'YYYY-MM-DD'), 'Jane Smith');


SELECT p.*, COUNT(r.reply) AS reply
FROM board p
LEFT JOIN board r ON p.id = r.id
GROUP BY p.id, p.title, p.content, p.day, p.writer
ORDER BY p.id DESC;

INSERT INTO board (id, title, content)
VALUES ('4', 'hi', 'hi');


        update board
        set title = 'hi',
            content = 'Hello'
        where id = '1';


select * from board order by id desc;


commit;


CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1;

select * from board;