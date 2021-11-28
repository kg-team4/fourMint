package four.mint.web.admin.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import four.mint.web.admin.login.AdminService;
import four.mint.web.admin.login.AdminVO;

@Transactional
@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;

	@Override
	public void insertAdmin(AdminVO vo) {
		adminDao.insertAdmin(vo);
	}

	@Override
	public AdminVO getAdmin(AdminVO vo) {
		AdminVO newVo = adminDao.getAdmin(vo);

		return newVo;
	}

	@Override
	public String getname(AdminVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
