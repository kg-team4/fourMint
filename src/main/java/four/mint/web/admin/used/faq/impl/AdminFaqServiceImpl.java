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
	public List<AdminFaqVO> getAdminFaqList(String category) {
		return adminFaqDao.getAdminFaqList(category);
	}

	@Override
	public void faq_delete(int parameter) {
		adminFaqDao.faq_delete(parameter);
		
	}

	@Override
	public void update_faq(AdminFaqVO faqVO) {
		adminFaqDao.update_faq(faqVO);
		
	}


}
