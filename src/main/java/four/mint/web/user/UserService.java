package four.mint.web.user;

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
	UserVO getUserNickname(String nickname);
	
	//naverLogin
	void insertUser(NaverVO svo);
	String getByNaver(String nid);
	
}
