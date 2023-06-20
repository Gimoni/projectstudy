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

alter user scott identified by tiger;

insert into users values ('python', '$2a$10$ayg93l/BuyOQ0b/1huGiJuBXm71M9fELCMt4OZ0da1bEX2mweIbcm','python','+821012345678', 'USER');
insert into users values ('java',   '$2a$10$nOMTH4OzkBYs1u1L2B5K5.SNO257rvxJH7cAd4Rykebfv5NRwfSi.','java','+821012345679', 'ADMIN');

delete from users where id = 'gimon';

commit;

select * from users where mobile = '+821012345678';

select count(*) from users;

select * from users;

insert INTO users 
VALUES ('gimon','1234567','gimon','+8254326789','USER');


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

commit;

drop table board;

INSERT INTO board (id, title, content, day, reply, writer)
VALUES (1, 'Sample Title 1', 'Sample Content 1', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 5, 'John Doe');

INSERT INTO board (id, title, content, day, reply, writer)
VALUES (2, 'Sample Title 2', 'Sample Content 2', TO_DATE('2023-06-19', 'YYYY-MM-DD'), 3, 'Jane Smith');


SELECT p.*, COUNT(r.reply) AS reply
FROM board p
LEFT JOIN board r ON p.id = r.id
GROUP BY p.id, p.title, p.content, p.day, p.reply, p.writer
ORDER BY p.id DESC;

INSERT INTO board (id, title, content)
VALUES ('4', 'hi', 'hi');


        update board
        set title = 'hi',
            content = 'Hello'
        where id = '1';


select * from board order by id desc;


commit;

CREATE TABLE board (
  id NUMBER(10) NOT NULL,
  title VARCHAR2(100) NOT NULL,
  content VARCHAR2(4000),
  day DATE,
  writer VARCHAR2(100),
  CONSTRAINT board_pk PRIMARY KEY (id)
);

CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1;

select * from boardreply;

CREATE TABLE boardreply (
  id NUMBER NOT NULL,
  content VARCHAR(2000) NOT NULL,
  day DATE,
  writer VARCHAR(20) NOT NULL,
  replyId NUMBER NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO boardreply (id, content, day, writer, replyId)
VALUES (1, 'Sample reply content 1', '2023-06-20', 'John', 12345);

INSERT INTO boardreply (id, content, day, writer, replyId)
VALUES (2, 'Sample reply content 2', '2023-06-21', 'Jane', 67890);

-- 적절한 샘플 데이터를 추가로 삽입할 수 있습니다.

CREATE TABLE board (
  id NUMBER(10) NOT NULL,
  title VARCHAR2(100) NOT NULL,
  content VARCHAR2(4000),
  day DATE,
  writer VARCHAR2(100),
  CONSTRAINT board_pk PRIMARY KEY (id)
);

select * from board;

BEGIN
  FOR i IN 1..100 LOOP
    -- Randomly select a character name
    SELECT TRIM(REGEXP_SUBSTR('Mickey Mouse,Donald Duck,Minnie Mouse,Goofy,Pluto', '[^,]+', 1, LEVEL))
    INTO writer
    FROM DUAL
    CONNECT BY LEVEL <= REGEXP_COUNT('Mickey Mouse,Donald Duck,Minnie Mouse,Goofy,Pluto', ',') + 1;

    -- Generate a random activity based on the character's name
    SELECT CASE DBMS_RANDOM.VALUE(1, 5)
      WHEN 1 THEN 'exploring the magical kingdom'
      WHEN 2 THEN 'having fun at the theme park'
      WHEN 3 THEN 'going on an adventure'
      WHEN 4 THEN 'meeting other Disney characters'
      WHEN 5 THEN 'watching fireworks'
    END INTO activity
    FROM DUAL;

    -- Generate a random date within the past week
    SELECT TRUNC(SYSDATE) - DBMS_RANDOM.VALUE(1, 7)
    INTO day
    FROM DUAL;

    -- Generate the content based on the character and activity
    content := REPLACE('Just wanted to share that %s is enjoying %s today!', '%s', character_name || ' is ' || activity);

    -- Insert the record into the board table
    INSERT INTO board (id, title, content, day, writer)
    VALUES (i, 'Sample Title ' || i, content, day, 'Sample Writer');
  END LOOP;
  COMMIT;
END;
/

CREATE TABLE comments (
  id NUMBER(10) NOT NULL,
  content VARCHAR2(200) NOT NULL,
  day DATE,
  writer VARCHAR2(20) NOT NULL,
  comment_id NUMBER(10) NOT NULL,
  CONSTRAINT comment_pk PRIMARY KEY (id),
  CONSTRAINT comment_fk FOREIGN KEY (comment_id) REFERENCES board (id)
);

select * from comments;