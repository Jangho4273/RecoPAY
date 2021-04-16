package com.spring.recopay.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.MemberDAO;
import com.spring.recopay.domain.MemberDTO;

@Service
public class MemberService {
	
	private SqlSession sqlSession;
	
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
//	@Autowired
//	private MemberDAO memberDAO;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberService() {
	}


	public MemberDAO sessionGet() {
		return sqlSession.getMapper(MemberDAO.class);
	}
	
	//회원가입
	public void register(MemberDTO memberDTO) throws Exception{
		sessionGet().register(memberDTO);
	}
	
//	//login
//	public MemberDTO login(MemberDTO memberDTO) throws Exception{
//		return sessionGet().select();
//	}
//	
//	
//	//encoding
//	public void registerMember(MemberDTO memberDTO) {
//		
//		System.out.println("Before Encoder : " + memberDTO.getPassword());
//		String endcodedPassword = bcryptPasswordEncoder.encode(memberDTO.getPassword());
//		System.out.println("After Encoder : " + endcodedPassword);
//		System.out.println("Resister : " + memberDTO);
//        
//		memberDTO.setPassword(endcodedPassword);	
//		memberDAO.registerMember(memberDTO);
//		
//	}
	
	
	
	
}
