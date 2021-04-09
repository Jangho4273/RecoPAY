package com.spring.recopay.domain;

public class TheaterDTO {
	private int uid; // DB_uid
	private String id; // api_id
	private String name; // 극장명
	private String location; // 극장 위치
	private String totalseat; // 극장 총 좌석 
	private String state; // 극장 운영 상태 
	private String telno; // 극장 전화번호
	private String chartr; // 극장 특이사항
	
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTotalseat() {
		return totalseat;
	}
	public void setTotalseat(String totalseat) {
		this.totalseat = totalseat;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getChartr() {
		return chartr;
	}
	public void setChartr(String chartr) {
		this.chartr = chartr;
	}
	
	
	
}
