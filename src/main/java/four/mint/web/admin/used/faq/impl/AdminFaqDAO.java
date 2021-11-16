package four.mint.web.admin.used.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.used.faq.AdminFaqVO;

@Repository
public class AdminFaqDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminFaq(AdminFaqVO vo) {
		System.out.println("FAQ");
		sqlSessionTemplate.insert("AdminFaqDAO.insertAdmin",vo);
	}
	
	public AdminFaqVO getAdminFaq(AdminFaqVO vo) {
		return(AdminFaqVO)sqlSessionTemplate.selectOne("AdminFaqDAO.getAdminFaq",vo);							
	}
	
	public List<AdminFaqVO>getAdminFaqList(){
		
		return sqlSessionTemplate.selectList("AdminFaqDAO.getAdminFaqList");
	}

}
