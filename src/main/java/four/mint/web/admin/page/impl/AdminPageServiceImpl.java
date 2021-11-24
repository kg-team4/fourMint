package four.mint.web.admin.page.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.page.AdminMemberListVO;
import four.mint.web.admin.page.AdminPageService;
import four.mint.web.admin.page.AdminPageVO;

@Service("adminPageService")
public class AdminPageServiceImpl implements AdminPageService{
	
	@Autowired
	private AdminPageDAO adminpageDao;
	
	@Override
	public void insertDeletemember(AdminPageVO vo) {
		adminpageDao.insertAdminPage(vo);		
	}

	@Override
	public AdminPageVO getAdmin(AdminPageVO vo) {
		AdminPageVO newVo = adminpageDao.getAdminPage(vo);		
		return null;
	}

	@Override
	public List<AdminPageVO> getAdminPageList() {		
		return adminpageDao.getAdminPageList();
	}

	@Override
	public List<AdminMemberListVO> getAdminMemberList() {
		
		return adminpageDao.getAdminMemberList();
	}
	
	@Override
	public void deleteMember(String nickname) {
		adminpageDao.deleteMember(nickname);
	}

}
