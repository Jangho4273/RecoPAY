package com.spring.recopay.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class ReservationDTO {
	private String id;	//공연예매번호
	private LocalDateTime prfdate;	//공연예매날짜
	private String title;  //구매한 공연 제목
	private int payment;    // 결재 금액 
	private int user_uid;	//회원UID
	private int nm_uid; 	//비회원 UID
	private char isfinish;
	private char iscancel;	//예매취소여부
	private String seat;	//공연좌석
	private int uid;		//공연일정번호
	private int ticketnum; // 구매한 티켓 갯수
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public LocalDateTime getPrfdate() {
		return prfdate;
	}
	public void setPrfdate(LocalDateTime prfdate) {
		this.prfdate = prfdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}
	public int getNm_uid() {
		return nm_uid;
	}
	public void setNm_uid(int nm_uid) {
		this.nm_uid = nm_uid;
	}
	public char getIsfinish() {
		return isfinish;
	}
	public void setIsfinish(char isfinish) {
		this.isfinish = isfinish;
	}
	public char getIscancel() {
		return iscancel;
	}
	public void setIscancel(char iscancel) {
		this.iscancel = iscancel;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getTicketnum() {
		return ticketnum;
	}
	public void setTicketnum(int ticketnum) {
		this.ticketnum = ticketnum;
	}
	
	
	
	
}
