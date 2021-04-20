SELECT * FROM THEATER;
SELECT * FROM PERFORM;
SELECT * FROM theater_seat;




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

