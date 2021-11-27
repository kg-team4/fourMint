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
	public List<AdminPageVO> getAdminPageList() {
		return adminpageDao.getAdminPageList();
	}
	
	@Override
	public void deleteMember(String nickname) {
		adminpageDao.deleteMember(nickname);
	}

	@Override
	public AdminPageVO getMemberOne(String nickname) {
		return adminpageDao.getMemberOne(nickname);
	}

}
