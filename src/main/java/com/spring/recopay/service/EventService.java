package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.EventDAO;
import com.spring.recopay.domain.EventDTO;
import com.spring.recopay.domain.PerformDAO;
import com.spring.recopay.domain.TheaterDAO;


@Service
public class EventService implements EventDAO {
	
	private SqlSession sqlSession;
	
	public EventService() {
		
	}

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<EventDTO> selectAllListOrderedByRemaindayAsc() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(EventDAO.class).selectAllListOrderedByRemaindayAsc();
	}

	@Override
	public int setIsfinish() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(EventDAO.class).setIsfinish();
	}

	@Override
	public EventDTO countIsfinished() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(EventDAO.class).countIsfinished();
	}
}
