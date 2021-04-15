package com.spring.recopay.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class EventDTO {
	
	private int uid; // UID
	private String title; // 이벤트 제목
	private String contents; // 이벤트 내용
	private String img; // 이벤트 사진
	private int user_uid; // 유저 uid
	private LocalDateTime startdate; // 이벤트 시작 일자
	private LocalDateTime enddate; // 이벤트 종료 일자
	private String isfinish; // 이벤트 종료 여부
	private int remainday; // 이벤트 남은 일 수
	private int remainfromtoday; // 오늘로 부터 남은 이벤트 일 수
	private double percentage;
	
	
	public double getPercentage() {
		double per = (1-(((double)remainfromtoday/(double)remainday)))*100;
		return Math.round(per);
	}
	
	public int getRemainfromtoday() {
		return remainfromtoday;
	}
	public void setRemainfromtoday(int remainfromtoday) {
		this.remainfromtoday = remainfromtoday;
	}
	public int getRemainday() {
		return remainday;
	}
	public void setRemainday(int remainday) {
		this.remainday = remainday;
	}
	public int getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getIsfinish() {
		return isfinish;
	}
	public void setIsfinish(String isfinish) {
		this.isfinish = isfinish;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStartdate() {
		return this.startdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	public void setStartdate(LocalDateTime startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return this.enddate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	public void setEnddate(LocalDateTime enddate) {
		this.enddate = enddate;
	}
}
