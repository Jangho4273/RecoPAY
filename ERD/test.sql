SELECT * FROM THEATER;
SELECT * FROM PERFORM;
SELECT * FROM theater_seat;




SELECT PRF_NAME FROM PERFORM p
WHERE p.th_uid = (SELECT t.th_id FROM theater_seat ts, theater t
WHERE ts.th_uid = t.TH_UID AND ROWNUM = 1) AND p.PRF_STATE = '공연중';


SELECT t.th_name, t.TH_LOCATION , ts.seat_num, ts.prf_time, kk.prf_name FROM theater t, theater_seat ts, MEMBER m,
(SELECT PRF_NAME FROM PERFORM p
WHERE p.th_uid = (SELECT t.th_id FROM theater_seat ts, theater t
WHERE ts.th_uid = t.TH_UID AND ROWNUM = 1) AND p.PRF_STATE = '공연중') kk
WHERE t.th_uid = ts.th_uid AND m.USER_ID  = 'admin';

