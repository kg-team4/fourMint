package four.mint.web.admin.report.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.report.AdminBlackListVO;
import four.mint.web.admin.report.AdminReportService;
import four.mint.web.admin.report.AdminReportVO;
import four.mint.web.user.UserVO;

@Service("adminReportService")
public class AdminReportServiceImpl implements AdminReportService {
	
	@Autowired
	private AdminReportDAO adminReportDAO;
	

	@Override
	public void insertreport(AdminReportVO vo) {
		adminReportDAO.insertAdminReport(vo);
		
	}

	@Override
	public AdminReportVO getAdmin(AdminReportVO vo) {
		AdminReportVO newVo = adminReportDAO.getAdminReport(vo);
		return null;
	}

	@Override
	public List<AdminReportVO> getAdminReportList() {
		
		return adminReportDAO.getAdminReportList();
	}
	

	@Override
	public void modify(AdminReportVO vo) throws Exception {
		adminReportDAO.modify(vo);
			
		}

	@Override
	public void delete(int vo) throws Exception {
		adminReportDAO.delete(vo);
		
	}
	
	@Override
	public void blacklist_delete(int vo) throws Exception {
		adminReportDAO.blacklist_delete(vo);
		
	}

	@Override
	public void insertblacklist(AdminBlackListVO vo) {
		adminReportDAO.insertAdminBlackList(vo);
		
	}

	@Override
	public UserVO getUserInfo(String nickname) {
		return adminReportDAO.getUserInfo(nickname);
	}

	@Override
	public List<AdminBlackListVO> getAdminBlackList() {
		
		return adminReportDAO.getAdminBlackList();
	}

	



}
