DROP TABLE "Member";

CREATE TABLE "Member" (
	"user_uid"	number		NOT NULL,
	"user_id"	varchar2(30)		NOT NULL,
	"user_password"	varchar2(30)		NOT NULL,
	"user_birth"	date		NOT NULL,
	"user_phone"	varchar2(20)		NOT NULL,
	"user_email"	varchar2(50)		NOT NULL,
	"user_addr"	varchar2(80)		NOT NULL,
	"user_joindate"	date	DEFAULT SYSDATE	NOT NULL,
	"user_isadmin"	char(1)		NOT NULL,
	"user_isCall"	char(1)		NULL
);

DROP TABLE "Non_Member";

CREATE TABLE "Non_Member" (
	"nm_uid"	number		NOT NULL,
	"nm_pw"	varchar2(30)		NOT NULL,
	"nm_phone"	varchar2(20)		NOT NULL,
	"nm_number"	varchar2(30)		NOT NULL,
	"nm_name"	varchar2(30)		NOT NULL
);

DROP TABLE "Qna_Board";

CREATE TABLE "Qna_Board" (
	"qna_uid"	number		NOT NULL,
	"user_uid"	number		NOT NULL,
	"qna_title"	varchar2(50)		NOT NULL,
	"qna_content"	clob		NOT NULL,
	"qna_uploadedtime"	date	DEFAULT SYSDATE	NULL,
	"qna_img"	varchar2(50)		NULL,
	"qna_viewcnt"	number	DEFAULT 0	NULL,
	"qna_answer"	varchar2(1000)		NULL
);


DROP TABLE "Theater";

CREATE TABLE "Theater" (
	"th_uid"	number		NOT NULL,
	"th_name"	varchar2(50)		NOT NULL,
	"th_location"	varchar2(100)		NULL,
	"th_totalseat"	number		NULL,
	"th_content"	varchar2(1500)		NULL,
	"th_state"	char(1)		NULL,
	"th_img"	varchar2(200)		NULL
);


DROP TABLE "Reservation";

CREATE TABLE "Reservation" (
	"res_number"	varchar2(30)		NOT NULL,
	"res_data"	date		NOT NULL,
	"res_visit"	number		NOT NULL,
	"res_paycost"	number		NOT NULL,
	"user_uid"	number		NULL,
	"nm_uid"	number		NULL,
	"res_isCancel"	char(1)		NOT NULL,
	"res_seat"	varchar2(25)		NOT NULL,
	"tt_uid"	number		NOT NULL
);

DROP TABLE "Theater_Seat";

CREATE TABLE "Theater_Seat" (
	"seat_num"	varchar2(10)		NOT NULL,
	"th_uid"	number		NOT NULL
);

DROP TABLE "Notice_Board";

CREATE TABLE "Notice_Board" (
	"notice_uid"	number		NOT NULL,
	"notice_title"	varchar2(50)		NOT NULL,
	"notice_content"	varchar2(2000)		NOT NULL,
	"notice_uploadedtime"	date		NULL,
	"notice_img"	varchar2(50)		NULL,
	"notice_viewcnt"	number	DEFAULT 0	NULL,
	"user_uid"	number		NOT NULL,
	"notice_type"	varchar2(20)		NOT NULL
);


DROP TABLE "Faq_Board";

CREATE TABLE "Faq_Board" (
	"faq_uid"	number		NOT NULL,
	"faq_title"	varchar2(50)		NOT NULL,
	"faq_content"	varchar2(2000)		NOT NULL,
	"faq_uploadedtime"	date		NULL,
	"faq_img"	varchar2(50)		NULL,
	"faq_viewcnt"	number	DEFAULT 0	NULL,
	"user_uid"	number		NOT NULL,
	"faq_type"	varchar2(20)		NOT NULL
);


DROP TABLE "Event_Board";

CREATE TABLE "Event_Board" (
	"event_uid"	number		NOT NULL,
	"event_title"	varchar2(50)		NOT NULL,
	"event_contents"	varchar2(2000)		NOT NULL,
	"event_uploadedtime"	date		NULL,
	"event_img"	varchar2(50)		NULL,
	"event_viewcnt"	number	DEFAULT 0	NULL,
	"user_uid"	number		NOT NULL
);


DROP TABLE "Review";

CREATE TABLE "Review" (
	"re_uid"	number		NOT NULL,
	"re_title"	varchar(500)		NOT NULL,
	"re_content"	clob		NOT NULL,
	"prf_uid"	number		NOT NULL,
	"re_regdate"	date	DEFAULT SYSDATE	NOT NULL,
	"re_score"	number		NULL,
	"user_uid"	number		NULL
);

DROP TABLE "FavoritePerform";

CREATE TABLE "FavoritePerform" (
	"fav_uid"	number		NOT NULL,
	"prf_uid"	number		NULL,
	"user_uid"	number		NOT NULL
);

DROP TABLE "Perform";

CREATE TABLE "Perform" (
	"prf_uid"	number		NOT NULL,
	"prf_id"	varchar2(15)		NOT NULL,
	"prf_name"	varchar2(30)		NOT NULL,
	"prf_from"	date		NULL,
	"prf_to"	date		NULL,
	"prf_fcltynm"	varchar2(30)		NOT NULL,
	"prf_poster"	varchar2(100)		NULL,
	"prf_state"	varchar2(10)		NOT NULL,
	"prf_openrun"	char(1)		NULL,
	"prf_price"	number		NOT NULL,
	"th_uid"	number		NOT NULL,
	"prf_avgsc"	number(2,1)		NULL
);

