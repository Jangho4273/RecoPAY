package com.spring.recopay.domain;


public interface MemberDAO {

	void register(MemberDTO dto);

	MemberDTO select();
	
//	public int idCheck(String username);
//	void registerMember(MemberDTO memberDTO);
	
	
	
}
