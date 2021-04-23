package com.spring.recopay.domain;

import java.util.List;
import org.mybatis.spring.annotation.MapperScan;
 
@MapperScan
public interface CommentDAO {
    // 댓글 개수
    public int commentCount();
 
    // 댓글 목록
    public List<CommentDTO> selectCommentByUid(int q_uid);
 
    // 댓글 작성
    public int commentInsert(CommentDTO comment);
    
    // 댓글 수정
    public int commentUpdate(CommentDTO comment);
 
    // 댓글 삭제
    public int commentDelete(int [] cno);
 
}