DROP TABLE "Timetable";

CREATE TABLE "Timetable" (
	"tt_uid"	number		NOT NULL,
	"tt_date"	date		NOT NULL,
	"tt_time"	varchar2(20)		NOT NULL,
	"tt_age"	varchar2(20)		NOT NULL,
	"tt_visit"	number		NOT NULL,
	"prf_uid"	number		NOT NULL
);

ALTER TABLE "Member" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"user_uid"
);

ALTER TABLE "Non_Member" ADD CONSTRAINT "PK_NON_MEMBER" PRIMARY KEY (
	"nm_uid"
);

ALTER TABLE "Qna_Board" ADD CONSTRAINT "PK_QNA_BOARD" PRIMARY KEY (
	"qna_uid",
	"user_uid"
);

ALTER TABLE "Theater" ADD CONSTRAINT "PK_THEATER" PRIMARY KEY (
	"th_uid"
);

ALTER TABLE "Reservation" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY (
	"res_number"
);

ALTER TABLE "Theater_Seat" ADD CONSTRAINT "PK_THEATER_SEAT" PRIMARY KEY (
	"seat_num"
);

ALTER TABLE "Notice_Board" ADD CONSTRAINT "PK_NOTICE_BOARD" PRIMARY KEY (
	"notice_uid"
);

ALTER TABLE "Faq_Board" ADD CONSTRAINT "PK_FAQ_BOARD" PRIMARY KEY (
	"faq_uid"
);

ALTER TABLE "Event_Board" ADD CONSTRAINT "PK_EVENT_BOARD" PRIMARY KEY (
	"event_uid"
);

ALTER TABLE "Review" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"re_uid"
);

ALTER TABLE "FavoritePerform" ADD CONSTRAINT "PK_FAVORITEPERFORM" PRIMARY KEY (
	"fav_uid"
);

ALTER TABLE "Perform" ADD CONSTRAINT "PK_PERFORM" PRIMARY KEY (
	"prf_uid"
);

ALTER TABLE "Timetable" ADD CONSTRAINT "PK_TIMETABLE" PRIMARY KEY (
	"tt_uid"
);

ALTER TABLE "Qna_Board" ADD CONSTRAINT "FK_Member_TO_Qna_Board_1" FOREIGN KEY (
	"user_uid"
)
REFERENCES "Member" (
	"user_uid"
);

ALTER TABLE "Reservation" ADD CONSTRAINT "FK_Member_TO_Reservation_1" FOREIGN KEY (
	"user_uid"
)
REFERENCES "Member" (
	"user_uid"
);

ALTER TABLE "Reservation" ADD CONSTRAINT "FK_Non_Member_TO_Reservation_1" FOREIGN KEY (
	"nm_uid"
)
REFERENCES "Non_Member" (
	"nm_uid"
);

ALTER TABLE "Reservation" ADD CONSTRAINT "FK_Timetable_TO_Reservation_1" FOREIGN KEY (
	"tt_uid"
)
REFERENCES "Timetable" (
	"tt_uid"
);

ALTER TABLE "Theater_Seat" ADD CONSTRAINT "FK_Theater_TO_Theater_Seat_1" FOREIGN KEY (
	"th_uid"
)
REFERENCES "Theater" (
	"th_uid"
);

ALTER TABLE "Notice_Board" ADD CONSTRAINT "FK_Member_TO_Notice_Board_1" FOREIGN KEY (
	"user_uid"
)
REFERENCES "Member" (
	"user_uid"
);

ALTER TABLE "Faq_Board" ADD CONSTRAINT "FK_Member_TO_Faq_Board_1" FOREIGN KEY (
	"user_uid"
)
REFERENCES "Member" (
	"user_uid"
);

ALTER TABLE "Event_Board" ADD CONSTRAINT "FK_Member_TO_Event_Board_1" FOREIGN KEY (
	"user_uid"
)
REFERENCES "Member" (
	"user_uid"
);

ALTER TABLE "Review" ADD CONSTRAINT "FK_Perform_TO_Review_1" FOREIGN KEY (
	"prf_uid"
)
REFERENCES "Perform" (
	"prf_uid"
);

ALTER TABLE "Review" ADD CONSTRAINT "FK_Member_TO_Review_1" FOREIGN KEY (
	"user_uid"
)
REFERENCES "Member" (
	"user_uid"
);

ALTER TABLE "FavoritePerform" ADD CONSTRAINT "FK_Perform_TO_FavoritePerform_1" FOREIGN KEY (
	"prf_uid"
)
REFERENCES "Perform" (
	"prf_uid"
);

ALTER TABLE "FavoritePerform" ADD CONSTRAINT "FK_Member_TO_FavoritePerform_1" FOREIGN KEY (
	"user_uid"
)
REFERENCES "Member" (
	"user_uid"
);

ALTER TABLE "Perform" ADD CONSTRAINT "FK_Theater_TO_Perform_1" FOREIGN KEY (
	"th_uid"
)
REFERENCES "Theater" (
	"th_uid"
);

ALTER TABLE "Timetable" ADD CONSTRAINT "FK_Perform_TO_Timetable_1" FOREIGN KEY (
	"prf_uid"
)
REFERENCES "Perform" (
	"prf_uid"
);

