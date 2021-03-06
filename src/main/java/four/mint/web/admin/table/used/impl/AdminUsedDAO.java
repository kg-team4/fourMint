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
	
	public List<AdminUsedVO> getAdminUsedList(){
		
		return sqlSessionTemplate.selectList("AdminUsedDAO.getAdminUsedList");
	}
	
	public List<AdminUsedVO> getAdminUsedSellList(int status){
		
		return sqlSessionTemplate.selectList("AdminUsedDAO.getAdminUsedSellList", status);
	}

	public void delete(int market_seq) {
		sqlSessionTemplate.delete("AdminUsedDAO.delete", market_seq); 
	}
	
	public List<AdminUsedVO> orderList() {
		
		return sqlSessionTemplate.selectList("AdminUsedDAO.orderList");
	}

	public int usedCount() {
		return sqlSessionTemplate.selectOne("AdminUsedDAO.usedCount");
	}	
}
