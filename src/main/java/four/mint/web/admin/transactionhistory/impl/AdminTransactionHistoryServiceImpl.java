package four.mint.web.admin.transactionhistory.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.transactionhistory.AdminTransactionHistoryService;
import four.mint.web.admin.transactionhistory.AdminTransactionHistoryVO;

@Service("AdminTransactionHistoryService")
public class AdminTransactionHistoryServiceImpl implements AdminTransactionHistoryService {

	@Autowired
	private AdminTransactionHistoryDAO adminTransactionHistoryDAO;

	@Override
	public ArrayList<AdminTransactionHistoryVO> getTransitionAllList() {
		return adminTransactionHistoryDAO.getTransitionAllList();
	}

	@Override
	public ArrayList<AdminTransactionHistoryVO> getTransitionStatusList(String status) {
		return adminTransactionHistoryDAO.getTransitionStatusList(status);
	}

	@Override
	public ArrayList<AdminTransactionHistoryVO> getTransitionCancelList(String pay_cancel) {
		return adminTransactionHistoryDAO.getTransitionCancelList(pay_cancel);
	}

	@Override
	public ArrayList<AdminTransactionHistoryVO> getTransitionAllCancelList() {
		return adminTransactionHistoryDAO.getTransitionAllCancelList();
	}

	@Override
	public void updatePayCancel(int seq) {
		adminTransactionHistoryDAO.updatePayCancel(seq);
	}

	@Override
	public void updateExchangeCount(int seq) {
		adminTransactionHistoryDAO.updateExchangeCount(seq);
	}

	@Override
	public void updateStatus(AdminTransactionHistoryVO vo) {
		adminTransactionHistoryDAO.updateStatus(vo);
	}

	@Override
	public void updateRefund(int seq) {
		adminTransactionHistoryDAO.updateRefund(seq);
	}

	@Override
	public AdminTransactionHistoryVO getSelectOne(int seq) {
		return adminTransactionHistoryDAO.getSelectOne(seq);
	}

	@Override
	public ArrayList<String> getStatus() {
		return adminTransactionHistoryDAO.getStatus();
	}

	@Override
	public ArrayList<AdminTransactionHistoryVO> getCancelComplete() {

		return adminTransactionHistoryDAO.getCancelComplete();
	}

	@Override
	public ArrayList<AdminTransactionHistoryVO> getRefundComplete() {
		return adminTransactionHistoryDAO.getRefundComplete();
	}

	@Override
	public ArrayList<AdminTransactionHistoryVO> getCancelRefundComplete() {
		return adminTransactionHistoryDAO.getCancelRefundComplete();
	}

	@Override
	public List<AdminTransactionHistoryVO> orderList() {

		return adminTransactionHistoryDAO.orderList();
	}
	
	@Override
	public int getTotalPrice() {
		return adminTransactionHistoryDAO.getTotalPrice();
	}

	@Override
	public ArrayList<AdminTransactionHistoryVO> getCountTopFive() {
		return adminTransactionHistoryDAO.getCountTopFive();
	}
}
