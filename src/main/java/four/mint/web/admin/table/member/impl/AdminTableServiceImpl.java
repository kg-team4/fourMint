package four.mint.web.admin.table.member.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.login.AdminService;
import four.mint.web.admin.login.AdminVO;
import four.mint.web.admin.login.impl.AdminDAO;
import four.mint.web.admin.table.member.AdminTableService;
import four.mint.web.admin.table.member.AdminTableVO;
import four.mint.web.user.UserVO;


@Service("adminTableService")
public class AdminTableServiceImpl implements AdminTableService {
	
	@Autowired
	private AdminTableDAO adminTableDao;


	@Override
	public void inserttablemember(AdminTableVO vo) {
		adminTableDao.insertAdminTable(vo);
	}

	@Override
	public AdminTableVO getAdmin(AdminTableVO vo) {
		AdminTableVO newVo = adminTableDao.getAdminTable(vo);
		return null;
	}

	@Override
	public String getname(AdminTableVO vo){
		return null;
	}

	@Override
	public List<AdminTableVO> getAdminTableList() {
		
		return adminTableDao.getAdminTableList();
	}

	@Override
	public int getAdminTableMan() {
		
		return adminTableDao.getAdminTableMan();
	}

	@Override
	public int getAdminTableWoman() {
		
		return adminTableDao.getAdminTableWoman();
	}

	@Override
	public ArrayList<UserVO> getAddress2() {
		return adminTableDao.getAddress2();
	}

	@Override
	public List<String> getBirth() {
		
		return adminTableDao.getBirth();
	}

	

}