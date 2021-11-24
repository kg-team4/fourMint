package four.mint.web.admin.page.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.page.AdminMemberListVO;
import four.mint.web.admin.page.AdminPageVO;
import four.mint.web.admin.table.member.AdminTableVO;

@Repository
public class AdminPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminPage(AdminPageVO vo) {
		System.out.println("멤버관리");
		sqlSessionTemplate.insert("AdminPageDAO.insertAdmin",vo);
	}
	
	public AdminPageVO getAdminPage(AdminPageVO vo) {
		
		return (AdminPageVO)sqlSessionTemplate.selectOne("AdminPageDAO.getAdminPage",vo);
	}
	
	public List<AdminPageVO> getAdminPageList() {
			
		return sqlSessionTemplate.selectList("AdminPageDAO.getAdminPageList");
	}
	
	
	public List<AdminTableVO> getAdminTableList() {
			
		return sqlSessionTemplate.selectList("AdminTableDAO.getAdminTableList");
	}

	public List<AdminMemberListVO> getAdminMemberList() {
		
		return sqlSessionTemplate.selectList("AdminPageDAO.getAdminPageList");
	
	}
	
}



