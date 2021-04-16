DROP TABLE Member;

CREATE TABLE Member (
	user_uid	number		NOT NULL,
	user_id	varchar2(30)		NOT NULL,
	user_password	varchar2(30)		NOT NULL,
	user_birth	date		NOT NULL,
	user_phone	varchar2(20)		NOT NULL,
	user_email	varchar2(50)		NOT NULL,
	user_addr	varchar2(80)		NOT NULL,
	user_joindate	date	DEFAULT SYSDATE	NOT NULL,
	user_isadmin	char(1)		NOT NULL,
	user_isCall	char(1)		NULL
);

DROP TABLE Non_Member;

CREATE TABLE Non_Member (
	nm_uid	number		NOT NULL,
	nm_pw	varchar2(30)		NOT NULL,
	nm_phone	varchar2(20)		NOT NULL,
	nm_number	varchar2(30)		NOT NULL,
	nm_name	varchar2(30)		NOT NULL
);

DROP TABLE Qna_Board;

CREATE TABLE Qna_Board (
	qna_uid	number		NOT NULL,
	user_uid	number		NOT NULL,
	qna_title 	varchar2(50)		NOT NULL,
	qna_content 	clob		NOT NULL,
	qna_uploadedtime 	date	DEFAULT SYSDATE	NULL,
	qna_img 	varchar2(50)		NULL,
	qna_viewcnt 	number	DEFAULT 0	NULL,
	qna_answer 	varchar2(1000)		NULL
);


DROP TABLE  Theater CASCADE CONSTRAINTS;

DROP SEQUENCE theater_seq;

CREATE SEQUENCE theater_seq;


CREATE TABLE  Theater  (
	th_uid 	number		NOT NULL,
	th_id varchar(10)  NOT NULL,
	th_name 	varchar2(100)		NOT NULL,
	th_location 	varchar2(120)		NULL,
	th_totalseat 	number		NULL,
	th_state 	char(1)	DEFAULT 0	NULL ,
	th_telno varchar2(20) NULL,
	th_chartr varchar2(30) NULL,
	th_lng float NULL,
	th_lat float NULL,
	th_url varchar2(300) NULL,
	th_totalno NUMBER NULL,
	th_opendate varchar2(40) NULL
);

SELECT * FROM THEATER t ;

SELECT th_uid "uid", th_id "id", th_name "name", th_location "location", th_totalseat "totalseat", th_state "state", 
	th_telno "telno", th_chartr "chartr", th_lng "lng", th_lat "lat", th_url "url", th_totalno "totalno",th_opendate "opendate" 
	FROM Theater where th_id = 'FC002633';


DROP TABLE  Reservation ;

CREATE TABLE  Reservation  (
	res_number 	varchar2(30)		NOT NULL,
	res_data 	date		NOT NULL,
	res_visit 	number		NOT NULL,
	res_paycost 	number		NOT NULL,
	user_uid 	number		NULL,
	nm_uid 	number		NULL,
	res_isCancel 	char(1)		NOT NULL,
	res_seat 	varchar2(25)		NOT NULL,
	tt_uid 	number		NOT NULL
);

DROP TABLE  Theater_Seat ;

CREATE TABLE  Theater_Seat  (
	seat_num 	varchar2(10)		NOT NULL,
	th_uid 	number		NOT NULL
);

DROP TABLE  Notice_Board ;

CREATE TABLE  Notice_Board  (
	notice_uid 	number		NOT NULL,
	notice_title 	varchar2(50)		NOT NULL,
	notice_content 	varchar2(2000)		NOT NULL,
	notice_uploadedtime 	date		NULL,
	notice_img 	varchar2(50)		NULL,
	notice_viewcnt 	number	DEFAULT 0	NULL,
	user_uid 	number		NOT NULL,
	notice_type 	varchar2(20)		NOT NULL
);

DROP TABLE  Faq_Board ;

