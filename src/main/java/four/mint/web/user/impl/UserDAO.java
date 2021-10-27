package four.mint.web.user.impl;

import org.springframework.beans.factory.annotation.Autowired;

import four.mint.web.common.mapper.UserMapper;
import four.mint.web.user.UserVO;
import lombok.Setter;

public class UserDAO {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	public void insert() {
		UserVO user = new UserVO();
			user.setEmail_id(null);
			user.setPassword(null);
			user.setNickname(null);
			user.setPhone("123");
		
		mapper.insert(user);
	}
}
