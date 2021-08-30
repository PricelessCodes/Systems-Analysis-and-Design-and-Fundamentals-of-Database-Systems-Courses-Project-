if exists(select 1 from sys.sysforeignkey where role='FK_USER_RELATIONS_SEAT') then
    alter table "User"
       delete foreign key FK_USER_RELATIONS_SEAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USER_RELATIONS_CINEMA H') then
    alter table "User"
       delete foreign key "FK_USER_RELATIONS_CINEMA H"
end if;

drop index if exists "User".Relationship_14_FK;

drop index if exists "User".Relationship_1_FK;

drop index if exists "User".User_PK;

drop table if exists "User";

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create or replace table "User" 
(
   User_id              integer                        not null,
   id                   integer                        not null,
   hall_num             char(10)                       null,
   Name                 varchar(200)                   null,
   ticketsNo            integer                        null,
   "E-mail"             varchar(100)                   null,
   noOfMoviesWatched    integer                        null,
   City                 char(50)                       null,
   State                char(50)                       null,
   "phone number"       char(15)                       null,
   constraint PK_USER primary key clustered (User_id)
);

/*==============================================================*/
/* Index: User_PK                                               */
/*==============================================================*/
create unique clustered index User_PK on "User" (
User_id ASC
);

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/
create index Relationship_1_FK on "User" (
id ASC
);

/*==============================================================*/
/* Index: Relationship_14_FK                                    */
/*==============================================================*/
create index Relationship_14_FK on "User" (
hall_num ASC
);

alter table "User"
   add constraint FK_USER_RELATIONS_SEAT foreign key (id)
      references Seat (id)
      on update restrict
      on delete restrict;

alter table "User"
   add constraint "FK_USER_RELATIONS_CINEMA H" foreign key (hall_num)
      references "Cinema Hall" (hall_num)
      on update restrict
      on delete restrict;


//////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_SEAT_RELATIONS_USER') then
    alter table Seat
       delete foreign key FK_SEAT_RELATIONS_USER
end if;

drop index if exists Seat.Relationship_2_FK;

drop index if exists Seat.Seat_PK;

drop table if exists Seat;

/*==============================================================*/
/* Table: Seat                                                  */
/*==============================================================*/
create or replace table Seat 
(
   id                   integer                        not null,
   User_id              integer                        not null,
   seat_class           varchar(2)                     null,
   seat_number          integer                        null,
   constraint PK_SEAT primary key clustered (id)
);

/*==============================================================*/
/* Index: Seat_PK                                               */
/*==============================================================*/
create unique clustered index Seat_PK on Seat (
id ASC
);

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/
create index Relationship_2_FK on Seat (
User_id ASC
);

alter table Seat
   add constraint FK_SEAT_RELATIONS_USER foreign key (User_id)
      references "User" (User_id)
      on update restrict
      on delete restrict;



//////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_MOVIE_RELATIONS_SEAT') then
    alter table Movie
       delete foreign key FK_MOVIE_RELATIONS_SEAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MOVIE_RELATIONS_USER') then
    alter table Movie
       delete foreign key FK_MOVIE_RELATIONS_USER
end if;

drop index if exists Movie.Relationship_6_FK;

drop index if exists Movie.Relationship_5_FK;

drop index if exists Movie.Movie_PK;

drop table if exists Movie;

/*==============================================================*/
/* Table: Movie                                                 */
/*==============================================================*/
create or replace table Movie 
(
   id                   integer                        not null,
   User_id              integer                        not null,
   movie_ID             integer                        not null,
   movie_rating         varchar(4)                     null,
   movie_name           char(20)                       null,
   movie_date           date                           null,
   movie_time           time                           null,
   constraint PK_MOVIE primary key clustered (id, User_id, movie_ID)
);

