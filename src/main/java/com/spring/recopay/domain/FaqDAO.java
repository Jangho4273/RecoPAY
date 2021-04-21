package com.spring.recopay.domain;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface FaqDAO {

	// 새글작성 <-- DTO
	int insert(FaqDTO dto);
	int insert(String title, String content,  String name);
	
	// 글 목록 
	List<FaqDTO> viewlist();

	// 특정 uid 글 내용 읽기,
	List<FaqDTO> viewByUid(int f_uid);
	
	// 특정 uid 글 수정 ( 제목, 내용 )
	int update(int uid, @Param("a")FaqDTO dto);
	
	// 특정 uid 글 삭제하기
	int deleteByUid(int uid);
	
	// 특정 uid 글 조회수 증가
	int incViewCnt(int uid);
	
} // end DAO