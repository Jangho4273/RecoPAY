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

public class PerformStore {
	
//  1. Oracle 연동을 위한 정보들(상수들)을 정의(세팅)
	
	// JDBC 드라이버 클래스 정보
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	
	// DB 서버 접속
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	
	// DB 사용자 계정 정보
	public static final String USER = "recopay";
	public static final String PASSWD = "recopay";
	
	public static final String SQL_INSERT =
			"INSERT INTO " + "Perform " + 
			"(prf_uid, prf_id, prf_name, prf_from, prf_to, prf_fcltynm, prf_poster, prf_state, prf_openrun, th_uid)" + 
					" VALUES(perform_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select 쿼리 결과
		
		
		
		String url = "";
		
		try {
			Class.forName(DRIVER);
			System.out.println("드라이버 클래스 로딩 성공");
			
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			System.out.println("DB Connection 성공");
			
			System.out.println();
			System.out.println("INSERT");
			pstmt = conn.prepareStatement(SQL_INSERT);
						
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			
			for(int i=30; i<71; i++) {
				System.out.println("---page: " + i + "---" );
				url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=de93ee9825c24143a98506d9e7f616bd&stdate=20050101&eddate=20210402&rows=100&cpage="+ i +"&shcate=AAAA";
				Document doc = dBuilder.parse(url);
				doc.getDocumentElement().normalize();
				System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
				
				NodeList nList = doc.getElementsByTagName("db");
				System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수
	
				for(int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						String prf_id  = getTagValue("mt20id", eElement);
						String urls = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + prf_id + "?service=de93ee9825c24143a98506d9e7f616bd";
						doc = dBuilder.parse(urls);
						NodeList nL = doc.getElementsByTagName("db");
						doc.getDocumentElement().normalize();
						Node nN = nL.item(0);
						
						Element eE = (Element) nN;
						
						
						pstmt.setString(1, getTagValue("mt20id", eElement));
						
						pstmt.setString(2, getTagValue("prfnm", eElement));
						pstmt.setString(3, getTagValue("prfpdfrom", eElement));
						pstmt.setString(4, getTagValue("prfpdto", eElement));
						pstmt.setString(5, getTagValue("fcltynm", eElement));
						pstmt.setString(6, getTagValue("poster", eElement));
						pstmt.setString(7, getTagValue("prfstate", eElement));
						pstmt.setString(8, getTagValue("openrun", eElement));
						pstmt.setString(9, getTagValue("mt10id", eE));
						int cnt = pstmt.executeUpdate();
						System.out.println(cnt + "개 행(row) INSERT 성공");
					
					}
				}
			}
		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end

	}
	
	private static String getTagValue(String tag, Element eElement) {
	    
		if(eElement.getElementsByTagName(tag).item(0) == null) {
			return null;
		}	
		else {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) 
		        return null;
		    return nValue.getNodeValue();
		}
	  

	}



}
