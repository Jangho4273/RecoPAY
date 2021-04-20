package com.spring.recopay.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recopay.domain.ServiceCenterDAO;
import com.spring.recopay.domain.ServiceCenterDTO;


@Service
public class ServiceCenterService implements ServiceCenterDAO{

	ServiceCenterDAO dao;
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 테스트 출력
	public ServiceCenterService() {
		super();
		System.out.println("ServiceCenterService() 생성");
	}
	
	// 글쓰기 
	public int write(ServiceCenterDTO dto) {
		dao = sqlSession.getMapper(ServiceCenterDAO.class);
		
		int result = dao.insert(dto);
		System.out.println("생성된 uid 는 " + dto.getUid());
		return result;
		
		//return dao.insert(dto.getSubject(), dto.getContent(), dto.getName());
	}
	
	//@Transactional
	public List<ServiceCenterDTO> viewByUid(int n_uid){
		// ※사실, 트랜잭션은 여기서 발생해야 한다.
		//  1. 조회수 증가    :   incViewCnt()
		//  2. 글 하나 읽어오기 :  selectByUid()
		
		dao = sqlSession.getMapper(ServiceCenterDAO.class); // MyBatis 사용
		dao.incViewCnt(n_uid);
		
		return dao.viewByUid(n_uid);
	}
	
	public int update(ServiceCenterDTO dto) {
		dao = sqlSession.getMapper(ServiceCenterDAO.class); // MyBatis 사용
	
		return dao.update(dto.getN_uid(), dto);
	}
	
	public int deleteByUid(int uid) {
		dao = sqlSession.getMapper(ServiceCenterDAO.class); // MyBatis 사용
		return dao.deleteByUid(uid);				
	}

	@Override
	public int insert(ServiceCenterDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(String title, String content, String name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ServiceCenterDTO> viewlist() {
	dao = sqlSession.getMapper(ServiceCenterDAO.class); // MyBatis 사용
	return dao.viewlist();

	}

	@Override
	public int incViewCnt(int uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(int uid, ServiceCenterDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}










