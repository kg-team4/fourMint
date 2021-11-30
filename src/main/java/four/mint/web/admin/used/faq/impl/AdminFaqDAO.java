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
		sqlSessionTemplate.insert("AdminFaqDAO.insertAdmin",vo);
	}
	
	
	public List<AdminFaqVO>getAdminFaqList(String category){
		return sqlSessionTemplate.selectList("AdminFaqDAO.getAdminFaqList", category);
	}

	public void faq_delete(int parameter) {
		sqlSessionTemplate.delete("AdminFaqDAO.faq_delete",parameter);
		
	}

	public void update_faq(AdminFaqVO faqVO) {
		sqlSessionTemplate.update("AdminFaqDAO.update_faq",faqVO);
		
	}

}
