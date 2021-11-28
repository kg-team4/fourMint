package four.mint.web.admin.purchasehistory.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import four.mint.web.admin.purchasehistory.AdminPurchaseHistoryVO;
import four.mint.web.admin.table.used.AdminUsedVO;

@Repository
public class AdminPurchaseHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminPurchaseHistory(AdminPurchaseHistoryVO vo) {
		System.out.println("거래내역");
		sqlSessionTemplate.insert("AdminPurchaseHistoryDAO.insertAdmin",vo);
	}
	
	public AdminPurchaseHistoryVO getAdminPurchaseHistory(AdminPurchaseHistoryVO vo) {
		return (AdminPurchaseHistoryVO)sqlSessionTemplate.selectOne("AdminPurchaseHistoryDAO.getAdminPurchaseHistory",vo);		
	}
	
	public List<AdminPurchaseHistoryVO>getAdminPurchaseHistoryList(){
		return sqlSessionTemplate.selectList("AdminPurchaseHistoryDAO.getAdminPurchaseHistoryList");
	}

	


}
