package com.spring.recopay.domain;

import java.util.List;

public interface ReservationDAO {
	int insertBuyingTicket(ReservationDTO dto);
	List<PerformDTO> getAllNotFinishedPerform();
}
