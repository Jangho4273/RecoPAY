package com.spring.recopay.domain;

import java.time.LocalDateTime;

public class QnaDTO {


	private int q_uid; // uid
	private int uid;
	private String title; // 제목
	private String content; // 내용
	private LocalDateTime uploadtime; // 업로드시간
	private String name; // 작성자
	private int viewcnt; // 조회수
	private String answer; // 유형

	public int getQ_uid() {
		return q_uid;
	}



	public int getUid() {
		return uid;
	}



	public String getTitle() {
		return title;
	}



	public String getContent() {
		return content;
	}



	public LocalDateTime getUploadtime() {
		return uploadtime;
	}



	public String getName() {
		return name;
	}



	public int getViewcnt() {
		return viewcnt;
	}



	public String getAnswer() {
		return answer;
	}



	public void setQ_uid(int q_uid) {
		this.q_uid = q_uid;
	}



	public void setUid(int uid) {
		this.uid = uid;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public void setUploadtime(LocalDateTime uploadtime) {
		this.uploadtime = uploadtime;
	}



	public void setName(String name) {
		this.name = name;
	}



	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	@Override
	public String toString() {
		return String.format("FaqDTO] %d : %s : %s : %s : %s : %d : %d : %s", q_uid, title,
				content, uploadtime, name, viewcnt, uid, answer);
	}
	
}
