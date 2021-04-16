package com.spring.recopay.domain;

public class MemberDTO {
	
	private String username;
	private String password;
	private String name;
	private String addr;
	private int call;
	private String emailbf;
	private String emailaf;

	

	public int getCall() {
		return call;
	}
	public void setCall(int call) {
		this.call = call;
	}
	public String getEmailbf() {
		return emailbf;
	}
	public void setEmailbf(String emailbf) {
		this.emailbf = emailbf;
	}
	public String getEmailaf() {
		return emailaf;
	}
	public void setEmailaf(String emailaf) {
		this.emailaf = emailaf;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	

	


	
	
	
}