/*==============================================================*/
/* Index: Movie_PK                                              */
/*==============================================================*/
create unique clustered index Movie_PK on Movie (
id ASC,
User_id ASC,
movie_ID ASC
);

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create index Relationship_5_FK on Movie (
id ASC
);

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/
create index Relationship_6_FK on Movie (
User_id ASC
);

alter table Movie
   add constraint FK_MOVIE_RELATIONS_SEAT foreign key (id)
      references Seat (id)
      on update restrict
      on delete restrict;

alter table Movie
   add constraint FK_MOVIE_RELATIONS_USER foreign key (User_id)
      references "User" (User_id)
      on update restrict
      on delete restrict;



//////////////////////////////////////////////////////////////////////////////////////////


drop index if exists "Cinema Hall"."Cinema Hall_PK";

drop table if exists "Cinema Hall";

/*==============================================================*/
/* Table: "Cinema Hall"                                         */
/*==============================================================*/
create or replace table "Cinema Hall" 
(
   hall_num             integer                        not null,
   constraint "PK_CINEMA HALL" primary key clustered (hall_num)
);

/*==============================================================*/
/* Index: "Cinema Hall_PK"                                      */
/*==============================================================*/
create unique clustered index "Cinema Hall_PK" on "Cinema Hall" (
hall_num ASC
);


///////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_CINEMA_RELATIONS_USER') then
    alter table Cinema
       delete foreign key FK_CINEMA_RELATIONS_USER
end if;

drop index if exists Cinema.Relationship_3_FK;

drop index if exists Cinema.Cinema_PK;

drop table if exists Cinema;

/*==============================================================*/
/* Table: Cinema                                                */
/*==============================================================*/
create or replace table Cinema 
(
   User_id              integer                        not null,
   cinema_ID            integer                        not null,
   Cinema_name          varchar(20)                    null,
   Cinema_city          varchar(20)                    null,
   constraint PK_CINEMA primary key clustered (User_id, cinema_ID)
);

/*==============================================================*/
/* Index: Cinema_PK                                             */
/*==============================================================*/
create unique clustered index Cinema_PK on Cinema (
User_id ASC,
cinema_ID ASC
);

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create index Relationship_3_FK on Cinema (
User_id ASC
);

alter table Cinema
   add constraint FK_CINEMA_RELATIONS_USER foreign key (User_id)
      references "User" (User_id)
      on update restrict
      on delete restrict;




/////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_CINEMA H') then
    alter table Relationship_10
       delete foreign key "FK_RELATION_RELATIONS_CINEMA H"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_SEAT') then
    alter table Relationship_10
       delete foreign key FK_RELATION_RELATIONS_SEAT
end if;

drop index if exists Relationship_10.Relationship_16_FK;

drop index if exists Relationship_10.Relationship_15_FK;

drop index if exists Relationship_10.Relationship_10_PK;

drop table if exists Relationship_10;

/*==============================================================*/
/* Table: Relationship_10                                       */
/*==============================================================*/
create or replace table Relationship_10 
(
   hall_num             integer                        not null,
   id                   integer                        not null,
   constraint PK_RELATIONSHIP_10 primary key clustered (hall_num, id)
);

/*==============================================================*/
/* Index: Relationship_10_PK                                    */
/*==============================================================*/
create unique clustered index Relationship_10_PK on Relationship_10 (
hall_num ASC,
id ASC
);

/*==============================================================*/
/* Index: Relationship_15_FK                                    */
/*==============================================================*/
create index Relationship_15_FK on Relationship_10 (
hall_num ASC
);

/*==============================================================*/
/* Index: Relationship_16_FK                                    */
/*==============================================================*/
create index Relationship_16_FK on Relationship_10 (
id ASC
);

alter table Relationship_10
   add constraint "FK_RELATION_RELATIONS_CINEMA H" foreign key (hall_num)
      references "Cinema Hall" (hall_num)
      on update restrict
      on delete restrict;

