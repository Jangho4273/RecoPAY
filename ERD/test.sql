SELECT * FROM THEATER;
SELECT * FROM PERFORM;
SELECT * FROM theater_seat;





SELECT b2.prf_name "prfname", b2.prf_id "prfid", a2.relprf_id "relprfid", 
	a2.sim "sim", a2.prf_name "relprfname", a2.prf_poster "relprfposter", a2.prf_uid "reluid", a2.PRF_FCLTYNM "relprffacilty" 
	FROM
	Perform b2,
	(SELECT a1.prf_id, a1.relprf_id, sim, b1.prf_uid, b1.prf_name, b1.PRF_FCLTYNM, b1.PRF_POSTER
	from
	(SELECT * from
	performRec a,(SELECT wr_prfid FROM test_write WHERE WR_SCORE >= 3 AND 
	WR_NAME = (SELECT USER_NAME FROM MEMBER WHERE user_id = 'admin')) b
	WHERE a.PRF_ID = b.wr_prfid) a1, Perform b1
	WHERE a1.relprf_id = b1.prf_id ) a2
	WHERE a2.prf_id = b2.prf_id
	ORDER BY b2.prf_id, sim DESC;


SELECT * from
performRec a,(SELECT wr_prfid FROM test_write WHERE WR_SCORE >= 3 AND 
WR_NAME = (SELECT USER_NAME FROM MEMBER WHERE user_id = 'admin')) b
WHERE a.PRF_ID = b.wr_prfid;

SELECT * FROM test_write;

SELECT PRF_NAME FROM PERFORM p
WHERE p.th_uid = (SELECT t.th_id FROM theater_seat ts, theater t
WHERE ts.th_uid = t.TH_UID AND ROWNUM = 1) AND p.PRF_STATE = '공연중';


SELECT ts.seat_uid, t.th_name, t.TH_LOCATION , ts.seat_num, ts.prf_time, kk.prf_name FROM theater t, theater_seat ts, MEMBER m,
(SELECT PRF_NAME FROM PERFORM p
WHERE p.th_uid = (SELECT t.th_id FROM theater_seat ts, theater t
WHERE ts.th_uid = t.TH_UID AND ROWNUM = 1) AND p.PRF_STATE = '공연중') kk
WHERE t.th_uid = ts.th_uid AND m.USER_ID  = 'admin';


SELECT ts.seat_uid, t.th_name, t.TH_LOCATION , ts.seat_num, ts.prf_time, kk.prf_name 
FROM theater t, theater_seat ts, MEMBER m,
(SELECT DISTINCT p.prf_name, p.prf_id, a.th_id FROM 
(SELECT t.th_id FROM theater_seat ts, theater t
WHERE ts.th_uid = t.TH_UID) a, perform p
WHERE a.th_id = p.th_uid AND p.prf_state = '공연중') kk
WHERE t.th_uid = ts.th_uid AND m.USER_ID = 'admin' AND kk.th_id = t.th_id;

SELECT DISTINCT p.prf_name, p.prf_id, a.th_id
FROM (SELECT t.th_id FROM theater_seat ts, theater t
WHERE ts.th_uid = t.TH_UID) a, perform p
WHERE a.th_id = p.th_uid;

SELECT DISTINCT p.prf_name, p.prf_id, a.th_id FROM 
(SELECT t.th_id FROM theater_seat ts, theater t
WHERE ts.th_uid = t.TH_UID) a, perform p
WHERE a.th_id = p.th_uid AND p.prf_state = '공연중';

