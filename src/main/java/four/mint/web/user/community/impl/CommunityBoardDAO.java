package four.mint.web.user.community.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.board.common.LikeVO;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.community.CommunityBoardVO;
import four.mint.web.user.community.CommunityCommentVO;

@Repository
public class CommunityBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommunityBoardVO> getCommunityBoardList(HttpServletRequest request, PageVO vo) {
		System.out.println("====> communityBoardList SELETE");
		
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommunityBoardList", vo);
	}
	
	public int getBoardCount() {
		
		return sqlSessionTemplate.selectOne("CommunityBoardDAO.getBoardCount");
	}

	public void insertCommunity(CommunityBoardVO cVO) {
		sqlSessionTemplate.insert("CommunityBoardDAO.insertCommunity", cVO);
	}

	public List<CommunityBoardVO> getKindList(String kind) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getKindList", kind);
	}

	public CommunityBoardVO getBoard(int seq) {
		return sqlSessionTemplate.selectOne("CommunityBoardDAO.getBoard", seq);
	}

	public void insertComment(CommunityCommentVO cVO) {
		sqlSessionTemplate.insert("CommunityBoardDAO.insertComment", cVO);
	}

	public List<CommunityCommentVO> getCommunityComment(int community_seq) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommunityComment", community_seq);
	}

	public List<CommunityBoardVO> getCommunityListMe(String nickname) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommunityListMe", nickname);
	}

	public void updateViews(int seq) {
		sqlSessionTemplate.update("CommunityBoardDAO.updateViews", seq);
	}

	public void updateComments(int board_seq) {
		sqlSessionTemplate.update("CommunityBoardDAO.updateComments", board_seq);
	}

	public List<CommunityCommentVO> getCommentList(String nickname) {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getCommentList", nickname);
	}

	public List<CommunityBoardVO> getTopFive() {
		return sqlSessionTemplate.selectList("CommunityBoardDAO.getTopFive");
	}

	public void insertLike(int seq) {
		sqlSessionTemplate.update("CommunityBoardDAO.insertLike", seq);
	}

	public LikeVO checkLike(LikeVO lVO) {
		return sqlSessionTemplate.selectOne("CommunityBoardDAO.checkLike", lVO);
	}

	public void insertCommunityLike(LikeVO lVO) {
		sqlSessionTemplate.insert("CommunityBoardDAO.insertCommunityLike", lVO);
	}

	public void deleteLike(int seq) {
		sqlSessionTemplate.update("CommunityBoardDAO.deleteLike", seq);
	}

	public void deleteCommunityLike(LikeVO lVO) {
		sqlSessionTemplate.delete("CommunityBoardDAO.deleteCommunityLike", lVO);
	}
}
