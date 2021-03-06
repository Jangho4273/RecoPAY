package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.PerformDAO;
import com.spring.recopay.domain.PerformDTO;
import com.spring.recopay.domain.RecoDTO;

@Service
public class PerformService {
	private SqlSession sqlSession;

	public PerformService() {
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PerformDAO sessionGet() {
		return sqlSession.getMapper(PerformDAO.class);
	}
	
	public List<PerformDTO> list() {
		return sessionGet().select();
	}

	public List<PerformDTO> viewByUid(int uid) {
		return sessionGet().viewByUid(uid);
	}
	
	public List<RecoDTO> recByUser(String userid) {
		return sessionGet().recByUser(userid);
	}
	
}
