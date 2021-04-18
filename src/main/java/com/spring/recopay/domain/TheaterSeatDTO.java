package com.spring.recopay.domain;

public class TheaterSeatDTO {
	private String seat;
	private int th_uid;
	private int user_uid;
	private String time;
	private String theaterName;
	private int leftSeat;
	

	public int getLeftSeat() {
		return leftSeat;
	}
	public void setLeftSeat(int leftSeat) {
		this.leftSeat = leftSeat;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getTh_uid() {
		return th_uid;
	}
	public void setTh_uid(int th_uid) {
		this.th_uid = th_uid;
	}
	public int getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}
	
	
}
