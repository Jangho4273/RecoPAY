package com.spring.recopay.domain;

import java.util.List;

public interface TheaterDAO {
	List<PerformDTO> select();
	List<PerformDTO> viewById(String id);
}
