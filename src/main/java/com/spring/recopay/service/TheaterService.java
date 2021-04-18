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
	public List<PerformDTO> viewById(String id) {
		// TODO Auto-generated method stub
		return getSession().viewById(id);
	}

	@Override
	public PerformDTO getMapCordXY(String name) {
		// TODO Auto-generated method stub
		return getSession().getMapCordXY(name);
	}

	@Override
	public int insertSeat(String seat, String theaterName, String userId) {
		// TODO Auto-generated method stub
		return getSession().insertSeat(seat, theaterName, userId);
	}


}
