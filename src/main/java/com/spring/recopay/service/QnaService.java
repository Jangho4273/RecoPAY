package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.recopay.domain.QnaDAO;
import com.spring.recopay.domain.QnaDTO;


@Service
public class QnaService implements QnaDAO{

	QnaDAO dao;
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 테스트 출력
	public QnaService() {
		super();
		System.out.println("QnaService() 생성");
	}
	
	// 글쓰기 
	public int write(QnaDTO dto) {
		dao = sqlSession.getMapper(QnaDAO.class);
		
		int result = dao.insert(dto);
		System.out.println("생성된 uid 는 " + dto.getQ_uid());
		return result;
		
		//return dao.insert(dto.getSubject(), dto.getContent(), dto.getName());
	}
	
	//@Transactional
	public List<QnaDTO> viewByUid(int q_uid){
		// ※사실, 트랜잭션은 여기서 발생해야 한다.
		//  1. 조회수 증가    :   incViewCnt()
		//  2. 글 하나 읽어오기 :  selectByUid()
		
		dao = sqlSession.getMapper(QnaDAO.class); // MyBatis 사용
		dao.incViewCnt(q_uid);
		
		return dao.viewByUid(q_uid);
	}
	
	public int update(QnaDTO dto) {
		dao = sqlSession.getMapper(QnaDAO.class); // MyBatis 사용
	
		return dao.update(dto.getQ_uid(), dto);
	}
	
	public int deleteByUid(int uid) {
		dao = sqlSession.getMapper(QnaDAO.class); // MyBatis 사용
		return dao.deleteByUid(uid);				
	}

	@Override
	public int insert(QnaDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(String title, String content, String name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QnaDTO> viewlist() {
	dao = sqlSession.getMapper(QnaDAO.class); // MyBatis 사용
	return dao.viewlist();

	}

	@Override
	public int incViewCnt(int uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(int uid, QnaDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}










