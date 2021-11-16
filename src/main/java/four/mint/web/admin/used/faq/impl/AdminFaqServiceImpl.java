package four.mint.web.admin.used.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.used.faq.AdminFaqService;
import four.mint.web.admin.used.faq.AdminFaqVO;

@Service("adminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService {
	
	@Autowired
	private AdminFaqDAO adminFaqDao;

	@Override
	public void insertfaq(AdminFaqVO vo) {
		adminFaqDao.insertAdminFaq(vo);		
	}

	@Override
	public AdminFaqVO getAdmin(AdminFaqVO vo) {
		AdminFaqVO newVo = adminFaqDao.getAdminFaq(vo);
		return null;
	}

	@Override
	public List<AdminFaqVO> getAdminFaqList() {
		
		return adminFaqDao.getAdminFaqList();
	}	
}
