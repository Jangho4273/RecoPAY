package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.PerformDAO;
import com.spring.recopay.domain.PerformDTO;
import com.spring.recopay.domain.TheaterDAO;

@Service
public class TheaterService implements TheaterDAO{
	
	private SqlSession sqlSession;
	
	public TheaterService(SqlSession sqlSession) {

	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public TheaterDAO getSession() {
		return sqlSession.getMapper(TheaterDAO.class);
	}

	@Override
	public List<PerformDTO> select() {
		// TODO Auto-generated method stub
		return getSession().select();
	}

	@Override
	public List<PerformDTO> viewByUid(int uid) {
		// TODO Auto-generated method stub
		return getSession().viewByUid(uid);
	}


}