alter table Relationship_10
   add constraint FK_RELATION_RELATIONS_SEAT foreign key (id)
      references Seat (id)
      on update restrict
      on delete restrict;



/////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_CINEMA H') then
    alter table Relationship_8
       delete foreign key "FK_RELATION_RELATIONS_CINEMA H"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_MOVIE') then
    alter table Relationship_8
       delete foreign key FK_RELATION_RELATIONS_MOVIE
end if;

drop index if exists Relationship_8.Relationship_13_FK;

drop index if exists Relationship_8.Relationship_12_FK;

drop index if exists Relationship_8.Relationship_8_PK;

drop table if exists Relationship_8;

/*==============================================================*/
/* Table: Relationship_8                                        */
/*==============================================================*/
create or replace table Relationship_8 
(
   hall_num             integer                        not null,
   id                   integer                        not null,
   User_id              integer                        not null,
   movie_ID             integer                        not null,
   constraint PK_RELATIONSHIP_8 primary key clustered (id, User_id, hall_num, movie_ID)
);

/*==============================================================*/
/* Index: Relationship_8_PK                                     */
/*==============================================================*/
create unique clustered index Relationship_8_PK on Relationship_8 (
id ASC,
User_id ASC,
hall_num ASC,
movie_ID ASC
);

/*==============================================================*/
/* Index: Relationship_12_FK                                    */
/*==============================================================*/
create index Relationship_12_FK on Relationship_8 (
hall_num ASC
);

/*==============================================================*/
/* Index: Relationship_13_FK                                    */
/*==============================================================*/
create index Relationship_13_FK on Relationship_8 (
id ASC,
User_id ASC,
movie_ID ASC
);

alter table Relationship_8
   add constraint "FK_RELATION_RELATIONS_CINEMA H" foreign key (hall_num)
      references "Cinema Hall" (hall_num)
      on update restrict
      on delete restrict;

alter table Relationship_8
   add constraint FK_RELATION_RELATIONS_MOVIE foreign key (id, User_id, movie_ID)
      references Movie (id, User_id, movie_ID)
      on update restrict
      on delete restrict;



///////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_CINEMA H') then
    alter table Relationship_7
       delete foreign key "FK_RELATION_RELATIONS_CINEMA H"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_CINEMA') then
    alter table Relationship_7
       delete foreign key FK_RELATION_RELATIONS_CINEMA
end if;

drop index if exists Relationship_7.Relationship_11_FK;

drop index if exists Relationship_7.Relationship_10_FK;

drop index if exists Relationship_7.Relationship_7_PK;

drop table if exists Relationship_7;

/*==============================================================*/
/* Table: Relationship_7                                        */
/*==============================================================*/
create or replace table Relationship_7 
(
   hall_num             integer                        not null,
   User_id              integer                        not null,
   cinema_ID            integer                        not null,
   constraint PK_RELATIONSHIP_7 primary key clustered (User_id, hall_num, cinema_ID)
);

/*==============================================================*/
/* Index: Relationship_7_PK                                     */
/*==============================================================*/
create unique clustered index Relationship_7_PK on Relationship_7 (
User_id ASC,
hall_num ASC,
cinema_ID ASC
);

/*==============================================================*/
/* Index: Relationship_10_FK                                    */
/*==============================================================*/
create index Relationship_10_FK on Relationship_7 (
hall_num ASC
);

/*==============================================================*/
/* Index: Relationship_11_FK                                    */
/*==============================================================*/
create index Relationship_11_FK on Relationship_7 (
User_id ASC,
cinema_ID ASC
);

alter table Relationship_7
   add constraint "FK_RELATION_RELATIONS_CINEMA H" foreign key (hall_num)
      references "Cinema Hall" (hall_num)
      on update restrict
      on delete restrict;

alter table Relationship_7
   add constraint FK_RELATION_RELATIONS_CINEMA foreign key (User_id, cinema_ID)
      references Cinema (User_id, cinema_ID)
      on update restrict
      on delete restrict;



