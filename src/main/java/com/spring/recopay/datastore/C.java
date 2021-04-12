package com.spring.recopay.datastore;

public class C {
	
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USER = "recopay";
	public static final String PASSWD = "recopay";
	
	public static final String API_KEY = "b9540b392fb0493c963e4b00ad293087";
	
	
	public static final String ROWS = "1200";
	
	public static final String THEATER_XML_URL = "http://www.kopis.or.kr/openApi/restful/prfplc?service="
			+ API_KEY + "&cpage=1&rows=" + ROWS;

	public static final String SQL_THEATER_INSERT = "INSERT INTO Theater "
			+ "(th_uid, th_id, th_name, th_location, th_totalseat, th_telno, th_chartr, th_lng, th_lat, th_url, th_totalno, th_opendate)"
			+ " VALUES(theater_seq.nextval, ?, ?, ?, ?, ?, ?,?,?,?,?,?)";
}
