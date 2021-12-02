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
	private AdminTableDAO adminTableDAO;


	@Override
	public void insertMember(AdminPageVO vo) {
		adminTableDAO.insertMember(vo);
	}

	@Override
	public AdminTableVO getAdmin(AdminTableVO vo) {
		AdminTableVO newVo = adminTableDAO.getAdminTable(vo);
		return newVo;
	}

	@Override
	public String getname(AdminTableVO vo){
		return null;
	}

	@Override
	public List<AdminTableVO> getAdminTableList() {
		
		return adminTableDAO.getAdminTableList();
	}

	@Override
	public int getAdminTableMan() {
		
		return adminTableDAO.getAdminTableMan();
	}

	@Override
	public int getAdminTableWoman() {
		
		return adminTableDAO.getAdminTableWoman();
	}

	@Override
	public ArrayList<UserVO> getAddress2() {
		return adminTableDAO.getAddress2();
	}

	@Override
	public List<String> getBirth() {
		
		return adminTableDAO.getBirth();
	}

	@Override
	public 
	ArrayList<AdminTableVO> getAddressMan() {
		
		return adminTableDAO.getAddressMan();
	}

	@Override
	public ArrayList<AdminTableVO> getAddressWoman() {
		
		return adminTableDAO.getAddressWoman();
	}

	@Override
	public AdminTableVO getMemberOne(String parameter) {
		return adminTableDAO.getMemberOne(parameter);
	}

	@Override
	public List<AdminTableVO> orderList() {
		
		return adminTableDAO.orderList();
	}

	@Override
	public ArrayList<ChartVO> getinitialChart(ChartVO chart) {
		
		return adminTableDAO.getinitialChart(chart);
	}

	@Override
	public ArrayList<ChartVO> getResponsiveChart(ChartVO chart) {
		
		return adminTableDAO.getResponsivceChart(chart);
	}

	

	@Override
	public void deleteMember(String parameter) {
		adminTableDAO.deleteMember(parameter);
	}

	@Override
	public ArrayList<ChartVO> getIndexResponsiveChart(ChartVO chart) {
		return adminTableDAO.getIndexResponsiveChart(chart);
	}

}
