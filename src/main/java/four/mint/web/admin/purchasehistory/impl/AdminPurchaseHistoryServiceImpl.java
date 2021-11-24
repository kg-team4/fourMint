package four.mint.web.admin.purchasehistory.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.purchasehistory.AdminPurchaseHistoryService;
import four.mint.web.admin.purchasehistory.AdminPurchaseHistoryVO;

@Service("AdminPurchaseHistoryService")
public class AdminPurchaseHistoryServiceImpl implements AdminPurchaseHistoryService {

	@Autowired
	private AdminPurchaseHistoryDAO adminPurchaseHistoryDAO;
	
	@Override
	public void inserttransactionhistory(AdminPurchaseHistoryVO vo) {
		adminPurchaseHistoryDAO.insertAdminPurchaseHistory(vo);
		
	}

	@Override
	public AdminPurchaseHistoryVO getAdmin(AdminPurchaseHistoryVO vo) {
		AdminPurchaseHistoryVO newVo = adminPurchaseHistoryDAO.getAdminPurchaseHistory(vo);
		return null;
	}

	@Override
	public List<AdminPurchaseHistoryVO> getAdminPurchaseHistoryList() {		
		return adminPurchaseHistoryDAO.getAdminPurchaseHistoryList();
	}
}