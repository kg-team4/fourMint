package four.mint.web.user;

public interface UserService {

	void insertUser(UserVO vo);
	UserVO getUser(UserVO vo);
	String getAddress1(UserVO vo);
	String getAddress2(UserVO vo);
	String getAddress3(UserVO vo);
}
