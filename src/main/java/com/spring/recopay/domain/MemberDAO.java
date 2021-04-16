package com.spring.recopay.domain;


public interface MemberDAO {

	void register(MemberDTO dto);

	MemberDTO select();

//	void registerMember(MemberDTO memberDTO);
	
	
	
}
