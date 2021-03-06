package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.PerformDAO;
import com.spring.recopay.domain.PerformDTO;
import com.spring.recopay.domain.TheaterDAO;
import com.spring.recopay.domain.TheaterDTO;
import com.spring.recopay.domain.TheaterSeatDTO;

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
	public TheaterDTO getMapCordXY(int uid) {
		// TODO Auto-generated method stub
		return getSession().getMapCordXY(uid);
	}

	@Override
	public int insertSeat(String seat, String theaterName, String userId, String time) {
		// TODO Auto-generated method stub
		return getSession().insertSeat(seat, theaterName, userId,time);
	}

	@Override
	public List<TheaterSeatDTO> getAllBookedSeats() {
		// TODO Auto-generated method stub
		return getSession().getAllBookedSeats();
	}

	@Override
	public List<TheaterSeatDTO> getBookedSeatsByNameAndTime(String time, String theaterName) {
		// TODO Auto-generated method stub
		return getSession().getBookedSeatsByNameAndTime(time, theaterName);
	}

	@Override
	public List<TheaterSeatDTO> getLeftSeat(int uid) {
		// TODO Auto-generated method stub
		return getSession().getLeftSeat(uid);
	}

	@Override
	public TheaterSeatDTO getTotalSeatByUid(int uid) {
		// TODO Auto-generated method stub
		return getSession().getTotalSeatByUid(uid);
	}

}
