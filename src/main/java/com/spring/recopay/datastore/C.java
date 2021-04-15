package com.spring.recopay.datastore;

public class C {
	
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USER = "recopay";
	public static final String PASSWD = "recopay";
	
	public static final String API_KEY = "b9540b392fb0493c963e4b00ad293087";
	
	
	public static final int THEATER_ROWS = 1200;
	public static final int EVENT_ROWS = 100;
	
	public static final String THEATER_XML_URL = "http://www.kopis.or.kr/openApi/restful/prfplc?service="
			+ API_KEY + "&cpage=1&rows=" + THEATER_ROWS;

	public static final String SQL_THEATER_INSERT = "INSERT INTO Theater "
			+ "(th_uid, th_id, th_name, th_location, th_totalseat, th_telno, th_chartr, th_lng, th_lat, th_url, th_totalno, th_opendate)"
			+ " VALUES(theater_seq.nextval, ?, ?, ?, ?, ?, ?,?,?,?,?,?)";
	
	public static final String SQL_EVENT_INSERT = "INSERT INTO Event_Board  (event_uid, event_title ,"
			+ " event_contents, event_img ,user_uid , event_startdate , event_enddate , event_isfinish) "
			+ "VALUES (event_seq.nextval, ?, ?, ?, 0, to_date(?,'YYYY-MM-DD'), to_date(?,'YYYY-MM-DD'), ?)";
	
	public static final String EVENT_TEST_URL = "http://hakchon.co.kr/wp-content/uploads/2019/05/%EA%B5%BF%EB%B0%94%EC%9D%B4%EC%9D%B4%EB%B2%A4%ED%8A%B8again%ED%95%99%EC%A0%84%EA%B9%80%EA%B4%91%EC%84%9D.jpg";
	
}
