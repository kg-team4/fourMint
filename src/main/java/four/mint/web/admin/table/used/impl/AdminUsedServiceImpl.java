package four.mint.web.admin.table.used.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.table.used.AdminUsedService;
import four.mint.web.admin.table.used.AdminUsedVO;

@Service("adminUsedService")
public class AdminUsedServiceImpl implements AdminUsedService{
	
	@Autowired
	private AdminUsedDAO adminUsedDAO;

	@Override
	public List<AdminUsedVO> getAdminUsedList() {
		
		return adminUsedDAO.getAdminUsedList();
	}

	@Override
	public List<AdminUsedVO> getAdminUsedSellList(int status) {
		
		return adminUsedDAO.getAdminUsedSellList(status);
	}

	@Override
	public List<AdminUsedVO> orderList() {
		
		return adminUsedDAO.orderList();
	}

	@Override
	public void delete(int market_seq) throws Exception {
		adminUsedDAO.delete(market_seq);
	}
}
