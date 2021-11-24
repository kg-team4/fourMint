package four.mint.web.user;

import java.util.List;

import four.mint.web.user.board.common.ReportVO;
import java.util.ArrayList;

public interface UserService {

	void insertUser(UserVO vo);
	UserVO getUser(UserVO vo);
	String getAddress1(UserVO vo);
	String getAddress2(UserVO vo);
	String getAddress3(UserVO vo);
	int idCheck(String id) throws Exception;
	int nickCheck(String nick) throws Exception;
	int phoneCheck(String phone) throws Exception;
	void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
	UserVO getUserFromNickname(String nickname);
	int getUserCount();
	List<UserVO> getUserList();
	
	//snsLogin
	void naverlogin(SnsVO snsvo);
	void kakaologin(SnsVO snsvo);
	String getBySns(String snsid);
	
	
	void updateAddress(UserVO vo);
	String getPw(UserVO vo);
	void updatePw(UserVO vo);
	void updateProfile(UserVO uVO);
	
	//follow
	List<FollowerVO> getFollowers(String nickname);
	List<FollowingVO> getFollowings(String nickname);
	void insertReport(ReportVO rVO);
	void updateReport(String reported);
	String getPassword(String email_id);
	void updateDate(String id);
	void insertDel(String id);
	void dropMem(String id);
	void updateSns(UserVO vo);
	UserVO getUserFromPhone(String phone);
	UserVO getUserFromEmail(String email);
	List<UserVO> getMem(SnsVO vo);
	
}
