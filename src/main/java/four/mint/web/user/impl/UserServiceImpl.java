package four.mint.web.user.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
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
		String api_key = "NCSTPRO7ARIFZH0T";
		String api_secret = "YUFI1UOUYVU1KW2M6BAVRGD0AMB86DIZ";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "01022895274"); // 발신전화번호.
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
}
