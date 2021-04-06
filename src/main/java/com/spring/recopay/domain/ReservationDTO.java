package com.spring.recopay.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class ReservationDTO {
	private String res_number;	//공연예매번호
	private LocalDateTime res_date;	//공연예매날짜
	private int res_visit;	//관람인원수
	private int res_paycost;	//결제금액
	private int user_uid;	//회원UID
	private int nm_uid; 	//비회원 UID
	private char res_isCancel;	//예매취소여부
	private String res_seat;	//공연좌석
	private int tt_uid;		//공연일정번호
	
	public ReservationDTO() {
		super();
	}
	
	public ReservationDTO(String res_number, LocalDateTime res_date, int res_visit, int res_paycost, int user_uid,
			int nm_uid, char res_isCancel, String res_seat, int tt_uid) {
		super();
		this.res_number = res_number;
		this.res_date = res_date;
		this.res_visit = res_visit;
		this.res_paycost = res_paycost;
		this.user_uid = user_uid;
		this.nm_uid = nm_uid;
		this.res_isCancel = res_isCancel;
		this.res_seat = res_seat;
		this.tt_uid = tt_uid;
	}
	public String getRes_number() {
		return res_number;
	}
	public void setRes_number(String res_number) {
		this.res_number = res_number;
	}
	public String getRes_date() {
		return this.res_date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
	}
	public void setRes_date(LocalDateTime res_date) {
		this.res_date = res_date;
	}
	public int getRes_visit() {
		return res_visit;
	}
	public void setRes_visit(int res_visit) {
		this.res_visit = res_visit;
	}
	public int getRes_paycost() {
		return res_paycost;
	}
	public void setRes_paycost(int res_paycost) {
		this.res_paycost = res_paycost;
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
	public char getRes_isCancel() {
		return res_isCancel;
	}
	public void setRes_isCancel(char res_isCancel) {
		this.res_isCancel = res_isCancel;
	}
	public String getRes_seat() {
		return res_seat;
	}
	public void setRes_seat(String res_seat) {
		this.res_seat = res_seat;
	}
	public int getTt_uid() {
		return tt_uid;
	}
	public void setTt_uid(int tt_uid) {
		this.tt_uid = tt_uid;
	}

	@Override
	public String toString() {
		return String.format("ReservationDTO] %s : %s : %d : %d : %d : %d : %s : %s : %d", res_number , res_date, res_visit, res_paycost, user_uid, nm_uid, res_isCancel, res_seat, tt_uid);
	}
	
}
