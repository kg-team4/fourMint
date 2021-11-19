package four.mint.web.user.impl;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.FollowerVO;
import four.mint.web.user.FollowingVO;
import four.mint.web.user.KakaoVO;
import four.mint.web.user.NaverVO;
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
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
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
	public void naverlogin(NaverVO nvo) {
		userDao.insertNaver(nvo);
	}

	@Override
	public void kakaologin(KakaoVO kvo) {
		userDao.insertKakao(kvo);
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

	
}
