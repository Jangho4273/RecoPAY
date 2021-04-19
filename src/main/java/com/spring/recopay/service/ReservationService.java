package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.PerformDAO;
import com.spring.recopay.domain.PerformDTO;
import com.spring.recopay.domain.ReservationDAO;
import com.spring.recopay.domain.ReservationDTO;

@Service
public class ReservationService implements ReservationDAO {

	private SqlSession sqlSession;
	
	public ReservationService() {
		
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int insertBuyingTicket(ReservationDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(ReservationDAO.class).insertBuyingTicket(dto);
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
	

}
