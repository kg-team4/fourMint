package four.mint.web.user;

import java.util.List;

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
	
	//snsLogin
	void naverlogin(NaverVO nvo);
	void kakaologin(KakaoVO kvo);
	String getBySns(String snsid);
	void updateAddress(UserVO vo);
	String getPw(UserVO vo);
	void updatePw(UserVO vo);
	void updateProfile(UserVO uVO);
	
	//follow
	List<FollowerVO> getFollowers(String nickname);
	List<FollowingVO> getFollowings(String nickname);
	
}
