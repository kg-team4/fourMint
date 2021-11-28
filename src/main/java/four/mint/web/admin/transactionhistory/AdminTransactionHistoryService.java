package four.mint.web.admin.transactionhistory;

import java.util.ArrayList;

public interface AdminTransactionHistoryService {
	
	ArrayList<AdminTransactionHistoryVO> getTransitionAllList();
	ArrayList<AdminTransactionHistoryVO> getTransitionStatusList(String status);
	ArrayList<AdminTransactionHistoryVO> getTransitionCancelList(String pay_cancel);
	ArrayList<AdminTransactionHistoryVO> getTransitionAllCancelList();
	void updatePayCancel(int seq);
	void updateExchangeCount(int seq);
	void updateStatus(AdminTransactionHistoryVO vo);
	void updateRefund(int seq);
	AdminTransactionHistoryVO getSelectOne(int seq);
	ArrayList<String> getStatus();
	ArrayList<AdminTransactionHistoryVO> getCancelComplete();
	ArrayList<AdminTransactionHistoryVO> getRefundComplete();
	ArrayList<AdminTransactionHistoryVO> getCancelRefundComplete();
	int getTotalPrice();
}
