package four.mint.web.admin.transactionhistory.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.transactionhistory.AdminTransactionHistoryVO;
	
@Repository
public class AdminTransactionHistoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<AdminTransactionHistoryVO> getAdminTransactionHistoryDateList(AdminTransactionHistoryVO vo) {
		return (ArrayList)sqlSessionTemplate.selectList("AdminPurchaseHistoryDAO.getAdminTransactionHistoryDateList", vo);
	}

}
