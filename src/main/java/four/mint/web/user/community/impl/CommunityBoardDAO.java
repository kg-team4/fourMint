package four.mint.web.user.community.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.community.CommunityBoardVO;

@Repository
public class CommunityBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommunityBoardVO> getCommunityBoardList(CommunityBoardVO vo) {
		System.out.println("====> communityBoardList SELETE");
		
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommunityBoardList", vo);
	}
}
