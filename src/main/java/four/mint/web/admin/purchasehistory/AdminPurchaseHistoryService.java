package four.mint.web.admin.purchasehistory;

import java.util.List;

public interface AdminPurchaseHistoryService {
	void inserttransactionhistory(AdminPurchaseHistoryVO vo);
	AdminPurchaseHistoryVO getAdmin(AdminPurchaseHistoryVO vo);
	
	List<AdminPurchaseHistoryVO>getAdminPurchaseHistoryList();

}
