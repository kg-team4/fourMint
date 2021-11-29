package four.mint.web.admin.report.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.report.AdminBlackListVO;
import four.mint.web.admin.report.AdminReportVO;
import four.mint.web.user.UserVO;

@Repository
public class AdminReportDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminReport(AdminReportVO vo) {
		System.out.println("블랙리스트");
		sqlSessionTemplate.insert("AdminReportDAO.insertAdmin",vo);
	}
	
	public AdminReportVO getAdminReport(AdminReportVO vo) {
		return (AdminReportVO) sqlSessionTemplate.selectList("AdminReportDAO.getAdminReportList");	
	}
	
	public List<AdminReportVO> getAdminReportList(){
		return sqlSessionTemplate.selectList("AdminReportDAO.getAdminReportList");
	}
	
	public void modify(AdminReportVO vo)throws Exception{
		sqlSessionTemplate.insert("AdminReportDAO.modify",vo); 	
	}
	
	public void delete(int vo)throws Exception{
		 sqlSessionTemplate.delete("AdminReportDAO.delete",vo); 	
	}
	
	public void blacklist_delete(int vo)throws Exception{
		  sqlSessionTemplate.delete("AdminReportDAO.blacklist_delete",vo); 	
	}
	
	
	public void insertAdminBlackList(AdminBlackListVO vo) {
		System.out.println("신고목록");
		sqlSessionTemplate.insert("AdminReportDAO.blacklist",vo);
	}
	
	public  UserVO getUserInfo(String nickname) {
		return sqlSessionTemplate.selectOne("UserDAO.getUserFromNickname",nickname);	
	}

	public List<AdminBlackListVO> getAdminBlackList() {
		return sqlSessionTemplate.selectList("AdminReportDAO.getAdminBlackList");
	}		

}
