package com.spring.recopay.domain;

import java.util.Date;

public class CommentDTO {
 
    private int cno; // 댓글 seq
    private int q_uid; // 게시글 seq
    private String content;
    private String writer;
    private Date reg_date;
    
    
	public int getCno() {
        return cno;
    }
 
    public void setCno(int cno) {
        this.cno = cno;
    }
    
    public int getQ_uid() {
		return q_uid;
	}
    

	public void setQ_uid(int q_uid) {
		this.q_uid = q_uid;
	}
 
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
 
    public String getWriter() {
        return writer;
    }
 
    public void setWriter(String writer) {
        this.writer = writer;
    }
 
    public Date getReg_date() {
        return reg_date;
    }
 
    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
    
}