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
	
	public void delete(int vo)throws Exception{
		  sqlSessionTemplate.delete("AdminUsedDAO.delete",vo); 	
	}

	public List<AdminUsedVO> orderList() {
		
		return sqlSessionTemplate.selectList("AdminUsedDAO.orderList");
	}	
}
