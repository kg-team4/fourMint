package four.mint.web.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.FollowCountVO;

@Repository
public class FollowDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public FollowCountVO getFollowCount(String nickname) {
		return sqlSessionTemplate.selectOne("FollowDAO.getFollowCount", nickname);
	}
	
	
}
