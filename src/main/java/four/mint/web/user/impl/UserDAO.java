package four.mint.web.user.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.FollowerVO;
import four.mint.web.user.FollowingVO;
import four.mint.web.user.KakaoVO;
import four.mint.web.user.NaverVO;
import four.mint.web.user.SnsVO;
import four.mint.web.user.UserVO;
import four.mint.web.user.board.common.ReportVO;


@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public void insertUser(UserVO vo) {
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		return (UserVO)sqlSessionTemplate.selectOne("UserDAO.getUser", vo);
	}
	
	public String getAddress1(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.getAddress1", vo);
	}
	
	public String getAddress2(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.getAddress2", vo);
	}
	
	public String getAddress3(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.getAddress3", vo);
	}
		
	public int idCheck(String id) throws Exception {
		return sqlSessionTemplate.selectOne("UserDAO.idCheck", id);
	}
	
	public int nickCheck(String nick) throws Exception {
		return sqlSessionTemplate.selectOne("UserDAO.nickCheck", nick);
	}
	
	public int phoneCheck(String phone) throws Exception {
		return sqlSessionTemplate.selectOne("UserDAO.phoneCheck", phone);
	}

	public void insertNaver(SnsVO snsvo) {
		sqlSessionTemplate.insert("UserDAO.insertNaver", snsvo);
	}
	
	public void insertKakao(SnsVO snsvo) {
		sqlSessionTemplate.insert("UserDAO.insertKakao", snsvo);
	}
	
	public UserVO getUserFromNickname(String nickname) {
		return sqlSessionTemplate.selectOne("UserDAO.getUserFromNickname", nickname);
	}
	
	public String getBySns(String snsid) {
		return sqlSessionTemplate.selectOne("UserDAO.getBySns", snsid);
	}
	
	public List<UserVO> getUserList(HttpServletRequest request) {
		return sqlSessionTemplate.selectList("UserDAO.getUserList");
	}

	public void updateAddress(UserVO vo) {
		sqlSessionTemplate.update("UserDAO.updateAddress", vo);
	}

	public String getPw(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.getPw", vo);
	}

	public void updatePw(UserVO vo) {
		sqlSessionTemplate.update("UserDAO.updatePw", vo);
	}
		
	public void updateProfile(UserVO uVO) {
		sqlSessionTemplate.update("UserDAO.updateProfile", uVO);
	}

	public List<FollowerVO> getFollowers(String nickname) {
		return sqlSessionTemplate.selectList("FollowDAO.getFollowers", nickname);
	}

	public List<FollowingVO> getFollowings(String nickname) {
		return sqlSessionTemplate.selectList("FollowDAO.getFollowings", nickname);
	}

	public void insertReport(ReportVO rVO) {
		sqlSessionTemplate.insert("UserDAO.insertReport", rVO);
	}
	public void updateDate(String id) {
		sqlSessionTemplate.update("UserDAO.updateDate", id);
		
	}
	public void insertDel(String id) {
		sqlSessionTemplate.insert("UserDAO.insertDel", id);
	}
	public void dropMem(String id) {
		sqlSessionTemplate.delete("UserDAO.dropMem", id);
	}

	public void updateSns(UserVO vo) {
		sqlSessionTemplate.update("UserDAO.updateSns", vo);
	}	

	public void updateReport(String reported) {
		sqlSessionTemplate.update("UserDAO.updateReport", reported);
	}

	public String getPassword(String email_id) {
		return sqlSessionTemplate.selectOne("UserDAO.getPassword", email_id);
	}

	public UserVO getUserFromPhone(String phone) {
		return sqlSessionTemplate.selectOne("UserDAO.getUserFromPhone", phone);
	}

	public UserVO getUserFromEmail(String email) {
		return sqlSessionTemplate.selectOne("UserDAO.getUserFromEmail", email);
	}

	public List<UserVO>getMem(SnsVO vo) {
		return sqlSessionTemplate.selectList("UserDAO.getMem", vo);
	}
	
	public String getId(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.getId", vo);
	}
	
	public String getEmailId(String email) {
		return sqlSessionTemplate.selectOne("UserDAO.getEmailId", email);
	}

	public int getUserCount() {
		return sqlSessionTemplate.selectOne("UserDAO.getUserCount");
	}
	
	public List<UserVO> getUserList() {
		return sqlSessionTemplate.selectList("UserDAO.getUserList");
	}

	public float getRating(String userNickname) {
		return sqlSessionTemplate.selectOne("UserDAO.getRating", userNickname);
	}

	public void updateRating(UserVO tempUser) {
		sqlSessionTemplate.update("UserDAO.updateRating", tempUser);
	}
}
