package four.mint.web.admin.table.member.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.page.AdminPageVO;
import four.mint.web.admin.ChartVO;
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
	public void insertMember(AdminPageVO vo) {
		adminTableDao.insertMember(vo);
	}

	@Override
	public AdminTableVO getAdmin(AdminTableVO vo) {
		AdminTableVO newVo = adminTableDao.getAdminTable(vo);
		return newVo;
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

	@Override
	public 
	ArrayList<AdminTableVO> getAddressMan() {
		
		return adminTableDao.getAddressMan();
	}

	@Override
	public ArrayList<AdminTableVO> getAddressWoman() {
		
		return adminTableDao.getAddressWoman();
	}

	@Override
	public AdminTableVO getMemberOne(String parameter) {
		return adminTableDao.getMemberOne(parameter);
	}

	@Override
	public List<AdminTableVO> orderList() {
		
		return adminTableDao.orderList();
	}

	@Override
	public ArrayList<ChartVO> getinitialChart(ChartVO chart) {
		
		return adminTableDao.getinitialChart(chart);
	}

	@Override
	public ArrayList<ChartVO> getResponsiveChart(ChartVO chart) {
		
		return adminTableDao.getResponsivceChart(chart);
	}

	

	@Override
	public void deleteMember(String parameter) {
		adminTableDao.deleteMember(parameter);
	}

	
		
}
