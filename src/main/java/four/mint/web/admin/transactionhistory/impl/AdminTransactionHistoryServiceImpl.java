package four.mint.web.admin.transactionhistory.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.transactionhistory.AdminTransactionHistoryService;
import four.mint.web.admin.transactionhistory.AdminTransactionHistoryVO;

@Service("AdminTransactionHistoryService")
public class AdminTransactionHistoryServiceImpl implements AdminTransactionHistoryService {

	@Autowired
	private AdminTransactionHistoryDAO adminTransactionHistoryDAO;

	@Override
	public ArrayList<AdminTransactionHistoryVO> getAdminTransactionHistoryDateList(AdminTransactionHistoryVO vo) {		
		return (ArrayList)adminTransactionHistoryDAO.getAdminTransactionHistoryDateList(vo);
	}
	
}
