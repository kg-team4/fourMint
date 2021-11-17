package four.mint.web.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.FollowService;
import four.mint.web.user.FollowCountVO;

@Service("followService")
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowDAO followDao;
	
	@Override
	public FollowCountVO getFollowCount(String nickname) {
		return followDao.getFollowCount(nickname);
	}

}