////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_CINEMA') then
    alter table Relationship_3
       delete foreign key FK_RELATION_RELATIONS_CINEMA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_MOVIE') then
    alter table Relationship_3
       delete foreign key FK_RELATION_RELATIONS_MOVIE
end if;

drop index if exists Relationship_3.Relationship_5_FK;

drop index if exists Relationship_3.Relationship_4_FK;

drop index if exists Relationship_3.Relationship_3_PK;

drop table if exists Relationship_3;

/*==============================================================*/
/* Table: Relationship_3                                        */
/*==============================================================*/
create or replace table Relationship_3 
(
   Cin_User_id          integer                        not null,
   cinema_ID            integer                        not null,
   id                   integer                        not null,
   User_id              integer                        not null,
   movie_ID             integer                        not null,
   constraint PK_RELATIONSHIP_3 primary key clustered (Cin_User_id, cinema_ID, id, User_id, movie_ID)
);

/*==============================================================*/
/* Index: Relationship_3_PK                                     */
/*==============================================================*/
create unique clustered index Relationship_3_PK on Relationship_3 (
Cin_User_id ASC,
cinema_ID ASC,
id ASC,
User_id ASC,
movie_ID ASC
);

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/
create index Relationship_4_FK on Relationship_3 (
Cin_User_id ASC,
cinema_ID ASC
);

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create index Relationship_5_FK on Relationship_3 (
id ASC,
User_id ASC,
movie_ID ASC
);

alter table Relationship_3
   add constraint FK_RELATION_RELATIONS_CINEMA foreign key (Cin_User_id, cinema_ID)
      references Cinema (User_id, cinema_ID)
      on update restrict
      on delete restrict;

alter table Relationship_3
   add constraint FK_RELATION_RELATIONS_MOVIE foreign key (id, User_id, movie_ID)
      references Movie (id, User_id, movie_ID)
      on update restrict
      on delete restrict;


/////////////////////////////////////////////////////////////////////////////////////////


if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_SEAT') then
    alter table Relationship_6
       delete foreign key FK_RELATION_RELATIONS_SEAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RELATION_RELATIONS_CINEMA') then
    alter table Relationship_6
       delete foreign key FK_RELATION_RELATIONS_CINEMA
end if;

drop index if exists Relationship_6.Relationship_9_FK;

drop index if exists Relationship_6.Relationship_8_FK;

drop index if exists Relationship_6.Relationship_6_PK;

drop table if exists Relationship_6;

/*==============================================================*/
/* Table: Relationship_6                                        */
/*==============================================================*/
create or replace table Relationship_6 
(
   id                   integer                        not null,
   User_id              integer                        not null,
   cinema_ID            integer                        not null,
   constraint PK_RELATIONSHIP_6 primary key clustered (User_id, id, cinema_ID)
);

/*==============================================================*/
/* Index: Relationship_6_PK                                     */
/*==============================================================*/
create unique clustered index Relationship_6_PK on Relationship_6 (
User_id ASC,
id ASC,
cinema_ID ASC
);

/*==============================================================*/
/* Index: Relationship_8_FK                                     */
/*==============================================================*/
create index Relationship_8_FK on Relationship_6 (
id ASC
);

/*==============================================================*/
/* Index: Relationship_9_FK                                     */
/*==============================================================*/
create index Relationship_9_FK on Relationship_6 (
User_id ASC,
cinema_ID ASC
);

alter table Relationship_6
   add constraint FK_RELATION_RELATIONS_SEAT foreign key (id)
      references Seat (id)
      on update restrict
      on delete restrict;

alter table Relationship_6
   add constraint FK_RELATION_RELATIONS_CINEMA foreign key (User_id, cinema_ID)
      references Cinema (User_id, cinema_ID)
      on update restrict
      on delete restrict;

//////////////////////////////////////////////////////////////////////////////////////////
