package com.spring.recopay.domain;


public interface MemberDAO {

	void register(MemberDTO dto);

	MemberDTO select();
	
	int checkSignup(String username);
	
//	public int idCheck(String username);
//	void registerMember(MemberDTO memberDTO);
	
	
	
}
