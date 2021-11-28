package four.mint.web.admin.table.member;

import java.util.ArrayList;
import java.util.List;

import four.mint.web.admin.page.AdminPageVO;
import four.mint.web.admin.ChartVO;
import four.mint.web.user.UserVO;


public interface AdminTableService {
	void insertMember(AdminPageVO vo);
	AdminTableVO getAdmin(AdminTableVO vo);
	String getname(AdminTableVO vo);
	
	List<AdminTableVO> getAdminTableList();
	
	int getAdminTableMan();
	int getAdminTableWoman();
	
	ArrayList<UserVO> getAddress2();
	
	List<String> getBirth();
	
	ArrayList<AdminTableVO> getAddressMan();
	ArrayList<AdminTableVO> getAddressWoman();
	AdminTableVO getMemberOne(String parameter);
	void deleteMember(String parameter);
	List<AdminTableVO> orderList();
	ArrayList<ChartVO> getinitialChart(ChartVO chart);
	ArrayList<ChartVO> getResponsiveChart(ChartVO chart);
}
