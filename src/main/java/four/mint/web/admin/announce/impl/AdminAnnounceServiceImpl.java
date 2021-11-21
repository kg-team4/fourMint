package four.mint.web.admin.announce.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.announce.AdminAnnounceService;
import four.mint.web.admin.announce.AdminAnnounceVO;

@Service("adminAnnounceService")
public class AdminAnnounceServiceImpl implements AdminAnnounceService {
	
	@Autowired
	public AdminAnnounceDAO adminAnnounceDao;

	@Override
	public void insertannounce(AdminAnnounceVO vo) {
		adminAnnounceDao.insertAdminAnnounce(vo);
		
	}

	@Override
	public AdminAnnounceVO getAdmin(AdminAnnounceVO vo) {
		AdminAnnounceVO newVo = adminAnnounceDao.getAdminAnnounce(vo);
		return null;
	}

	@Override
	public List<AdminAnnounceVO> getAdminAnnounceList() {
		
		return adminAnnounceDao.getAdminAnnounceList();
	}

}
