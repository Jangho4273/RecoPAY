package com.spring.recopay.domain;

import java.util.List;

public interface PerformDAO {
	List<PerformDTO> select();
	List<PerformDTO> viewByUid(int uid);
	List<RecoDTO> recByUser(String userid);
}
