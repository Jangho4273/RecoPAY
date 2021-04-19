package com.spring.recopay.domain;

public class PerformDTO {
	
	private int uid;
	private String id		;
	private String name	    ;
    private String from	    ;
    private String to		;
	private String fcltynm  ;
	private String poster	;
	private String state	;
	private String openrun  ;
    private String tuid		;
    private String ticketprice; // 티켓 가격
    private String runday; // 상영되는 요일-시간  ex) 월요일~금요일(14:30)
    private String runtime; // 총 상영 시간 ex) 1시간 30분 

    
	public String getTicketprice() {
		return ticketprice;
	}
	public void setTicketprice(String ticketprice) {
		this.ticketprice = ticketprice;
	}
	public String getRunday() {
		return runday;
	}
	public void setRunday(String runday) {
		this.runday = runday;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
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
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getOpenrun() {
		return openrun;
	}
	public void setOpenrun(String openrun) {
		this.openrun = openrun;
	}
	public String getTuid() {
		return tuid;
	}
	public void setTuid(String tuid) {
		this.tuid = tuid;
	}
    
    
    
}
	

