package four.mint.web.admin.page.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.page.AdminPageVO;

@Repository
public class AdminPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminPage(AdminPageVO vo) {
		System.out.println("관리자멤버관리");
		sqlSessionTemplate.insert("AdminPageDAO.insertAdmin", vo);
	}
	
	public AdminPageVO getAdminPage(AdminPageVO vo) {
		
		return (AdminPageVO)sqlSessionTemplate.selectOne("AdminPageDAO.getAdminPage",vo);
	}
	
	public List<AdminPageVO> getAdminPageList() {
			
		return sqlSessionTemplate.selectList("AdminPageDAO.getAdminPageList");
	}

	public void deleteMember(String nickname) {
		sqlSessionTemplate.delete("AdminPageDAO.deleteMember", nickname);
	}
	
	public AdminPageVO getMemberOne(String nickname) {
		return sqlSessionTemplate.selectOne("AdminPageDAO.getMemberOne", nickname);
	}
}
