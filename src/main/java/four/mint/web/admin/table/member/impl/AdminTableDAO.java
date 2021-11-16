package four.mint.web.admin.table.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.table.member.AdminTableVO;

@Repository
public class AdminTableDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminTable(AdminTableVO vo) {
		System.out.println("회원목록");
		sqlSessionTemplate.insert("AdminTableDAO.insertAdmin",vo);
	}
	
	public AdminTableVO getAdminTable(AdminTableVO vo) {
		return(AdminTableVO)sqlSessionTemplate.selectOne("AdminTableDAO.getAdminTable",vo);	
	}
	
	public List<AdminTableVO> getAdminTableList(){		
		return sqlSessionTemplate.selectList("AdminTableDAO.getAdminTableList");
	}
	

}
