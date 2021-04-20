package com.spring.recopay.domain;

public class MemberDTO {
	
	private String username;
	private String password;
	private String name;
	private String addr2;
	private int call;
	private String emailbf;

	

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
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}



	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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
