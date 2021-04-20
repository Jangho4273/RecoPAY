package com.spring.recopay.domain;

public class TheaterSeatDTO {
	
	private int totalSeat;
	private String seat;
	private int th_uid;
	private int user_uid;
	private int prf_uid;
	private String time;
	private String theaterName;
	private String leftSeat;
	private String bookedSeat;
	
	
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}
	
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
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
	public int getPrf_uid() {
		return prf_uid;
	}
	public void setPrf_uid(int prf_uid) {
		this.prf_uid = prf_uid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getLeftSeat() {
		return leftSeat;
	}
	public void setLeftSeat(String leftSeat) {
		this.leftSeat = leftSeat;
	}
	public String getBookedSeat() {
		return bookedSeat;
	}
	public void setBookedSeat(String bookedSeat) {
		this.bookedSeat = bookedSeat;
	}
	
	
	
	
}
