package four.mint.web.admin.transactionhistory;

import java.util.ArrayList;
import java.util.List;

public interface AdminTransactionHistoryService {
	
	ArrayList<AdminTransactionHistoryVO> getAdminTransactionHistoryDateList(AdminTransactionHistoryVO vo);

	List<AdminTransactionHistoryVO> orderList();

	

}
