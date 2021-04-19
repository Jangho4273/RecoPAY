package com.spring.recopay.domain;

import java.util.List;

public interface TheaterDAO {
	List<PerformDTO> select();
	List<PerformDTO> viewById(String id);
	PerformDTO getMapCordXY(String name);
	int insertSeat(String seat, String theaterName,String userId,String time);
	List<TheaterSeatDTO> getAllBookedSeats();
	List<TheaterSeatDTO> getBookedSeatsByNameAndTime(String time, String theaterName);
	List<TheaterSeatDTO> getLeftSeat(String theaterName, String time);
}

