package four.mint.web.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;

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
}
