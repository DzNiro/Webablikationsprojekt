DROP DATABASE IF EXISTS db_webapplikation;
CREATE DATABASE db_webapplikation;
use db_webapplikation;

/* Genre */
CREATE TABLE tbl_genre (
  	genre_pk_id_genreid INT(15) NOT NULL AUTO_INCREMENT,
  	genre_beschreibung VARCHAR(30) NOT NULL,
  	genre_foto VARCHAR(50),
	PRIMARY KEY (genre_pk_id_genreid)
)ENGINE = InnoDB;

/*USER*/
CREATE TABLE tbl_user (
	user_pk_id_userid INT(15) NOT NULL AUTO_INCREMENT,
	user_username VARCHAR(30) NOT NULL,
	user_password CHAR(40) NOT NULL,
	PRIMARY KEY (user_pk_id_userid)
)ENGINE = InnoDB;

/*Spiel*/
CREATE TABLE tbl_spiel(
	spiel_pk_id_spielid INT(15) NOT NULL AUTO_INCREMENT,
	spiel_fk_genreid INT(15) NOT NULL,
	spiel_titel VARCHAR(30) NOT NULL,
	spiel_beschreibung VARCHAR(250),
	spiel_url_trailer VARCHAR(250),
	spiel_counter_bewertungen INT(3),
	spiel_counter_pos_bewertungen INT(3),
	PRIMARY KEY (spiel_pk_id_spielid),
	FOREIGN KEY (spiel_fk_genreid) REFERENCES tbl_genre(genre_pk_id_genreid) ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE tbl_spiel_comment(
	spielcomment_pk_id_commentid INT(15) NOT NULL AUTO_INCREMENT,
	spielcomment_fk_userid INT(15) NOT NULL,
	spielcomment_fk_spielid INT(15) NOT NULL,
	spielcomment_comment_text VARCHAR(300) NOT NULL,
	spielcomment_counter_bewertungen INT(3),
	spielcomment_counter_pos_bewertungen INT(3),
	PRIMARY KEY (spielcomment_pk_id_commentid),
	FOREIGN KEY (spielcomment_fk_userid) REFERENCES tbl_user(user_pk_id_userid) ON UPDATE CASCADE,
	FOREIGN KEY (spielcomment_fk_spielid) REFERENCES tbl_spiel(spiel_pk_id_spielid) ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE tbl_spiel_answer_comment(
	spielanswercomment_pk_id_answerid INT(15) NOT NULL AUTO_INCREMENT,
	spielanswercomment_fk_userid INT(15) NOT NULL,
	spielanswercomment_fk_spielcommentid INT(15) NOT NULL,
	spielanswercomment_answernr INT(2) NOT NULL,
	spielanswercomment_text VARCHAR(150) NOT NULL,
	spielanswercomment_counter_bewertungen INT(3),
	spielanswercomment_counter_pos_bewertungen INT(3),
	PRIMARY KEY (spielanswercomment_pk_id_answerid),
	FOREIGN KEY (spielanswercomment_fk_userid) REFERENCES tbl_user(user_pk_id_userid) ON UPDATE CASCADE,
	FOREIGN KEY (spielanswercomment_fk_spielcommentid) REFERENCES tbl_spiel_comment(spielcomment_pk_id_commentid) ON UPDATE CASCADE
)ENGINE = InnoDB;

/*Blog*/
CREATE TABLE tbl_blog(
	blog_pk_id_blogid INT(15) NOT NULL AUTO_INCREMENT,
	blog_fk_userid INT(15) NOT NULL,
	blog_titel VARCHAR(50) NOT NULL,
	blog_text VARCHAR(500) NOT NULL,
	blog_counter_bewertungen INT(3),
	blog_counter_pos_bewertungen INT(3),
	PRIMARY KEY (blog_pk_id_blogid),
	FOREIGN KEY (blog_fk_userid) REFERENCES tbl_user(user_pk_id_userid) ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE tbl_blog_comment(
	blogcomment_pk_id_commentid INT(15) NOT NULL AUTO_INCREMENT,
	blogcomment_fk_blogid INT(15) NOT NULL,
	blogcomment_fk_userid INT(15) NOT NULL,
	blogcomment_comment_text VARCHAR(300) NOT NULL,
	blogcomment_counter_bewertungen INT(3) NOT NULL,
	blogcomment_counter_pos_bewertungen INT(3) NOT NULL,
	PRIMARY KEY (blogcomment_pk_id_commentid),
	FOREIGN KEY (blogcomment_fk_blogid) REFERENCES tbl_blog(blog_pk_id_blogid) ON UPDATE CASCADE,
	FOREIGN KEY (blogcomment_fk_userid) REFERENCES tbl_user(user_pk_id_userid) ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE tbl_blog_answer_comment(
	bloganswercomment_pk_id_answerid INT(15) NOT NULL AUTO_INCREMENT,
	bloganswercomment_fk_userid INT(15) NOT NULL,
	bloganswercomment_fk_blogcommentid INT(15) NOT NULL,
	bloganswercomment_answernr INT(2) NOT NULL,
	bloganswercomment_text VARCHAR(150) NOT NULL,
	bloganswercomment_counter_bewertungen INT(3),
	bloganswercomment_counter_pos_bewertungen INT(3),
	PRIMARY KEY (bloganswercomment_pk_id_answerid),
	FOREIGN KEY (bloganswercomment_fk_userid) REFERENCES tbl_user(user_pk_id_userid) ON UPDATE CASCADE,
	FOREIGN KEY (bloganswercomment_fk_blogcommentid) REFERENCES tbl_blog_comment(blogcomment_pk_id_commentid) ON UPDATE CASCADE
)ENGINE = InnoDB;

