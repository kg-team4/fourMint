package four.mint.web.admin.table.used.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.table.used.AdminUsedVO;

@Repository
public class AdminUsedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertAdminUsed(AdminUsedVO vo) {
		System.out.println("상품관리");
		sqlSessionTemplate.insert("AdminUsedDAO.insertAdmin",vo);
	}
	
	public AdminUsedVO getAdminUsed(AdminUsedVO vo) {
		return(AdminUsedVO)sqlSessionTemplate.selectOne("AdminUsedDAO.getAdminUsed",vo);		
	}
	
	public List<AdminUsedVO>getAdminUsedList(){		
		return sqlSessionTemplate.selectList("AdminUsedDAO.getAdminUsedList");
	}
	
	public void delete(int vo)throws Exception{
		  sqlSessionTemplate.delete("AdminUsedDAO.delete",vo); 	
	}

	public List<AdminUsedVO> orderList() {
		
		return sqlSessionTemplate.selectList("AdminUsedDAO.orderList");
	}	
}