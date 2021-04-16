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
	public static final String SQL_NOTICE_INSERT = 
			"INSERT INTO Notice"
			+ "(notice_uid, notice_title, notice_content, notice_uploadtime, notice_name, notice_viewcnt, notice type) "
			+ "VALUES"
			+ "(notice_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	public static final String SQL_NOTICE_SELECT = 
			"SELECT notice_uid \"uid\", notice_title title, notice_content content, " +
			"notice_uploadtime uploadtime, notice_name name, notice_viewcnt viewcnt, notice_type type" +
			"FROM notice_board ORDER BY notice_uid DESC";
	
	public static final String SQL_NOTICE_SELECT_BY_UID =
			"SELECT notice_uid \"uid\", notice_title title, notice_content content, " +
			"notice_uploadtime uploadtime, notice_name name, notice_viewcnt viewcnt, notice_type type" +
			"FROM notice_board WHERE notice_uid = ?";
	
	public static final String SQL_NOTICE_INC_VIEWCNT = 
			"UPDATE notice_board SET notice_viewcnt = notice_viewcnt + 1 WHERE wr_uid = ?";
	
	public static final String SQL_NOTICE_DELETE_BY_UID =
			"DELETE FROM notice_board WHERE notice_uid = ?";

	public static final String SQL_NOTICE_WRITE_UPDATE =
			"UPDATE notice_board SET notice_title = ?, notice_content = ? WHERE notice_name = ?";
	
}
