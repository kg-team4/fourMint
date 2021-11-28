package four.mint.web.admin.transactionhistory.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.transactionhistory.AdminTransactionHistoryVO;
	
@Repository
public class AdminTransactionHistoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<AdminTransactionHistoryVO> getTransitionAllList() {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getTransitionAllList");
	}
	
	public ArrayList<AdminTransactionHistoryVO> getTransitionStatusList(String status) {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getTransitionStatusList", status);
	}
	
	public ArrayList<AdminTransactionHistoryVO> getTransitionCancelList(String pay_cancel) {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getTransitionCancelList", pay_cancel);
	}
	
	public ArrayList<AdminTransactionHistoryVO> getTransitionAllCancelList() {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getTransitionAllCancelList");
	}
	
	public void updatePayCancel(int seq) {
		sqlSessionTemplate.update("AdminTransactionHistoryDAO.updatePayCancel", seq);
	}
	
	public void updateExchangeCount(int seq) {
		sqlSessionTemplate.update("AdminTransactionHistoryDAO.updateExchangeCount", seq);
	}
	
	public void updateStatus(AdminTransactionHistoryVO vo) {
		sqlSessionTemplate.update("AdminTransactionHistoryDAO.updateStatus", vo);
	}
	
	public void updateRefund(int seq) {
		sqlSessionTemplate.update("AdminTransactionHistoryDAO.updateRefund", seq);
	}
	
	public AdminTransactionHistoryVO getSelectOne(int seq) {
		return sqlSessionTemplate.selectOne("AdminTransactionHistoryDAO.getSelectOne", seq);
	}
	
	public ArrayList<String> getStatus() {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getStatus");
	}
	
	public ArrayList<AdminTransactionHistoryVO> getCancelComplete() {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getCancelComplete");
	}
	
	public ArrayList<AdminTransactionHistoryVO> getRefundComplete() {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getRefundComplete");
	}
	
	public ArrayList<AdminTransactionHistoryVO> getCancelRefundComplete() {
		return (ArrayList)sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.getCancelRefundComplete");
	}
	
	public int getTotalPrice() {
		return sqlSessionTemplate.selectOne("AdminTransactionHistoryDAO.getTotalPrice");
	}

	public List<AdminTransactionHistoryVO> orderList() {
		
		return sqlSessionTemplate.selectList("AdminTransactionHistoryDAO.orderList");
	}

	

	

}
