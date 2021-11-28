package four.mint.web.admin.purchasehistory;

import java.util.List;

import four.mint.web.admin.table.used.AdminUsedVO;

public interface AdminPurchaseHistoryService {
	void inserttransactionhistory(AdminPurchaseHistoryVO vo);
	AdminPurchaseHistoryVO getAdmin(AdminPurchaseHistoryVO vo);
	
	List<AdminPurchaseHistoryVO>getAdminPurchaseHistoryList();
	

}
