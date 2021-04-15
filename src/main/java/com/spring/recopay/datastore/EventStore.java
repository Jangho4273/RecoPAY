package com.spring.recopay.datastore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

/**
 * CREATE TABLE Event_Board ( event_uid number NOT NULL, event_title
 * varchar2(200) NOT NULL, event_contents varchar2(2000) NOT NULL, event_img
 * varchar2(500) NULL, user_uid number NOT NULL, event_startdate date NULL,
 * event_enddate date NULL, event_isfinish char(1) NULL );
 * 
 * @author aflhzv
 *
 */

public class EventStore {

	public static void main(String[] args) {
		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int totalcnt = 0;

			Class.forName(C.DRIVER);
			System.out.println("드라이버 클래스 로딩 성공");

			conn = DriverManager.getConnection(C.URL, C.USER, C.PASSWD);
			System.out.println("DB Connection 성공");

			System.out.println();
			System.out.println("INSERT");
			pstmt = conn.prepareStatement(C.SQL_EVENT_INSERT);

			for (int i = 0; i < C.EVENT_ROWS; i++) {
				pstmt.setString(1, "TestTitle" + i);
				pstmt.setString(2, "대충 할인 이벤트를 진행하고 있다는 내용" + i);
				pstmt.setString(3, C.EVENT_TEST_URL);
				pstmt.setString(4, getRandomDate("2021-03-01", "2021-04-01")); // 이벤트 시작 랜덤 날짜
				pstmt.setString(5, getRandomDate("2021-04-04", "2021-05-05")); // 이벤트 끝 랜덤 날짜
				pstmt.setString(6, getRandomNum(0, 1,totalcnt)); // isfinish -> 0 : 이벤트 중 1 : 이벤트 끝

				totalcnt += pstmt.executeUpdate();
				System.out.println("총 (" + totalcnt + "/" + C.EVENT_ROWS + ")개 행(row) INSERT 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end
	}

	private static String getRandomDate(String startDay, String endDay) {
		LocalDate fromDay = LocalDate.of(Integer.parseInt(startDay.substring(0, 4)),
				Integer.parseInt(startDay.substring(5, 7)), Integer.parseInt(startDay.substring(8, 10)));
		LocalDate toDay = LocalDate.of(Integer.parseInt(endDay.substring(0, 4)),
				Integer.parseInt(endDay.substring(5, 7)), Integer.parseInt(endDay.substring(8, 10)));

		LocalDate randDay = fromDay
				.plusDays((long) (Math.random() * 10000) % (toDay.toEpochDay() - fromDay.toEpochDay()));

		return randDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	private static String getRandomNum(int startNo, int endNo, int totalcnt) {
		if(totalcnt % 2 == 1) {
			return "0";
		} else {
			return "1";
		}
	}

}
