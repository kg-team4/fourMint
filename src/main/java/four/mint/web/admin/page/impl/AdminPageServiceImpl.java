package four.mint.web.admin.page.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import four.mint.web.admin.page.AdminPageService;
import four.mint.web.admin.page.AdminPageVO;

@Service("adminPageService")
public class AdminPageServiceImpl implements AdminPageService{
	
	@Autowired
	private AdminPageDAO adminpageDao;
	
	@Override
	public void insertAdminmember(AdminPageVO vo) {
		adminpageDao.insertAdminPage(vo);
		
	}

	@Override
	public AdminPageVO getAdmin(AdminPageVO vo) {
		AdminPageVO newVo = adminpageDao.getAdminPage(vo);
		
		return newVo;
	}

	@Override
	public String getname(AdminPageVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AdminPageVO> getAdminPageList() {
		
		return adminpageDao.getAdminPageList();
	}
	
	
	

}