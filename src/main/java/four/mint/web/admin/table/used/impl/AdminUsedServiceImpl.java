package four.mint.web.admin.table.used.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.table.used.AdminUsedService;
import four.mint.web.admin.table.used.AdminUsedVO;

@Service("adminUsedService")
public class AdminUsedServiceImpl implements AdminUsedService{
	
	@Autowired
	private AdminUsedDAO adminUsedDao;

	@Override
	public void insertmarketboard(AdminUsedVO vo) {
		adminUsedDao.insertAdminUsed(vo);		
	}

	@Override
	public AdminUsedVO getAdmin(AdminUsedVO vo) {
		AdminUsedVO newVo = adminUsedDao.getAdminUsed(vo);
		return null;
	}

	@Override
	public List<AdminUsedVO> getAdminUsedList() {
		
		return adminUsedDao.getAdminUsedList();
	}

	@Override
	public void delete(int vo) throws Exception {
		adminUsedDao.delete(vo);
		
	}

	@Override
	public List<AdminUsedVO> orderList() {
		
		return adminUsedDao.orderList();
	}	
}
