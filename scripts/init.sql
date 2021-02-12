DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS wish_list;


create table movie (
  id varchar(100) not null,
  title varchar(100) not null,
  "cast" varchar(250) null,
  release_date date null,
  genre varchar(100) null,
  director varchar(100) null,
  constraint movie_PK
    primary key (id)
);


create table "user" (
  id varchar(100) not null,
  username varchar(100) not null,
  password varchar(100) not null,
  constraint user_PK
    primary key (id),
  constraint user_UN
    unique (username)
);


create table wish_list (
  user_id varchar(100) not null,
  movie_id varchar(100) not null,
  comment varchar(300) null,
  constraint wish_list_PK
    primary key (
      user_id,
      movie_id
    ),
  constraint wish_list_FK
    foreign key (user_id)
    references "user" (id) on delete cascade,
  constraint wish_list_FK_1
    foreign key (movie_id)
    references movie (id)
);
