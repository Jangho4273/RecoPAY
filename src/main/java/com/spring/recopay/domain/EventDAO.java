package com.spring.recopay.domain;

import java.util.List;

public interface EventDAO {
	List<EventDTO> selectAllListOrderedByRemaindayAsc();
}
