package com.spring.recopay.datastore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * 극장정보 DB에 저장(Batch) - ORACLE table도 수정했음 
 * @author aflhzv
 *
 */


public class TheaterStore {

	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		int totalcnt = 0;

		try {
			Class.forName(C.DRIVER);
			System.out.println("드라이버 클래스 로딩 성공");
			
			conn = DriverManager.getConnection(C.URL, C.USER, C.PASSWD);
			System.out.println("DB Connection 성공");

			System.out.println();
			System.out.println("INSERT");
			pstmt = conn.prepareStatement(C.SQL_THEATER_INSERT);

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(C.THEATER_XML_URL);

			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
			
			NodeList nList = doc.getElementsByTagName("db");
			System.out.println("파싱할 리스트 수 : " + nList.getLength()); // 파싱할 리스트 수

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					
					String th_id = getTagValue("mt10id", eElement);
					String urls = "http://www.kopis.or.kr/openApi/restful/prfplc/" + th_id
							+ "?service=" + C.API_KEY;
					
					doc = dBuilder.parse(urls);
					NodeList nL = doc.getElementsByTagName("db");
					doc.getDocumentElement().normalize();
					Element eE = (Element) nL.item(0);

					pstmt.setString(1, getTagValue("mt10id", eElement));
					pstmt.setString(2, getTagValue("fcltynm", eElement));
					pstmt.setString(3, getTagValue("adres", eE));
					pstmt.setString(4, getTagValue("seatscale", eE));
					pstmt.setString(5, getTagValue("telno", eE));
					pstmt.setString(6, getTagValue("fcltychartr", eE));
					
					pstmt.setString(7, getTagValue("lo", eE));
					pstmt.setString(8, getTagValue("la", eE));
					pstmt.setString(9, getTagValue("relateurl", eE));
					pstmt.setString(10, getTagValue("mt13cnt", eE));
					pstmt.setString(11, getTagValue("opende", eE));
					totalcnt += pstmt.executeUpdate();
					System.out.println("총 (" + totalcnt + "/" + C.ROWS + ")개 행(row) INSERT 성공");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end

	}

	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

}
