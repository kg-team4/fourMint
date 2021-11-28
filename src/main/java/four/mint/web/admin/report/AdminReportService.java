package four.mint.web.admin.report;

import java.util.List;

import four.mint.web.user.UserVO;

public interface AdminReportService {
	void insertreport(AdminReportVO vo);
	AdminReportVO getAdmin(AdminReportVO vo);
	
	List<AdminReportVO>getAdminReportList();
	List<AdminBlackListVO>getAdminBlackList();
	
	//등록
	public void modify(AdminReportVO vo)throws Exception;
	//삭제
	public void delete(int report_seq)throws Exception;
	
	public void blacklist_delete(int blacklist_seq)throws Exception;
	
	void insertblacklist(AdminBlackListVO vo);
	
	UserVO getUserInfo(String nickname);
	
	

	

}
