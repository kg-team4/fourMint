package four.mint.web.admin.login.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import four.mint.web.admin.login.AdminVO;
import four.mint.web.admin.login.AdminService;


@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdmin(AdminVO vo) {
		System.out.println("====> admin TABLE INSERT one admin");
		sqlSessionTemplate.insert("AdminDAO.insertAdmin", vo);
	}
	
	public AdminVO getAdmin(AdminVO vo) {
		System.out.println("====> member TABLE SELECT one admin");
		
		return (AdminVO)sqlSessionTemplate.selectOne("AdminDAO.getAdmin", vo);
	}		
}
