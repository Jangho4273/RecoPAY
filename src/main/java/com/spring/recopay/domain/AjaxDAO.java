package com.spring.recopay.domain;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface AjaxDAO {
	
	/**
	 * 페이징용 SELECT
	 * @param from 몇번째 row 부터
	 * @param pageRows 몇개의 데이터(게시글)
	 * @return
	 */
	public List<WriteDTO> selectFromRow(
			@Param("from") int from,
			@Param("pageRows") int pageRows);

	// 전체 글의 개수
	public int countAll();
	
	// 글 읽기
	public List<WriteDTO> selectByUid(int uid);
	// 조회수 증가
	public int incViewCnt(int uid);
	
	// 글작성
	public int insert(WriteDTO dto);
	
	// 글수정
	public int update(WriteDTO dto);
	
	// 특정 uid 글(들) 삭제하기
	public int deleteByUid(int [] uids);
	
	public List<WriteDTO> getPrfnames(String prfname);

	public List<WriteDTO> getPrfnames1(String prfname);
}