CREATE TABLE  Faq_Board  (
	faq_uid 	number		NOT NULL,
	faq_title 	varchar2(50)		NOT NULL,
	faq_content 	varchar2(2000)		NOT NULL,
	faq_uploadedtime 	date		NULL,
	faq_img 	varchar2(50)		NULL,
	faq_viewcnt 	number	DEFAULT 0	NULL,
	user_uid 	number		NOT NULL,
	faq_type 	varchar2(20)		NOT NULL
);

select sysdate from dual;

DROP TABLE  Event_Board ;



CREATE TABLE  Event_Board  (
	event_uid 	number		NOT NULL,
	event_title 	varchar2(200)		NOT NULL,
	event_contents 	varchar2(2000)		NOT NULL,
	event_img 	varchar2(500)		NULL,
	user_uid 	number		NOT NULL,
	event_startdate date NULL,
	event_enddate date NULL,
	event_isfinish char(1) NULL
);

INSERT INTO EVENT_BOARD (event_uid, 
event_title , event_contents, event_img ,user_uid , event_startdate , event_enddate , event_isfinish) 
VALUES (event_seq.nextval, 'test','test','test',123,TO_DATE('2021-04-01','YYYY-MM-DD'),TO_DATE('2021-04-01','YYYY-MM-DD'),'1');

