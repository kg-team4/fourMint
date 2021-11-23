package four.mint.web.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.FollowCountVO;
import four.mint.web.user.FollowingVO;

@Repository
public class FollowDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public FollowCountVO getFollowCount(String nickname) {
		return sqlSessionTemplate.selectOne("FollowDAO.getFollowCount", nickname);
	}

	public FollowingVO getCheck(FollowingVO fchVO) {
		return sqlSessionTemplate.selectOne("FollowDAO.getCheck", fchVO);
	}

	public void insertFollow(FollowingVO fVO) {
		sqlSessionTemplate.insert("FollowDAO.insertFollow", fVO);
	}

	public void deleteFollow(FollowingVO fVO) {
		sqlSessionTemplate.delete("FollowDAO.deleteFollow", fVO);
	}
	
	
}
