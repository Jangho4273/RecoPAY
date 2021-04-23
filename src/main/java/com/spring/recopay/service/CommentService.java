package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.CommentDAO;
import com.spring.recopay.domain.CommentDTO;
 
@Service
public class CommentService {
	CommentDAO dao;
	
	@Autowired
	private SqlSession sqlSession;

	public List<CommentDTO> selectCommentByUid(int q_uid){
		dao = sqlSession.getMapper(CommentDAO.class);
		return dao.selectCommentByUid(q_uid);
	}
    
	public int count() {
		dao = sqlSession.getMapper(CommentDAO.class);
		return dao.commentCount();
    }
	
	public int insert(CommentDTO dto) {
		dao = sqlSession.getMapper(CommentDAO.class); // MyBatis 사용 댓글쓰기
		return dao.commentInsert(dto); 
	}
	
	public int update(CommentDTO dto) {
		dao = sqlSession.getMapper(CommentDAO.class); // MyBatis 사용 댓글수정
		return dao.commentUpdate(dto);
	}
	
	public int delete(int [] cno) {
		dao = sqlSession.getMapper(CommentDAO.class); // MyBatis 사용 댓글삭제
		return dao.commentDelete(cno);
	}
}