SELECT event_uid "uid", event_title "title", event_contents "contents", event_img "img", 
user_uid "user_uid", TO_DATE(TO_CHAR(event_startdate,'YYYY-MM-DD')) "startdate" , 
TO_DATE(TO_CHAR(event_enddate,'YYYY-MM-DD')) "enddate", 
event_isfinish "isfinish", (event_enddate - event_startdate) AS remainday, 
(TO_DATE(TO_CHAR(event_enddate,'YYYY-MM-DD')) - TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD'))) AS remainfromtoday, 
(1-((TO_DATE(TO_CHAR(event_enddate,'YYYY-MM-DD')) - TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD')))/(event_enddate - event_startdate)))*100 AS percentage
FROM EVENT_BOARD 
ORDER BY percentage ASC;

SELECT 
count(*) AS total, 
count(event_isfinish == 1) AS finished, 
count(event_isfinish == 0) AS ongoing 
FROM EVENT_BOARD ;

		SELECT 
			(SELECT count(*) FROM EVENT_BOARD) total,
			(SELECT count(*) FROM EVENT_BOARD WHERE EVENT_ISFINISH = 1) AS finished,
			(SELECT count(*) FROM EVENT_BOARD WHERE EVENT_ISFINISH = 0) AS ongoing 
		FROM dual;



UPDATE EVENT_BOARD 
SET event_isfinish = 1  
WHERE (TO_DATE(TO_CHAR(event_enddate,'YYYY-MM-DD')) - TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD'))) < 0 ;

SELECT * FROM EVENT_BOARD eb ;

CREATE SEQUENCE event_seq;

DROP SEQUENCE event_seq;

DROP TABLE  Review ;

CREATE TABLE  Review  (
	re_uid 	number		NOT NULL,
	re_title 	varchar(500)		NOT NULL,
	re_content 	clob		NOT NULL,
	prf_uid 	number		NOT NULL,
	re_regdate 	date	DEFAULT SYSDATE	NOT NULL,
	re_score 	number		NULL,
	user_uid 	number		NULL
);

DROP TABLE  FavoritePerform ;

CREATE TABLE  FavoritePerform  (
	fav_uid 	number		NOT NULL,
	prf_uid 	number		NULL,
	user_uid 	number		NOT NULL
);

CREATE TABLE favperform(
	fav_uid NUMBER NOT NULL,
	prf_uid varchar2(15) NOT NULL,
	user_uid NUMBER NOT null
)

CREATE TABLE PerformRec (
	rec_uid NUMBER NOT NULL,
	prf_id varchar2(15) NOT NULL,
	relprf_id varchar2(15) NOT NULL,
	sim number(4,3) NOT null
)

SELECT * FROM performRec

INSERT INTO favperform VALUES(1,'PF173066' ,1);
INSERT INTO favperform VALUES(2, 'PF172498' ,1);

SELECT p.PRF_NAME "prfname", k.prf_id "prfid", k.relprf_id "relprfid", k.sim "sim", k.prf_name "relprfname", k.prf_poster "relprfposter", k.prf_uid "reluid", k.PRF_FCLTYNM "relprffacilty"
FROM 
(SELECT r.rec_uid "uid", r.prf_id, r.relprf_id, r.sim, p.PRF_NAME, p.PRF_POSTER, p.PRF_UID, p.PRF_FCLTYNM 
FROM PerformRec r, favperform f, Perform p
WHERE f.user_uid=1 and r.prf_id = f.prf_uid AND r.relprf_id = p.prf_id
ORDER BY r.prf_id) k, PERFORM p
WHERE k.prf_id = p.prf_id;



CREATE TABLE Perform (
	prf_uid	number		NOT NULL,
	prf_id	varchar2(15)		NOT NULL,
	prf_name	varchar2(200)		NOT NULL,
	prf_from	varchar2(20)		NULL,
	prf_to	varchar2(20)		NULL,
	prf_fcltynm	varchar2(200)		NULL,
	prf_poster	varchar2(200)		NULL,
	prf_state	varchar2(20)		NOT NULL,
	prf_openrun	char(1)		NULL,
	th_uid	varchar2(30)		NULL,
	prf_avgsc	number(2,1)		NULL,
	prf_summary clob NULL
);

SELECT * FROM perform;

SELECT * FROM PERFORMrec;
SELECT * FROM THEATER t ;

SELECT * FROM perform;
SELECT * FROM perform ORDER BY prf_from DESC;
SELECT * FROM perform WHERE PRF_UID < 5198 ORDER BY PRF_ID DESC;
SELECT * FROM perform WHERE PRF_STATE = '공연중' ORDER BY PRF_ID DESC;
CREATE SEQUENCE perform_seq;
DROP SEQUENCE perform_seq;

CREATE TABLE test_write (
	wr_uid NUMBER NOT NULL,
	wr_subject varchar2(50),
	wr_content clob,
	wr_name varchar2(20),
	wr_viewcnt NUMBER DEFAULT 0,
	wr_regdate DATE DEFAULT sysdate,
	wr_score NUMBER,
	wr_prfname varchar2(50)
);

alter table test_write modify (wr_prfname varchar2(200)) ;

INSERT INTO test_write (wr_uid, wr_subject, wr_content, wr_name, wr_score, wr_prfname) 
(SELECT test_write_seq.nextval, wr_subject, wr_content, wr_name, wr_score, wr_prfname FROM test_write);
SELECT * FROM test_write;
DROP TABLE test_write;

CREATE SEQUENCE test_write_seq;
DROP SEQUENCE test_write_seq;
DROP TABLE  Timetable ;

CREATE TABLE  Timetable  (
	tt_uid 	number		NOT NULL,
	tt_date 	date		NOT NULL,
	tt_time 	varchar2(20)		NOT NULL,
	tt_age 	varchar2(20)		NOT NULL,
	tt_visit 	number		NOT NULL,
	prf_uid 	number		NOT NULL
);

ALTER TABLE  Member  ADD CONSTRAINT  PK_MEMBER  PRIMARY KEY (
	user_uid 
);

ALTER TABLE  Non_Member  ADD CONSTRAINT  PK_NON_MEMBER  PRIMARY KEY (
	nm_uid 
);

ALTER TABLE  Qna_Board  ADD CONSTRAINT  PK_QNA_BOARD  PRIMARY KEY (
	qna_uid ,
	user_uid 
);

ALTER TABLE  Theater  ADD CONSTRAINT  PK_THEATER  PRIMARY KEY (
	th_uid 
);

ALTER TABLE  Reservation  ADD CONSTRAINT  PK_RESERVATION  PRIMARY KEY (
	res_number 
);

ALTER TABLE  Theater_Seat  ADD CONSTRAINT  PK_THEATER_SEAT  PRIMARY KEY (
	seat_num 
);

ALTER TABLE  Notice_Board  ADD CONSTRAINT  PK_NOTICE_BOARD  PRIMARY KEY (
	notice_uid 
);

ALTER TABLE  Faq_Board  ADD CONSTRAINT  PK_FAQ_BOARD  PRIMARY KEY (
	faq_uid 
);

ALTER TABLE  Event_Board  ADD CONSTRAINT  PK_EVENT_BOARD  PRIMARY KEY (
	event_uid 
);

ALTER TABLE  Review  ADD CONSTRAINT  PK_REVIEW  PRIMARY KEY (
	re_uid 
);

ALTER TABLE  FavoritePerform  ADD CONSTRAINT  PK_FAVORITEPERFORM  PRIMARY KEY (
	fav_uid 
);

ALTER TABLE  Perform  ADD CONSTRAINT  PK_PERFORM  PRIMARY KEY (
	prf_uid 
);

ALTER TABLE  Timetable  ADD CONSTRAINT  PK_TIMETABLE  PRIMARY KEY (
	tt_uid 
);

ALTER TABLE  Qna_Board  ADD CONSTRAINT  FK_Member_TO_Qna_Board_1  FOREIGN KEY (
	user_uid 
)
REFERENCES  Member  (
	user_uid 
);

ALTER TABLE  Reservation  ADD CONSTRAINT  FK_Member_TO_Reservation_1  FOREIGN KEY (
	user_uid 
)
REFERENCES  Member  (
	user_uid 
);

ALTER TABLE  Reservation  ADD CONSTRAINT  FK_Non_Member_TO_Reservation_1  FOREIGN KEY (
	nm_uid 
)
REFERENCES  Non_Member  (
	nm_uid 
);

ALTER TABLE  Reservation  ADD CONSTRAINT  FK_Timetable_TO_Reservation_1  FOREIGN KEY (
	tt_uid 
)
REFERENCES  Timetable  (
	tt_uid 
);

ALTER TABLE  Theater_Seat  ADD CONSTRAINT  FK_Theater_TO_Theater_Seat_1  FOREIGN KEY (
	th_uid 
)
REFERENCES  Theater  (
	th_uid 
);

ALTER TABLE  Notice_Board  ADD CONSTRAINT  FK_Member_TO_Notice_Board_1  FOREIGN KEY (
	user_uid 
)
REFERENCES  Member  (
	user_uid 
);

ALTER TABLE  Faq_Board  ADD CONSTRAINT  FK_Member_TO_Faq_Board_1  FOREIGN KEY (
	user_uid 
)
REFERENCES  Member  (
	user_uid 
);

ALTER TABLE  Event_Board  ADD CONSTRAINT  FK_Member_TO_Event_Board_1  FOREIGN KEY (
	user_uid 
)
REFERENCES  Member  (
	user_uid 
);

ALTER TABLE  Review  ADD CONSTRAINT  FK_Perform_TO_Review_1  FOREIGN KEY (
	prf_uid 
)
REFERENCES  Perform  (
	prf_uid 
);

ALTER TABLE  Review  ADD CONSTRAINT  FK_Member_TO_Review_1  FOREIGN KEY (
	user_uid 
)
REFERENCES  Member  (
	user_uid 
);

ALTER TABLE  FavoritePerform  ADD CONSTRAINT  FK_Perform_TO_FavoritePerform_1  FOREIGN KEY (
	prf_uid 
)
REFERENCES  Perform  (
	prf_uid 
);

ALTER TABLE  FavoritePerform  ADD CONSTRAINT  FK_Member_TO_FavoritePerform_1  FOREIGN KEY (
	user_uid 
)
REFERENCES  Member  (
	user_uid 
);

ALTER TABLE  Perform  ADD CONSTRAINT  FK_Theater_TO_Perform_1  FOREIGN KEY (
	th_uid 
)
REFERENCES  Theater  (
	th_uid 
);

ALTER TABLE  Timetable  ADD CONSTRAINT  FK_Perform_TO_Timetable_1  FOREIGN KEY (
	prf_uid 
)
REFERENCES  Perform  (
	prf_uid 
);

