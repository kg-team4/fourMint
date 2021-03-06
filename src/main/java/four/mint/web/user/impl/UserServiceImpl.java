package four.mint.web.user.impl;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.FollowerVO;
import four.mint.web.user.FollowingVO;
import four.mint.web.user.SnsVO;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.user.board.common.ReportVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDao;

	@Override
	public void insertUser(UserVO vo) {
		userDao.insertUser(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		UserVO newVo = userDao.getUser(vo);

		return newVo;
	}

	@Override
	public String getAddress1(UserVO vo) {
		return userDao.getAddress1(vo);
	}

	@Override
	public String getAddress2(UserVO vo) {
		return userDao.getAddress2(vo);
	}

	@Override
	public String getAddress3(UserVO vo) {
		return userDao.getAddress3(vo);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return userDao.idCheck(id);
	}

	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", ""); // 발신전화번호.
		params.put("type", "SMS");
		params.put("text", "인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
		} catch (CoolsmsException e) { }
	}

	@Override
	public int nickCheck(String nick) throws Exception {
		return userDao.nickCheck(nick);
	}

	@Override
	public int phoneCheck(String phone) throws Exception {
		return userDao.phoneCheck(phone);
	}

	@Override
	public void naverlogin(SnsVO snsvo) {
		userDao.insertNaver(snsvo);
	}

	@Override
	public void kakaologin(SnsVO snsvo) {
		userDao.insertKakao(snsvo);
	}

	@Override
	public UserVO getUserFromNickname(String nickname) {
		return userDao.getUserFromNickname(nickname);
	}
	
	
	@Override
	public String getBySns(String snsid) {
		return userDao.getBySns(snsid);
	}

	@Override
	public void updateAddress(UserVO vo) {
		userDao.updateAddress(vo);
	}

	@Override
	public String getPw(UserVO vo) {
		return userDao.getPw(vo);
	}

	@Override
	public void updatePw(UserVO vo) {
		userDao.updatePw(vo);
	}
		
	@Override
	public void updateProfile(UserVO uVO) {
		userDao.updateProfile(uVO);
	}

	@Override
	public List<FollowerVO> getFollowers(String nickname) {
		return userDao.getFollowers(nickname);
	}

	@Override
	public List<FollowingVO> getFollowings(String nickname) {
		return userDao.getFollowings(nickname);
	}

	@Override
	public void insertReport(ReportVO rVO) {
		userDao.insertReport(rVO);
	}

	@Override
	public void updateReport(String reported) {
		userDao.updateReport(reported);
	}

	@Override
	public String getPassword(String email_id) {
		return userDao.getPassword(email_id);
	}

	@Override
	public void updateDate(String id) {
		userDao.updateDate(id);
	}


	@Override
	public void insertDel(String id) {
		userDao.insertDel(id);
		
	}

	@Override
	public void dropMem(String id) {
		userDao.dropMem(id);
		
	}

	@Override
	public void updateSns(UserVO vo) {
		userDao.updateSns(vo);
	}
		
	@Override
	public UserVO getUserFromPhone(String phone) {
		return userDao.getUserFromPhone(phone);
	}

	@Override
	public UserVO getUserFromEmail(String email) {
		return userDao.getUserFromEmail(email);
	}

	@Override
	public List<UserVO> getMem(SnsVO vo) {
		
		return userDao.getMem(vo);
	}

	@Override
	public int getUserCount() {
		return userDao.getUserCount();
	}
	
	@Override
	public List<UserVO> getUserList() {
		return userDao.getUserList();
	}

	@Override
	public String getId(UserVO vo) {
		
		return userDao.getId(vo);
	}

	@Override
	public float getRating(String userNickname) {
		return userDao.getRating(userNickname);
	}

	@Override
	public void updateRating(UserVO tempUser) {
		userDao.updateRating(tempUser);
	}

	@Override
	public String getEmailId(String email) {
		
		return userDao.getEmailId(email);
	}

	
}
