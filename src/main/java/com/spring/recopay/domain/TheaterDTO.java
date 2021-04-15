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
	
	private float lng; // 위도
	private float lat; // 경도
	private String url; // 홈페이지
	private int totalno; // 전화번호
	private String opendate; // 극장 오픈 일자
	
	
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
	
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getTotalno() {
		return totalno;
	}
	public void setTotalno(int totalno) {
		this.totalno = totalno;
	}
	public String getOpendate() {
		return opendate;
	}
	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}
	
	
}
