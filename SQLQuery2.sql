CREATE DATABASE MovieDatabase;
GO
USE MovieDatabase;
GO



--create Movie table
CREATE TABLE Movie(
mov_id int primary key ,
mov_Title varchar(50),
mov_year int,
mov_time int,
mov_lang varchar(50),
mov_dt_rel date,
mov_rel_country char(5)

);




--create actor table

CREATE TABLE actor(
act_id int primary key ,
act_fname char(20),
act_lname char(20),
act_gender char(1)
);



--create director table
CREATE TABLE director(
dir_id int primary key ,
dir_fname char(20),
dir_lname char(20),
);



--create reviewer table
CREATE TABLE reviewer(
rev_id int primary key ,
rev_name char(30),
);



--create genres table
CREATE TABLE genres(
gen_id int primary key ,
gen_title char(20),
);

--create Movie_direction table
CREATE TABLE Movie_direction(
dir_id int, 
mov_id int ,

PRIMARY KEY (mov_id,dir_id),
FOREIGN KEY (mov_id) REFERENCES Movie(mov_id),
FOREIGN KEY (dir_id) REFERENCES director(dir_id)

);


--create Movie_cast table
CREATE TABLE Movie_cast(
act_id int, 
mov_id int ,
role char(30),
PRIMARY KEY (mov_id,act_id),
FOREIGN KEY (mov_id) REFERENCES Movie(mov_id),
FOREIGN KEY (act_id) REFERENCES actor(act_id)

);




--create Movie_genres table
CREATE TABLE Movie_genres(
gen_id int, 
mov_id int ,

PRIMARY KEY (mov_id,gen_id),
FOREIGN KEY (mov_id) REFERENCES Movie(mov_id),
FOREIGN KEY (gen_id) REFERENCES genres(gen_id)

);



--create rating table
CREATE TABLE rating(
mov_id int ,
rev_id int, 
rev_stars int,
num_o_ratings int
PRIMARY KEY (mov_id,rev_id),
FOREIGN KEY (mov_id) REFERENCES Movie(mov_id),
FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)

);