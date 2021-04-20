package com.spring.recopay.domain;

import java.time.LocalDateTime;

public class FaqDTO {


	private int f_uid; // uid
	private String title; // 제목
	private String content; // 내용
	private LocalDateTime uploadtime; // 업로드시간
	private String name; // 작성자
	private int viewcnt; // 조회수
	private int uid;
	private String type; // 유형

	public int getF_uid() {
		return f_uid;
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






	public int getUid() {
		return uid;
	}






	public String getType() {
		return type;
	}






	public void setF_uid(int f_uid) {
		this.f_uid = f_uid;
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






	public void setUid(int uid) {
		this.uid = uid;
	}






	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return String.format("FaqDTO] %d : %s : %s : %s : %s : %d : %d : %s", f_uid, title,
				content, uploadtime, name, viewcnt, uid, type);
	}
	
	
}
